# Changelog

All notable changes to this project will be documented in this file.

## [1.3.4] - 2026-05-20

### Added

- **HA 2026.5 New Elements**: Added support for the new HA 2026.5 elements documented in this [blog post](https://developers.home-assistant.io/blog/2026/05/04/frontend-component-updates-2026.5). This includes:
  - **New Web Awesome Tokens**: Added CSS styling variables for Web Awesome `ha-switch` (unchecked/checked states, borders, hover, and sizing overrides from PR #51984), `ha-checkbox`, and custom `ha-progress-bar`.
  - **Global Shadow & Surface Styling**: Added shadow tokens (`ha-box-shadow-s`, `ha-box-shadow-m`, `ha-box-shadow-l`) set to `"none"`, and new elevated surface variables (`ha-color-surface-default`, etc.) for tooltips and adaptive popovers.
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

- **`docs/theme_dev_reference.md`**: Updated the "Every Key is a Theme" note to use the new utility theme names and to explicitly state that no mechanism exists to hide themes from the picker — the pragmatic solution is correct naming and a default primary color.

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
