# Changelog

All notable changes to this project will be documented in this file.

## [1.4.1] - 2026-08-02 - Visible Controls on the No-Accent Theme

### Summary

- Restores visible fill and contrast to active controls (such as switches) on **Black with White**, the no-accent variant.
- All ten accent variants (Blue, Cyan, Emerald, Green, Indigo, Orange, Pink, Red, Silver, Violet) are unchanged.

### Fixed

- **Monochrome controls visibility** *(refines Black with White controls, introduced in 1.3.8)*: Restored fill and contrast to active controls (such as switches) on **Black with White**, the no-accent variant. The ten accent variants — Blue, Cyan, Emerald, Green, Indigo, Orange, Pink, Red, Silver, Violet — remain unchanged.

## [1.4.0] - 2026-07-04 - Release - Eleven Accent Colors; Violet and Pink Renamed

### Highlights

- **Two New Themes**: Added **Black with Blue** and **Black with Emerald** (11 variants total).
- **Lock State Colors**: Lock entities now match the theme's accent, muted grey, and red scheme.
- **Pure-Black Code Editor**: YAML, automation, and template editors now use a pure-black background.
- **Themeable Card Headers**: Override card title colors via `ha-card-header-color`.

### Summary

- Expands the theme from 8 to 11 accent colors — adding Blue and Emerald, and renaming/re-hueing Purple → Violet and Fuchsia → Pink — alongside a large amount of under-the-hood token and structural work.

### Added

- **Two new accent variants — Blue and Emerald**, bringing the picker to 11 selectable themes.
- **Lock entity colors**: lock states now follow the theme's accent/neutral scheme (locked = accent, unlocked/transitional = muted gray, jammed = red) instead of HA's fixed green/red.
- **Inline code contrast**: inline code text color is now set for readability on the dark code background.
- **Code editor surface**: the YAML/automation/template editor now uses a pure-black background instead of a lighter default panel.

### Changed

- **"Black with Purple" → "Black with Violet"** *(refines Purple variant, introduced in 1.3.1)*: Renamed and shifted bluer (`#9c27b0` → `#7c3aed`) for clearer separation in the picker.
- **"Black with Fuchsia" → "Black with Pink"** *(refines Fuchsia variant, introduced in 1.1.1)*: Renamed and shifted to true pink (`#ff00ff` → `#ec4899`). Old `var(--purple-color)` / `var(--fuchsia-color)` references remain available for backward compatibility.
- **Card title/header color** is now themeable via `ha-card-header-color` (white remains the default).

### Under the hood

- **Single-Source Neutral Ramp** *(from `1.4.0-dev9`)*: Consolidated repeated neutral hex values into ten shared `--token-neutral-*` tokens and YAML anchors, verified value-identical across all 307 keys and 11 themes.

## [1.3.8] - 2026-06-25 - Release - Black with White Base Theme

### Summary

- Consolidates the former *Standard* and *Background Only* themes into a single **Black with White** monochrome base theme, and improves form field hover separation.

### Changed

- **Black with White Theme** *(refines Black Base utility themes, introduced in 1.3.1)*: Consolidated the previous *Standard* and *Background Only* themes into a single monochrome base anchor.
- **Form field hover state** *(refines input field styling from 1.3.3)*: Changed input field hover background from black to dark gray for better visual separation from surrounding surfaces.

### Under the hood

- **Theme Test Dashboard** *(from `1.3.8-dev6`)*: Added a YAML-mode Theme Test dashboard and mock sensor entities to verify rendering across card types.

## [1.3.7] - 2026-06-24 - Release - HACS Listing; WCAG AA Contrast Fixes

### Summary

- The theme is now officially on HACS! No custom repository adding required.
- Made changes based on WCAG AA minimum contrast ratio checks and themes best practice.

### Added

- **Tooltips**: Added ha-tooltip-background-color and ha-tooltip-text-color overrides to resolve the dark-mode issue where tooltips could render with white text on a white background. This is inspired by the **Graphite** theme
- **Danger/Warning Tag Fills**: Added translucent background fills (rgba) and vivid foreground text for resting, hover, and active states of danger and warning tags, resolving illegible low-contrast element rendering on black backgrounds.

