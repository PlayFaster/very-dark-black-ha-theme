# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

## What This Theme Does

**Very Dark Black HA Theme** is a Home Assistant theme pack that provides pure black backgrounds with a choice of accent colors. The entire project ships as a single YAML file (`themes/very_dark_black_ha_theme.yaml`) that Home Assistant loads directly.

Available accent color variants: Blue, Cyan, Emerald, Green, Indigo, Orange, Pink, Red, Silver (monochrome), Violet, White (no accent). `Black with White` doubles as the base anchor all variants inherit from — it appears in the picker as a structural side-effect of HA's theme architecture and is a usable no-accent variant in its own right.

## Project Structure

```text
themes/very_dark_black_ha_theme.yaml          ← The entire theme (single file, ~540 lines)
docs/DEVELOPMENT.md                           ← Critical dev reference: pitfalls & architecture
docs/change_ref_ha_v2026_4.md                 ← HA 2026.4 frontend migration notes
docs/change_ref_ha_v2026_5.md                 ← HA 2026.5 Web Awesome component notes
docs/change_ref_ha_v2026_6.md                 ← HA 2026.6 Web Awesome radio component notes
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

For one-off commands, use `docker exec` from the Windows host:

```bash
# Confirm the container is up first
docker ps --filter "name=<CONTAINER_NAME>" --format "{{.Names}}"

