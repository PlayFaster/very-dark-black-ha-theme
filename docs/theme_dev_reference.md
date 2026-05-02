# Home Assistant Theme Development: Lessons Learned & "What Not To Do"

This document serves as a technical reference based on the development of the "Very Dark Black" theme pack. It highlights common pitfalls that can break Home Assistant's configuration or cause UI accessibility issues.

## 1. YAML Standards & Linting

Strict validation (like `yamllint`) requires adherence to official YAML specifications.

- **Document Start**: Always start `.yaml` files with `---`. Home Assistant core often works without it, but CI/CD pipelines and linters will flag it as an error.
- **Line Length**: Keep lines under 80 characters. For long CSS properties (like `border`), split them into individual components (`border-width`, `border-style`, `border-color`) rather than using shorthand.
- **Trailing Spaces**: Never leave spaces at the end of a line. These are invisible but considered errors in clean code environments.

## 2. Shared Configs & Hidden Anchors

Home Assistant's theme loader is unique and highly restrictive.

- **The "Every Key is a Theme" Rule**: Every top-level key in a theme file is treated as a selectable theme name in the HA UI. There is no mechanism to hide or exclude a theme from the picker — internal helpers (like `Black (Background Only)` and `Black (Standard)`) will always appear. The pragmatic solution is to give them a sensible name and accept their presence. Do NOT add `primary-color` to an anchor theme (Section A or B) — every colour variant also defines it, and HA will log a duplicate key warning for every theme in the file.
- **The "Everything is a String" Rule**: Home Assistant expects every variable inside a theme to be a string (representing a CSS variable).
  - **CRITICAL FAILURE**: Do NOT nest dictionaries (like a palette block) inside a theme block. This will crash the Home Assistant configuration loader and prevent a restart.
- **Execution Order (Anchors vs. Aliases)**: YAML is processed sequentially within a file.
  - **CRITICAL FAILURE**: You MUST define an anchor (e.g., `&acc_red`) _before_ you reference it with an alias (e.g., `*acc_red`). Defining anchors at the bottom of a large shared configuration while referencing them at the top will cause a fatal "undefined alias" error that prevents HA from starting.
- **Inheritance (Anchors/Aliases)**: To avoid "Duplicate Key" warnings, ensure that your base anchor contains _only_ shared settings. If the base anchor defines a property (e.g., `state-active-color: var(--primary-color)`) and a sub-theme overrides it (e.g., `*acc_red`), HA's restrictive loader will log a warning.
  - **The Fix**: Remove the key from the base config entirely and explicitly define it in every variant. Use a comment in the base config to document the intended default.
  - **Gotcha — Section B redeclaring Section A tokens**: `black_surfaces` (Section B) uses `<<: *base_logic`. Any token already defined in `base_logic` must NOT be redefined in `black_surfaces`, even with an identical value — HA will still warn. Before adding a token to Section B, grep for it in Section A first. Tokens like `mdc-text-field-fill-color`, `wa-text-field-fill-background-color`, and `wa-select-fill-background-color` are already set in Section A (lines 99, 124, 125) and must not be duplicated in Section B.

## 3. UI Accessibility & Polish

Dark themes often suffer from "White-on-White" text issues or "Dead Flat" backgrounds.

- **Contrast Ratios (WCAG AA)**: On a pure black (#000000) background, secondary text needs to be at least `#a8a8a8` to safely pass WCAG AA contrast guidelines (~8:1). Standard grey (#9b9b9b) is often too close to the threshold for comfortable reading in all lighting conditions.
- **Hover/Selection States**: Home Assistant's Material Design components use specific tokens for list highlights.
- **The Fix**: Explicitly set `mdc-list-item-selected-container-color` to a dark charcoal or your accent color.
- **Browser Rendering**: Always include `-webkit-font-smoothing: antialiased` in your `card-mod` host styles. This prevents light text from "blooming" or blurring against pure black backgrounds, keeping it crisp and legible.
- **Depth on Flat Surfaces**: A pure black (`#000000`) interface can feel "dead" without subtle lighting. Use `box-shadow: inset 0 1px 4px rgba(255, 255, 255, 0.05)` on inputs and fields to create a tactile "cut-out" effect that respects the dark aesthetic.
- **Standardized Borders**: Use a low-opacity white (e.g., `rgba(255, 255, 255, 0.12)`) for borders rather than off-white. This provides consistent luminance and visibility across different screen technologies (OLED vs. IPS).

## 4. Icon & Component Scaling

- **Granular Radius**: Avoid a single global `border-radius`. Implement a scale (e.g., `token-size-radius-small: 8px`, `medium: 12px`, `large: 16px`) to differentiate between small interactive elements (buttons/inputs) and large structural components (cards).
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
- **Material 3 Semantic Tokens**: Modern components increasingly use the `md-sys-color-*` palette.
  - `md-sys-color-on-surface-variant`: Essential for secondary text visibility.
  - `md-sys-color-outline-variant`: Controls borders in new M3-style cards.
  - `md-sys-color-[error|warning|success|info]`: Essential for semantic feedback in logs and status chips.
- **Dynamic Color Scales (HSL Power)**: Instead of manually defining 10+ shades of every color variant, use CSS `hsl(from var(...) ...)` to dynamically generate 05-95 scales.
  - **NOTE**: The `hsl(from ...)` syntax requires HA 2026.4+ and a modern browser.
  - **Example**: `ha-color-primary-20: hsl(from var(--primary-color) h s calc(l * 0.40))`

## 6. Card-Mod & Component Exclusions

Global background styling for `ha-card` can cause "background stacking" issues with modern custom cards.

- **The Problem**: Applying a solid black background to all `ha-card` elements will break cards intended to be transparent (Mushroom Title, Bubble Card containers).
- **The Fix**: Add explicit `:host(...) ha-card` exclusions in your global `card-mod-card` block to set `background: transparent !important` and `border: none !important` for:
  - `hui-heading-card`
  - `mushroom-title-card` / `mushroom-chips-card`
  - `.type-custom-bubble-card`
  - `hui-conditional-card`
  - `custom-button-card`
- **Brittle Selectors**: Deep DOM traversal (e.g., `ha-card-picker $ ha-sub-page ...`) is extremely brittle and will break when HA updates its internal component structure. Use native CSS tokens whenever possible, and clearly document these selectors as high-maintenance items.
