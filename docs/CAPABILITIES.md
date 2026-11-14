# Very Dark Black HA Theme — Capabilities Dossier

An architectural and functional inventory of **Very Dark Black HA Theme** (`very-dark-black-ha-theme`), a pure-black Home Assistant theme suite with 11 selectable variants.

**Current Through:** 1.4.2 (covering 1.0.1 to 1.4.2) · **Last Audited:** 2026-11-14 · **Status:** Active

---

## 1. Theme Variants & Inheritance

### 1.1 11-Variant Theme Architecture

- **Purpose**: Provides a pure-black (`#000000`) base theme alongside 10 selectable accent color variants without duplicating shared styling rules.
- **Entities & Interfaces**: `Black with White` (`&base_logic`) plus `Black with Blue`, `Black with Cyan`, `Black with Emerald`, `Black with Green`, `Black with Indigo`, `Black with Orange`, `Black with Pink`, `Black with Red`, `Black with Silver`, and `Black with Violet` (`themes/very_dark_black_ha_theme.yaml:19,545-615`).
- **Technical Guarantees**:
  - Single-anchor YAML merge inheritance (`<<: *base_logic`): variant-specific keys (`primary-color`, `state-active-color`, `card-mod-theme`) are isolated to Section B so Home Assistant logs zero duplicate-key warnings. `Black with Orange` additionally overrides `state-active-color`, `state-switch-active-color`, `state-plug-active-color`, and `state-binary_sensor-active-color` to `*acc_red` (`very_dark_black_ha_theme.yaml:584-587`).
  - Monochrome control visibility: `Black with White` omits `primary-color` intentionally, so active controls fall back to `"var(--primary-color, #aaaaaa)"` / `"var(--primary-color, #e0e0e0)"` rather than rendering invisible.
- **Lifecycle Timeline**:
  - `1.0.1`: Initial release (`Black with Cyan`).
  - `1.1.1`: Added Green, Red, Fuchsia, and Orange variants.
  - `1.3.1`: Added Purple, Indigo, Silver, and `Black Base` utility theme.
  - `1.3.8`: Consolidated utility themes into `Black with White` base anchor.
  - `1.4.0`: Added Blue and Emerald; renamed Purple → Violet and Fuchsia → Pink (11 variants total).
  - `1.4.1`: Restored monochrome active control fill on `Black with White`.

### 1.2 Light-Mode Dark Fallback & Backward Compatibility

- **Purpose**: Keeps Home Assistant dark on systems configured for light mode and preserves legacy CSS variable names for user `card-mod` snippets.
- **Entities & Interfaces**: `modes.dark` / `modes.light` block (`very_dark_black_ha_theme.yaml:199-201`), `purple-color`, and `fuchsia-color` (`very_dark_black_ha_theme.yaml:26,31`).
- **Technical Guarantees**:
  - Explicit `modes.light` mirror prevents light-mode OS/browser settings from reverting surfaces to light defaults.
  - Legacy `var(--purple-color)` (`#9c27b0`) and `var(--fuchsia-color)` (`#ff00ff`) tokens remain defined after the `1.4.0` rename to Violet/Pink.
- **Lifecycle Timeline**:
  - `1.3.1`: Added explicit light-mode dark fallback.
  - `1.4.0`: Retained `purple-color` and `fuchsia-color` for backward compatibility.

---

## 2. Color & Token Architecture

### 2.1 Single-Source Neutral Ramp & RGB Primitives

- **Purpose**: Eliminates duplicated neutral hex literals and RGB channel tuples across the theme file and `card-mod` blocks.
- **Entities & Interfaces**: 10 `--token-neutral-*` keys (`Section 1c`, `very_dark_black_ha_theme.yaml:53-71`), 12 `--token-rgb-*` tuples (`Section 1b`, `very_dark_black_ha_theme.yaml:35-51`), and 3 `--token-size-radius-*` tokens (`Section 3`, `very_dark_black_ha_theme.yaml:87-89`).
- **Technical Guarantees**:
  - Dual CSS-var + YAML-anchor definitions allow `card-mod` (`Section 20`) to consume `var(--token-neutral-*, <literal>)` while YAML keys reuse `*base_*` / `*acc_*` aliases at parse time.
  - Anchor-resolution diff verified value-identical across all 307 keys × 11 themes (`1.4.0-dev9`).
