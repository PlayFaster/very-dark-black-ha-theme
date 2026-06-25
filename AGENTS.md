# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

## What This Theme Does

**Very Dark Black HA Theme** is a Home Assistant theme pack that provides pure black backgrounds with a choice of accent colors. The entire project ships as a single YAML file (`themes/very_dark_black_ha_theme.yaml`) that Home Assistant loads directly.

Available accent color variants: Cyan, Green, Red, Fuchsia, Orange, Purple, Indigo, Silver (monochrome). Two internal base themes ("Black (Background Only)" and "Black (Standard)") are also exposed in the picker — this is a known, intentional limitation of HA's theme architecture.

## Project Structure

```text
themes/very_dark_black_ha_theme.yaml          ← The entire theme (single file, ~480 lines)
docs/DEVELOPMENT.md                           ← Critical dev reference: pitfalls & architecture
docs/change_ref_ha_v2026_4.md                 ← HA 2026.4 frontend migration notes
docs/change_ref_ha_v2026_5.md                 ← HA 2026.5 Web Awesome component notes
docs/change_ref_ha_v2026_6.md                 ← HA 2026.6 Web Awesome radio component notes
hacs.json                                     ← HACS metadata
.devcontainer/.devconfig/                     ← GITIGNORED — local devcontainer files only
  configuration.yaml                          ←   Live HA config: mock entities for testing
  ui-theme-test.yaml                          ←   3-view Lovelace dashboard (comprehensive)
```

No build system, no scripts, no dependencies to install. Changes are made directly to the YAML file and reloaded in Home Assistant via `frontend.reload_themes`.

> **Note:** `.devcontainer/.devconfig/` is gitignored and never committed. The files there are local-only. `ui-theme-test.yaml` is a comprehensive 3-view Lovelace dashboard (sections × 2, masonry × 1) that exercises every major card type, state, and theme token. `configuration.yaml` contains all mock entities that back the test dashboard.

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

- **Section A — `Black (Background Only)` (`&base_logic`)**: All shared tokens: backgrounds, typography, icons, inputs, color scales, energy/graph colors, named colors (`red-color`, `cyan-color`, etc.), and the global `card-mod-card` CSS block. This is the base anchor.
- **Section B — `Black (Standard)` (`&black_surfaces`)**: Extends Section A via `<<: *base_logic`. Adds card backgrounds, dialog surfaces, borders, and dividers — anything that requires a "deep black" surface rather than just a background.
- **Section C — Individual variants**: Each accent theme (e.g., `Black with Cyan`) extends Section B via `<<: *black_surfaces` and only adds `primary-color`, `state-active-color`, and `card-mod-theme`.

## Critical Rules When Modifying the Theme

These rules are enforced by Home Assistant's theme loader and will cause failures or log spam if violated. See `docs/DEVELOPMENT.md` for full detail.

1. **Every top-level key is a theme name** — there is no way to hide a theme from the UI picker.
2. **All values must be strings** — never nest a dict inside a theme block; HA's config loader will crash on restart.
3. **Anchors before aliases** — YAML is processed sequentially. An alias (`*acc_red`) must appear after its anchor (`&acc_red`) in the file.
4. **No duplicate keys across anchor merges** — if a token is defined in Section A (`base_logic`), do NOT redefine it in Section B (`black_surfaces`), even with the same value. HA logs a warning per theme for every duplicate. Before adding a token to Section B, grep for it in Section A first.
5. **Do not add `primary-color`, `state-active-color`, or `card-mod-theme` to Section A or B** — these vary per accent variant and belong only in Section C.

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

1. Define an anchor for the new color hex in Section A (follow the existing `&acc_*` naming pattern, alongside the other named color anchors at the top of `base_logic`).
2. Add a corresponding `*-color` named color token in that same block (e.g., `lime-color: &acc_lime "#..."`).
3. Add the new theme entry at the end of Section C:

   ```yaml
   Black with Lime:
     <<: *black_surfaces
     card-mod-theme: "Black with Lime"
     primary-color: *acc_lime
     state-active-color: var(--primary-color)
   ```

## card-mod Integration

`card-mod` (optional dependency) is used in the `card-mod-card` block (Section A) to inject global CSS. Key behaviors:

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
