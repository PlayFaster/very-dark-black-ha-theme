# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

> [!CAUTION]
>
> **Never run `git checkout`, `git restore`, `git reset`, `git stash` or `git clean`. Ask first, every time — no exceptions, whoever's changes you think they are.** Reading git (`status`, `diff`, `log`, `show`) is always fine. Full rule and the incident behind it: [`agent_conventions.md`](.shared/dev_std/agent_conventions.md).

## What This Theme Does

**Very Dark Black HA Theme** is a Home Assistant theme pack that provides pure black backgrounds with a choice of accent colors. The entire project ships as a single YAML file (`themes/very_dark_black_ha_theme.yaml`) that Home Assistant loads directly.

Available accent color variants: Blue, Cyan, Emerald, Green, Indigo, Orange, Pink, Red, Silver (monochrome), Violet, White (no accent). `Black with White` doubles as the base anchor all variants inherit from — it appears in the picker as a structural side-effect of HA's theme architecture and is a usable no-accent variant in its own right.

## Project Structure

```text
themes/very_dark_black_ha_theme.yaml          ← The entire theme (single file, ~600 lines)
docs/DEVELOPMENT.md                           ← Critical dev reference: pitfalls & architecture
docs/change_ref_ha_v2026_4.md                 ← HA 2026.4 frontend migration notes
docs/change_ref_ha_v2026_5.md                 ← HA 2026.5 Web Awesome component notes
docs/change_ref_ha_v2026_6.md                 ← HA 2026.6 Web Awesome radio component notes
docs/change_ref_ha_v2026_7.md                 ← HA 2026.7 — component behavior only, no token changes
docs/color_picks_202606.md                    ← Accent color selection rationale
docs/changelog_local.md                       ← Working changelog notes
hacs.json                                     ← HACS metadata
.ha/                                          ← GIT-TRACKED devcontainer config files
  mock_package.yaml                           ←   Mock entities (multi-domain HA package)
  ui-theme-test.yaml                          ←   Theme test Lovelace dashboard (4 views)
.devcontainer/.devconfig/                     ← GITIGNORED — runtime HA config dir
  configuration.yaml                          ←   Entry point; loads .ha/ files via packages
```

No build system, no scripts, no dependencies to install. Changes are made directly to the YAML file and reloaded in Home Assistant via `frontend.reload_themes`.

> **Note:** `.devcontainer/.devconfig/` is gitignored and never committed — it contains the HA database, `.storage/`, cache, and the `configuration.yaml` entry point. The two files that matter for development are git-tracked in `.ha/` and referenced from `configuration.yaml` at their absolute container paths (`/workspaces/${PROJECT_NAME}/.ha/`). `mock_package.yaml` is loaded via `homeassistant.packages:` (multi-domain entities, not just `template:`). `ui-theme-test.yaml` is a 4-view Lovelace dashboard (sections × 3, masonry × 1) referenced via its absolute container path in the dashboard config. See `docs/DEVELOPMENT.md` Section 7 for the full devcontainer tracked-config approach.

## Commands

There are no Python tests for this project. Validation is handled by VS Code tasks (shared from the monorepo) and CI (shared GitHub Actions workflow).

### VS Code Tasks

Run via **Terminal → Run Task** inside the devcontainer:

| Task                           | What it does                                      |
| :----------------------------- | :------------------------------------------------ |
| **Validate All**               | Runs all validation tasks in sequence             |
| `YAML: Lint Project`           | yamllint against tracked YAML files               |
| `JSON: Verify All Files`       | check-jsonschema on all tracked JSON              |
| `HACS: Verify Manifest`        | Schema-validates `hacs.json`                      |
| `HA: Check Config`             | Live HA config check against the running instance |
| `Markdown: Check Links`        | markdown-link-check on README                     |
| `Markdown: Lint (View Only)`   | markdownlint on all tracked `.md` files           |
| `Codespell: Check (View Only)` | Spell check (config from root `pyproject.toml`)   |
| `Zizmor: GitHub Actions Audit` | Security audit of `.github/` workflows            |
| `Prettier: Check (View Only)`  | Prettier format check on md, json, yaml           |
| **Fix All**                    | Runs all auto-fix tasks in sequence               |

Python-specific tasks (`Ruff`, `Mypy`, `Pytest`, `Pre-commit`) are present in the shared task list but skip automatically for this project via `project.category = theme` in `.vscode/settings.json`.

### Running tools directly inside the devcontainer

