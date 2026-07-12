# Changes Made In Home Assistant ver 2026.4

## From the [HA Developers Blog](https://developers.home-assistant.io/blog/2026/03/25/frontend-component-updates-2026.4/)

In the **Home Assistant 2026.4.0** release (April 1, 2026), a significant architectural shift occurred in the frontend. The project has begun migrating from **Material Design** components to **Web Awesome** (based on Shoelace/Lit).

Specifically, the "grey placeholder" issue is caused by the migration from `ha-textfield` to the new `ha-input` component. While the goal was to keep the look-and-feel identical, the underlying CSS variables and DOM structure have changed.

### The Key Change: `ha-input`

In 2026.4, Home Assistant introduced new **semantic theme variables** for form elements. If a theme is "all black" but seeing grey placeholders/backgrounds, it is likely because your theme is missing the new variables that controls the container of the dropdown before it is interacted with.

The following variables were introduced/updated this week:

- `--ha-color-form-background`: Now defaults to a light/neutral grey (`var(--ha-color-neutral-95)`). May need to force this to black.
- `--ha-color-form-background-hover`: Controls the "highlight" when you hover over the collapsed dropdown.
- `--ha-color-form-background-disabled`: The state when a dropdown cannot be clicked.

### How to Modify A Theme

To restore the black background for the dropdown placeholders, add or update these lines in your theme's YAML file:

```yaml
your_theme_name:
  # ... existing colors ...
  ha-color-form-background: "#000000"
  ha-color-form-background-hover: "#1a1a1a" # Or black if you prefer no hover effect

  # For the actual text/placeholder color inside the box
  input-dropdown-icon-color: "#ffffff"
  input-label-ink-color: "#ffffff"
```

### Card-Mod Considerations

If you use `card-mod` to style specific dropdowns (like `input_select`), be aware that many components now use `<ha-dropdown>` instead of the older `<ha-button-menu>`.

If your `card-mod` CSS was targeting `.dropdown-trigger` or `paper-input-container`, those selectors may no longer work because the shadow DOM structure has changed. You may need to update your selectors to target:

1. `ha-select`
2. `ha-input`
3. The internal `vaadin-select-text-field` (if applicable in specific card types).

### Summary of Pipeline Data Types

For your Jinja/Theme maintenance:

- **Variable Inputs:** YAML/String
- **CSS Values:** Hex/RGB String
- **Component Mapping:** JSON-like Shadow DOM structure (accessed via `card-mod`)

> **Note:** The `ha-textfield` API still exists as a shim in 2026.4 but is scheduled for complete removal in **2026.5**. Updating your theme variables now will prevent further breakage next month.