- **Lifecycle Timeline**:
  - `1.3.3`: Added granular `--token-size-radius-*` scale (`8px`, `12px`, `16px`).
  - `1.3.7`: Added `--token-rgb-*` channel tuples for `rgba()` opacity variants.
  - `1.4.0`: Consolidated repeated neutrals into Section 1c Neutral Ramp.

### 2.2 Dynamic HSL Color Scales

- **Purpose**: Generates 05–95 primary and neutral tonal ramps dynamically from each variant's `--primary-color`.
- **Entities & Interfaces**: `ha-color-primary-05`..`95` and `ha-color-neutral-05`..`95` (`very_dark_black_ha_theme.yaml:219-243`).
- **Technical Guarantees**:
  - All 20 `hsl(from var(--primary-color, #aaaaaa) ...)` expressions are double-quoted so YAML parsers do not treat `#aaaaaa` as an inline comment.
  - Multiplier progression (`1.0×` at `-40` through `1.90×` at `-95`) matches the neutral scale.
- **Lifecycle Timeline**:
  - `1.3.3`: Introduced dynamic HSL primary and neutral scales (HA 2026.4+).
  - `1.3.3-dev11`: Fixed `ha-color-primary-50..95` step multipliers.
  - `1.4.1-dev8`: Double-quoted all 20 fallback expressions to prevent `#` truncation.

### 2.3 Optional Accent Emphasis

- **Purpose**: Allows users to opt into accent-colored card and heading titles without altering default white/light-grey text hierarchy.
- **Entities & Interfaces**: Section 4b (`ha-card-header-color` and `ha-heading-card-title-color` commented out as opt-ins; `ha-heading-card-subtitle-color` active at `very_dark_black_ha_theme.yaml:130`) and `card-mod` `.card-header` hook (`very_dark_black_ha_theme.yaml:113-134,466+`).
- **Technical Guarantees**:
  - `.card-header` reads `var(--ha-card-header-color, #ffffff) !important`, ensuring user overrides take effect while preserving `#ffffff` as the default.
- **Lifecycle Timeline**:
  - `1.4.0`: Added Section 4b opt-in block and live `ha-card-header-color` hook.
  - `1.4.1-dev8`: Activated `ha-heading-card-subtitle-color: var(--primary-color)` for accent subtitle emphasis.

---

## 3. Home Assistant Component & Card Support

### 3.1 Modern M3 & Web Awesome Components

- **Purpose**: Maintains native styling parity across Material 3 and Web Awesome components introduced in Home Assistant 2025.1+ through 2026.6+.
- **Entities & Interfaces**: `--md-sys-color-*` (`Section 11`), `ha-switch-*`, `ha-checkbox-*`, `ha-progress-bar-*`, `ha-box-shadow-s/m/l`, `ha-color-surface-default` (`Section 16`), and `ha-radio-group` / `ha-radio-option` (`Section 17`, `very_dark_black_ha_theme.yaml:203-218,314-386`).
- **Technical Guarantees**:
  - Flat shadow tokens (`"none"`) and elevated surface tokens prevent white-on-white tooltips and unstyled popovers.
  - Radio, checkbox, switch, and slider tokens carry `var(--primary-color, #aaaaaa)` fallbacks for monochrome compatibility.
- **Lifecycle Timeline**:
  - `1.3.1`: Added `--ha-` and `--sl-` (Shoelace) tokens for HA 2025+.
  - `1.3.3`: Added M3 and Web Awesome semantic tokens for HA 2026.4+.
  - `1.3.4`: Added HA 2026.5 Web Awesome switch, checkbox, progress bar, shadow, and surface tokens.
  - `1.3.5`: Added HA 2026.6 Web Awesome radio tokens.

### 3.2 Accessibility & State Color Mappings

