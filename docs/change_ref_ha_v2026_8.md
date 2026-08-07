# Changes Made In Home Assistant ver 2026.8

## From the [HA Developers Blog](https://developers.home-assistant.io/blog/2026/07/31/frontend-component-updates-2026.8/)

In the **Home Assistant 2026.8.0** release (August 2026), the frontend component updates are primarily layout-focused, JavaScript context/behavior APIs, and new Lovelace card features. No new CSS custom properties relating to theme colors were introduced, no existing color tokens were renamed or deprecated, and no theme YAML changes are required.

---

### Summary of Changes

#### 1. `ha-split-panel` Wrapper Component (New)

Home Assistant added `ha-split-panel` as a wrapper around the Web Awesome split panel component. It introduces several layout/size tokens:

- `--ha-split-panel-divider-width`
- `--ha-split-panel-divider-hit-area`
- `--ha-split-panel-min`
- `--ha-split-panel-max`
- `--ha-split-panel-grip-display`

These tokens control sizing, positioning, and layout behavior, rather than colors. Since this theme is color-centric and does not enforce custom layout dimensions on standard panels, **no theme YAML changes are required** for this component.

---

#### 2. `ha-tile-info` Layout Controls (Updated)

`ha-tile-info` gained additional tokens for layout controls inside custom cards and tile-like surfaces:

- `--ha-tile-info-gap`
- `--ha-tile-info-min-height`
- `--ha-tile-info-primary-min-height`
- `--ha-tile-info-primary-line-clamp`

Like `ha-split-panel`, these tokens control layout metrics (height, gaps, text clamping) rather than styling colors. The theme leaves layout defaults to the frontend implementation. **No theme YAML changes are required.**

---

#### 3. Form and Selector Additions (JavaScript / Schema)

- **Conditional Fields**: `ha-form` schemas now support the `visible` property to toggle field visibility dynamically.
- **Text Selector validation**: Text selectors now support HTML `pattern` validation and custom `validation_message`.
- **Entity Selector filter**: Entity selectors can now filter based on device properties (`manufacturer`, `model`).
- **New Selector**: Added `ui_clock_date_format` selector for the clock card date format editor.

These are JavaScript API schema enhancements with no styling surface. **No action needed.**

---

#### 4. Lovelace updates: `state_color` moving to `color`

The `entities` and `glance` cards now support the `color` configuration parameter (e.g. `color: state` or `color: none`) as a replacement for the legacy `state_color` boolean. This is a Lovelace dashboard configuration option/YAML syntax change, not a CSS custom property or theme variable set in theme YAML. **No theme YAML changes are required.**

---

#### 5. Custom Panels & App Iframes: Safe-Area Handling

Custom panels and add-on app iframes now get safe-area padding by default to avoid screen notches, status bars, and home indicators. Home Assistant forwards the resolved safe-area values into iframe documents as CSS variables:

- `--safe-area-inset-top`
- `--safe-area-inset-right`
- `--safe-area-inset-bottom`
- `--safe-area-inset-left`

These values are dynamic and device-dependent; the theme does not customize or override these values. **No theme action is needed.**

---

#### 6. Context & Editor Infrastructure: Global Dirty State

`DirtyStateProviderMixin` now publishes a global dirty state, setting `window.isDirtyState` and firing a `dirty-state-changed` event. This is a pure JavaScript lifecycle feature with no styling surface. **No action needed.**

---

### Theme Impact

**None.** No color-related CSS custom properties were added, renamed, or deprecated in 2026.8. The theme YAML requires no changes for this release.

Reviewed: 2026-08-07
