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

## 5. Modern Token Migration (2025-2026+)

Home Assistant is moving away from legacy `paper-` and `mdc-` variables toward **Web Awesome** (Shoelace/Lit) and **Material 3** tokens.

- **Web Awesome (2026.4+ Shift)**: The 2026.4 release introduces a shift toward **Semantic Surface Tokens**.
  - `wa-color-surface-raised`: Controls the background of elevated elements like dropdown menus.
  - `ha-color-fill-neutral-[quiet|normal]-[resting|hover|active]`: These tokens handle the hover and interaction states for menus and list items. Mapping these is critical to prevent "white-on-white" invisibility in the new UI.
- **Dynamic Color Scales (HSL Power)**: Instead of manually defining 10+ shades of every color variant, use CSS `hsl(from var(...) ...)` to dynamically generate 05-95 scales.
  - **Example**: `ha-color-primary-20: hsl(from var(--primary-color) h s calc(l * 0.40))`
  - This ensures that progress bars, sliders, and graph series automatically look correct for Cyan, Green, Red, etc., without extra code.

## 6. Card-Mod & Component Exclusions

Global background styling for `ha-card` can cause "background stacking" issues with modern custom cards.

- **The Problem**: Applying a solid black background to all `ha-card` elements will break cards intended to be transparent (Mushroom Title, Bubble Card containers).
- **The Fix**: Add explicit `:host(...) ha-card` exclusions in your global `card-mod-card` block to set `background: transparent !important` for structural components like `hui-heading-card`, `mushroom-chips-card`, and `.type-custom-bubble-card`.
es and sliders.
- **API Sunset**: Be aware that `ha-textfield` is scheduled for removal in **2026.5**. Transitioning to semantic `ha-color-form-background` variables is required for future-proofing.

## 6. Card-Mod & Shadow DOM Changes

The migration to Web Awesome (2026.4) changed the underlying DOM structure of many components.

- **New Selectors**: Avoid legacy selectors like `.dropdown-trigger` or `paper-input-container`. Modern themes should target:
  - `ha-select`
  - `ha-input`
  - `ha-dropdown` (replaces older `ha-button-menu`)
- **Shadow DOM**: When targeting these new components, verify if the property you are styling is exposed via a CSS variable or if you need to pierce the shadow DOM specifically for that component's internal structure.
