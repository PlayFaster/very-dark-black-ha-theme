# Changelog

All notable changes to this project will be documented in this file.

## [v1.3.3-dev6] - Now

### Added

- **HA 2026.4 Support**: More comprehensive support for HA 2026.4+, includes Charts, Energy Dashboard, Color Scales, and Web Awesome elements.
- **HA 2026.4 Semantic Coverage**: Full support for Web Awesome (WA) semantic tokens, restoring dropdown backgrounds and hover states.
- **Dynamic Color Scales**: Implemented HSL-based scales (`ha-color-primary-05` to `95` and `ha-color-neutral-05` to `95`) for both primary and neutral tones.
- **Energy Dashboard Support**: Added explicit high-contrast mappings for all Energy dashboard elements (Solar, Grid, Battery, etc.).
- **Graph Palette**: Implemented a 10-series graph color palette for consistent data visualization across multi-entity charts.
- **Named Colors**: Added standard HA named color mappings (`red-color`, `blue-color`, etc.) for improved compatibility with third-party cards.

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

### Fixed

- **YAML Anchor Duplication**: Resolved issue with duplicate YAML anchors that prevented theme reloading.
- **File Integrity**: Cleaned up stray characters at end of theme file.
- **Validate Badge**: Validate badge in Readme was pointing to a run, not latest. Now fixed.

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
