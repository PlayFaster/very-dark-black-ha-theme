# Changelog

All notable changes to this project will be documented in this file.

## [1.3.8-dev3] - 2026-06-25 - Unreleased

### Summary

- **Base Theme Fixes**: Investigated and resolved invisible UI elements (`ha-slider`, `ha-checkbox`, `ha-radio-option`, `ha-progress-bar`) on `Black (Background Only)` and `Black (Standard)`. Root cause: those components chain their active/checked color to `var(--primary-color)`, which is intentionally unset on the base themes. Fixed by adding CSS fallback values in Section A.

### Fixed

- **ha-slider invisible on base themes**: Added `ha-slider-thumb-color` and `ha-slider-indicator-color` to Section A using `var(--primary-color, #aaaaaa)`. The `<ha-slider>` component reads these via CSS inheritance; the fallback activates when `--primary-color` is unset.
- **ha-checkbox checked state invisible on base themes**: Changed `ha-checkbox-checked-background-color` and `ha-checkbox-checked-background-color-hover` from `var(--primary-color)` to `var(--primary-color, #aaaaaa)`.
- **ha-radio-option checked state invisible on base themes**: Same fallback applied to `ha-radio-option-active-color` and `ha-radio-option-checked-background-color`.
- **ha-progress-bar invisible on base themes**: Same fallback applied to `ha-progress-bar-indicator-color` and `ha-progress-bar-indicator-background`.

### Added

- **control-switch-on-color** added to Section A (`var(--primary-color, #aaaaaa)`). This is the actual token `<ha-control-switch>` binds its active color to. Currently has no effect because the component redeclares it via a `:host` CSS rule (overriding inheritance), but is kept for potential future component changes.

### Known Limitation — switch ON state on base themes

`<ha-control-switch>` (the tile card toggle in HA 2026.6+) redeclares `--control-switch-on-color: var(--primary-color)` in a `:host` CSS rule, overriding any externally inherited value. Since `--primary-color` is unset on base themes and adding it to Section A causes duplicate key warnings (an absolute constraint), the switch ON state remains transparent on base themes. No fix is available within the current architecture. This is a permanent known limitation.

### Investigation Notes

Full investigation documented in `.notes/issues/base_theme_issues/`. The original symptom (switch ON and slider invisible) was initially investigated against HA 2026.5b0 (beta), which produced misleading results. Re-investigation on HA 2026.6.4 (release) produced definitive findings. The key discovery: `ha-switch-checked-*` and `paper-slider-*` tokens, added to the theme in 1.3.4, are not consumed by the actual components in HA 2026.6.4. Those tokens are retained for backward compatibility (they fail silently).

## [1.3.8-dev2] - 2026-06-25 - Unreleased

### Summary

- **Theme Test Dashboard**: Created a Theme Test dashboard in the devcontainer to have the various theme elements present in one place for testing purposes

### Added

- **"ui-theme-test.yaml**: Added file /.devcontainer/.devconfig/ui-theme-test.yaml as the Theme Test dashboard.
- **Dummy Sensors**: Added a large number of dummy sensors based on the setup used by the **Graphite** theme

## [1.3.8-dev1] - 2026-06-25 - Unreleased

### Summary

- **Code Review**: Several code review driven changes. See /code_review/code_review_20260624.md

### Changed

- **Form Backgrounds**: Changed form (text-field) hoover to very dark grey and form disabled to a different very dark grey. Subtle but helpful.
- **Section Numbers**: Previous re-orgs and updates of the theme file structure meant that the sections numbers were out of order. Re-numbers, sections 1 to 19 now.
- **Comments**: Added several comments to confirm some decisions to that they would not be flagged again. Also ensured all comments are under 80 chars

## [1.3.7] - 2026-06-24 - Release

### Summary

- The theme is now officially on HACS! No custom repository adding required.
- Made changes based on WCAG AA minimum contrast ratio checks and themes best practice.

### Added

- **Tooltips**: Added ha-tooltip-background-color and ha-tooltip-text-color overrides to resolve the dark-mode issue where tooltips could render with white text on a white background. This is inspired by the **Graphite** theme
- **Danger/Warning Tag Fills**: Added translucent background fills (rgba) and vivid foreground text for resting, hover, and active states of danger and warning tags, resolving illegible low-contrast element rendering on black backgrounds.

### Changed