Agents run on the Windows host and reach the container via `docker exec` — the full workflow, the `.devcontainer/.env` identity lookup, and the Git Bash path-mangling trap are in [shared conventions §1](.shared/dev_std/agent_conventions.md). Theme-flavoured examples:

```bash
docker exec -w /workspaces/<PROJECT_DIR> <CONTAINER_NAME> bash -c "codespell ."
docker exec -w /workspaces/<PROJECT_DIR> <CONTAINER_NAME> bash -c "yamllint -c .validate/.yamllint themes/"
```

Note that §2 of that file (pytest, ruff, mypy, pre-commit) does **not** apply here — this project has no Python source and no tests.

## Theme File Architecture (2-Section YAML)

The single theme file uses YAML anchors/aliases to avoid duplication. The structure is strictly ordered — anchors must be defined before they are referenced. There are **two** top-level sections:

- **Base theme — `Black with White` (`&base_logic`)**: All shared tokens: backgrounds, card surfaces, dialogs, borders, dividers, typography, icons, inputs, color scales, energy/graph colors, named colors (`red-color`, `cyan-color`, etc.), and the global `card-mod-card` CSS block. This mapping IS the `&base_logic` anchor. It is also a usable no-accent variant (white text and icons, HA semantic state colors, no `primary-color`). Internally it is organized into numbered subsections 1–20 (`# --- 1. Named Colors ---` … `# --- 20. Global Card-Mod ---`), including the 1b/1c/4b/13b lettered inserts referenced elsewhere in this file.
- **Section B — Individual variants**: Each accent theme (e.g., `Black with Cyan`) extends the base via `<<: *base_logic` and only adds `primary-color`, `state-active-color`, and `card-mod-theme`. **Ten** variants, alphabetical to match the HA picker sort: Blue, Cyan, Emerald, Green, Indigo, Orange, Pink, Red, Silver, Violet. Orange additionally overrides `state-switch-active-color`, `state-plug-active-color`, and `state-binary_sensor-active-color` to Red (to avoid yellow-adjacent active states).

Counting note: **ten** Section B variants, but **eleven** entries in the HA picker — the base anchor `Black with White` is itself a named theme and therefore appears alongside them. The README's "11 sub-themes" is the picker count and is correct; do not reconcile the two numbers by changing either.

### Neutral Ramp — single source for repeated neutrals (Section 1c)

Every repeated neutral color (whites, greys, surfaces, borders) is defined **once** in the **Section 1c Neutral Ramp** as a `token-neutral-*` key, and nowhere else. Each definition does double duty:

- It is a **keyed token**, so HA auto-registers it as a CSS custom property (`--token-neutral-*`) that the `card-mod` blocks can read via `var()`.
- It carries a **YAML anchor** (`&base_white`, `&acc_charcoal`, etc.) for parse-time reuse in the plain YAML values below.

This mirrors the existing `token-rgb-*` and `token-size-radius-*` conventions. **Rules when touching neutrals:**

- Do **not** hardcode a repeated neutral hex anywhere else — alias the anchor (`*base_white`) in YAML values, or reference the CSS var (`var(--token-neutral-line-strong, #333333)`) inside `card-mod`. Add new repeated neutrals to Section 1c.
- The two distinct "whites" are intentional and must stay separate: `token-neutral-white` (`#ffffff`) = max-contrast emphasis (icons, input ink, dialog headings); `primary-text-color` (`#e1e1e1`) = body text. Do not merge them.
- One-off colors (used once) and inert `var(--primary-color, #aaaaaa)` fallbacks are deliberately left as literals — do not "consolidate" them.

### Optional Accent Emphasis (Section 4b) — intentional opt-in

Section 4b holds emphasis-text tokens (`ha-heading-card-title-color`, `ha-heading-card-subtitle-color`, `ha-card-header-color`) set to `var(--primary-color)`. `ha-heading-card-subtitle-color` is intentionally active by default so section heading subtitles pop with accent color on accent themes. Other emphasis tokens (`ha-card-header-color`, `ha-heading-card-title-color`) remain commented out as a **deliberate opt-in**: default behavior keeps card titles white; a user uncomments a line to route the accent onto card title text. The `card-header` accent hook is live via a var-with-fallback in the Section 20 `card-mod-card` (`var(--ha-card-header-color, #ffffff)`); keep that fallback so white stays the default. Section 13b similarly holds intentional per-state lock colors.

## Critical Rules When Modifying the Theme

