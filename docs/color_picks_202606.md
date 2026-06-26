# Accent Color Analysis — June 2026

Documented here: the full hue-spread analysis leading to the expansion from 9 to 11 themes in v1.3.9, the options considered, the changes made, and the colors explicitly rejected.

---

## Starting Point (9 themes, v1.3.8)

| Theme | Hex | Hue° | Notes |
| ----- | --- | ----- | ----- |
| Black with Cyan | `#00bcd4` | 187° | Primary/default |
| Black with Green | `#4caf50` | 122° | |
| Black with Red | `#f44336` | 4° | |
| Black with Fuchsia | `#ff00ff` | 300° | Pure magenta |
| Black with Purple | `#9c27b0` | 291° | |
| Black with Indigo | `#5c6bc0` | 231° | |
| Black with Silver | `#e0e0e0` | — | Achromatic/monochrome |
| Black with Orange | `#ff9800` | 36° | Red state accents |
| Black with White | — | — | No accent / base anchor |

**Problems identified:**

- Purple (291°) and Fuchsia (300°) only 9° apart — visually near-identical in picker
- No true blue (clear gap: Cyan 187° → Indigo 231°, 44° with nothing)
- No green-to-cyan bridging color (Green 122° → Cyan 187°, 65° gap)

---

## Options Considered

### Blue — ADDED ✓

Material Blue `#2196f3` (207°). The `&acc_blue` anchor was already defined in the file and used internally for energy/graph tokens. Exposing it as "Black with Blue" required only a single new Section B entry. Blue fills the most obvious perceptual gap — the color most users expect to find that wasn't there. Hue 207° sits cleanly between Cyan (187°) and Indigo (231°).

### Emerald — ADDED ✓

Emerald-600 `#059669` (161°). Fills the Green→Cyan gap. Called "Emerald" not "Teal" because:
- The hex sits at 161° hue — true emerald territory (cool-green)
- "Teal" conventionally implies 170–185°, which would crowd Cyan at 187° (only 14° gap)
- Placing it at 161° gives Green→Emerald = 39°, Emerald→Cyan = 26° — both acceptable
- "Black with Emerald" is visually distinct from both Green and Cyan in the picker

An initial Teal candidate (`#0d9488`, 173°) was rejected specifically because of the 14° gap to Cyan — too close to justify a separate theme.

### Purple → Violet — TWEAKED ✓

Changed hex `#9c27b0` (291°) → `#7c3aed` (262°). Renamed "Black with Purple" → "Black with Violet".

Rationale: at 291°, Purple was only 9° from Fuchsia (300°). Shifting to 262° moves it toward true violet/blue-violet, increases separation from Pink (new 330°) to 68°, and makes the name "Violet" accurate to the visible color.

### Fuchsia → Pink — TWEAKED ✓

Changed hex `#ff00ff` (300°) → `#ec4899` (330°). Renamed "Black with Fuchsia" → "Black with Pink".

Rationale: pure magenta (#ff00ff) at 300° was too close to Purple (291°, 9° gap). After Purple shifts to Violet (262°), the Fuchsia slot at 300° still reads as purple-magenta rather than pink. Shifting to 330° puts it clearly in hot-pink territory and away from the new Violet (68° gap). The name "Fuchsia" at 330° would be a misnomer — "Pink" is accurate.

Backward compat: `fuchsia-color: "#ff00ff"` and `purple-color: "#9c27b0"` are retained as bare named color tokens (no anchors) for users consuming them via `var(--fuchsia-color)` / `var(--purple-color)` in card-mod CSS.

---

## Colors Explicitly Rejected

### Yellow / Amber

**Rejected.** Yellow is a standard HA semantic icon color (entity state indicators). An accent theme using yellow would create confusion between "theme accent" and "this entity is in a warning/attention state." Orange is already present and intentionally uses red state accents (not orange) for the same reason — to stay clear of yellow-adjacent HA semantics.

### Teal (at ~173°)

**Rejected in favor of Emerald.** Teal at 173° would leave only a 14° gap to Cyan (187°) — perceptually indistinguishable in the picker at a glance. The gap-filling role is better served by Emerald at 161°, which sits further from Cyan and has a distinct visual character (clearly green-dominant rather than blue-green).

### Maroon

**Rejected.** Two independent reasons:
1. **Luminance**: Maroon (`#800000`) has a WCAG contrast ratio of ~1.9:1 against black — invisible as an accent. Even "bright" dark-reds like Crimson (`#dc143c`) only reach ~4.2:1 (below the 4.5:1 AA minimum). Dark colors simply don't work as accents on pure black.
2. **Hue**: Maroon sits at ~0–5° — the same hue as Red (`#f44336`). It adds no hue diversity.

### Rose / Crimson

**Rejected.** Rose (~340–350°) falls between Pink (330°) and Red (4°) with only ~15° clearance on each side. Adding it would crowd an already-tight Red→Pink zone. Same luminance constraint applies — sufficiently vivid rose reads as "vivid dark pink/red," not rose.

---

## Final 11-Theme Spread (v1.3.9)

| Theme | Hex | Hue° | Gap to next |
| ----- | --- | ----- | ----------- |
| Black with Red | `#f44336` | 4° | +32° |
| Black with Orange | `#ff9800` | 36° | +86° (Yellow zone — excluded) |
| Black with Green | `#4caf50` | 122° | +39° |
| **Black with Emerald** _(new)_ | `#059669` | 161° | +26° |
| Black with Cyan | `#00bcd4` | 187° | +20° |
| **Black with Blue** _(new)_ | `#2196f3` | 207° | +24° |
| Black with Indigo | `#5c6bc0` | 231° | +31° |
| **Black with Violet** _(was Purple)_ | `#7c3aed` | 262° | +68° |
| **Black with Pink** _(was Fuchsia)_ | `#ec4899` | 330° | +34° |
| — wraps to Red — | — | 364°/4° | — |
| Black with Silver | `#e0e0e0` | — | Achromatic |
| Black with White | — | — | No accent |

**Gap summary:**
- Largest gap: Violet→Pink at 68°. The Violet→Pink→Red zone (262°→330°→4°) spans 102° with one theme in the middle — the Rose/Crimson slot would go here if ever needed. Not needed now.
- Yellow gap (86°): deliberate exclusion, noted above.
- Cool-blue cluster (Emerald→Cyan→Blue→Indigo, 161°–231°): four themes in 70°. Each has distinct color character: Emerald reads green-cool, Cyan blue-green, Blue pure blue, Indigo violet-leaning. Acceptable.

---

## What Could Still be Added (Future, at 12)

Only one slot remains before hitting the stated 12-theme maximum (10 colors + Silver + White).

- 12 max is arbitrary, based on the thought that above that, it gets messy and crowded.

The clearest candidate: a **warm rose** in the Violet→Pink gap (~300°, the old Fuchsia position), but currently that gap is acceptable. No candidate identified that is clearly missing.

---

_Analysis conducted: 2026-06-25. Changes implemented in theme file version 1.3.9-dev._
