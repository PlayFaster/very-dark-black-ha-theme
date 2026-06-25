# Changes Made In Home Assistant ver 2026.7

## From the [HA Developers Blog](https://developers.home-assistant.io/blog/2026/06/23/frontend-component-updates-2026.7/)

In the **Home Assistant 2026.7.0** release (June 2026), the changes are infrastructure and component-behaviour focused rather than CSS-token focused. No new CSS custom properties were introduced, no existing tokens were renamed or deprecated, and no theme YAML changes are required.

---

### Summary of Changes

#### 1. Component Size Attribute Renames

`ha-button`, `ha-button-toggle-group`, and `ha-slider` now use short Web Awesome size names.

| Old attribute value | New attribute value |
| --- | --- |
| `small` | `s` |
| `medium` | `m` |
| `large` | `l` |
| _(new)_ | `xs`, `xl` |

These are HTML attribute values, not CSS custom properties. The theme does not set size attributes on these elements in card-mod CSS. **No theme YAML change required.**

---

#### 2. Virtualized List Components (New)

`ha-list-virtualized` and `ha-list-selectable-virtualized` were introduced for large-dataset rendering performance. These components expose no new CSS tokens relevant to the theme. **No action needed.**

---

#### 3. Infrastructure: Dirty State Tracking & Related Context

`DirtyStateProviderMixin`, `dirtyStateContext`, `relatedContext`, and `narrowViewportContext` were added as shared editor infrastructure. These are JavaScript context APIs with no CSS token surface. **No action needed.**

---

#### 4. Lovelace Strategy Regeneration Control

`registryDependencies` and `shouldRegenerate()` allow dashboard strategies to control when they rebuild. No CSS token impact. **No action needed.**

---

### Theme Impact

**None.** No CSS custom properties added, renamed, or deprecated in 2026.7. The theme YAML requires no changes for this release.

Reviewed: 2026-06-25
