# Changelog

All notable changes to this project will be documented in this file.

## [1.3.4] - 2026-05-20

### Added

- **HA 2026.5 New Elements**: Added support for the new HA 2026.5 elements documented in this [blog post](https://developers.home-assistant.io/blog/2026/05/04/frontend-component-updates-2026.5). This includes:
  - **New Web Awesome Tokens**: Added CSS styling variables for Web Awesome `ha-switch` (unchecked/checked states, borders, hover, and sizing overrides from PR #51984), `ha-checkbox`, and custom `ha-progress-bar`.
  - **Global Shadow & Surface Styling**: Added shadow tokens (`ha-box-shadow-s`, `ha-box-shadow-m`, `ha-box-shadow-l`) set to `"none"`, and new elevated surface variables (`ha-color-surface-default`, etc.) for tooltips and adaptive popovers.

### Changed

- **Documentation**: Updated the README file with additional details including on applying themes to dashboard views and sections, as well as at the system level.

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