# Run a tool inside the container (-w sets the in-container working dir)
docker exec -w /workspaces/<PROJECT_DIR> <CONTAINER_NAME> bash -c "codespell ."
docker exec -w /workspaces/<PROJECT_DIR> <CONTAINER_NAME> bash -c "yamllint -c .validate/.yamllint themes/"
```

## Theme File Architecture (3-Section YAML)

The single theme file uses YAML anchors/aliases to avoid duplication. The structure is strictly ordered — anchors must be defined before they are referenced:

- **Base theme — `Black with White` (`&base_logic`)**: All shared tokens: backgrounds, card surfaces, dialogs, borders, dividers, typography, icons, inputs, color scales, energy/graph colors, named colors (`red-color`, `cyan-color`, etc.), and the global `card-mod-card` CSS block. This mapping IS the `&base_logic` anchor. It is also a usable no-accent variant (white text and icons, HA semantic state colors, no `primary-color`).
- **Section B — Individual variants**: Each accent theme (e.g., `Black with Cyan`) extends the base via `<<: *base_logic` and only adds `primary-color`, `state-active-color`, and `card-mod-theme`. Eleven variants: Blue, Cyan, Emerald, Green, Indigo, Orange, Pink, Red, Silver, Violet. Orange additionally overrides `state-switch-active-color`, `state-plug-active-color`, and `state-binary_sensor-active-color` to Red (to avoid yellow-adjacent active states).

## Critical Rules When Modifying the Theme

These rules are enforced by Home Assistant's theme loader and will cause failures or log spam if violated. See `docs/DEVELOPMENT.md` for full detail.

1. **Every top-level key is a theme name** — there is no way to hide a theme from the UI picker.
2. **All values must be strings** — never nest a dict inside a theme block; HA's config loader will crash on restart.
3. **Anchors before aliases** — YAML is processed sequentially. An alias (`*acc_red`) must appear after its anchor (`&acc_red`) in the file.
4. **No duplicate keys across anchor merges** — if a token is defined in the base anchor (`base_logic`), do NOT redefine it in any Section B variant, even with the same value. HA logs a warning per theme for every duplicate. Before adding a token to a variant, grep for it in the base anchor first.
5. **Do not add `primary-color`, `state-active-color`, or `card-mod-theme` to the base anchor** — these vary per accent variant and belong only in Section B.
6. **`card-mod-theme` must exactly match the HA picker name** — e.g. `"Black with Violet"` not `"Black Violet"`. Mismatch silently breaks card-mod theme profile tracking.

## YAML Standards (for linting)

- Start `.yaml` files with `---`
- Lines must be under 80 characters — split CSS shorthand properties (`border` → `border-width`, `border-style`, `border-color`)
- No trailing whitespace

## HA Version Compatibility

| HA Version | Feature Added                                                     |
| :--------- | :---------------------------------------------------------------- |
| 2022.11+   | Core dark backgrounds, cards, sidebar                             |
| 2025.1+    | Inputs, dialogs, modern card layouts                              |
| 2026.4+    | Dynamic HSL color scales (`hsl(from var(...) ...)`)               |
| 2026.5+    | Web Awesome tokens: `ha-switch`, `ha-checkbox`, `ha-progress-bar` |
| 2026.6+    | Web Awesome tokens: `ha-radio-group`, `ha-radio-option`           |

The `hsl(from ...)` relative color syntax used for the `ha-color-neutral-*` and `ha-color-primary-*` scales requires HA 2026.4+ and a modern browser.

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

Avoid deep shadow-DOM selectors (e.g., `ha-card-picker $ ha-sub-page`) — they break when HA updates its component structure. Prefer native CSS tokens.

## Modern Token Migration Context

HA is migrating from `paper-` / `mdc-` variables to **Web Awesome** (Shoelace/Lit) and **Material 3** tokens. When a UI element appears unstyled after an HA update, the likely cause is a renamed or new token. Reference themes used for comparison: [`Frosted Glass`](https://github.com/wessamlauf/homeassistant-frosted-glass-themes) and [`Graphite`](https://github.com/TilmanGriesel/graphite).

Token hierarchy for icons (define in each Section C variant for per-accent matching):

- `paper-item-icon-color` — legacy/standard icon color
- `state-icon-color` — neutral/inactive icon state
- `state-icon-active-color` — "On"/active icon state

**Backward compatibility:** Keep old/superseded tokens (`paper-*`, `mdc-*`). They fail silently on newer HA — no warnings, no visual impact. Removing them breaks older HA versions. Only remove if a token actively causes a conflict or warning.

**New token classification — always check before adding:**

- **Category A** (hardcoded component default): add only if the default looks wrong on black.
- **Category B** (component defaults to `var(--primary-color)`): add immediately to the base anchor using `var(--primary-color, #aaaaaa)`. On `Black with White`, `--primary-color` is unset → transparent → invisible. Do not wait for a visible failure — on the base theme it is invisible by definition.
- **`:host` trap**: some components redeclare tokens internally via `:host { --token: var(--primary-color) }`, overriding any inherited value. These cannot be fixed without setting `primary-color` directly (which causes warnings — an absolute constraint). Document as permanent `Black with White` limitations.

See `docs/DEVELOPMENT.md` Section 5 for full detail and examples.

## Development Environment

The project uses a VS Code devcontainer running a live Home Assistant instance for manual theme testing. The container image is `ha-dev-base:latest`. Theme changes take effect immediately without restarting HA — reload via `Developer Tools → YAML → Reload Themes` or the `frontend.reload_themes` service call.

### MCP Access (ha-mcp-dev)

When the devcontainer is running, the `ha-mcp-dev` MCP server automatically connects to the HA instance inside it (`http://localhost:8123`). Use it to verify theme changes without leaving the editor.

**After any modification, follow the post-modification process** — see [`.shared/prompts/post_mod_process.md`](.shared/prompts/post_mod_process.md). Specify a `SCOPE` when invoking it. Python-specific steps (mypy, pytest, pre-commit, ruff) skip automatically — `project.category = theme` guards them in the shared task definitions.

| SCOPE      | What runs                                                              |
| :--------- | :--------------------------------------------------------------------- |
| `None`     | Changes only — no validation                                           |
| `Basic`    | HA restart + error check + lint/format fixes                           |
| `Full`     | Basic + YAML lint, Prettier, codespell, HACS manifest, markdown checks |
| `Complete` | Full + Zizmor audit                                                    |

For rapid visual iteration between restarts, trigger a theme reload without restarting:

- Call `ha_call_service` with domain `frontend`, service `reload_themes`

### Skill Prompts

See `.shared/prompts/devcon_run_gen.md` for the mini-skill for running arbitrary commands inside this devcontainer from the Windows host. Container identity values (`CONTAINER_NAME`, `PROJECT_DIR`) are in `.devcontainer/.env`.

See `.shared/prompts/theme_review.md` for the theme token drift review guide. Use it when an HA update is suspected to have renamed or removed tokens. It provides a Playwright-based workflow for inspecting component shadow DOMs, reading `adoptedStyleSheets`, and cross-referencing against the theme YAML to detect invalid `var()` chains, dead tokens, and missing Category B overrides.

## README Known Decisions

These are deliberate choices in `README.md`. Do not raise findings against them in any review (including readme_review), in any section.

- **"Sections" terminology** — "Sections" in the README means the HA Sections view type (introduced HA 2024.3). It is the standard term. Do not flag it as ambiguous.
- **`Black with White` in picker** — `Black with White` appearing in the picker alongside the accent variants is a structural consequence of HA's theme architecture (the base anchor must be a named theme entry). It is intentionally treated as a usable no-accent variant, not flagged as an error or infrastructure artifact. Do not flag its presence or description as a limitation finding.
- **Automate Theme Changes navigation table** — the scenario/trigger/jump-to table in the Automate Theme Changes section is intentional structure. Do not flag it as redundant or suggest removing it.
- **card-mod documentation — deliberately omitted** — the theme lists card-mod as optional but includes no limitations section, no visual comparison, and no "without card-mod" caveats. This is intentional: the visual difference on modern HA is not perceptible. Do not flag the absence of card-mod limitation content as a missing information finding (2a), and do not flag any card-mod-adjacent wording as suggesting features are "inactive" or broken without it.
