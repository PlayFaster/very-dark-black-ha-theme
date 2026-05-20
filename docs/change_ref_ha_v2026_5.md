# Changes Made In Home Assistant ver 2026.5

## From the [HA Developers Blog](https://developers.home-assistant.io/blog/2026/05/04/frontend-component-updates-2026.5/) and [GitHub PR #51984](https://github.com/home-assistant/frontend/pull/51984)

In the **Home Assistant 2026.5.0** release (May 2026), the migration from **Material Design** components to **Web Awesome** (based on Shoelace/Lit) progressed significantly. Multiple core components were refactored to use Web Awesome, which introduces new CSS properties/tokens and deprecates older ones.

Additionally, a critical bug fix was merged in PR #51984 to prevent `ha-entity-toggle` from overriding custom theme variables for `ha-switch`.

---

### Key Component Migrations

#### 1. `ha-switch` & `ha-entity-toggle`

`ha-switch` has been migrated to Web Awesome. This deprecates the old Material Design-based `--switch-*` tokens and introduces detailed semantic tokens forunchecked/checked states, borders, and hover effects.

**Removed Tokens:**

- `--switch-unchecked-button-color`
- `--switch-unchecked-track-color`
- `--switch-unchecked-color`
- `--switch-checked-button-color`
- `--switch-checked-track-color`
- `--switch-checked-color`

**New Web Awesome Tokens:**

- `--ha-switch-size`
- `--ha-switch-thumb-size`
- `--ha-switch-width`
- `--ha-switch-background-color` (Unchecked track background)
- `--ha-switch-thumb-background-color` (Unchecked thumb)
- `--ha-switch-background-color-hover`
- `--ha-switch-thumb-background-color-hover`
- `--ha-switch-checked-background-color` (Checked track background)
- `--ha-switch-checked-thumb-background-color` (Checked thumb)
- `--ha-switch-checked-background-color-hover`
- `--ha-switch-checked-thumb-background-color-hover`
- `--ha-switch-border-color`
- `--ha-switch-thumb-border-color`
- `--ha-switch-thumb-border-color-hover`
- `--ha-switch-checked-border-color`
- `--ha-switch-checked-thumb-border-color`
- `--ha-switch-checked-border-color-hover`
- `--ha-switch-checked-thumb-border-color-hover`
- `--ha-switch-thumb-box-shadow`
- `--ha-switch-disabled-opacity`
- `--ha-switch-required-marker`
- `--ha-switch-required-marker-offset`

**PR #51984 Fix (Toggle Overrides):** To prevent `ha-entity-toggle` from overriding global custom theme sizing, the following toggle-specific variables are introduced:

- `--ha-entity-toggle-switch-width` (Defaults to `38px` inside entity toggles, but themeable)
- `--ha-entity-toggle-switch-size` (Defaults to `20px` inside entity toggles, but themeable)
- `--ha-entity-toggle-switch-thumb-size` (Defaults to `14px` inside entity toggles, but themeable)

#### 2. `ha-checkbox`

`ha-checkbox` has been migrated to Web Awesome, replacing the old MDC checkbox.

**New Web Awesome Tokens:**

- `--ha-checkbox-size`
- `--ha-checkbox-border-color`
- `--ha-checkbox-border-color-hover`
- `--ha-checkbox-background-color`
- `--ha-checkbox-background-color-hover`
- `--ha-checkbox-checked-background-color`
- `--ha-checkbox-checked-background-color-hover`
- `--ha-checkbox-checked-icon-color` (Checkmark icon color)
- `--ha-checkbox-checked-icon-scale`
- `--ha-checkbox-border-radius`
- `--ha-checkbox-border-width`
- `--ha-checkbox-required-marker`
- `--ha-checkbox-required-marker-offset`

#### 3. `ha-progress-bar`

A new custom progress bar component replaces the old `mwc-progress-bar` in the codebase.

**New Tokens:**

- `--ha-progress-bar-indicator-color`
- `--ha-progress-bar-indicator-background`
- `--ha-progress-bar-track-color`
- `--ha-progress-bar-track-height`
- `--ha-progress-bar-border-radius`
- `--ha-progress-bar-animation-duration`
- `--ha-progress-bar-indicator-highlight-image`
- `--ha-progress-bar-indicator-highlight-width`
- `--ha-progress-bar-indicator-highlight-height`

#### 4. `ha-textarea`

Migrated to Web Awesome. Supports Lit/Shoelace attributes. Specifically, the textarea can grow in size automatically by setting the `resize` property to `auto`.

#### 5. `ha-adaptive-popover`