- **Label Badges**: Darkened standard badge background colors (label-badge-red, label-badge-green, label-badge-blue, label-badge-yellow, label-badge-grey) to meet WCAG AA accessibility requirements and ensure high contrast against white text overlays.
- **Documentation**: Updated README file based on release of theme on HACS. HACS install instructions updated to remove requirement to add as custom repository. Also update HACS badges in README header.

## [1.3.7-dev10] - 2026-06-24 - Unreleased

### Fixed

- **Danger / Warning**: Fixed ha-color-on-danger-normal and ha-color-on-warning-normal so that they display an alert (Red) color, same as HA default, not the text default (white)

## [1.3.7-dev9] - 2026-06-24 - Unreleased

### Summary

- Added RGB tokens to enable rgba() opacity variants in the theme without duplicating the numbers

### Changed

- **RGB Primitive Tokens**: Added a set of raw RGB tuple tokens for Danger/Warning Fill Indirection (`token-rgb-red`, `token-rgb-orange`, `token-rgb-green`, etc.) alongside the existing hex color anchors in Section A. These expose each accent color's channel values as a standalone CSS custom property, enabling `rgba()` opacity variants anywhere in the theme without duplicating the numbers. Applied immediately to the danger and warning fill tokens, which previously hardcoded the RGB values at each opacity step. Further color changes now requires editing the hex anchor and its RGB primitive once; all opacity variants follow without further edits. This is inspired by the **Graphite** theme

## [1.3.7-dev8] - 2026-06-24 - Unreleased

### Summary

- Made changes based on WCAG AA minimum contrast ratio checks and themes best practice.

### Added

- Tooltips: Added ha-tooltip-background-color and ha-tooltip-text-color overrides to resolve the dark-mode issue where tooltips rendered with white text on a white background.
- Danger/Warning Tag Fills: Added soft translucent background fills (rgba) and vivid foreground text for resting, hover, and active states of danger and warning tags, resolving illegible low-contrast element rendering on black backgrounds.

### Changed

- Label Badges: Darkened standard badge background colors (label-badge-red, label-badge-green, label-badge-blue, label-badge-yellow, label-badge-grey) to meet WCAG AA accessibility requirements and ensure high contrast against white text overlays.

## [1.3.7-dev7] - 2026-06-24 - Unreleased

### Changed

- **CI Validation Bump**: Shared CI validation bumped from v2.0.3 to v2.0.4. v2.0.4 added internal self-validation, and so does not affect theme CI Validation, bumped to keep up-to-date only.
- **Bump**: Bumped Ruff from 0.15.16 to 0.15.17 (Note used for theme , part of overall CI Validation)
- **gitignore**: Updated .gitignore file (scratch folder)

## [1.3.7-dev6] - 2026-06-20 - Unreleased

### Changed

- **Documentation**: Updated README file based on release of theme on HACS. HACS install instructions updated to remove need to install custom repository. Also update HACS badges in README header.

## [1.3.7-dev4] - 2026-06-18 - Unreleased

### Summary

- **CI Validation Overhaul**: Major overhaul of the local (tasks.json) and online (github.com CI) Validation system

### Changed

- **dev-workbench**: Moved CI Validation and Sync to dev-workbench system, with major restructure of files and folders.
- **CI Local Tasks**: Reordered local tasks.json, added color for pass/fail.
- **CI Validation Bump**: Shared CI validation bumped to v2.0.3. No user changes in this release, background/infrastructure only.
- **CodeQL**: CodeQL shared config and local caller modified to detail permissions to that Zizmor will pass
- **CodeQL**: Added a shared CodeQL validation config to the shared validation repo, pulled into each project, incl this one.
- **Link Check**: Updated markdown-link-check to ignore .notes/ and .shared/ links in projects as these are excluded.

## [1.3.6] - 2026-06-15

### Summary

- **CI Validation Only**: Changes to the CI Validation set-up require a release to test properly, but there are no user changes in this release, background/infrastructure only.

## [1.3.6-dev5] - 2026-06-15 - Unreleased

### Changed

