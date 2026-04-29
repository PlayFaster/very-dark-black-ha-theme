# Changelog

All notable changes to this project will be documented in this file.

## [v1.3.3-dev9] - Now

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
  - **Enhanced Typography**: Implemented antialiased font smoothing and refined font weights for actions to improve legibility on black backgrounds.
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
  - Clarifiy that card-mod is recommended but not absolutely required.
  - Moved features first, requirements second.
  - Expanded install via HACS instructions including repo link.
  - Heading badges - added HACS Custom and Licence badges.
  - Standardized heading icons.
  - Included Licence info.

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

- **More Colours**: Added Purple, Indigo, and Silver (monochrome) variants.
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

- **Multi-Theme**: Added additional highlight colour options to existing cyan - green, red, fuchsia, orange.

### Fixed

- **Invisible Menu Fix**: Fixed some of the black-on-black invisible menus.

## [1.0.1] - 2025-11-18

### Added

- **Initial Release**: Very dark black with cyan text and accents.

---

### Format

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