### Changed

- **Label Badges**: Darkened standard badge background colors (label-badge-red, label-badge-green, label-badge-blue, label-badge-yellow, label-badge-grey) to meet WCAG AA accessibility requirements and ensure high contrast against white text overlays.
- **Documentation** *(refines README installation docs, verified in 1.3.1)*: Updated README file for official HACS listing, removing custom-repository steps and updating HACS header badges.

### Under the hood

- **RGB Primitive Tokens** *(from `1.3.7-dev9`)*: Added `token-rgb-*` channel tokens so `rgba()` opacity variants reference each accent anchor once without duplicating RGB numbers.
- **Validation Infrastructure** *(from `1.3.7-dev4`)*: Migrated CI validation and local `tasks.json` to `dev-workbench` (`v2.0.3`), and added CodeQL permissions for Zizmor compliance.

## [1.3.6] - 2026-06-15 - CI Validation Test Release

### Summary

- **CI Validation Only**: Changes to the CI Validation set-up require a release to test properly, but there are no user changes in this release, background/infrastructure only.

### Under the hood

- **Shared Validation Sync** *(from `1.3.6-dev3`–`1.3.6-dev5`)*: Adopted shared `.github` CI validation, `tasks.json`, `pyproject.toml` codespell config, `.prettierrc.json`, `AGENTS.md`, and Dependabot.

## [1.3.5] - 2026-06-05 - HA 2026.6 Radio Tokens; README Use Cases

Home Assistant 2026.6 Compatibility

### Summary

- Adds Home Assistant 2026.6 Web Awesome radio button styling (`ha-radio-group`, `ha-radio-option`) and expands `README.md` with new automation use cases and structured FAQ sections.

### Added

- **HA 2026.6 Web Awesome Radio Tokens**: Added CSS styling support for `ha-radio-group` and `ha-radio-option`, the Web Awesome radio button components introduced in HA 2026.6. Tokens cover active color, unchecked/checked states, borders, and hover — styled consistently with the existing `ha-switch` and `ha-checkbox` token patterns.

### Changed

- **README** *(refines README documentation from 1.3.4)*: Added Table of Contents; expanded Use Cases with new **Startup Indicator** (set a distinct accent at boot, auto-restore after 2 minutes) and **Visual Alert Highlight** (trigger Red on an alert condition, restore on clear) scenarios, each with a ready-to-use YAML automation example; promoted per-view and per-section theming from a tip callout to a dedicated subsection with scope-level descriptions; improved FAQ with grouped, emoji-labelled headings.

### Under the hood

- **CI Hardening** *(from `1.3.5-dev1`)*: Added GitHub Actions `concurrency`, `permissions: contents: read`, SHA-pinned actions, Codespell, Zizmor, and Prettier checks.

## [1.3.4] - 2026-05-20 - HA 2026.5 Web Awesome Tokens

### Summary

- Adds Home Assistant 2026.5 Web Awesome styling (`ha-switch`, `ha-checkbox`, `ha-progress-bar`), flat shadow tokens, and elevated surface variables for tooltips and popovers.

### Added