- **CI Validation Sync**: Moved to a shared CI validation, similar to the integration/python projects.
- **Local Validation Sync**: Moved to a shared tasks,json for local validation and fixes, now shared and in sync with the integration/python projects.
- **CI — Permissions**: Removed job-level `permissions` block from `test_val` in the shared `validate-specific.yaml`. Permissions now flow through from the calling stub, fixing a GitHub Actions parse-time rejection caused by the theme stub's `contents: read` grant being exceeded.
- **CI — Secrets**: Removed `secrets: inherit` from the theme stub. The theme passes no secrets to the shared workflow — `GIST_SECRET` is integration-only and optional.
- **Dev — Shared tasks.json**: Theme project now uses the shared `tasks.json` (synced from monorepo). All Python-specific tasks (`Ruff`, `Mypy`, `Pytest`, `Pre-commit`) skip automatically via `project.category = theme` in `.vscode/settings.json`. Active validation tasks: YAML lint, JSON verify, HACS manifest, HA Check Config, markdown link check, markdown lint, codespell, Zizmor, Prettier.
- **Dev — `pyproject.toml`**: Added root `pyproject.toml` with `[tool.codespell]` section (synced from `pyproject_theme.toml`). Enables codespell auto-discovery for both local tasks and CI — aligns with the integration project pattern.
- **Dev — `.vscode/settings.json`**: Created with `project.category: theme` and `project.componentName: ""` to support shared task guards and VS Code variable resolution.

### Added

-- **pyproject.toml**: Local validation sync (see above) means that the project (which is not a python project) has a pyproject.toml file. This is to allow the codespell config to be the same across all in sync projects.

## [1.3.6-dev4] - 2026-06-15 - Unreleased

### Changed

- **Validation Config**: Changed from .prettierrc.js to .prettierrc.json to allow GitHub.com CodeQL to run without errors
- **.gitignore**: Multiple updates to .gitignore

### Added

- **AGENTS.md**: Added AGENTS.md to repo root

## [1.3.6-dev3] - 2026-06-11 - Unreleased

### Changed

- **Validation Sync**: Moved to a better system and process to keep validation (lint/format/test) tools in sync, across PlayFaster projects and between the projects and what Home Assistant uses.
  - .validate/version_matrix.json added as the definitive source of tool version use.
  - Several Env: entries added to .vscode/tasks.json for tool sync and checking.
  - .validate/requirements_test.txt pulled as generic, with all tools pinned to versions, and requirements_custom.txt used to add project specific items.
  - As part of the sync, docker-compose.yml and devcontainer.json are now generic, with a .env file holding project specific info and a docker-compose.override.yml holding additional, project specific steps.
  - HA Manifest and HACS schema files updated.
- **Validation Config**: Changed from .prettierrc.js to .prettierrc.json to allow GitHub.com CodeQL to run without errors
- **.gitignore**: Multiple updates to .gitignore

### Added

- **Dependabot**: Added Dependabot to the github.com CI. Is used for other PlayFaster projects but had not been in place for Very Dark Black Theme before.
- **AGENTS.md**: Added AGENTS.md to repo root

## [1.3.5] - 2026-06-05

### Added

- **HA 2026.6 Web Awesome Radio Tokens**: Added CSS styling support for `ha-radio-group` and `ha-radio-option`, the Web Awesome radio button components introduced in HA 2026.6. Tokens cover active color, unchecked/checked states, borders, and hover — styled consistently with the existing `ha-switch` and `ha-checkbox` token patterns.

### Changed

- **README**: Added Table of Contents; expanded Use Cases with new **Startup Indicator** (set a distinct accent at boot, auto-restore after 2 minutes) and **Visual Alert Highlight** (trigger Red on an alert condition, restore on clear) scenarios, each with a ready-to-use YAML automation example; promoted per-view and per-section theming from a tip callout to a dedicated subsection with scope-level descriptions; improved FAQ with grouped, emoji-labelled headings.

## [1.3.5-dev4] - 2026-06-05 - Unreleased

### Changed

- **README — Use Cases**: Expanded "Color-coded views" bullet to explicitly cover both views (full screen) and sections (partial screen), with a link to the new Apply subsection. Added two new use cases: **Startup Indicator** (set Orange at boot, auto-restore after 2 minutes) and **Visual Alert Highlight** (trigger Red on an alert condition, restore on clear).
- **README — Apply Theme**: Promoted the per-view/section theming TIP callout to a dedicated `#### Apply to Individual Views or Sections` subsection, introducing the three scope levels (System / View / Section) with plain-English descriptions before the step-by-step instructions.
- **README — Automate Theme Changes**: Added three structured sub-sections with emojis (`⚙️ Setup Requirements`, `🟠 Set Theme at Startup`, `🟠 Startup Indicator with Delayed Restore`, `🚨 Visual Alert Theme`), each with a concrete YAML example.
- **README — Structure & Navigation**: Added `## 📋 Table of Contents`; changed Requirements & Compatibility emoji from 📋 to ⚙️; moved `## 🗑️ Removal` to after Known Limitations (aligned with ZTE project README structure).
- **README — FAQ**: Grouped five FAQ items under two emoji sub-headings (`### 🔧 Installation & Setup`, `### 🎨 Display & Styling`); added per-item emoji headings (⚠️ 🖼️ 🔍 🖱️ 🔄).
- **README — Contributors**: Added 🙏 prefix to contributor acknowledgement lines.