- **Purpose**: Ensures WCAG AA legibility on pure-black surfaces and harmonizes semantic state colors with the active accent variant.
- **Entities & Interfaces**: `secondary-text-color` (`#a8a8a8`), `ha-tooltip-*`, `label-badge-*`, `ha-color-on-danger/warning-*`, dark `-quiet-*` and `success` semantic fills (`Section 15`), `state-lock-*-color`, Energy dashboard tokens, and 10-series `graph-color-*` palette (`very_dark_black_ha_theme.yaml:36-39,93,244-312,327-328,419-425`).
- **Technical Guarantees**:
  - Secondary text (`#a8a8a8`), darkened `label-badge-*` fills, and translucent `rgba(var(--token-rgb-*), ...)` danger/warning tags maintain contrast against `#000000` and `#ffffff`.
  - Lock states map to accent (locked), muted grey (unlocked/transitional), and red (jammed) instead of HA's fixed green/red.
- **Lifecycle Timeline**:
  - `1.3.3`: Brightened secondary text; added Energy dashboard and 10-series graph palettes.
  - `1.3.7`: Added tooltip overrides, danger/warning tag fills, and darkened label badges for WCAG AA compliance.
  - `1.4.0`: Added lock entity state colors, inline code text color, and pure-black code editor surface.

### 3.3 Optional `card-mod` & Third-Party Exclusions

- **Purpose**: Enhances scrollbars, data-table headers, and more-info dialogs when `card-mod` is installed while avoiding visual breakage on third-party cards.
- **Entities & Interfaces**: `card-mod-theme` (all 10 Section B accent variants; `very_dark_black_ha_theme.yaml:545-615`), `card-mod-card`, and `card-mod-more-info` (`very_dark_black_ha_theme.yaml:466-537`).
- **Technical Guarantees**:
  - `card-mod` is strictly optional; all core colors and controls work via native CSS custom properties.
  - Every `card-mod-theme` string matches its exact HA theme picker name (`1.3.3-dev11`); CSS exclusions cover Mushroom (Title/Chips), Bubble Card, Conditional, Custom Button, Heading, and Glance cards (`1.3.3`).
- **Lifecycle Timeline**:
  - `1.0.1` (verified): Included base theme and `card-mod` styling.
  - `1.3.3`: Expanded third-party card exclusions; aligned `card-mod-theme` names and removed brittle `ha-card-picker` selector.
  - `1.4.0`: Updated `card-mod` blocks to read `--token-neutral-*` and `ha-card-header-color`.

---

## 4. Compatibility & Distribution

### 4.1 HACS & Home Assistant Version Floor

- **Purpose**: Tracks supported Home Assistant versions, HACS metadata, and frontend CSS variable deprecations.
- **Entities & Interfaces**: `hacs.json` (`homeassistant: "2022.11.0"`, `filename: "very_dark_black_ha_theme.yaml"`, `render_readme: true`), `docs/ha_compatibility.md`, `README.md` (with `https://hacs.xyz/` `Marketplace` shield target), and `.github/images/` screenshots (`1.4.2`).
- **Technical Guarantees**:
  - Enforces `2022.11.0` minimum in `hacs.json` while documenting progressive capabilities (`2025.1+`, `2026.4+` HSL scales) and frontend token deprecations through `2026.11` in `docs/ha_compatibility.md`.
- **Lifecycle Timeline**:
  - `1.2.2`: Initial GitHub repository release.
  - `1.3.7`: Official HACS listing.
  - `1.4.2-dev7`: Created `docs/ha_compatibility.md` deprecation and compatibility ledger.

---

## 5. Platform, Tooling & Diagnostics Infrastructure

### 5.1 Shared Validation & CI Suites