These rules are enforced by Home Assistant's theme loader and will cause failures or log spam if violated. See `docs/DEVELOPMENT.md` for full detail.

1. **Every top-level key is a theme name** — there is no way to hide a theme from the UI picker.
2. **All values must be strings** — never nest a dict inside a theme block; HA's config loader will crash on restart.
3. **Anchors before aliases** — YAML is processed sequentially. An alias (`*acc_red`) must appear after its anchor (`&acc_red`) in the file.
4. **No duplicate keys across anchor merges** — if a token is defined in the base anchor (`base_logic`), do NOT redefine it in any Section B variant, even with the same value. HA logs a warning per theme for every duplicate. Before adding a token to a variant, grep for it in the base anchor first.
5. **Do not add `primary-color`, `state-active-color`, or `card-mod-theme` to the base anchor** — these vary per accent variant and belong only in Section B.
6. **`card-mod-theme` must exactly match the HA picker name** — e.g. `"Black with Violet"` not `"Black Violet"`. Mismatch silently breaks card-mod theme profile tracking.
7. **Quote any value containing `#`** — in YAML an unquoted value ends at a space followed by `#`; the rest becomes a comment. `ha-color-primary-05: hsl(from var(--primary-color, #aaaaaa) …)` silently loads as `hsl(from var(--primary-color,` — broken CSS on **every** theme in the file, not just the one being edited. Always write `"…"` around a value that contains a hex color inside a `var()` fallback. See YAML Standards below for how to detect it.

## YAML Standards (for linting)

Rules come from `.validate/.yamllint` (`extends: default`, with `document-start: disable`, `line-length: disable`, and `comments: min-spaces-from-content: 1`). Notably:

- **No `---` document start** — `document-start` is disabled to match Home Assistant convention (HA does not use it). Do not add `---` to the theme file.
- **No line-length limit** — `line-length` is disabled, so aligned token blocks (e.g. the Section 1c Neutral Ramp) may exceed 80 characters. Do not reflow or split lines purely to satisfy an 80-char rule; it is not enforced.
- **No trailing whitespace** (still enforced by the `default` ruleset).
- **Inline comments** need at least one space from content.

### Detecting the `#` truncation trap (Critical Rule 7)

`yamllint` reports one `missing starting space in comment` warning per affected line — it is parsing the discarded remainder as a comment. That is the signature:

```bash
yamllint -c .validate/.yamllint themes/
```

Two things make this dangerous. It is a **warning, not an error**, so a broken file still passes CI. And `codespell` cannot see it at all — a spell checker is not a validator. After editing any value containing `#`, run `yamllint` and confirm the value survives:

```bash
python -c "import yaml;print(yaml.safe_load(open('themes/very_dark_black_ha_theme.yaml'))['Black with White']['ha-color-primary-05'])"
```

A value ending in `,` is truncated. This occurred on 2026-08-02 and broke 20 tokens across all 11 themes.

## HA Version Compatibility

| HA Version | Feature Added |
| :-- | :-- |
| 2022.11+ | Core dark backgrounds, cards, sidebar |
| 2025.1+ | Inputs, dialogs, modern card layouts |
| 2026.4+ | Dynamic HSL color scales (`hsl(from var(...) ...)`) |
| 2026.5+ | Web Awesome tokens: `ha-switch`, `ha-checkbox`, `ha-progress-bar` |
| 2026.6+ | Web Awesome tokens: `ha-radio-group`, `ha-radio-option` |
| 2026.7+ | Component behavior only — no token changes |
| 2026.8+ | `ha-bottom-sheet-*` tokens (adaptive dialogs). `paper-item-icon-color` and `state-icon-active-color` no longer referenced by the frontend |

The `hsl(from ...)` relative color syntax used for the `ha-color-neutral-*` and `ha-color-primary-*` scales requires HA 2026.4+ and a modern browser.

Verified against HA 2026.8.0b3 on 2026-08-02. Per-version notes are in `docs/change_ref_ha_v2026_*.md`.

## Adding a New Accent Color Variant

1. Define an anchor for the new color hex in the base theme (follow the existing `&acc_*` naming pattern, alongside the other named color anchors at the top of `base_logic`).
2. Add a corresponding `*-color` named color token in that same block (e.g., `lime-color: &acc_lime "#..."`).
3. Add the new theme entry at the end of Section B:

   ```yaml
   Black with Lime:
     <<: *base_logic
     card-mod-theme: "Black with Lime"
     primary-color: *acc_lime
     state-active-color: var(--primary-color)
   ```