## [1.3.5-dev3] - 2026-06-05 - Unreleased

### Added

- **HA 2026.6 Web Awesome Radio Tokens**: Added `ha-radio-option-active-color`, `ha-radio-option-border-color`, `ha-radio-option-border-color-hover`, `ha-radio-option-border-width`, `ha-radio-option-background-color`, `ha-radio-option-background-color-hover`, `ha-radio-option-checked-background-color`, and `ha-radio-option-checked-icon-color` to Section A (`base_logic`). Styled consistently with the existing `ha-checkbox-*` pattern (matching border colours, hover fills, and checked accent). Covers the new Web Awesome `ha-radio-group` / `ha-radio-option` component that replaces `ha-radio` in HA 2026.6. Sizing tokens (`ha-radio-option-height`, `toggle-size`, `checked-icon-scale`, `control-margin`, required-marker tokens) are intentionally omitted — the theme does not override equivalent checkbox sizing.
- **Reference Doc**: Created `docs/change_ref_ha_v2026_6.md` documenting HA 2026.6 frontend changes: radio component migration, omitted sizing tokens, layout-width token renames (`ha-sidebar-width`, `ha-top-app-bar-width` — no action needed for this theme), removed/migrated components, and backward compatibility rationale.

## [1.3.5-dev2] - 2026-06-04 - Unreleased

### Changed

- **DevCon**: Aligned the Devcontainer environment with other projects.

## [1.3.5-dev1] - 2026-05-24 - Unreleased

### Changed

- **README**: Added `## 💡 Use Cases` section with 5 practical scenarios (OLED displays, monochrome setup, color-coded views, automated switching, custom card pairing); expanded FAQ & Troubleshooting from 2 to 5 entries — added "Theme does not appear in picker", "card-mod CSS features not working", and "Specific elements un-styled after HA update"; expanded Under the Hood section description to summarise the dev reference contents.
- **CI Validation** (`.github/workflows/validate.yaml`): Added `concurrency` block to cancel in-progress duplicate runs; added `permissions: contents: read` at workflow level; added `persist-credentials: false` to all checkout steps; pinned all action refs from floating tags to full SHA hashes; added Codespell job (Job 4); added Zizmor workflow security audit job (Job 5, `continue-on-error: true`); added Prettier Format Check step to `lint_val` job.
- **Local Validation** (`.vscode/tasks.json`): Removed inapplicable `HA: Verify Manifest` task (theme has no `manifest.json`); added `Zizmor: GitHub Actions Audit` and `Zizmor: Fix (Safe Auto-Fix)` tasks; updated `Validate All` sequence to include Zizmor and remove the manifest task. **DevCon**: Updates to the DevCon setup, to standardize with other projects, esp. on mapping shared folders.

## [1.3.4] - 2026-05-20

### Added

