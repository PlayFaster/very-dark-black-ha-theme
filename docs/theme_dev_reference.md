# Home Assistant Theme Development: Lessons Learned & "What Not To Do"

This document serves as a technical reference based on the development of the "Very Dark Black" theme pack. It highlights common pitfalls that can break Home Assistant's configuration or cause UI accessibility issues.

## 1. YAML Standards & Linting

Strict validation (like `yamllint`) requires adherence to official YAML specifications.

- **Document Start**: Always start `.yaml` files with `---`. Home Assistant core often works without it, but CI/CD pipelines and linters will flag it as an error.
- **Line Length**: Keep lines under 80 characters. For long CSS properties (like `border`), split them into individual components (`border-width`, `border-style`, `border-color`) rather than using shorthand.
- **Trailing Spaces**: Never leave spaces at the end of a line. These are invisible but considered errors in clean code environments.

## 2. Shared Configs & Hidden Anchors

Home Assistant's theme loader is unique and highly restrictive.

- **The "Every Key is a Theme" Rule**: Every top-level key in a theme file is treated as a selectable theme name in the HA UI.
- **The "Everything is a String" Rule**: Home Assistant expects every variable inside a theme to be a string (representing a CSS variable).
  - **CRITICAL FAILURE**: Do NOT nest dictionaries (like a palette block) inside a theme block. This will crash the Home Assistant configuration loader and prevent a restart.
- **Inheritance (Anchors/Aliases)**: To avoid "Duplicate Key" warnings, ensure that your base anchor contains _only_ shared settings. If the base anchor defines a color (e.g., Cyan) and a sub-theme overrides it (e.g., Green), HA will log a warning about duplicate keys.

## 3. UI Accessibility: Dropdowns & Lists

Dark themes often suffer from "White-on-White" text issues in system menus.

- **Hover/Selection States**: Home Assistant's Material Design components use specific tokens for list highlights.
- **The Fix**: Explicitly set `mdc-list-item-selected-container-color` to a dark charcoal or your accent color. If left default, it may fall back to white, making white text invisible.
- **Browser Rendering**: Always include `color-scheme: dark !important` in your `card-mod` host styles. This tells the browser to use dark-mode variants for native elements like date-pickers and scrollbars.

## 4. Icon Color Logic

- **Base vs. Accent**: Avoid forcing a global icon color (like pure white) in your shared base configuration if you want individual themes to have colorful icons.
- **Variable Hierarchy**:
  - `paper-item-icon-color`: The legacy/standard variable for most icons.
  - `state-icon-color`: Controls icons in their "neutral" or "inactive" states.
  - `state-icon-active-color`: Controls icons when an entity is "On" or active.
- **Best Practice**: Define these variables in each individual color variant theme to ensure the icons match the chosen accent (Red, Green, etc.) rather than defaulting to a single global color.

## 5. Modern Token Migration (2025+)

Home Assistant is moving away from legacy `paper-` variables.

- **Shoelace Tokens**: Newer UI elements use Shoelace. Always map your primary color to `sl-color-primary-base`.
- **Material 3 Tokens**: Map your color to `ha-color-primary-50` to ensure interactive elements like button ripples and sliders use the correct shade.