- **Purpose**: Enforces YAML, JSON schema, HACS manifest, Markdown, spelling, and GitHub Actions security standards across host and devcontainer environments.
- **Entities & Interfaces**: `.github/workflows/validate.yaml` (`PlayFaster/.github` `v2.0.18`), `.vscode/tasks.json` (`Fix All Fast`, `Validate Fast (Docs & Style)`, `Validate All`), `.validate/hacs_schema.json`, and `pyproject.toml`.
- **Technical Guarantees**:
  - `project.category = theme` in `.vscode/settings.json` skips Python tasks (`Ruff`, `Mypy`, `Pytest`, `Pre-commit`) with a neutral `–` status while running `yamllint`, `jq` + `check-jsonschema --check-metaschema`, `HACS: Verify Manifest` (`additionalProperties: false`), `HA: Check Config`, `markdownlint`, `codespell`, `zizmor --pedantic`, and `prettier` (non-Markdown).
- **Lifecycle Timeline**:
  - `1.3.1`: Added local YAML lint and JSON schema validation.
  - `1.3.5-dev1`: Hardened GitHub Actions CI (`concurrency`, read-only permissions, SHA pinning, Zizmor, Codespell, Prettier).
  - `1.3.6-dev5` / `1.3.7-dev4`: Migrated to shared `.github` / `dev-workbench` tooling.
  - `1.4.2-dev8`: Synced `Fix All Fast` / `Validate Fast (Docs & Style)` suite names, draft-correct JSON validation, `.prettierignore`, and `.github` `v2.0.18`.

### 5.2 Theme Test Dashboard & Mock Entities

- **Purpose**: Provides a repeatable live Home Assistant dashboard to visually inspect all 11 variants across native and custom cards.
- **Entities & Interfaces**: `.ha/ui-theme-test.yaml` and `.ha/mock_package.yaml`.
- **Technical Guarantees**:
  - Git-tracked outside `.devcontainer/.devconfig/` and loaded at `/workspaces/${PROJECT_NAME}/.ha/`; includes 5 views (including Compare and a fifth `Broken` view at `path: broken`), a disabled `theme_test_broken_checker` automation, and mock entities covering card, form, control, and graph states, updated to `color: state` for HA 2026.8 (`1.4.2-dev4`) and documented in `AGENTS.md` (`1.4.2`).
- **Lifecycle Timeline**:
  - `1.3.8-dev2`: Created `ui-theme-test.yaml` and dummy sensors.
  - `1.3.8-dev6`: Relocated to `.ha/ui-theme-test.yaml` and `.ha/mock_package.yaml` with Compare view.
  - `1.4.2-dev4`: Migrated `state_color: true` to `color: state` for HA 2026.8.

### 5.3 Changelog & Compatibility Audit Tooling

- **Purpose**: Keeps public release notes, local engineering logs, and compatibility ledgers synchronized and machine-validated.
- **Entities & Interfaces**: `CHANGELOG.md`, `docs/changelog_local.md`, and `docs/ha_compatibility.md`.
- **Technical Guarantees**:
  - `docs/changelog_local.md` carries the canonical Authoring Rules callout (`check_changelog_header.py`) and `Document Audit Status` (`1.4.2-dev12..1.0.1` verified); `CHANGELOG.md` carries `Summary`, `Highlights`, lineage tags, and `Under the hood` sections (`1.4.2`–`1.0.1`).
- **Lifecycle Timeline**:
  - `1.4.2-dev7`: Added `docs/ha_compatibility.md`.
  - `1.4.2-dev8`: Remediated `docs/changelog_local.md` (`CF-101`/`CF-202`) and aligned `CHANGELOG.md` (`1.4.1`–`1.0.1`).
  - `1.4.2-dev9`: Added `docs/CAPABILITIES.md`, reorganized `.notes/`, and updated `.notes/proj_structure.md` (`v1.0.10`) and `AGENTS.md`.
  - `1.4.2`: Added Section 15 dark `-quiet-*` and `success` semantic fills, `Broken` test view and disabled automation, `README.md` Marketplace doc alignment and updated `.github/images/` screenshots, `AGENTS.md` runner-script alignment (`python3 .workbench/run_task.py "Fix All Fast"`), and `CHANGELOG.md` `[1.4.2]`.

---

*Capabilities dossier audited against codebase and changelogs up to 1.4.2 on 2026-11-14. Maintained via `capabilities_build.md`.*
