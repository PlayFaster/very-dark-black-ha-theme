# Changes Made In Home Assistant ver 2026.6

## From the [HA Developers Blog](https://developers.home-assistant.io/blog/2026/05/27/frontend-component-updates-2026.6/)

In the **Home Assistant 2026.6.0** release (June 2026), the migration from Material Design components to **Web Awesome** (Shoelace/Lit) continued. The headline changes are:

- `ha-radio` replaced by the new `ha-radio-group` + `ha-radio-option` Web Awesome components.
- `ha-top-app-bar` removed entirely; `ha-top-app-bar-fixed` migrated to native Lit.
- `ha-header-bar` rewritten as a native Lit component.
- `ha-drawer` updated to use the Web Awesome drawer component.
- Two layout-width token renames (see below — no action needed for color-only themes).

---

### Key Component Migrations

#### 1. `ha-radio-group` & `ha-radio-option`

`ha-radio` has been removed and replaced with a Web Awesome-based `ha-radio-group` containing `ha-radio-option` children. This introduces a new set of CSS tokens parallel in structure to the existing `ha-checkbox-*` tokens.

**Removed component (retained in theme for backward compat):**

- `ha-radio` (and its associated `paper-radio-button-unchecked-color` legacy token)

**New Web Awesome Tokens added to theme:**

| Token | Value | Notes |
| --- | --- | --- |
| `ha-radio-option-active-color` | `var(--primary-color)` | Selected/active accent color |
| `ha-radio-option-border-color` | `#444444` | Unchecked border — matches `ha-checkbox-border-color` |
| `ha-radio-option-border-color-hover` | `#666666` | Hover border — matches `ha-checkbox-border-color-hover` |
| `ha-radio-option-border-width` | `1.5px` | Matches `ha-checkbox-border-width` |
| `ha-radio-option-background-color` | `transparent` | Unchecked — matches `ha-checkbox-background-color` |
| `ha-radio-option-background-color-hover` | `#151515` | Hover — matches `ha-checkbox-background-color-hover` |
| `ha-radio-option-checked-background-color` | `var(--primary-color)` | Checked fill |
| `ha-radio-option-checked-icon-color` | `#ffffff` | High-contrast icon on colored background |

**Tokens intentionally omitted (sizing/layout — theme does not set equivalent checkbox sizing):**

- `ha-radio-option-height`
- `ha-radio-option-toggle-size`
- `ha-radio-option-checked-icon-scale`
- `ha-radio-option-control-margin`
- `ha-radio-group-required-marker`
- `ha-radio-group-required-marker-offset`

> **Note:** The blog post contains a typo — `--ha-radio-option-heigh` — the correct token name is `--ha-radio-option-height`.

---

#### 2. Layout Width Token Renames

Two tokens were renamed as part of component migrations:

| Old token | New token | Status |
| --- | --- | --- |
| `--mdc-top-app-bar-width` | `--ha-top-app-bar-width` | Not set in theme — no action needed |
| `--mdc-drawer-width` | `--ha-sidebar-width` | Not set in theme — no action needed |

The theme does not override sidebar or top-bar widths, so no theme YAML change is required. If a custom sidebar width is ever needed, use `ha-sidebar-width`.

---

#### 3. Removed Components (No Action Needed)

These components were removed or fully migrated to Lit. No CSS tokens were lost from the theme:

- `ha-top-app-bar` — removed entirely; no theme tokens were set for this
- `ha-top-app-bar-fixed` — migrated from Material Web Components to Lit
- `ha-header-bar` — rewritten as native Lit component
- `ha-drawer` — updated to Web Awesome drawer (token rename handled above)

---

### Backward Compatibility

Per project policy, **removed and deprecated tokens are retained** in the theme file because they fail silently (no error, just no effect) on newer HA versions while still styling older installs. No tokens were removed from the theme file for this release.
