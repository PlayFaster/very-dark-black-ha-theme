# Home Assistant Compatibility

What Home Assistant versions this theme supports and the status of frontend CSS theme variables.

**Reviewed 2026-11-02.**

> [!IMPORTANT]
>
> **This theme targets Home Assistant 2022.11.0 and later.** It relies on Lovelace CSS custom properties and frontend theme variable support.

---

## Supported versions

| Type | Version / Status | Note |
| :-- | :-- | :-- |
| **Minimum** | **2022.11.0** | Declared in `README.md` |
| **Enforced by** | `hacs.json` | `"homeassistant": "2022.11.0"` |
| **Functional floor** | Lovelace CSS custom variables | Modern true-black card styling |
| **Frontend target** | Modern Lovelace frontend | Uses `--primary-background-color`, `--card-background-color`, etc. |

---

## Deprecation & compatibility ledger

| API / Feature | Deprecated in | Removed in | Theme Exposure | Status |
| :-- | :-- | :-- | :-- | :-- |
| `--paper-item-icon-active-color`, `--state-icon-active-color` | Unused from 2022.12 (blog 2022-12-07) | 2022.12 | Set at YAML lines 98 and 103 for 2022.11 | **Retained** under the backward-compatibility policy; no effect from 2022.12 |
| Dynamic HSL `ha-color-neutral-*` and `ha-color-primary-*` scales (`hsl(from …)`) | None | None | Require HA 2026.4 and a modern browser (YAML line 220) | **Compliant**; fall back on older versions (README line 96) |
| Surface background tokens introduced in 2026.5 | Broader refactoring announced as future work (`docs/change_ref_ha_v2026_5.md` line 129) | None | Set for tooltips | **Watch** |
| `--ha-split-panel-*`, `--ha-tile-info-*` (2026.8) | None | None | Not set; layout tokens | **N/A** |
| `--md-list-item-*`, `--md-outlined-icon-button-*`, `--md-sys-color-outline`, `--md-assist-chip-*`, `--md-input-chip-*`, `--md-filter-chip-*`, `--mdc-typography-*` (2026.11) | 2026.11 | 2026.11 | Not set; the theme sets only the `-variant` outline and on-surface tokens (YAML lines 211, 212) | **N/A** |
| `--ha-panel-background`, `--ha-panel-toolbar-background`, `--ha-data-table-background` (2026.11) | None | None | Not set; default to `primary-background-color` and `data-table-background-color`, both black (YAML lines 75, 157) | **Compliant** by default |

---

## Upcoming milestones

- **Home Assistant frontend changes:** Frontend changes altering Lovelace CSS tokens or web components are tracked via `theme_review.md` and registered in `ha_compat_findings_register.md`.

---

## Version Control

| Version | Date | Change |
| :-- | :-- | :-- |
| 1.1.0 | 2026-11-02 | Ledger rebuilt from the 2026-11-02 13:42 compatibility review: legacy active-color tokens, HSL scales, 2026.5 surface watch, 2026.8 and 2026.11 tokens. |
| 1.0.0 | 2026-11-02 | Initial compatibility dossier created. |