Introduced as the popover counterpart to `ha-adaptive-dialog` (combining desktop popover with mobile bottom sheet), currently utilized by the Tile Card date picker feature.

#### 6. Removed `ha-fab`

`ha-fab` (Floating Action Button) has been removed. Home Assistant now uses a standard `ha-button`, leaving position styling to parent containers.

---

### Global Style updates

#### 1. Box Shadow Tokens

Standardized global box shadow tokens are introduced, replacing older fragmented variables:

**New Tokens:**

- `--ha-box-shadow-s`
- `--ha-box-shadow-m`
- `--ha-box-shadow-l`

**Removed/Deprecated Tokens:**

- `--ha-color-shadow-light`
- `--ha-color-shadow-dark`
- `--ha-shadow-offset-x-...`
- `--ha-shadow-blur-...`
- `--ha-shadow-spread-...`

#### 2. Surface Colors

New tokens introduced for surface backgrounds, currently used for tooltips (`ha-tooltip`) but planned for broader surface background refactoring in future releases:

- `--ha-color-surface-default`
- `--ha-color-surface-low`
- `--ha-color-surface-lower`
- `--ha-color-surface-default-inverted`
- `--ha-color-surface-low-inverted`
- `--ha-color-surface-lower-inverted`

---

### How to Modify the Theme for 2026.5

To maintain the "Very Dark Black" ethos (pure black backgrounds `#000000`, dark surfaces `#0a0a0a`, and clear visibility with the primary/accent color), add or update the following mappings:

```yaml
your_theme_name:
  # --- Box Shadows (Flat/Black Ethos) ---
  ha-box-shadow-s: "none"
  ha-box-shadow-m: "none"
  ha-box-shadow-l: "none"

  # --- Surface Colors (Tooltips & Future refactoring) ---
  ha-color-surface-default: "#0a0a0a" # Dark surface for tooltips
  ha-color-surface-low: "#050505"
  ha-color-surface-lower: "#000000"
  ha-color-surface-default-inverted: "#ffffff"
  ha-color-surface-low-inverted: "#f5f5f5"
  ha-color-surface-lower-inverted: "#e0e0e0"

  # --- Progress Bar Customization ---
  ha-progress-bar-indicator-color: var(--primary-color)
  ha-progress-bar-indicator-background: var(--primary-color)
  ha-progress-bar-track-color: "#1a1a1a"
  ha-progress-bar-track-height: "4px"
  ha-progress-bar-border-radius: "4px"

  # --- Web Awesome Switch Customization (Unchecked) ---
  ha-switch-background-color: "#1e1e1e"
  ha-switch-thumb-background-color: "#666666"
  ha-switch-background-color-hover: "#2a2a2a"
  ha-switch-thumb-background-color-hover: "#888888"
  ha-switch-border-color: "#333333"
  ha-switch-thumb-border-color: "#666666"

  # --- Web Awesome Switch Customization (Checked) ---
  ha-switch-checked-background-color: var(--ha-color-primary-10) # Quieter primary HSL scale
  ha-switch-checked-thumb-background-color: var(--primary-color)
  ha-switch-checked-background-color-hover: var(--ha-color-primary-20)
  ha-switch-checked-thumb-background-color-hover: var(--primary-color)
  ha-switch-checked-border-color: var(--primary-color)
  ha-switch-checked-thumb-border-color: var(--primary-color)
  ha-switch-checked-thumb-border-color-hover: var(--primary-color)

  # --- Entity Toggle Sizes (PR #51984) ---
  ha-entity-toggle-switch-width: 38px;
  ha-entity-toggle-switch-size: 20px;
  ha-entity-toggle-switch-thumb-size: 14px;

  # --- Web Awesome Checkbox Customization ---
  ha-checkbox-size: "18px"
  ha-checkbox-border-width: "1.5px"
  ha-checkbox-border-radius: "4px"
  ha-checkbox-border-color: "#444444" # Graphite color matching unselected state
  ha-checkbox-border-color-hover: "#666666"
  ha-checkbox-background-color: "transparent" # Pure black background contrast
  ha-checkbox-background-color-hover: "#151515"
  ha-checkbox-checked-background-color: var(--primary-color)
  ha-checkbox-checked-background-color-hover: var(--primary-color)
  ha-checkbox-checked-icon-color: "#ffffff" # High contrast checkmark
```

### Summary of Pipeline Data Types

- **Variable Inputs:** YAML / Theme mappings
- **CSS Values:** Hex, CSS variables, `var(--primary-color)`, HSL color scaling (`var(--ha-color-primary-*)`)
- **Component Mapping:** Web Awesome shadow DOM styling hook properties