- **HA 2026.5 New Elements**: Added support for the new HA 2026.5 elements documented in this [blog post](https://developers.home-assistant.io/blog/2026/05/04/frontend-component-updates-2026.5). This includes:
  - **New Web Awesome Tokens**: Added CSS styling variables for Web Awesome `ha-switch` (unchecked/checked states, borders, hover, and sizing overrides from PR #51984), `ha-checkbox`, and custom `ha-progress-bar`.
  - **Global Shadow & Surface Styling**: Added shadow tokens (`ha-box-shadow-s`, `ha-box-shadow-m`, `ha-box-shadow-l`) set to `"none"`, and new elevated surface variables (`ha-color-surface-default`, etc.) for tooltips and adaptive popovers.

### Changed

- **Documentation**: Updated the README file with additional details including on applying themes to dashboard views and sections, as well as at the system level.

## [1.3.4-dev3] - 2026-05-20 - Unreleased

### Added

- **HA 2026.5 Web Awesome Tokens**: Added CSS styling variables for Web Awesome `ha-switch` (unchecked/checked states, borders, hover, and sizing overrides from PR #51984), `ha-checkbox`, and custom `ha-progress-bar`.
- **Global Shadow & Surface Styling**: Added shadow tokens (`ha-box-shadow-s`, `ha-box-shadow-m`, `ha-box-shadow-l`) set to `"none"`, and new elevated surface variables (`ha-color-surface-default`, etc.) for tooltips and adaptive popovers.
- **Discovered Mappings & Compatibility**: Integrated new inputs and outlined border tokens, custom badge overrides, table rows, and legacy paper sliders/toggles to maintain full styling support for custom dashboard cards.
- **Reference Docs**: Created `docs/change_ref_ha_v2026_5.md` documenting HA 2026.5 frontend theme element updates.
- **Documentation**: Updated the README file with additional details including on applying themes to dashboard views and sections, as well as at the system level. Added additional screenshots.

## [1.3.4-dev2] - 2026-05-08 - Unreleased

### Changed

- **DevCon Improvements**: Changes to the devcontainer for better symmlinked folder mapping and additional checks (prettier) in tasks.json.

## [1.3.3] - 2026-05-02

### Added

- **Element Expansion**: Added a number of new elements to improve visibility and increase native element support for HA 2026.4 and beyond:
  - **M3 & WA Tokens**: Added Material 3 and Web Awesome semantic tokens.
  - **Dynamic Color Scales**: Implemented HSL-based scales.
  - **Energy Dashboard**: High-contrast mappings for Energy dashboard elements.
  - **Graph Palette**: Graph color palette for consistency across multi-entity charts.
  - **Log & History**: Logbook and History table headers with specific backgrounds and improved row hover states.
  - **Named Colors**: Standard HA named color mappings (`red-color`, `blue-color`, etc.) for improved compatibility with third-party cards.
  - **Custom Card Compatibility**: Expanded CSS exclusions to include Mushroom (Title/Chips), Bubble Card, Conditional cards, Custom Button cards, and native Heading/Glance cards.

### Changed

- **Readme**: Clarified card-mod is recommended but not required. Added compatibility milestone breakdown (2022.11 / 2025.1+ / 2026.4+).

### Fixed

- **Brightened Secondary Text**: Secondary text raised to meet contrast guidelines on pure black backgrounds.

## [1.3.3-dev13] - 2026-05-01

### Changed

- **`Black (Base)` renamed to `Black (Background Only)`**: The previous name implied it was a foundational/developer theme without making clear what selecting it would look like. The new name explicitly communicates that only the background color is themed black — all surface/form tokens are absent, so HA's defaults show through. Not a full Very Dark Black experience.

### Removed

- **`Black More Contrast`**: Removed. Developed as a testbed for signal-clarity improvements (accent-color field borders, elevated input fills). Those improvements were evaluated, revised, and the final signal tokens (`#606060` field outlines, `0.12` ripple, `rgba(255,255,255,0.1)` selection highlight, `#000000` input fills) were applied to all standard themes via `black_surfaces`. The testbed no longer serves a purpose.

- **`Black More More`**: Removed. After applying the Path A signal tokens to `black_surfaces`, `Black More More` became an exact duplicate of `Black with Cyan` — identical rendered output, different structural path. No reason to retain it.

---

## [1.3.3-dev12] - 2026-05-01

### Added

- **New Theme: `Black More More`** (Cyan, Option C). Keeps the very dark black dashboard surface. Adds three targeted contrast improvements for interactive elements only:
  - **C1 — Elevated portal surfaces**: Dialogs, dropdown panels, and menus render at `#111111` (vs pure black). `mdc-theme-surface`, `ha-dialog-surface-background`, `paper-dialog-background-color`, and `wa-color-surface-raised` all set to `#111111`. This makes "things that float above the dashboard" visually distinct from the base layer.
  - **C2 — Elevated input fills**: `wa-text-field-fill-background-color` and `wa-select-fill-background-color` set to `#111111`. The field area you type into is subtly lighter than the surrounding surface.
  - **C3 — Accent borders at rest**: All form outlines, field borders, and the dropdown icon use `var(--primary-color)` at rest (not just on hover/focus). Signals "this is interactive" without any background change.
  - All other surface tokens (card background, card border, divider, scrim, ripple) match the standard themes exactly.

### Changed

- **`Black More Contrast` redesigned** (Indigo, Options B + D). Previously had elevated dialog surfaces, stronger borders, stronger dividers, and increased ripple opacity. All of those overrides are removed. The theme now differs from the standard only in:
  - **D — Accent borders at rest**: `mdc-text-field-outline-color`, `mdc-select-outline-color`, `ha-color-form-outline`, `input-dropdown-icon-color` all set to `var(--primary-color)`. Fields are framed in Indigo at rest.
  - **B — Elevated input fills**: `wa-text-field-fill-background-color` and `wa-select-fill-background-color` set to `#111111`.
  - Dialog surfaces, card borders, dividers, scrim, and ripple all revert to the same values as `Black (Standard)`.

- **`card-mod-card` CSS — `background-color` now theme-driven**: Changed two hard-coded `#000000` occurrences in `ha-card` and `.card-header` rules to `var(--ha-card-background, #000000)`. Fallback preserves existing behavior for all standard themes. Required so that any future theme can set its own card surface via the token.

- **`ha-card-background` / `card-background-color` moved to Section B** (`&black_surfaces`): Previously in `base_logic` (Section A). Moved because card background is a surface decision. Themes using `<<: *base_logic` directly (`Black More Contrast`, `Black More More`) must define these tokens explicitly — both do so at `*base_black` (`#000000`).

### Design rationale

Core ethos: pure black everywhere. The contrast themes exist to prevent confusion, not to add grey. Signal improvements target specific failure modes:

- **"Where is the input field?"** — field outline lifted from `#444444` (marginal) to either `#606060` (Path A, neutral) or `var(--primary-color)` (Path B, accent)
- **"Is my cursor on something?"** — ripple from `0.08` to `0.12`
- **"What's selected in this list?"** — selected container from `#333333` (~invisible on black) to `rgba(255,255,255,0.1)`

`Black More Contrast` uses accent color as the signal (colored borders = interactive). `Black More More` uses neutral grey visibility (everything stays non-chromatic, just more visible).

### Notes

- `wa-text-field-fill-background-color` and `wa-select-fill-background-color` are WA tokens — take effect on HA 2026.4+. On older versions silently ignored.
- `mdc-theme-surface` controls both dialog surfaces AND dropdown panel backgrounds in `Black More More`. Single token elevates both portal types.

---

## [1.3.3-dev11] - 2026-05-01

### Changed

- **Utility Theme Rename**: `Black Base (Shared Logic)` renamed to `Black (Base)`; `Black Base (Standard Surfaces)` renamed to `Black (Standard)`. Both names are shorter, clearer in the HA theme picker, and no longer expose internal YAML terminology to end users. YAML anchors (`&base_logic`, `&black_surfaces`) and all alias references are unchanged.

- **Utility Theme Defaults**: Added `primary-color: *acc_cyan` and `state-active-color: var(--primary-color)` to both `Black (Base)` and `Black (Standard)`. Previously neither defined a primary color, so selecting either from the picker would fall back to HA's default primary (typically blue). Both themes now render correctly as cyan variants if selected. Since all inheriting color variants explicitly define their own `primary-color`, the merge key semantics mean this default is safely overridden by each variant with no behavioral change to existing themes.

- **`card-mod-theme` Names Corrected**: All 9 `card-mod-theme` string values renamed to exactly match their corresponding HA theme names. Previously inconsistent (notably `"Black Main"` for the Cyan theme). Correct matching is required for card-mod's internal theme profile tracking.
  - `"Black Main"` → `"Black with Cyan"`
  - `"Black Green"` → `"Black with Green"`
  - `"Black Red"` → `"Black with Red"`
  - `"Black Fuchsia"` → `"Black with Fuchsia"`
  - `"Black Purple"` → `"Black with Purple"`
  - `"Black Indigo"` → `"Black with Indigo"`
  - `"Black Silver"` → `"Black with Silver"`
  - `"Black Orange"` → `"Black with Orange"`
  - `"Black Contrast"` → `"Black More Contrast"`

- **Primary Color Scale Corrected**: `ha-color-primary-50` was a duplicate of `ha-color-primary-40` (both `var(--primary-color)`). Corrected to `hsl(from var(--primary-color) h s calc(l * 1.15))`. This fix cascaded: `-60` through `-95` were all offset by one step and were corrected simultaneously. Full primary scale multipliers now match the neutral scale and the Graphite reference theme exactly:

  | Step | Multiplier  |
  | ---- | ----------- |
  | -40  | 1.0× (base) |
  | -50  | 1.15×       |
  | -60  | 1.30×       |
  | -70  | 1.45×       |
  | -80  | 1.60×       |
  | -90  | 1.75×       |
  | -95  | 1.90×       |

- **`card-mod-more-info` — Brittle Selector Removed**: The `ha-card-picker` selector (`ha-card-picker $ ha-sub-page ha-icon-button-prev-next + h1 + div`) was removed. This selector used adjacent-sibling combinators (`+`) to target an anonymous div three shadow DOM levels deep — any HA DOM restructuring breaks it silently. Investigation confirmed it was not present in either reference theme (Frosted Glass, Graphite), which rely on native tokens (`mdc-theme-surface`, `ha-dialog-surface-background`) for card picker backgrounds. Tested: card picker background remains black after removal. A dated comment was added with the removal rationale and a less-brittle replacement selector (`ha-card-picker $ ha-sub-page { background-color: #000000; }`) for restoration if a regression appears in a future HA version.

- **`card-mod-more-info` — Intentional Override Documented**: The `ha-more-info-dialog` selectors retained as confirmed necessary. Added comment documenting: (a) the intentional `#ffffff` override vs global native token `mdc-theme-on-surface: #e1e1e1`, (b) that this is a pure-black-specific fix not present in reference themes, and (c) that it is a candidate for removal if native token coverage improves in future HA versions.

- **README Compatibility Section**: Added version milestone breakdown below the compatibility table documenting that the theme is usable from HA 2022.11 onwards with progressive feature improvement at 2025.1+ and full HSL color scale support at 2026.4+.

- **README Features List**: Updated utility theme entry from `Black Base (Shared Config)` (which also mismatched the actual YAML name `Black Base (Shared Logic)`) to correctly list both `Black (Base)` and `Black (Standard)` with a note that both appear in the picker and default to cyan.

- **`docs/DEVELOPMENT.md`**: Updated the "Every Key is a Theme" note to use the new utility theme names and to explicitly state that no mechanism exists to hide themes from the picker — the pragmatic solution is correct naming and a default primary color.

### Notes

- Code review notes for this session: `.notes/code_review/code_review_20260501.md`
- Project structure documented for future sessions: `.notes/proj_structure.md`

## [1.3.3-dev9] - 2026-05-01

### Added

- **More Contrast Entry**: Introduced "Black More Contrast" (Indigo), a dedicated high-visibility theme that maintains a pure black background while significantly enhancing UI boundaries and interaction states.
  - **Surface Elevation**: Implemented charcoal surfaces (`#1c1c1c`) for dialogs, menus, and dropdowns to provide better physical separation from the dashboard background.
  - **Accent Framing**: Form outlines and selector borders are now framed with the primary accent color for instant field identification.
  - **Structural Separators**: Increased divider and card border visibility to `0.2+` opacity.
  - **Interactive Feedback**: Enhanced visibility for sliders, toggle bars, and hover "glow" intensities.
  - **Depth & Focus**: Refined dialog scrim opacity and menu selection backgrounds for a more tactile, three-dimensional feel.
- **Element Expansion**: Added a number of new elements to improve visibility and contrast as well as increase native element support for HA 2026.4 and beyond:
  - **M3 & WA Tokens**: Added Material 3 and Web Awesome semantic tokens.
  - **Dynamic Color Scales**: Implemented HSL-based scales.
  - **Energy Dashboard**: High-contrast mappings for Energy dashboard elements.
  - **Graph Palette**: Graph color palette for consistency across multi-entity charts.
  - **Log & History**: Logbook and History table headers - specific backgrounds, improved row hover states.
  - **Named Colors**: Standard HA named color mappings (`red-color`, `blue-color`, etc.) for improved compatibility with third-party cards.
  - **Visibility & Contrast**: Brightened secondary text; improved radius and inset shadows on input fields; font smoothing for legibility on black backgrounds.
  - **Custom Card Compatibility**: Expanded global CSS exclusions to include Mushroom (Title/Chips), Bubble Card, Conditional cards, Custom Button cards, and native Heading/Glance cards.
- **IN DETAIL**:
  - **HA 2026.4 Support**: More comprehensive support for HA 2026.4+, includes Charts, Energy Dashboard, Color Scales, and Web Awesome elements.
  - **HA 2026.4 Semantic Coverage**: Full support for Web Awesome (WA) semantic tokens, restoring dropdown backgrounds and hover states.
  - **Dynamic Color Scales**: Implemented HSL-based scales (`ha-color-primary-05` to `95` and `ha-color-neutral-05` to `95`) for both primary and neutral tones.
  - **Energy Dashboard Support**: Added explicit high-contrast mappings for all Energy dashboard elements (Solar, Grid, Battery, etc.).
  - **Graph Palette**: Implemented a 10-series graph color palette for consistent data visualization across multi-entity charts.
  - **Named Colors**: Added standard HA named color mappings (`red-color`, `blue-color`, etc.) for improved compatibility with third-party cards.
  - **UI Depth & Polish**: Introduced granular radius scale (8px, 12px, 16px) and subtle inset shadows for all input fields.
  - **Enhanced Typography**: Implemented anti-aliased font smoothing and refined font weights for actions to improve legibility on black backgrounds.
  - **Improved Contrast**: Brightened secondary text to `#a8a8a8` to ensure WCAG AA compliance on pure black backgrounds.
  - **Custom Card Compatibility**: Expanded global CSS exclusions to include Mushroom (Title/Chips), Bubble Card, Conditional cards, Custom Button cards, and native Heading/Glance cards.
  - **Professional Data Tables**: Refined Logbook and History table headers with specific backgrounds and improved row hover states.
  - **Immersive Dialogs**: Increased dialog scrim opacity to 0.9 and removed dialog shadows for a cleaner, focused aesthetic.
  - **M3 & WA Tokens**: Added comprehensive coverage for Material 3 (`md-sys-color-*`) and Web Awesome semantic form tokens.
  - **Metadata**: Added theme metadata header for better project identification and support tracking.

### Fixed

- **Validate Badge**: Validate badge in Readme was pointing to a run, not latest. Now fixed.
- **YAML Anchor Duplication**: Resolved issue with duplicate YAML anchors that prevented theme reloading.
- **Duplicate YAML Keys**: Resolved "state-active-color" duplicate key warning by moving definitions from base config to individual variants.
- **YAML Execution Order**: Reordered color anchors to the top of the file to resolve fatal "undefined alias" errors.
- **File Integrity**: Cleaned up stray characters at end of theme file.

### Changed

- **Theme Architecture Refactor**: Centralized over 15 repetitive property mappings into the `Black Base (Shared Config)` using `var(--primary-color)` inheritance, significantly reducing code duplication and improving maintainability.
- **Infrastructure**: Updated the validation checks and added Codespell.
- **Infrastructure**: Improved the DevContainer setup process.
- **Readme**: Updated readme file.
  - Clarify that card-mod is recommended but not absolutely required.
  - Moved features first, requirements second.
  - Expanded install via HACS instructions including repo link.
  - Heading badges - added HACS Custom and License badges.
  - Standardized heading icons.
  - Included License info.

## [1.3.2] - 2026-04-03

### Fixed

- **Grey Drop-down Placeholder**: Fixed an issue where some element changes introduced in HA 2026.4.x caused drop-down placeholders to be grey.

### Added

- **Badges**: Added badges to README.

### Changed

- **Validation**: Additional GitHub and Local validation steps.
- **Formatting**: Additional local formatting checks.

## [1.3.1] - 2026-04-01

### Added

- **More Colors**: Added Purple, Indigo, and Silver (monochrome) variants.
- **Black Base**: Added a "Black Base (Shared Config)" utility theme for consistent inheritance.
- **Light Fallback**: Added explicit light mode block to ensure the UI stays dark on systems set to light mode.
- **Modern Tokens**: Added compatibility for `--ha-` and `--sl-` (Shoelace) variables used in Home Assistant 2025+.
- **Validation**: Implemented local infrastructure for YAML linting and JSON schema validation.

### Changed

- **Documentation**: Updated README with theme automation examples and detailed compatibility requirements.
- **Screenshots**: Added screenshots to README.

### Fixed

- **Ghost Themes**: Resolved issue where internal helper blocks appeared in the theme selection list.
- **UI Visibility**: Fixed "white-on-white" text issues in dropdown menus and selection lists.

### Removed

- **"with Test" Option**: Removed the "Black with Orange plus Test" variant to simplify the theme list.

## [1.2.2] - 2026-03-30

### Changed

- **GitHub**: Initial release to GitHub repository.

## [1.2.1] - 2026-01-16

### Added

- **TEST Visibility**: Added option for TEST text near top left, for identifying a test or backup system.

## [1.1.1] - 2025-12-04

### Added

- **Multi-Theme**: Added additional highlight color options to existing cyan - green, red, fuchsia, orange.

### Fixed

- **Invisible Menu Fix**: Fixed some of the black-on-black invisible menus.

## [1.0.1] - 2025-11-18

### Added

- **Initial Release**: Very dark black with cyan text and accents.

---

### Format

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
