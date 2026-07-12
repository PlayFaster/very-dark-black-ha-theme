# Home Assistant Theme Development: Lessons Learned & "What Not To Do"

This document serves as a technical reference based on the development of the "Very Dark Black" theme pack. It highlights common pitfalls that can break Home Assistant's configuration or cause UI accessibility issues.

## 1. YAML Standards & Linting

Validation is `yamllint` configured by `.validate/.yamllint` (`extends: default`) with two `default`-rule relaxations chosen to match Home Assistant convention:

- **Document Start**: `document-start` is **disabled**. Home Assistant does not use the `---` document-start marker, so the theme file intentionally omits it. Do **not** add `---`. (This was flipped from the original "always add `---`" stance once the linter was aligned to HA — a bare `---` is not wanted here.)
- **Line Length**: `line-length` is **disabled**. Long lines are allowed — for example, the aligned Section 1c Neutral Ramp token block exceeds 80 characters by design. Do not reflow or split lines solely to satisfy an 80-char limit; splitting genuine CSS shorthand (`border` → `border-width`/`-style`/`-color`) is still fine for readability, but it is not required by the linter.
- **Trailing Spaces**: Still enforced by the `default` ruleset — never leave spaces at the end of a line.
- **Comment Spacing**: `comments: min-spaces-from-content: 1` — inline comments need at least one space before the `#`.

## 2. Shared Configs & Hidden Anchors

Home Assistant's theme loader is unique and highly restrictive.

- **The "Every Key is a Theme" Rule**: Every top-level key in a theme file is treated as a selectable theme name in the HA UI. There is no mechanism to hide or exclude a theme from the picker — the base anchor theme (`Black with White`) will always appear alongside the accent variants. The pragmatic solution is to give it a sensible name and treat it as a usable variant. Do NOT add `primary-color` to the base anchor — every accent variant also defines it, and HA will log a duplicate key warning for every theme in the file.
- **The "Everything is a String" Rule**: Home Assistant expects every variable inside a theme to be a string (representing a CSS variable).
  - **CRITICAL FAILURE**: Do NOT nest dictionaries (like a palette block) inside a theme block. This will crash the Home Assistant configuration loader and prevent a restart.
- **Execution Order (Anchors vs. Aliases)**: YAML is processed sequentially within a file.
  - **CRITICAL FAILURE**: You MUST define an anchor (e.g., `&acc_red`) _before_ you reference it with an alias (e.g., `*acc_red`). Defining anchors at the bottom of a large shared configuration while referencing them at the top will cause a fatal "undefined alias" error that prevents HA from starting.
- **Inheritance (Anchors/Aliases)**: To avoid "Duplicate Key" warnings, ensure that your base anchor contains _only_ shared settings. If the base anchor defines a property (e.g., `state-active-color: var(--primary-color)`) and a sub-theme overrides it (e.g., `*acc_red`), HA's restrictive loader will log a warning.
  - **The Fix**: Remove the key from the base config entirely and explicitly define it in every variant. Use a comment in the base config to document the intended default.
  - **Gotcha — variant redefining base anchor tokens**: Any token already defined in `base_logic` (the `Black with White` anchor) must NOT be redefined in a Section B accent variant, even with an identical value — HA will still warn. Before adding a token to any variant, grep for it in the base anchor first.

## 3. UI Accessibility & Polish

Dark themes often suffer from "White-on-White" text issues or "Dead Flat" backgrounds.