- **HA 2026.5 New Elements**: Added support for the new HA 2026.5 elements documented in this [blog post](https://developers.home-assistant.io/blog/2026/05/04/frontend-component-updates-2026.5). This includes:
  - **New Web Awesome Tokens**: Added CSS styling variables for Web Awesome `ha-switch` (unchecked/checked states, borders, hover, and sizing overrides from PR #51984), `ha-checkbox`, and custom `ha-progress-bar`.
  - **Global Shadow & Surface Styling**: Added shadow tokens (`ha-box-shadow-s`, `ha-box-shadow-m`, `ha-box-shadow-l`) set to `"none"`, and new elevated surface variables (`ha-color-surface-default`, etc.) for tooltips and adaptive popovers.

### Changed

- **Documentation** *(refines README documentation from 1.3.3)*: Updated the README file with additional details including on applying themes to dashboard views and sections, as well as at the system level.

### Under the hood

- **Devcontainer & Prettier** *(from `1.3.4-dev2`)*: Added Prettier checks to `tasks.json` and improved devcontainer symlinked folder mapping.

## [1.3.3] - 2026-05-02 - M3 and Web Awesome Tokens; Energy and Graph Palettes

### Highlights

- **M3 & Web Awesome Support**: Added Material 3, Web Awesome, and dynamic HSL color scale tokens for HA 2026.4+.
- **Energy & Graph Palettes**: High-contrast mappings for Energy dashboards and multi-entity charts.
- **Custom Card Compatibility**: Expanded exclusions for Mushroom, Bubble Card, Conditional, Button, Heading, and Glance cards.
- **Brighter Secondary Text**: Raised secondary text contrast on pure-black backgrounds.

### Summary

- Expands Home Assistant 2026.4+ token coverage with Material 3, Web Awesome, dynamic HSL scales, Energy dashboard mappings, a multi-series graph palette, and broader third-party card compatibility.

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

- **Readme** *(refines README compatibility documentation from 1.3.1)*: Clarified card-mod is recommended but not required. Added compatibility milestone breakdown (2022.11 / 2025.1+ / 2026.4+).

### Fixed

- **Brightened Secondary Text** *(refines base text contrast, verified in 1.0.1)*: Secondary text raised to meet contrast guidelines on pure black backgrounds.

### Under the hood

- **Theme Architecture & Scale Fixes** *(from `1.3.3-dev9`, `1.3.3-dev11`)*: Consolidated 15+ repetitive mappings into `Black Base`, aligned all 9 `card-mod-theme` names to match HA picker names, fixed `ha-color-primary-50..95` HSL multipliers, removed a brittle `ha-card-picker` selector, and added Codespell validation.

## [1.3.2] - 2026-04-03 - Drop-down Placeholder Color Fixed

### Summary

- Fixes gray dropdown placeholder contrast on Home Assistant 2026.4.x and adds README status badges.

### Fixed

- **Dropdown placeholder contrast** *(refines dropdown styling, verified in 1.3.1)*: Restored visibility of gray dropdown placeholders following frontend changes introduced in HA 2026.4.x.

### Added

- **Badges**: Added badges to README.

### Under the hood

- **Validation** *(enhances local validation from 1.3.1)*: Additional GitHub and Local validation steps.
- **Formatting** *(enhances local validation from 1.3.1)*: Additional local formatting checks.

## [1.3.1] - 2026-04-01 - Purple, Indigo and Silver Variants

### Highlights

- **Three New Accent Variants**: Added Purple, Indigo, and Silver (monochrome) themes.
- **Light-Mode Dark Fallback**: Keeps the UI dark even when a system uses light mode.
- **HA 2025+ Token Support**: Added `--ha-` and `--sl-` (Shoelace) variable compatibility.
- **Dropdown & Picker Fixes**: Resolved ghost helper blocks and white-on-white dropdown text.

### Summary

- Adds Purple, Indigo, and Silver variants, explicit light-mode dark fallback, HA 2025+ `--ha-`/`--sl-` compatibility, and fixes for ghost themes and dropdown text visibility.

### Added

- **More Colors** *(enhances accent variants, introduced in 1.1.1)*: Added Purple, Indigo, and Silver (monochrome) variants.
- **Black Base**: Added a "Black Base (Shared Config)" utility theme for consistent inheritance.
- **Light Fallback**: Added explicit light mode block to ensure the UI stays dark on systems set to light mode.
- **Modern Tokens**: Added compatibility for `--ha-` and `--sl-` (Shoelace) variables used in Home Assistant 2025+.

### Changed

- **Documentation**: Updated README with theme automation examples and detailed compatibility requirements.
- **Screenshots**: Added screenshots to README.

### Fixed

- **Ghost Themes**: Resolved issue where internal helper blocks appeared in the theme selection list.
- **UI Visibility**: Fixed "white-on-white" text issues in dropdown menus and selection lists.

### Removed

- **"with Test" Option** *(refines TEST visibility options, introduced in 1.2.1)*: Removed the "Black with Orange plus Test" variant to simplify the theme list.

### Under the hood

- **Validation**: Implemented local infrastructure for YAML linting and JSON schema validation.

## [1.2.2] - 2026-03-30 - Initial GitHub Release

### Summary

- Initial publication of the theme to its GitHub repository.

### Changed

- **GitHub**: Initial release to GitHub repository.

## [1.2.1] - 2026-01-16 - TEST Visibility Marker

### Summary

- Adds an optional `TEST` visibility marker near the top left to identify test or backup systems.

### Added

- **TEST Visibility**: Added option for TEST text near top left, for identifying a test or backup system.

## [1.1.1] - 2025-12-04 - Green, Red, Fuchsia and Orange Variants

### Summary

- Expands the theme with green, red, fuchsia, and orange accent variants and fixes black-on-black invisible menus.

### Added

- **Multi-Theme** *(enhances initial Cyan theme, introduced in 1.0.1)*: Added additional highlight color options to existing cyan - green, red, fuchsia, orange.

### Fixed

- **Invisible Menu Fix**: Fixed some of the black-on-black invisible menus.

## [1.0.1] - 2025-11-18 - Initial Release, Cyan Accent

### Summary

- Initial release of the Very Dark Black Home Assistant theme with cyan text and accents.

### Added

- **Initial Release**: Very dark black with cyan text and accents.

---

### Format

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Entry structure — headers, titles, category headings and the split between this file and its counterpart — follows `.shared/dev_std/changelog_format.md`.

---

- [Changelog](#changelog)
  - [\[1.4.1\] - 2026-08-02 - Visible Controls on the No-Accent Theme](#141---2026-08-02---visible-controls-on-the-no-accent-theme)
  - [\[1.4.0\] - 2026-07-04 - Release - Eleven Accent Colors; Violet and Pink Renamed](#140---2026-07-04---release---eleven-accent-colors-violet-and-pink-renamed)
  - [\[1.3.8\] - 2026-06-25 - Release - Black with White Base Theme](#138---2026-06-25---release---black-with-white-base-theme)
  - [\[1.3.7\] - 2026-06-24 - Release - HACS Listing; WCAG AA Contrast Fixes](#137---2026-06-24---release---hacs-listing-wcag-aa-contrast-fixes)
  - [\[1.3.6\] - 2026-06-15 - CI Validation Test Release](#136---2026-06-15---ci-validation-test-release)
  - [\[1.3.5\] - 2026-06-05 - HA 2026.6 Radio Tokens; README Use Cases](#135---2026-06-05---ha-20266-radio-tokens-readme-use-cases)
  - [\[1.3.4\] - 2026-05-20 - HA 2026.5 Web Awesome Tokens](#134---2026-05-20---ha-20265-web-awesome-tokens)
  - [\[1.3.3\] - 2026-05-02 - M3 and Web Awesome Tokens; Energy and Graph Palettes](#133---2026-05-02---m3-and-web-awesome-tokens-energy-and-graph-palettes)
  - [\[1.3.2\] - 2026-04-03 - Drop-down Placeholder Color Fixed](#132---2026-04-03---drop-down-placeholder-color-fixed)
  - [\[1.3.1\] - 2026-04-01 - Purple, Indigo and Silver Variants](#131---2026-04-01---purple-indigo-and-silver-variants)
  - [\[1.2.2\] - 2026-03-30 - Initial GitHub Release](#122---2026-03-30---initial-github-release)
  - [\[1.2.1\] - 2026-01-16 - TEST Visibility Marker](#121---2026-01-16---test-visibility-marker)
  - [\[1.1.1\] - 2025-12-04 - Green, Red, Fuchsia and Orange Variants](#111---2025-12-04---green-red-fuchsia-and-orange-variants)
  - [\[1.0.1\] - 2025-11-18 - Initial Release, Cyan Accent](#101---2025-11-18---initial-release-cyan-accent)

---