## card-mod Integration

`card-mod` (optional dependency) is used in the `card-mod-card` block in the base theme to inject global CSS. Key behaviors:

- Forces all `ha-card` elements to a black background with the theme border.
- Explicitly sets `background: transparent; border: none` for cards intended to be transparent: `hui-heading-card`, `mushroom-title-card`, `mushroom-chips-card`, `.type-custom-bubble-card`, `hui-conditional-card`, `custom-button-card`.
- Applies custom scrollbar styling and `-webkit-font-smoothing: antialiased`.
- `card-mod-more-info` overrides dialog heading/surface text to pure white (needed for black backgrounds; standard themes don't require this).
- References both native HA tokens (`var(--ha-card-background)`, `var(--divider-color)`) **and** the theme's own Neutral Ramp tokens (`var(--token-neutral-line-strong, #333333)`, `var(--token-neutral-deep, …)`, `var(--token-neutral-white, …)`). Theme-defined tokens in `card-mod` are a sanctioned pattern as of the Section 1c consolidation — always keep the literal `var()` fallback so the block still renders if a token is unset.

Avoid deep shadow-DOM selectors (e.g., `ha-card-picker $ ha-sub-page`) — they break when HA updates its component structure. Prefer CSS tokens (native HA tokens, or the theme's `--token-neutral-*` ramp with a literal fallback) over hardcoded hex literals.

## Modern Token Migration Context

HA is migrating from `paper-` / `mdc-` variables to **Web Awesome** (Shoelace/Lit) and **Material 3** tokens. When a UI element appears unstyled after an HA update, the likely cause is a renamed or new token. Reference themes used for comparison: [`Frosted Glass`](https://github.com/wessamlauf/homeassistant-frosted-glass-themes) and [`Graphite`](https://github.com/TilmanGriesel/graphite).

Token hierarchy for icons — all three are defined **once in the base anchor** (Section 4) as `var(--primary-color, #aaaaaa)`, so each variant picks up its own accent through the merge. Do **not** redefine them per variant: there is no "Section C", and duplicating a base key into a Section B variant violates Critical Rule 4 and makes HA log a duplicate-key warning for every theme in the file.

- `state-icon-color` — **the live token on HA 2026.8.** The only one of the three the compiled frontend still references
- `paper-item-icon-color` — **legacy.** Zero occurrences in the 2026.8 bundles. Retained for older HA
- `state-icon-active-color` — **legacy.** Zero occurrences in the 2026.8 bundles. Retained for older HA

Modern HA also builds per-domain icon colors at runtime as `--state-<domain>-<state>-color`, which take precedence over the tokens above. A literal search for those names in the bundles finds nothing — they are constructed from template strings, so absence from a grep does not mean absence from the product.

Keep all three (see Backward compatibility below), but when diagnosing an icon color on 2026.8, `state-icon-color` is the one that matters.

**Backward compatibility:** Keep old/superseded tokens (`paper-*`, `mdc-*`). They fail silently on newer HA — no warnings, no visual impact. Removing them breaks older HA versions. Only remove if a token actively causes a conflict or warning.

**New token classification — always check before adding:**

- **Category A** (hardcoded component default): add only if the default looks wrong on black.
- **Category B** (component defaults to `var(--primary-color)`): add immediately to the base anchor using `var(--primary-color, #aaaaaa)`. On `Black with White`, `--primary-color` is unset → transparent → invisible. Do not wait for a visible failure — on the base theme it is invisible by definition.
- **`:host` trap**: some components redeclare tokens internally via `:host { --token: var(--primary-color) }`, overriding any inherited value. These cannot be fixed without setting `primary-color` directly (which causes warnings — an absolute constraint). Document as permanent `Black with White` limitations.

See `docs/DEVELOPMENT.md` Section 5 for full detail and examples.

## Development Environment

The project uses a VS Code devcontainer running a live Home Assistant instance for manual theme testing. The container image is `ha-dev-base:latest`. Theme changes take effect immediately without restarting HA — reload via `Tools → YAML → Reload Themes` or the `frontend.reload_themes` service call.

### Interrogating the running HA instance

Use **HAB → MCP → Script**, in that order — the full protocol (the host-side `hab` executable, its per-project credential trap, the availability pre-flight) is in [shared conventions §3](.shared/dev_std/agent_conventions.md). For this project the common needs are reading theme state and forcing a reload; both work over any of the three.

**After any modification, follow the post-modification process** — see [`.shared/prompts/post_mod_process.md`](.shared/prompts/post_mod_process.md). Specify a `SCOPE` when invoking it. Python-specific steps (mypy, pytest, pre-commit, ruff) skip automatically — `project.category = theme` guards them in the shared task definitions.

The SCOPE table below is **theme-specific** and replaces the integration table in the shared conventions file — the `Full` and `Complete` rows differ because there is nothing Python to run.

| SCOPE      | What runs                                                              |
| :--------- | :--------------------------------------------------------------------- |
| `None`     | Changes only — no validation                                           |
| `Basic`    | HA restart + error check + lint/format fixes                           |
| `Full`     | Basic + YAML lint, Prettier, codespell, HACS manifest, markdown checks |
| `Complete` | Full + Zizmor audit                                                    |

For rapid visual iteration between restarts, trigger a theme reload without restarting:

- Call `ha_call_service` with domain `frontend`, service `reload_themes`

### Switching themes — check the profile first

`frontend.set_theme` sets the **backend default** only. An explicit theme selected in the user's HA profile **overrides it and the call is silently ignored** — the service still returns success. This is deliberate Home Assistant behavior: a backend action never overwrites a human's per-device choice. No service call clears it, and writing the value directly does not survive a reload.

Before switching themes, check — and if a theme is set, ask the user to clear it (**Profile → Theme → X**, leaving _Use default theme_) rather than trying to work around it:

```javascript
document.querySelector("home-assistant").hass.selectedTheme; // {theme: ""} = OK
document.documentElement.__themes.cacheKey; // what is ACTUALLY applied
```

Two related traps: `frontend.set_theme` needs `"mode": "dark"` when a dark-mode default is set, and the `theme-test` dashboard pins per-card themes in places, so a card may not reflect the page theme. Full detail and the five-layer precedence order are in [`.shared/prompts/theme_review.md`](.shared/prompts/theme_review.md) STEP 0.

### Skill Prompts

The shared prompt catalogue is listed in [shared conventions §3](.shared/dev_std/agent_conventions.md) — `devcon_run_gen.md` for arbitrary commands inside the devcontainer, `post_mod_process.md` for the SCOPE-driven validation pass. Container identity values (`CONTAINER_NAME`, `PROJECT_DIR`) are in `.devcontainer/.env`.

One prompt is specific to this project: `.shared/prompts/theme_review.md`, the theme token drift review guide. Use it when an HA update is suspected to have renamed or removed tokens. It provides a Playwright-based workflow for inspecting component shadow DOMs, reading `adoptedStyleSheets`, and cross-referencing against the theme YAML to detect invalid `var()` chains, dead tokens, and missing Category B overrides.

## README Known Decisions

These are deliberate choices in `README.md`. Do not raise findings against them in any review (including readme_review), in any section.

- **"Sections" terminology** — "Sections" in the README means the HA Sections view type (introduced HA 2024.3). It is the standard term. Do not flag it as ambiguous.
- **`Black with White` in picker** — `Black with White` appearing in the picker alongside the accent variants is a structural consequence of HA's theme architecture (the base anchor must be a named theme entry). It is intentionally treated as a usable no-accent variant, not flagged as an error or infrastructure artifact. Do not flag its presence or description as a limitation finding.
- **Automate Theme Changes navigation table** — the scenario/trigger/jump-to table in the Automate Theme Changes section is intentional structure. Do not flag it as redundant or suggest removing it.
- **card-mod documentation — deliberately omitted** — the theme lists card-mod as optional but includes no limitations section, no visual comparison, and no "without card-mod" caveats. This is intentional: the visual difference on modern HA is not perceptible. Do not flag the absence of card-mod limitation content as a missing information finding (2a), and do not flag any card-mod-adjacent wording as suggesting features are "inactive" or broken without it.

## Shared Conventions

Markdown rules (the single-codepoint emoji ban for headings), temporary-file placement, the no-nuclear-restart rule, and progress reporting are centralized — see [`.shared/dev_std/agent_conventions.md`](.shared/dev_std/agent_conventions.md) §5–7. Sections 1–4 of that file are integration-specific; only §1 (`docker exec`) and §3 (HA interrogation) apply here, and the Python tooling in §2 and §4 does not.

The emoji rule matters for this project in particular: `README.md` uses emoji in almost every heading.