- **Contrast Ratios (WCAG AA)**: On a pure black (#000000) background, secondary text needs to be at least `#a8a8a8` to safely pass WCAG AA contrast guidelines (~8:1). Standard grey (#9b9b9b) is often too close to the threshold for comfortable reading in all lighting conditions.
- **Hover/Selection States**: Home Assistant's Material Design components use specific tokens for list highlights.
- **The Fix**: Explicitly set `mdc-list-item-selected-container-color` to a dark charcoal or your accent color.
- **Browser Rendering**: Always include `-webkit-font-smoothing: antialiased` in your `card-mod` host styles. This prevents light text from "blooming" or blurring against pure black backgrounds, keeping it crisp and legible.
- **Depth on Flat Surfaces**: A pure black (`#000000`) interface can feel "dead" without subtle lighting. Use `box-shadow: inset 0 1px 4px rgba(255, 255, 255, 0.05)` on inputs and fields to create a tactile "cut-out" effect that respects the dark aesthetic.
- **Standardized Borders**: Use a low-opacity white (e.g., `rgba(255, 255, 255, 0.12)`) for borders rather than off-white. This provides consistent luminance and visibility across different screen technologies (OLED vs. IPS).

## 4. Icon & Component Scaling

- **Granular Radius**: Avoid a single global `border-radius`. Implement a scale (e.g., `token-size-radius-small: 8px`, `medium: 12px`, `large: 16px`) to differentiate between small interactive elements (buttons/inputs) and large structural components (cards).
- **Variable Hierarchy**:
  - `paper-item-icon-color`: The legacy/standard variable for most icons.
  - `state-icon-color`: Controls icons in their "neutral" or "inactive" states.
  - `state-icon-active-color`: Controls icons when an entity is "On" or active.
- **Best Practice**: Define these variables in each individual color variant theme to ensure the icons match the chosen accent (Red, Green, etc.) rather than defaulting to a single global color.

### Single-Source Neutral Tokens (the "Neutral Ramp")

Repeated neutral colors (whites, greys, surfaces, borders) should be defined **once** and referenced everywhere else, never re-typed as literals. This theme collects them in a **Neutral Ramp** (Section 1c) where each `token-neutral-*` key is a single source that works through **both** reuse mechanisms at once:

- **YAML anchor** (`&base_white`, `&acc_charcoal`, …) — parse-time reuse. Alias it (`*base_white`) in ordinary YAML values. Invisible to CSS.
- **Keyed token** — because every theme key auto-registers as a CSS custom property, the same definition is reachable as `var(--token-neutral-white)`, **including inside `card-mod` blocks**.

This is the key distinction: a YAML anchor **cannot** be referenced from a `card-mod` CSS string (anchors are resolved at YAML parse time, before any CSS exists). Only a keyed token becomes a `--custom-property` that `card-mod` can read. So to feed a color into `card-mod` from a single source, it must be a token key, not merely an anchor. Pattern (always keep the literal fallback):

```yaml
# Section 1c — one definition, two reuse paths
token-neutral-line-strong: &acc_charcoal "#333333"

# YAML value elsewhere → anchor alias
ha-switch-border-color: *acc_charcoal

# card-mod CSS → CSS var with literal fallback
card-mod-card: |
  :host { --scrollbar-thumb-color: var(--token-neutral-line-strong, #333333) !important; }
```

**Guidelines:**

- Add a new repeated neutral to Section 1c; do not scatter its hex. One-off colors (used once) stay inline — anchoring them adds indirection with no dedupe benefit.
- Keep `token-neutral-white` (`#ffffff`, max-contrast emphasis: icons, input ink, dialog headings) separate from `primary-text-color` (`#e1e1e1`, body text). Same "whiteness", different roles.
- Leave inert `var(--primary-color, #aaaaaa)` fallbacks as literals — they only render if `--primary-color` is unset (never, except conceptually on the base theme), so they are not drift.
- Mirrors the pre-existing `token-rgb-*` and `token-size-radius-*` conventions — the ramp is the same idea applied to neutrals.
- **Verify refactors with an anchor-resolution diff**: a consolidation must not change any resolved value. Load the YAML before and after with a parser that resolves anchors, and assert every existing key maps to the same value (only intentionally-edited `card-mod` strings should differ).

## 5. Modern Token Migration (2025-2026+)

Home Assistant is moving away from legacy `paper-` and `mdc-` variables toward **Web Awesome** (Shoelace/Lit) and **Material 3** tokens.

- **Web Awesome (2026.4+ Shift)**: The 2026.4 release introduces a shift toward **Semantic Surface Tokens**.
  - `wa-color-surface-raised`: Controls the background of elevated elements like dropdown menus.
  - `ha-color-fill-neutral-[quiet|normal]-[resting|hover|active]`: These tokens handle the hover and interaction states for menus and list items. Mapping these is critical to prevent "white-on-white" invisibility in the new UI.
- **Material 3 Semantic Tokens**: Modern components increasingly use the `md-sys-color-*` palette.
  - `md-sys-color-on-surface-variant`: Essential for secondary text visibility.
  - `md-sys-color-outline-variant`: Controls borders in new M3-style cards.
  - `md-sys-color-[error|warning|success|info]`: Essential for semantic feedback in logs and status chips.
- **Dynamic Color Scales (HSL Power)**: Instead of manually defining 10+ shades of every color variant, use CSS `hsl(from var(...) ...)` to dynamically generate 05-95 scales.
  - **NOTE**: The `hsl(from ...)` syntax requires HA 2026.4+ and a modern browser.
  - **Example**: `ha-color-primary-20: hsl(from var(--primary-color) h s calc(l * 0.40))`

### Backward Compatibility — Keep Old Tokens

Old and superseded tokens (e.g. `paper-*`, `mdc-*` from legacy components) must be **kept** in the theme even after the components that used them are removed from HA. These tokens fail silently on newer HA versions — they set a CSS custom property that nothing reads, causing no warnings, no visual glitches, and no YAML errors. Removing them breaks backward compatibility for users still on older HA versions.

Only remove a token if it actively causes a problem (e.g. a naming collision with a new token, or a verified YAML warning). Deprecation alone is not sufficient justification for removal.

### New Token Decisions — Category A vs Category B

When a new component or token is identified (e.g. through an HA release note, a `change_ref_*` doc, or a theme drift investigation), classify it before deciding whether to add it:

#### **Category A — Token has a hardcoded component default**

The component's internal CSS provides a concrete fallback value independent of the theme, e.g. `background: var(--new-token, #1a73e8)`. If the theme does not set `new-token`, the component uses its own default. Approach: **reactive** — add only if the default looks wrong on this theme.

#### **Category B — Token chains to a theme-owned variable (especially `--primary-color`)**

The component's internal CSS defaults to `var(--primary-color)` or another theme token, e.g. `background: var(--new-token, var(--primary-color))`. For accent themes this works correctly. For the base theme (`Black with White`), `--primary-color` is unset → `transparent` → the element becomes invisible. Approach: **mandatory and proactive** — add to the base anchor immediately using `var(--primary-color, #aaaaaa)` as the value. Do not wait for a visible problem; on the base theme the failure is invisible by definition.

To determine which category: inspect the component's shadow DOM `adoptedStyleSheets` in DevTools (or run the `theme_review.md` Playwright script). Look at what the internal CSS fallback resolves to — a hardcoded color (Category A) or a `var(--primary-color)` chain (Category B).

**Important:** the `:host` re-declaration trap. Some components set their own token internally via a `:host` CSS rule, e.g. `:host { --control-switch-on-color: var(--primary-color) }`. This overrides any inherited value — an external `control-switch-on-color` set by the theme is ignored. For these components, the only path is through `--primary-color` itself. Since adding `primary-color` to the base anchor causes duplicate key warnings (an absolute constraint), such components cannot be fixed for `Black with White`. Document them as permanent known limitations of that theme.

## 6. Card-Mod & Component Exclusions

Global background styling for `ha-card` can cause "background stacking" issues with modern custom cards.

- **The Problem**: Applying a solid black background to all `ha-card` elements will break cards intended to be transparent (Mushroom Title, Bubble Card containers).
- **The Fix**: Add explicit `:host(...) ha-card` exclusions in your global `card-mod-card` block to set `background: transparent !important` and `border: none !important` for:
  - `hui-heading-card`
  - `mushroom-title-card` / `mushroom-chips-card`
  - `.type-custom-bubble-card`
  - `hui-conditional-card`
  - `custom-button-card`
- **Brittle Selectors**: Deep DOM traversal (e.g., `ha-card-picker $ ha-sub-page ...`) is extremely brittle and will break when HA updates its internal component structure. Use native CSS tokens whenever possible, and clearly document these selectors as high-maintenance items.

## 7. Devcontainer — Tracked Config Files (`.ha/`)

The devcontainer mounts the entire project workspace at `/workspaces/${PROJECT_NAME}` inside the container, alongside the HA config dir at `/config` (mapped from `.devcontainer/.devconfig/`). This means HA can reference files anywhere in the project tree using absolute container paths.

Two files that are important for development are git-tracked in `.ha/` rather than buried in the gitignored `.devconfig/`:

| File | Tracked path | Container path | How HA loads it |
| :-- | :-- | :-- | :-- |
| Mock entities | `.ha/mock_package.yaml` | `/workspaces/${PROJECT_NAME}/.ha/mock_package.yaml` | `homeassistant.packages:` in `configuration.yaml` |
| Test dashboard | `.ha/ui-theme-test.yaml` | `/workspaces/${PROJECT_NAME}/.ha/ui-theme-test.yaml` | Absolute `filename:` in the dashboard config |

### Why `packages:` and not `template:`

`mock_package.yaml` uses HA's `homeassistant.packages:` mechanism because it defines entities across multiple domains (`template:`, `input_boolean:`, `input_number:`, `input_select:`, `media_player:`, etc.). A `!include` under `template:` would only load template-domain entities — `packages:` loads a full mini-config with any combination of domains.

In `configuration.yaml`:

```yaml
homeassistant:
  packages:
    theme_test_mocks: !include /workspaces/very-dark-black-ha-theme/.ha/mock_package.yaml
```

### Why absolute paths work

HA's YAML `!include` tag resolves paths using Python's `os.path.join(current_dir, path)`. When the path argument starts with `/`, it overrides the base directory — so absolute paths work regardless of where `configuration.yaml` lives. The same principle applies to the Lovelace dashboard `filename:`.

### `.devconfig/` remains gitignored

`configuration.yaml` (the HA entry point) stays in `.devconfig/` — it cannot be relocated. Everything else that changes rapidly (database, `.storage/`, cache, generated files) also stays there and stays gitignored. Only the two authored files in `.ha/` are tracked.

---

## 8. Devcontainer Configuration — Template Entity Pitfalls

The `.devcontainer/.devconfig/` directory (gitignored) contains the live HA configuration for the devcontainer, including mock entities used by the theme test dashboard. The following pitfalls were found while building that configuration — they are non-obvious and not clearly documented in the HA integration reference pages.

### `media_player` is not a valid key inside `template:`

HA's `template:` integration block does not support `media_player:`. Putting it there produces `'media_player' is an invalid option for 'template'` and the entity is silently dropped. Use `media_player: platform: universal` instead, wired to `input_boolean`, `input_select`, and `input_number` helpers.

### Template `select` options must be a string template, not a YAML list

```yaml
# WRONG — causes "template value should be a string for dictionary value 'select->0->options'"
options:
  - Option A
  - Option B

# CORRECT
options: "{{ ['Option A', 'Option B', 'Option C'] }}"
```

### `binary_sensor` device_class `problem` and `heat` only belong in the `binary_sensor:` list

Placing a template sensor with `device_class: problem` or `device_class: heat` under the `sensor:` key produces `expected SensorDeviceClass ... got 'problem'`. These are binary-sensor-only device classes and must go under the `binary_sensor:` key in the template block.

### Template `weather` uses `*_template` suffix on every key

Unlike every other template integration type (`sensor`, `binary_sensor`, `select`, `number`, etc.) where the key name is bare (`state:`, `options:`, `min:`, `max:`), the weather integration requires `_template` appended to each value key:

```yaml
# WRONG — causes "required key 'condition_template' not provided"
- weather:
    - condition: "sunny"
      temperature: "22"

# CORRECT
- weather:
    - condition_template: "{{ states('input_select.weather_condition') }}"
      temperature_template: "22"
```

### `precipitation_template` is invalid — precipitation is forecast-only

`precipitation_template` is not a valid key for the `weather:` template block. Precipitation is a forecast-only attribute and cannot be set as a current-conditions property. Using it produces `'precipitation_template' is an invalid option for 'template'...weather->0->...`. Remove it entirely; no workaround exists at the current-conditions level.

---

## 9. Documentation & README Conventions

### Emoji in Headings — Always-Color Single-Codepoint Only

When writing or editing the README, always use **always-color single-codepoint emoji** in headings and Table of Contents links. Never use VS16 compound emoji (e.g., `⚙️`, `🏗️`, `⚠️`, `🗑️`).

**Why**: VS16 (U+FE0F, Variation Selector-16) is an invisible byte that forces emoji rendering. GitHub's anchor generator strips it when computing heading anchors, but Markdown tooling includes it in `href` values — causing Table of Contents links to 404. The problem is completely invisible in source editors.

See root `CLAUDE.md` → "Shared Markdown Notes" for the full replacement table and a detection script.
