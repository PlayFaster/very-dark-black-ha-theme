# Internal Detailed Changelog: Very Dark Black Home Assistant Theme

All changes to this project will be documented in this file. This is the detailed changelog, to include non user facing changes and intra-release changes.

---

- [Internal Detailed Changelog: Very Dark Black Home Assistant Theme](#internal-detailed-changelog-very-dark-black-home-assistant-theme)
  - [\[1.4.1-dev6\] - 2026-08-02 - Unreleased](#141-dev6---2026-08-02---unreleased)
  - [\[1.4.1-dev5\] - 2026-07-26 - Unreleased](#141-dev5---2026-07-26---unreleased)
  - [\[1.4.1-dev4\] - 2026-07-26 - Unreleased](#141-dev4---2026-07-26---unreleased)
  - [\[1.4.1-dev3\] - 2026-07-12 - Unreleased](#141-dev3---2026-07-12---unreleased)
  - [\[1.4.1-dev2\] - 2026-07-12 - Unreleased](#141-dev2---2026-07-12---unreleased)
  - [\[1.4.1-dev1\] - 2026-07-06 - Unreleased](#141-dev1---2026-07-06---unreleased)
  - [\[1.4.0\] - 2026-07-04 - Release](#140---2026-07-04---release)
  - [\[1.4.0-dev9\] - 2026-07-04 - Unreleased](#140-dev9---2026-07-04---unreleased)
  - [\[1.4.0-dev8\] - 2026-07-04 - Unreleased](#140-dev8---2026-07-04---unreleased)
  - [\[1.4.0-dev7\] - 2026-07-04 - Unreleased](#140-dev7---2026-07-04---unreleased)
  - [\[1.4.0-dev6\] - 2026-07-04 - Unreleased](#140-dev6---2026-07-04---unreleased)
  - [\[1.4.0-dev5\] - 2026-07-04 - Unreleased](#140-dev5---2026-07-04---unreleased)
  - [\[1.4.0-dev4\] - 2026-07-03 - Unreleased](#140-dev4---2026-07-03---unreleased)
  - [\[1.4.0-dev3\] - 2026-06-27 - Unreleased](#140-dev3---2026-06-27---unreleased)
  - [\[1.4.0-dev2\] - 2026-06-27 - Unreleased](#140-dev2---2026-06-27---unreleased)
  - [\[1.4.0-dev1\] - 2026-06-26 - Unreleased](#140-dev1---2026-06-26---unreleased)
  - [\[1.3.8\] - 2026-06-25 - Release](#138---2026-06-25---release)
  - [\[1.3.8-dev9\] - 2026-06-25 - Unreleased](#138-dev9---2026-06-25---unreleased)
  - [\[1.3.8-dev6\] - 2026-06-25 - Unreleased](#138-dev6---2026-06-25---unreleased)
  - [\[1.3.8-dev3\] - 2026-06-25 - Unreleased](#138-dev3---2026-06-25---unreleased)
  - [\[1.3.8-dev2\] - 2026-06-25 - Unreleased](#138-dev2---2026-06-25---unreleased)
  - [\[1.3.8-dev1\] - 2026-06-25 - Unreleased](#138-dev1---2026-06-25---unreleased)
  - [\[1.3.7\] - 2026-06-24 - Release](#137---2026-06-24---release)
  - [\[1.3.7-dev10\] - 2026-06-24 - Unreleased](#137-dev10---2026-06-24---unreleased)
  - [\[1.3.7-dev9\] - 2026-06-24 - Unreleased](#137-dev9---2026-06-24---unreleased)
  - [\[1.3.7-dev8\] - 2026-06-24 - Unreleased](#137-dev8---2026-06-24---unreleased)
  - [\[1.3.7-dev7\] - 2026-06-24 - Unreleased](#137-dev7---2026-06-24---unreleased)
  - [\[1.3.7-dev6\] - 2026-06-20 - Unreleased](#137-dev6---2026-06-20---unreleased)
  - [\[1.3.7-dev4\] - 2026-06-18 - Unreleased](#137-dev4---2026-06-18---unreleased)
  - [\[1.3.6\] - 2026-06-15](#136---2026-06-15)
  - [\[1.3.6-dev5\] - 2026-06-15 - Unreleased](#136-dev5---2026-06-15---unreleased)
  - [\[1.3.6-dev4\] - 2026-06-15 - Unreleased](#136-dev4---2026-06-15---unreleased)
  - [\[1.3.6-dev3\] - 2026-06-11 - Unreleased](#136-dev3---2026-06-11---unreleased)
  - [\[1.3.5\] - 2026-06-05](#135---2026-06-05)
  - [\[1.3.5-dev4\] - 2026-06-05 - Unreleased](#135-dev4---2026-06-05---unreleased)
  - [\[1.3.5-dev3\] - 2026-06-05 - Unreleased](#135-dev3---2026-06-05---unreleased)
  - [\[1.3.5-dev2\] - 2026-06-04 - Unreleased](#135-dev2---2026-06-04---unreleased)
  - [\[1.3.5-dev1\] - 2026-05-24 - Unreleased](#135-dev1---2026-05-24---unreleased)
  - [\[1.3.4\] - 2026-05-20](#134---2026-05-20)
  - [\[1.3.4-dev3\] - 2026-05-20 - Unreleased](#134-dev3---2026-05-20---unreleased)
  - [\[1.3.4-dev2\] - 2026-05-08 - Unreleased](#134-dev2---2026-05-08---unreleased)
  - [\[1.3.3\] - 2026-05-02](#133---2026-05-02)
  - [\[1.3.3-dev13\] - 2026-05-01](#133-dev13---2026-05-01)
  - [\[1.3.3-dev12\] - 2026-05-01](#133-dev12---2026-05-01)
  - [\[1.3.3-dev11\] - 2026-05-01](#133-dev11---2026-05-01)
  - [\[1.3.3-dev9\] - 2026-05-01](#133-dev9---2026-05-01)
  - [\[1.3.2\] - 2026-04-03](#132---2026-04-03)
  - [\[1.3.1\] - 2026-04-01](#131---2026-04-01)
  - [\[1.2.2\] - 2026-03-30](#122---2026-03-30)
  - [\[1.2.1\] - 2026-01-16](#121---2026-01-16)
  - [\[1.1.1\] - 2025-12-04](#111---2025-12-04)
  - [\[1.0.1\] - 2025-11-18](#101---2025-11-18)

---

## [1.4.1-dev6] - 2026-08-02 - Unreleased

### Changes

- **README**: Updated to add _Documentation Accuracy_ section, standard now across all project README files.
- **`changelog_local`**: Added Table of Contents

### Bumps

- **Shared CI**: Bump `.github` Shared CI Validation via SHA from v2.0.7 to v2.0.8
- **Validate Bump**: Update `zizmor` from 1.25.2 to 1.28.0
- These do NOT affect this project but are part of Shared CI.
  - **Validate Bump**: Update `ruff` from 0.15.22 to 0.16.0
  - **Validate Bump**: Bumped PHACC `pytest-homeassistant-custom-component` from 0.13.348 to 0.13.341
- **`tasks.json`**: Added a new hardware checks section to tasks.json, for local hardware validation.

## [1.4.1-dev5] - 2026-07-26 - Unreleased

### Bumps

- These do NOT affect this project but are part of Shared CI.
  - **Validate Bump**: Update `ruff`from 0.15.21 to 0.15.22

## [1.4.1-dev4] - 2026-07-26 - Unreleased

### Changed

- **Logo**: Added a logo to the top of `README` file. Themes in HA don't have icons or logos, unlike integrations. This is just for branding and visibility in the `README`.
- **Readme**: Updated the readme with collapsible sections, similar to other PlayFaster README files.
- **AGents**: Updated AGENTS.md to sync with Readme and in-line with current theme behavior.

### Bumps

- **Shared .github CI Validation**: Bump .github Shared CI Validation via SHA from v2.0.5 to v2.0.6
- **Validate Bump**: Update `codespell`from 2.42 to 2.43
- These do NOT affect this project but are part of Shared CI.
  - **Validate Bump**: Bumped PHACC `pytest-homeassistant-custom-component` from 0.13.346 to 0.13.348
  - **Validate Bump**: Update `ruff`from 0.15.20 to 0.15.21

## [1.4.1-dev3] - 2026-07-12 - Unreleased

### Changed

- **Docs Formats**: Codespell alignment, words like behavior and color etc.

## [1.4.1-dev2] - 2026-07-12 - Unreleased

### Bumps

- These do NOT affect this project but are part of Shared CI.
  - **Validate Bump**: Bumped PHACC `pytest-homeassistant-custom-component` from 0.13.345 to 0.13.346

### Changed

- **Formats**: Codespell alignment, words like behavior and color etc.

## [1.4.1-dev1] - 2026-07-06 - Unreleased

### Bumps

- **Shared .github CI Validation**: Bump .github Shared CI Validation via SHA from v2.0.5 to v2.0.6

### Changed

- **Shared Local CI**: These do **NOT** impact this VDB Theme project (ruff = python), but because the CI is shared the files come across.
  - **Ruff Checks Extended**: As of shared CI Dev-workbench v2.2.1, Ruff checks have been extended to align with Home Assistant. This involves INcluding a wide range of checks and then EXcluding several items because of the wider range. In this project, that lead to 17 issues to be addressed.
  - **IQS Validation**: `dev-workbench` script `iqs_static_check.py` added via `tasks.json` now checks for Home Assistant Integration Quality Scale ( IQS ) compliance to 7 basic IQS rules.

## [1.4.0] - 2026-07-04 - Release

### Summary

- Expands the theme from 8 to 11 accent colors — adding Blue and Emerald, and renaming/re-hueing Purple → Violet and Fuchsia → Pink — alongside a large amount of under-the-hood token and structural work.

### Added

- **Two new accent variants — Blue and Emerald**, bringing the picker to 11 selectable themes.
- **Lock entity colors**: lock states now follow the theme's accent/neutral scheme (locked = accent, unlocked/transitional = muted grey, jammed = red) instead of HA's fixed green/red.
- **Inline code contrast**: inline code text color is now set for readability on the dark code background.
- **Code editor surface**: the YAML/automation/template editor now uses a pure-black background instead of a lighter default panel.

### Changed

- **"Black with Purple" → "Black with Violet"**: renamed and shifted bluer (`#9c27b0` → `#7c3aed`) for clearer separation in the picker.
- **"Black with Fuchsia" → "Black with Pink"**: renamed and shifted to true pink (`#ff00ff` → `#ec4899`). Old `var(--purple-color)` / `var(--fuchsia-color)` references remain available for backward compatibility.
- **Card title/header color** is now themeable via `ha-card-header-color` (white remains the default).

## [1.4.0-dev9] - 2026-07-04 - Unreleased

### Summary

- **Neutral color consolidation**: Repeated neutral hex literals (whites, greys, surfaces, borders) were consolidated into a single-source **Neutral Ramp** (new Section 1c). Each canonical neutral is now defined once as a keyed token that doubles as both a CSS custom property (`--token-neutral-*`, reachable from card-mod) and a YAML anchor (parse-time reuse). Purely a refactor — every existing key resolves to its exact previous value; verified by an anchor-resolution diff across all 11 themes (only the two card-mod blocks changed, as intended).

### Added

- **Section 1c — Neutral Ramp**: Ten keyed tokens as the single source for repeated neutrals — `token-neutral-white` `#ffffff`, `-black` `#000000`, `-deep` `#050505`, `-surface` `#0a0a0a`, `-hover` `#151515`, `-border` `#1a1a1a`, `-line-strong` `#333333`, `-line-medium` `#444444`, `-line-soft` `#666666`, `-outline` `#606060`. Legacy anchor names (`base_black`, `base_surface`, `base_border`, `acc_charcoal`, `acc_graphite`, `acc_medium`) were retained on these definitions so every existing `*alias` keeps resolving; the anchor _definition sites_ simply moved up into 1c. Follows the existing `token-rgb-*` / `token-size-radius-*` convention. `token-neutral-white` is kept deliberately separate from `primary-text-color` (`#e1e1e1`): white = max-contrast emphasis, `#e1e1e1` = body.

### Changed

- **Option A — `#ffffff` consolidated**: 17 standalone `#ffffff` YAML values now alias `*base_white` (`token-neutral-white`). `var(..., #ffffff)` fallbacks and comment references left untouched.
- **Option B — anchor stragglers**: ~11 literals that duplicated an existing anchor's value (`#000000`, `#0a0a0a`, `#1a1a1a`, `#333333`, `#444444`, `#666666`) swapped to their anchors, eliminating "same color, two forms" drift.
- **Option C — new neutral anchors**: repeated-but-unnamed `#151515` (control hover ×3), `#606060` (input outline ×3), and `#050505` (deep panel) given anchors and aliased.
- **Option D — card-mod de-literalized**: the 5 hard hex literals inside the card-mod blocks (`#333333` scrollbar ×2, `#050505` data-table header, `#ffffff` more-info dialog ×2) now read from the Neutral Ramp via `var(--token-neutral-*, <literal>)`, each keeping its original hex as a fallback. This is the first time a card-mod block references a _theme-defined_ token (previously only native HA tokens), extending the established `token-*`-as-CSS-var pattern.

### Notes

- **Zero visual change intended**: all swaps are value-identical. Guarded by a resolved-value diff (Python anchor resolution) confirming all 307 keys × 11 themes are unchanged except the two card-mod strings. The card-mod `var()` references carry literal fallbacks, so rendering is safe even if a token were ever unset.
- **Deliberately left as literals**: the 9 `var(--primary-color, #aaaaaa)` fallbacks (inert — primary-color is never unset); one-off singletons (`#1e1e1e`, `#2a2a2a`, `#888888`, `#f5f5f5`, `#222222`, badge and graph hues); and `#e0e0e0` on `ha-color-surface-lower-inverted` (not aliased to the `acc_silver` accent — same hex, different semantic role).

### Docs Updated

- **AGENTS.md**: Documented the Section 1c Neutral Ramp (single-source token/anchor dual mechanism) and its rules under Theme File Architecture; noted that `card-mod` referencing theme-defined `--token-neutral-*` tokens (with literal fallback) is now a sanctioned pattern; added a guardrail that the Section 4b accent-emphasis block and Section 13b lock states are intentional opt-ins (not dead code); corrected the stale YAML-standards block (project `.yamllint` disables `document-start` and `line-length`); bumped the file-size note (~540 → ~600 lines).
- **docs/DEVELOPMENT.md**: Corrected §1 YAML standards to match `.validate/.yamllint` (no `---`, no line-length limit); added a "Single-Source Neutral Tokens (Neutral Ramp)" subsection under §4 explaining the anchor-vs-keyed-token distinction, why only keyed tokens reach `card-mod`, and the anchor-resolution diff used to verify zero-drift refactors.
- **README.md**: No content change for the consolidation (internal) or the accent-emphasis opt-in (requires editing the YAML) — neither affects user-facing install/usage docs. Separately fixed a broken anchor link: the "Startup Indicator" heading (line 178) used a VS16 compound emoji (`⏱️` = U+23F1 + U+FE0F), whose invisible variation selector broke the Table/TOC anchor match; swapped to a single-codepoint always-color emoji (`⏳` U+23F3), per the DEVELOPMENT.md §9 / AGENTS.md §9 convention.

## [1.4.0-dev8] - 2026-07-04 - Unreleased

### Summary

- **Optional accent emphasis**: Added a commented-out, opt-in block (new Section 4b) exposing emphasis-text tokens that can route the accent onto titles/headers — extending the theme's "white carries the body, accent pops on icons/controls" philosophy to text hierarchy. Default rendering is unchanged.

### Added

- **Section 4b — Optional Accent Emphasis (opt-in, all commented out)**: Verified-native tokens users can uncomment to accent emphasis text — `ha-heading-card-title-color` (section/heading-card title, default `--primary-text-color`), `ha-heading-card-subtitle-color` (default `--secondary-text-color`), and `ha-card-header-color` (standard card titles, default `#ffffff`). Each documented with its live default and caveats. The heading-card icon was intentionally omitted — it already inherits the accent via `state-icon-color`.

### Changed

- **Card-header accent hook made live**: The Section 20 `card-mod-card` `.card-header` rule changed from a hard `color: #ffffff !important` to `color: var(--ha-card-header-color, #ffffff) !important`, and `paper-card-header-color` now mirrors the same var-with-fallback. White remains the default; this makes the optional `ha-card-header-color` accent token in Section 4b actually take effect (previously the `!important` would have silently overridden it) across both modern and legacy header paths.

### Notes

- **Re-scoped from dev7**: `ha-heading-card-title-color` was initially set aside as a no-op (its default already resolves to `--primary-text-color`). It now lives in the Section 4b opt-in block set to `var(--primary-color)` — as an accent choice rather than a default, which is where it adds value.

## [1.4.0-dev7] - 2026-07-04 - Unreleased

### Summary

- **LCARS Theme**: Reviewed the ha-lcars theme for useful features, and identified four. All keys added to the `&base_logic` anchor, so every accent variant inherits them.

### Added

- **`markdown-code-text-color`** (`var(--primary-text-color)`): Pairs with the existing `markdown-code-background-color`. Without it, inline-code text fell back to a default that risked low contrast on the `#0a0a0a` code fill.
- **`code-editor-background-color`** (`#000000`): CodeMirror surface (YAML/automation/template editors) does not follow card backgrounds natively, leaving a lighter panel on pure black.
- **`disabled-text-color`** (`rgba(155, 155, 155, 0.5)`): Legacy token still driving disabled labels in older component paths that predate `ha-color-on-disabled-normal`. Kept literal to match the existing disabled ink value.
- **Lock state colors** (new Section 13b): `state-lock-locked-color` → `var(--primary-color)`, `state-lock-unlocked-color` / `-locking-color` / `-unlocking-color` / `-open-color` → `var(--secondary-text-color)`, `state-lock-jammed-color` → `#f44336`. HA defaults these to fixed green/red hues that clash with the monochrome accent scheme; mapped to the theme's own active (accent) / inactive (muted grey) / danger (red) pattern.

### Notes

- **Deliberately skipped**: `state-climate-*-color` (HA's heat=orange/cool=blue conventions aid usability); `table-header-background-color` (verified against HA frontend `dev` — not a real variable, HA never reads it, so it cannot replace the existing data-table-header card-mod which also sets the `#050505` shade and border-bottom).

## [1.4.0-dev6] - 2026-07-04 - Unreleased

### Changed

- **Documentation**: Updated the README to align with the ZTE/Huwaei/WiFI Project README files.

## [1.4.0-dev5] - 2026-07-04 - Unreleased

### Bumps

- **Unused Bumps**: These utilities are not used in the VDB Theme but are used by the shared CI Validation
  - **Validate Bump**: Update `ruff` to 0.15.20
  - **Validate Bump**: Bumped `pytest-homeassistant-custom-component` to 0.13.345

## [1.4.0-dev4] - 2026-07-03 - Unreleased

### Bumps

- **Shared .github CI Validation**: Bump .github Shared CI Validation via SHA from v2.0.4 to v2.0.5

## [1.4.0-dev3] - 2026-06-27 - Unreleased

### Summary

- **Screenshots**: First batch of screenshot changes for the README file using the 11 variants and the Theme Test dashboard. A start, needs more work.

### Changed

- **Screenshots**: Changed from one to two theme selection screenshots (so that full selection list could be shown, across the two images). Added the grid of identical entity cards, each with one of the variants applied, sorted in color order. Gives a good sense of the accent colors, but may be basic.

## [1.4.0-dev2] - 2026-06-27 - Unreleased

### Summary

- **All about YAML Lint**: Multiple YAML Lint local validation warns/fails in the ha-dev-pf stub repo highlighted some shortcomings with YAML Lint implementation. Updated to avoid need for "---" at the top of every YAML file, which is a YAML standard, but NOT the HA standard. Also updated to only run on git tracked files (avoids linting devcon files for example).

### Changed

- **YAML Lint**: Added "document-start: disable" to .yamllint rule file, to stop warns/fails for "no --- at document start", which brings it in line with Home Assistant.
- **YAML Files**: Updated YAML files to remove any "---" document starts added.
- **Tasks.json**: Updated tasks.json, via hosts-tooling so that YAML-Lint only runs on git tracked files.
- **Note**: This DOES change the themes/very_dark_black_ha_theme.yaml file, removing the "---" at the start of the file. Non functional, but is a file change.

## [1.4.0-dev1] - 2026-06-26 - Unreleased

### Summary

- **9 → 11 themes**: Added Blue and Emerald as new accent variants. Tweaked Purple → Violet (hex shifted bluer, name changed) and Fuchsia → Pink (hex shifted pinker, name changed). Section B reordered alphabetically. Full hue-spread analysis documented in `docs/color_picks_202606.md`.

### Added

- **Black with Blue**: New Section B theme using the pre-existing `&acc_blue "#2196f3"` anchor (207° hue). The anchor was already defined and used internally for energy dashboard and graph tokens — this change simply exposes it as a selectable theme. Fills the most obvious perceptual gap between Cyan (187°) and Indigo (231°).
- **Black with Emerald**: New Section B theme using new anchor `&acc_emerald "#059669"` (161° hue). Named "Emerald" rather than "Teal" because the hex sits at 161° (cool green-dominant), whereas "Teal" conventionally implies 170–185°. A Teal candidate at `#0d9488` (173°) was rejected for leaving only a 14° gap to Cyan (187°) — too close to justify a separate picker entry. Emerald at 161° gives Green→Emerald = 39°, Emerald→Cyan = 26°, both acceptable.
- **`emerald-color: &acc_emerald "#059669"`**: Named color token in Section 1. Also usable as `var(--emerald-color)` in card-mod user CSS.
- **`violet-color: &acc_violet "#7c3aed"`**: Named color token added to Section 1 with accent anchor. Replaces `acc_purple` as the active accent anchor.
- **RGB primitives**: `token-rgb-violet: "124, 58, 237"`, `token-rgb-pink: "236, 72, 153"`, `token-rgb-emerald: "5, 150, 105"` added to Section 1b. Expose channel values for `rgba()` opacity variants in card-mod CSS, consistent with the existing RGB primitive set.
- **`docs/color_picks_202606.md`**: New reference document. Full hue-spread analysis: starting point (9 themes with hue degrees), all options considered, colors explicitly rejected (Yellow/Amber, Teal at 173°, Maroon, Rose/Crimson) with rationale for each, final 11-theme spread table with gap analysis, and a note on the remaining 12th-slot candidate.

### Changed

- **"Black with Purple" → "Black with Violet"**: Renamed. Hex changed `#9c27b0` (291°) → `#7c3aed` (262°). At 291°, Purple was only 9° from Fuchsia (300°) — near-identical in the picker. Shifting to 262° moves it into true violet/blue-violet territory, increases separation from the new Pink (330°) to 68°, and makes the name accurate to the visible color. `acc_purple` anchor retired; replaced by `acc_violet`.
- **"Black with Fuchsia" → "Black with Pink"**: Renamed. Hex changed `#ff00ff` (300°, pure magenta) → `#ec4899` (330°). After Purple shifted to Violet (262°), the old Fuchsia slot at 300° still read as purple-magenta. Shifting to 330° places it clearly in hot-pink territory and away from Violet (68° gap). `acc_fuchsia` anchor retired; replaced by `acc_pink`. "Pink" is the accurate name for this hex; "Fuchsia" at 330° would be a misnomer.
- **Backward compatibility**: `purple-color: "#9c27b0"` and `fuchsia-color: "#ff00ff"` are retained in Section 1 as bare named color tokens (no anchors). Users referencing `var(--purple-color)` or `var(--fuchsia-color)` in card-mod CSS are unaffected. The old hex values remain available.
- **Energy & graph tokens**: `energy-grid-return-color`, `energy-battery-in-color`, and `graph-color-4` updated from `*acc_purple` → `*acc_violet`. These now render in the Violet hex (`#7c3aed`) in the energy dashboard and multi-series graph palette.
- **Section B ordering**: Reordered to match HA picker alphabetical sort — Blue, Cyan, Emerald, Green, Indigo, Orange, Pink, Red, Silver, Violet. Previously unordered. White (base anchor) remains first in the file as required by YAML anchor-before-alias rules.
- **Theme metadata header**: `Last Updated` bumped to 2026-06-25.
- **Theme Test Dashboard**: Updated ui-theme-test.yaml to display the new and changed themes for testing visibility.

### Docs Updated

- **AGENTS.md**: Accent variant list updated to 11 (Blue, Cyan, Emerald, Green, Indigo, Orange, Pink, Red, Silver, Violet, White); line count estimate updated (~480 → ~540); Section B description updated to enumerate all 11 variants and note Orange's red state overrides; Critical Rule 6 added (`card-mod-theme` must exactly match the HA picker name).
- **README.md**: Features list reordered alphabetically; emoji updated; new entries (Blue 💙, Emerald 💚, Pink 🩷, Violet 🟣) added; Fuchsia/Purple entries removed; "Various sub-themes" updated to "11 sub-themes"; monochrome use-case line extended to mention Violet/Indigo as subtle accent options.
- **`.notes/proj_structure.md`**: Section B table updated — 8 → 11 variants with hex and hue columns; `color_picks_202606.md` added to docs table; version bumped to v1.0.6.

### Design Rationale (See `docs/color_picks_202606.md` for Full Detail)

- **Yellow/Amber rejected**: Yellow is a standard HA semantic icon color (warning/attention states) — an accent theme in that range creates confusion with HA's own state indicators.
- **Teal at 173° rejected**: Only 14° from Cyan (187°) — too close to justify a separate theme. Emerald at 161° fills the same gap with better separation.
- **Maroon rejected**: Contrast ratio ~1.9:1 against black (WCAG AA requires 4.5:1) plus same hue as Red — adds no diversity.
- **Rose/Crimson rejected**: Only ~15° clearance from both Pink and Red — crowds an already-tight zone with a luminance problem.

## [1.3.8] - 2026-06-25 - Release

### Changed

- **Black with White Theme**: A new monochrome theme has been implemented as the base anchor, replacing the previous _Standard_ and _Background Only_ themes.
- **Form field hover state**: Changed Input field hover background from black to dark gray for better visual separation from surrounding surfaces.

## [1.3.8-dev9] - 2026-06-25 - Unreleased

### Summary

- **Base Theme Consolidation & Rename**: Eliminated "Black (Background Only)" as a separate picker entry by merging its surface tokens into the base anchor. Renamed "Black (Standard)" to "Black with White" for clarity and better sort order - its now a theme variant in its own right. Fixed the sparkline graph on "Black with White" which was invisible due to an unset `primary-color` chain. Reviewed HA 2026.7 frontend blog — no token changes, no theme action needed.

### Changed

- **Base theme consolidation**: Merged "Black (Background Only)" (`&black_surfaces`, Section B) into the base anchor (`&base_logic` / "Black with White"). The two-level inheritance chain A→B→C is now a single base anchor + Section B accent variants. All 8 accent themes now use `<<: *base_logic` directly. "Black (Background Only)" is gone from the picker — picker now shows 9 themes (Black with White + 8 accents).
- **"Black (Standard)" renamed to "Black with White"**: More descriptive name — accurately reflects the pure-black-surface / white-text-and-icons character of the no-accent theme. New name sorts after "Black with Silver" in the picker (W > S); previously "Black (Standard)" sorted before all "Black with..." variants due to `(` vs `w` ASCII order.
- **Docs**: Updated AGENTS.md, docs/DEVELOPMENT.md, and .notes/proj_structure.md to reflect the single-base architecture, rename, and new .ha/ directory. proj_structure.md bumped to v1.0.4 → v1.0.5.
- View 4 of `ui-theme-test.yaml` (Compare view) received a `footer:` view-level key during this session — a dev-only dashboard annotation.

### Fixed

- **Sensor card graph invisible on "Black with White"**: Sensor card mini graphs were not rendering on the no-accent theme. Root cause: `accent-color: var(--primary-color)` with no fallback; `--primary-color` is intentionally unset on "Black with White" → `--accent-color` resolved to guaranteed-invalid → the graph component used it for line color → transparent/invisible line. Fixed by adding a grey fallback: `accent-color: "var(--primary-color, #e0e0e0)"`. Accent themes are unaffected (their `primary-color` is set).

### Added

- **HA 2026.7 Reference Doc**: Created `docs/change_ref_ha_v2026_7.md`. The 2026.7 frontend blog covers component size attribute renames (`small`/`medium`/`large` → `xs`/`s`/`m`/`l`/`xl` on `ha-button`, `ha-button-toggle-group`, `ha-slider`) and new infrastructure (virtualized lists, dirty state context). No CSS custom property changes — no theme YAML action required.

## [1.3.8-dev6] - 2026-06-25 - Unreleased

### Summary

- **Better Base Themes & Better Theme Test**: The two base (anchor) themes, have been significantly improved to ensure that if selected, they are fully usable, just minus an accent color. A significant Theme Test dashboard has been created, and is set-up as git tracked.

### Changed

- **Mock Values**: A full suite of dummy / mock sensor entities have been created via the home assistant "packages:" functionality to populate the Theme Test dashboard so that changes to the theme or to Home Assistant can be checked and addressed as needed.
- **Theme Test Dashboard**: A YAML mode theme test dashboard is now in place on the Home Assistant instance in the devcon of the project. This allows for visually checking many card and sensor types and combinations. It also has a compare view where the applied (default) theme can be compared to one of the VDB (Cyan) themes.
- **Docs**: Updated relevant documents AGENTS, DEVELOPMENT, proj_Structure, README to account for the updated functionality.

## [1.3.8-dev3] - 2026-06-25 - Unreleased

### Summary

- **Base Theme Fixes**: Investigated and resolved invisible UI elements (`ha-slider`, `ha-checkbox`, `ha-radio-option`, `ha-progress-bar`) on `Black (Background Only)` and `Black (Standard)`. Root cause: those components chain their active/checked color to `var(--primary-color)`, which is intentionally unset on the base themes. Fixed by adding CSS fallback values in Section A.

### Fixed

- **ha-slider invisible on base themes**: Added `ha-slider-thumb-color` and `ha-slider-indicator-color` to Section A using `var(--primary-color, #aaaaaa)`. The `<ha-slider>` component reads these via CSS inheritance; the fallback activates when `--primary-color` is unset.
- **ha-checkbox checked state invisible on base themes**: Changed `ha-checkbox-checked-background-color` and `ha-checkbox-checked-background-color-hover` from `var(--primary-color)` to `var(--primary-color, #aaaaaa)`.
- **ha-radio-option checked state invisible on base themes**: Same fallback applied to `ha-radio-option-active-color` and `ha-radio-option-checked-background-color`.
- **ha-progress-bar invisible on base themes**: Same fallback applied to `ha-progress-bar-indicator-color` and `ha-progress-bar-indicator-background`.

### Added

- **control-switch-on-color** added to Section A (`var(--primary-color, #aaaaaa)`). This is the actual token `<ha-control-switch>` binds its active color to. Currently has no effect because the component redeclares it via a `:host` CSS rule (overriding inheritance), but is kept for potential future component changes.

### Investigation Notes

Full investigation documented in `.notes/issues/base_theme_issues/`. The original symptom (switch ON and slider invisible) was initially investigated against HA 2026.5b0 (beta), which produced misleading results. Re-investigation on HA 2026.6.4 (release) produced definitive findings. The key discovery: `ha-switch-checked-*` and `paper-slider-*` tokens, added to the theme in 1.3.4, are not consumed by the actual components in HA 2026.6.4. Those tokens are retained for backward compatibility (as with all prev version tokens, they fail silently).

## [1.3.8-dev2] - 2026-06-25 - Unreleased

### Summary

- **Theme Test Dashboard**: Created a Theme Test dashboard in the devcontainer to have the various theme elements present in one place for testing purposes

### Added

- **"ui-theme-test.yaml**: Added file /.devcontainer/.devconfig/ui-theme-test.yaml as the Theme Test dashboard.
- **Dummy Sensors**: Added a large number of dummy sensors based on the setup used by the **Graphite** theme

## [1.3.8-dev1] - 2026-06-25 - Unreleased

### Summary

- **Code Review**: Several code review driven changes. See /code_review/code_review_20260624.md

### Changed

- **Form Backgrounds**: Changed form (text-field) hoover [ ha-color-form-background-hover ] to very dark grey and form disabled to a different very dark grey. Subtle but helpful.
- **Section Numbers**: Previous re-orgs and updates of the theme file structure meant that the sections numbers were out of order. Re-numbers, sections 1 to 19 now.
- **Comments**: Added several comments to confirm some decisions to that they would not be flagged again. Also ensured all comments are under 80 chars

## [1.3.7] - 2026-06-24 - Release

### Summary

- The theme is now officially on HACS! No custom repository adding required.
- Made changes based on WCAG AA minimum contrast ratio checks and themes best practice.

### Added

- **Tooltips**: Added ha-tooltip-background-color and ha-tooltip-text-color overrides to resolve the dark-mode issue where tooltips could render with white text on a white background. This is inspired by the **Graphite** theme
- **Danger/Warning Tag Fills**: Added translucent background fills (rgba) and vivid foreground text for resting, hover, and active states of danger and warning tags, resolving illegible low-contrast element rendering on black backgrounds.

### Changed

- **Label Badges**: Darkened standard badge background colors (label-badge-red, label-badge-green, label-badge-blue, label-badge-yellow, label-badge-grey) to meet WCAG AA accessibility requirements and ensure high contrast against white text overlays.
- **Documentation**: Updated README file based on release of theme on HACS. HACS install instructions updated to remove requirement to add as custom repository. Also update HACS badges in README header.

## [1.3.7-dev10] - 2026-06-24 - Unreleased

### Fixed

- **Danger / Warning**: Fixed ha-color-on-danger-normal and ha-color-on-warning-normal so that they display an alert (Red) color, same as HA default, not the text default (white)

## [1.3.7-dev9] - 2026-06-24 - Unreleased

### Summary

- Added RGB tokens to enable rgba() opacity variants in the theme without duplicating the numbers

### Changed

- **RGB Primitive Tokens**: Added a set of raw RGB tuple tokens for Danger/Warning Fill Indirection (`token-rgb-red`, `token-rgb-orange`, `token-rgb-green`, etc.) alongside the existing hex color anchors in Section A. These expose each accent color's channel values as a standalone CSS custom property, enabling `rgba()` opacity variants anywhere in the theme without duplicating the numbers. Applied immediately to the danger and warning fill tokens, which previously hardcoded the RGB values at each opacity step. Further color changes now requires editing the hex anchor and its RGB primitive once; all opacity variants follow without further edits. This is inspired by the **Graphite** theme

## [1.3.7-dev8] - 2026-06-24 - Unreleased

### Summary

- Made changes based on WCAG AA minimum contrast ratio checks and themes best practice.

### Added

- Tooltips: Added ha-tooltip-background-color and ha-tooltip-text-color overrides to resolve the dark-mode issue where tooltips rendered with white text on a white background.
- Danger/Warning Tag Fills: Added soft translucent background fills (rgba) and vivid foreground text for resting, hover, and active states of danger and warning tags, resolving illegible low-contrast element rendering on black backgrounds.

### Changed

- Label Badges: Darkened standard badge background colors (label-badge-red, label-badge-green, label-badge-blue, label-badge-yellow, label-badge-grey) to meet WCAG AA accessibility requirements and ensure high contrast against white text overlays.

## [1.3.7-dev7] - 2026-06-24 - Unreleased

### Changed

- **CI Validation Bump**: Shared CI validation bumped from v2.0.3 to v2.0.4. v2.0.4 added internal self-validation, and so does not affect theme CI Validation, bumped to keep up-to-date only.
- **Bump**: Bumped Ruff from 0.15.16 to 0.15.17 (Note used for theme , part of overall CI Validation)
- **gitignore**: Updated .gitignore file (scratch folder)

## [1.3.7-dev6] - 2026-06-20 - Unreleased

### Changed

- **Documentation**: Updated README file based on release of theme on HACS. HACS install instructions updated to remove need to install custom repository. Also update HACS badges in README header.

## [1.3.7-dev4] - 2026-06-18 - Unreleased

### Summary

- **CI Validation Overhaul**: Major overhaul of the local (tasks.json) and online (github.com CI) Validation system

### Changed

- **dev-workbench**: Moved CI Validation and Sync to dev-workbench system, with major restructure of files and folders.
- **CI Local Tasks**: Reordered local tasks.json, added color for pass/fail.
- **CI Validation Bump**: Shared CI validation bumped to v2.0.3. No user changes in this release, background/infrastructure only.
- **CodeQL**: CodeQL shared config and local caller modified to detail permissions to that Zizmor will pass
- **CodeQL**: Added a shared CodeQL validation config to the shared validation repo, pulled into each project, incl this one.
- **Link Check**: Updated markdown-link-check to ignore .notes/ and .shared/ links in projects as these are excluded.

## [1.3.6] - 2026-06-15

### Summary

- **CI Validation Only**: Changes to the CI Validation set-up require a release to test properly, but there are no user changes in this release, background/infrastructure only.

## [1.3.6-dev5] - 2026-06-15 - Unreleased

### Changed

- **CI Validation Sync**: Moved to a shared CI validation, similar to the integration/python projects.
- **Local Validation Sync**: Moved to a shared tasks,json for local validation and fixes, now shared and in sync with the integration/python projects.
- **CI — Permissions**: Removed job-level `permissions` block from `test_val` in the shared `validate-specific.yaml`. Permissions now flow through from the calling stub, fixing a GitHub Actions parse-time rejection caused by the theme stub's `contents: read` grant being exceeded.
- **CI — Secrets**: Removed `secrets: inherit` from the theme stub. The theme passes no secrets to the shared workflow — `GIST_SECRET` is integration-only and optional.
- **Dev — Shared tasks.json**: Theme project now uses the shared `tasks.json` (synced from monorepo). All Python-specific tasks (`Ruff`, `Mypy`, `Pytest`, `Pre-commit`) skip automatically via `project.category = theme` in `.vscode/settings.json`. Active validation tasks: YAML lint, JSON verify, HACS manifest, HA Check Config, markdown link check, markdown lint, codespell, Zizmor, Prettier.
- **Dev — `pyproject.toml`**: Added root `pyproject.toml` with `[tool.codespell]` section (synced from `pyproject_theme.toml`). Enables codespell auto-discovery for both local tasks and CI — aligns with the integration project pattern.
- **Dev — `.vscode/settings.json`**: Created with `project.category: theme` and `project.componentName: ""` to support shared task guards and VS Code variable resolution.

### Added

-- **pyproject.toml**: Local validation sync (see above) means that the project (which is not a python project) has a pyproject.toml file. This is to allow the codespell config to be the same across all in sync projects.

## [1.3.6-dev4] - 2026-06-15 - Unreleased

### Changed

- **Validation Config**: Changed from .prettierrc.js to .prettierrc.json to allow GitHub.com CodeQL to run without errors
- **.gitignore**: Multiple updates to .gitignore

### Added

- **AGENTS.md**: Added AGENTS.md to repo root

## [1.3.6-dev3] - 2026-06-11 - Unreleased

### Changed

- **Validation Sync**: Moved to a better system and process to keep validation (lint/format/test) tools in sync, across PlayFaster projects and between the projects and what Home Assistant uses.
  - .validate/version_matrix.json added as the definitive source of tool version use.
  - Several Env: entries added to .vscode/tasks.json for tool sync and checking.
  - .validate/requirements_test.txt pulled as generic, with all tools pinned to versions, and requirements_custom.txt used to add project specific items.
  - As part of the sync, docker-compose.yml and devcontainer.json are now generic, with a .env file holding project specific info and a docker-compose.override.yml holding additional, project specific steps.
  - HA Manifest and HACS schema files updated.
- **Validation Config**: Changed from .prettierrc.js to .prettierrc.json to allow GitHub.com CodeQL to run without errors
- **.gitignore**: Multiple updates to .gitignore

### Added

- **Dependabot**: Added Dependabot to the github.com CI. Is used for other PlayFaster projects but had not been in place for Very Dark Black Theme before.
- **AGENTS.md**: Added AGENTS.md to repo root

## [1.3.5] - 2026-06-05

### Added

- **HA 2026.6 Web Awesome Radio Tokens**: Added CSS styling support for `ha-radio-group` and `ha-radio-option`, the Web Awesome radio button components introduced in HA 2026.6. Tokens cover active color, unchecked/checked states, borders, and hover — styled consistently with the existing `ha-switch` and `ha-checkbox` token patterns.

### Changed

- **README**: Added Table of Contents; expanded Use Cases with new **Startup Indicator** (set a distinct accent at boot, auto-restore after 2 minutes) and **Visual Alert Highlight** (trigger Red on an alert condition, restore on clear) scenarios, each with a ready-to-use YAML automation example; promoted per-view and per-section theming from a tip callout to a dedicated subsection with scope-level descriptions; improved FAQ with grouped, emoji-labelled headings.

## [1.3.5-dev4] - 2026-06-05 - Unreleased

### Changed

- **README — Use Cases**: Expanded "Color-coded views" bullet to explicitly cover both views (full screen) and sections (partial screen), with a link to the new Apply subsection. Added two new use cases: **Startup Indicator** (set Orange at boot, auto-restore after 2 minutes) and **Visual Alert Highlight** (trigger Red on an alert condition, restore on clear).
- **README — Apply Theme**: Promoted the per-view/section theming TIP callout to a dedicated `#### Apply to Individual Views or Sections` subsection, introducing the three scope levels (System / View / Section) with plain-English descriptions before the step-by-step instructions.
- **README — Automate Theme Changes**: Added three structured sub-sections with emojis (`⚙️ Setup Requirements`, `🟠 Set Theme at Startup`, `🟠 Startup Indicator with Delayed Restore`, `🚨 Visual Alert Theme`), each with a concrete YAML example.
- **README — Structure & Navigation**: Added `## 📋 Table of Contents`; changed Requirements & Compatibility emoji from 📋 to ⚙️; moved `## 🗑️ Removal` to after Known Limitations (aligned with ZTE project README structure).
- **README — FAQ**: Grouped five FAQ items under two emoji sub-headings (`### 🔧 Installation & Setup`, `### 🎨 Display & Styling`); added per-item emoji headings (⚠️ 🖼️ 🔍 🖱️ 🔄).
- **README — Contributors**: Added 🙏 prefix to contributor acknowledgement lines.

## [1.3.5-dev3] - 2026-06-05 - Unreleased

### Added

- **HA 2026.6 Web Awesome Radio Tokens**: Added `ha-radio-option-active-color`, `ha-radio-option-border-color`, `ha-radio-option-border-color-hover`, `ha-radio-option-border-width`, `ha-radio-option-background-color`, `ha-radio-option-background-color-hover`, `ha-radio-option-checked-background-color`, and `ha-radio-option-checked-icon-color` to Section A (`base_logic`). Styled consistently with the existing `ha-checkbox-*` pattern (matching border colors, hover fills, and checked accent). Covers the new Web Awesome `ha-radio-group` / `ha-radio-option` component that replaces `ha-radio` in HA 2026.6. Sizing tokens (`ha-radio-option-height`, `toggle-size`, `checked-icon-scale`, `control-margin`, required-marker tokens) are intentionally omitted — the theme does not override equivalent checkbox sizing.
- **Reference Doc**: Created `docs/change_ref_ha_v2026_6.md` documenting HA 2026.6 frontend changes: radio component migration, omitted sizing tokens, layout-width token renames (`ha-sidebar-width`, `ha-top-app-bar-width` — no action needed for this theme), removed/migrated components, and backward compatibility rationale.

## [1.3.5-dev2] - 2026-06-04 - Unreleased

### Changed

- **DevCon**: Aligned the Devcontainer environment with other projects.

## [1.3.5-dev1] - 2026-05-24 - Unreleased

### Changed

- **README**: Added `## 💡 Use Cases` section with 5 practical scenarios (OLED displays, monochrome setup, color-coded views, automated switching, custom card pairing); expanded FAQ & Troubleshooting from 2 to 5 entries — added "Theme does not appear in picker", "card-mod CSS features not working", and "Specific elements un-styled after HA update"; expanded Under the Hood section description to summarize the dev reference contents.
- **CI Validation** (`.github/workflows/validate.yaml`): Added `concurrency` block to cancel in-progress duplicate runs; added `permissions: contents: read` at workflow level; added `persist-credentials: false` to all checkout steps; pinned all action refs from floating tags to full SHA hashes; added Codespell job (Job 4); added Zizmor workflow security audit job (Job 5, `continue-on-error: true`); added Prettier Format Check step to `lint_val` job.
- **Local Validation** (`.vscode/tasks.json`): Removed inapplicable `HA: Verify Manifest` task (theme has no `manifest.json`); added `Zizmor: GitHub Actions Audit` and `Zizmor: Fix (Safe Auto-Fix)` tasks; updated `Validate All` sequence to include Zizmor and remove the manifest task. **DevCon**: Updates to the DevCon setup, to standardize with other projects, esp. on mapping shared folders.

## [1.3.4] - 2026-05-20

### Added

- **HA 2026.5 New Elements**: Added support for the new HA 2026.5 elements documented in this [blog post](https://developers.home-assistant.io/blog/2026/05/04/frontend-component-updates-2026.5). This includes:
  - **New Web Awesome Tokens**: Added CSS styling variables for Web Awesome `ha-switch` (unchecked/checked states, borders, hover, and sizing overrides from PR #51984), `ha-checkbox`, and custom `ha-progress-bar`.
  - **Global Shadow & Surface Styling**: Added shadow tokens (`ha-box-shadow-s`, `ha-box-shadow-m`, `ha-box-shadow-l`) set to `"none"`, and new elevated surface variables (`ha-color-surface-default`, etc.) for tooltips and adaptive popovers.

### Changed

- **Documentation**: Updated the README file with additional details including on applying themes to dashboard views and sections, as well as at the system level.

## [1.3.4-dev3] - 2026-05-20 - Unreleased

### Added

- **HA 2026.5 Web Awesome Tokens**: Added CSS styling variables for Web Awesome `ha-switch` (unchecked/checked states, borders, hover, and sizing overrides from PR #51984), `ha-checkbox`, and custom `ha-progress-bar`.
- **Global Shadow & Surface Styling**: Added shadow tokens (`ha-box-shadow-s`, `ha-box-shadow-m`, `ha-box-shadow-l`) set to `"none"`, and new elevated surface variables (`ha-color-surface-default`, etc.) for tooltips and adaptive popovers.
- **Discovered Mappings & Compatibility**: Integrated new inputs and outlined border tokens, custom badge overrides, table rows, and legacy paper sliders/toggles to maintain full styling support for custom dashboard cards.
- **Reference Docs**: Created `docs/change_ref_ha_v2026_5.md` documenting HA 2026.5 frontend theme element updates.
- **Documentation**: Updated the README file with additional details including on applying themes to dashboard views and sections, as well as at the system level. Added additional screenshots.

## [1.3.4-dev2] - 2026-05-08 - Unreleased

### Changed

- **DevCon Improvements**: Changes to the devcontainer for better symm-linked folder mapping and additional checks (prettier) in tasks.json.

## [1.3.3] - 2026-05-02

### Added

- **Element Expansion**: Added a number of new elements to improve visibility and increase native element support for HA 2026.4 and beyond:
  - **M3 & WA Tokens**: Added Material 3 and Web Awesome semantic tokens.
  - **Dynamic Color Scales**: Implemented HSL-based scales.
  - **Energy Dashboard**: High-contrast mappings for Energy dashboard elements.
  - **Graph Palette**: Graph color palette for consistency across multi-entity charts.
  - **Log & History**: Logbook and History table headers with specific backgrounds and improved row hover states.
  - **Named Colors**: Standard HA named color mappings (`red-color`, `blue-color`, etc.) for improved compatibility with third-party cards.
  - **Custom Card Compatibility**: Expanded CSS exclusions to include Mushroom (Title/Chips), Bubble Card, Conditional cards, Custom Button cards, and native Heading/Glance cards.

### Changed

- **Readme**: Clarified card-mod is recommended but not required. Added compatibility milestone breakdown (2022.11 / 2025.1+ / 2026.4+).

### Fixed

- **Brightened Secondary Text**: Secondary text raised to meet contrast guidelines on pure black backgrounds.

## [1.3.3-dev13] - 2026-05-01

### Changed

- **`Black (Base)` renamed to `Black (Background Only)`**: The previous name implied it was a foundational/developer theme without making clear what selecting it would look like. The new name explicitly communicates that only the background color is themed black — all surface/form tokens are absent, so HA's defaults show through. Not a full Very Dark Black experience.

### Removed

- **`Black More Contrast`**: Removed. Developed as a testbed for signal-clarity improvements (accent-color field borders, elevated input fills). Those improvements were evaluated, revised, and the final signal tokens (`#606060` field outlines, `0.12` ripple, `rgba(255,255,255,0.1)` selection highlight, `#000000` input fills) were applied to all standard themes via `black_surfaces`. The testbed no longer serves a purpose.

- **`Black More More`**: Removed. After applying the Path A signal tokens to `black_surfaces`, `Black More More` became an exact duplicate of `Black with Cyan` — identical rendered output, different structural path. No reason to retain it.

---

## [1.3.3-dev12] - 2026-05-01

### Added

- **New Theme: `Black More More`** (Cyan, Option C). Keeps the very dark black dashboard surface. Adds three targeted contrast improvements for interactive elements only:
  - **C1 — Elevated portal surfaces**: Dialogs, dropdown panels, and menus render at `#111111` (vs pure black). `mdc-theme-surface`, `ha-dialog-surface-background`, `paper-dialog-background-color`, and `wa-color-surface-raised` all set to `#111111`. This makes "things that float above the dashboard" visually distinct from the base layer.
  - **C2 — Elevated input fills**: `wa-text-field-fill-background-color` and `wa-select-fill-background-color` set to `#111111`. The field area you type into is subtly lighter than the surrounding surface.
  - **C3 — Accent borders at rest**: All form outlines, field borders, and the dropdown icon use `var(--primary-color)` at rest (not just on hover/focus). Signals "this is interactive" without any background change.
  - All other surface tokens (card background, card border, divider, scrim, ripple) match the standard themes exactly.

### Changed

- **`Black More Contrast` redesigned** (Indigo, Options B + D). Previously had elevated dialog surfaces, stronger borders, stronger dividers, and increased ripple opacity. All of those overrides are removed. The theme now differs from the standard only in:
  - **D — Accent borders at rest**: `mdc-text-field-outline-color`, `mdc-select-outline-color`, `ha-color-form-outline`, `input-dropdown-icon-color` all set to `var(--primary-color)`. Fields are framed in Indigo at rest.
  - **B — Elevated input fills**: `wa-text-field-fill-background-color` and `wa-select-fill-background-color` set to `#111111`.
  - Dialog surfaces, card borders, dividers, scrim, and ripple all revert to the same values as `Black (Standard)`.

- **`card-mod-card` CSS — `background-color` now theme-driven**: Changed two hard-coded `#000000` occurrences in `ha-card` and `.card-header` rules to `var(--ha-card-background, #000000)`. Fallback preserves existing behavior for all standard themes. Required so that any future theme can set its own card surface via the token.

- **`ha-card-background` / `card-background-color` moved to Section B** (`&black_surfaces`): Previously in `base_logic` (Section A). Moved because card background is a surface decision. Themes using `<<: *base_logic` directly (`Black More Contrast`, `Black More More`) must define these tokens explicitly — both do so at `*base_black` (`#000000`).

### Design rationale

Core ethos: pure black everywhere. The contrast themes exist to prevent confusion, not to add grey. Signal improvements target specific failure modes:

- **"Where is the input field?"** — field outline lifted from `#444444` (marginal) to either `#606060` (Path A, neutral) or `var(--primary-color)` (Path B, accent)
- **"Is my cursor on something?"** — ripple from `0.08` to `0.12`
- **"What's selected in this list?"** — selected container from `#333333` (~invisible on black) to `rgba(255,255,255,0.1)`

`Black More Contrast` uses accent color as the signal (colored borders = interactive). `Black More More` uses neutral grey visibility (everything stays non-chromatic, just more visible).

### Notes

- `wa-text-field-fill-background-color` and `wa-select-fill-background-color` are WA tokens — take effect on HA 2026.4+. On older versions silently ignored.
- `mdc-theme-surface` controls both dialog surfaces AND dropdown panel backgrounds in `Black More More`. Single token elevates both portal types.

---

## [1.3.3-dev11] - 2026-05-01

### Changed

- **Utility Theme Rename**: `Black Base (Shared Logic)` renamed to `Black (Base)`; `Black Base (Standard Surfaces)` renamed to `Black (Standard)`. Both names are shorter, clearer in the HA theme picker, and no longer expose internal YAML terminology to end users. YAML anchors (`&base_logic`, `&black_surfaces`) and all alias references are unchanged.

- **Utility Theme Defaults**: Added `primary-color: *acc_cyan` and `state-active-color: var(--primary-color)` to both `Black (Base)` and `Black (Standard)`. Previously neither defined a primary color, so selecting either from the picker would fall back to HA's default primary (typically blue). Both themes now render correctly as cyan variants if selected. Since all inheriting color variants explicitly define their own `primary-color`, the merge key semantics mean this default is safely overridden by each variant with no behavioral change to existing themes.

- **`card-mod-theme` Names Corrected**: All 9 `card-mod-theme` string values renamed to exactly match their corresponding HA theme names. Previously inconsistent (notably `"Black Main"` for the Cyan theme). Correct matching is required for card-mod's internal theme profile tracking.
  - `"Black Main"` → `"Black with Cyan"`
  - `"Black Green"` → `"Black with Green"`
  - `"Black Red"` → `"Black with Red"`
  - `"Black Fuchsia"` → `"Black with Fuchsia"`
  - `"Black Purple"` → `"Black with Purple"`
  - `"Black Indigo"` → `"Black with Indigo"`
  - `"Black Silver"` → `"Black with Silver"`
  - `"Black Orange"` → `"Black with Orange"`
  - `"Black Contrast"` → `"Black More Contrast"`

- **Primary Color Scale Corrected**: `ha-color-primary-50` was a duplicate of `ha-color-primary-40` (both `var(--primary-color)`). Corrected to `hsl(from var(--primary-color) h s calc(l * 1.15))`. This fix cascaded: `-60` through `-95` were all offset by one step and were corrected simultaneously. Full primary scale multipliers now match the neutral scale and the Graphite reference theme exactly:

  | Step | Multiplier  |
  | ---- | ----------- |
  | -40  | 1.0× (base) |
  | -50  | 1.15×       |
  | -60  | 1.30×       |
  | -70  | 1.45×       |
  | -80  | 1.60×       |
  | -90  | 1.75×       |
  | -95  | 1.90×       |

- **`card-mod-more-info` — Brittle Selector Removed**: The `ha-card-picker` selector (`ha-card-picker $ ha-sub-page ha-icon-button-prev-next + h1 + div`) was removed. This selector used adjacent-sibling combinators (`+`) to target an anonymous div three shadow DOM levels deep — any HA DOM restructuring breaks it silently. Investigation confirmed it was not present in either reference theme (Frosted Glass, Graphite), which rely on native tokens (`mdc-theme-surface`, `ha-dialog-surface-background`) for card picker backgrounds. Tested: card picker background remains black after removal. A dated comment was added with the removal rationale and a less-brittle replacement selector (`ha-card-picker $ ha-sub-page { background-color: #000000; }`) for restoration if a regression appears in a future HA version.

- **`card-mod-more-info` — Intentional Override Documented**: The `ha-more-info-dialog` selectors retained as confirmed necessary. Added comment documenting: (a) the intentional `#ffffff` override vs global native token `mdc-theme-on-surface: #e1e1e1`, (b) that this is a pure-black-specific fix not present in reference themes, and (c) that it is a candidate for removal if native token coverage improves in future HA versions.

- **README Compatibility Section**: Added version milestone breakdown below the compatibility table documenting that the theme is usable from HA 2022.11 onwards with progressive feature improvement at 2025.1+ and full HSL color scale support at 2026.4+.

- **README Features List**: Updated utility theme entry from `Black Base (Shared Config)` (which also mismatched the actual YAML name `Black Base (Shared Logic)`) to correctly list both `Black (Base)` and `Black (Standard)` with a note that both appear in the picker and default to cyan.

- **`docs/DEVELOPMENT.md`**: Updated the "Every Key is a Theme" note to use the new utility theme names and to explicitly state that no mechanism exists to hide themes from the picker — the pragmatic solution is correct naming and a default primary color.

### Notes

- Code review notes for this session: `.notes/code_review/code_review_20260501.md`
- Project structure documented for future sessions: `.notes/proj_structure.md`

## [1.3.3-dev9] - 2026-05-01

### Added

- **More Contrast Entry**: Introduced "Black More Contrast" (Indigo), a dedicated high-visibility theme that maintains a pure black background while significantly enhancing UI boundaries and interaction states.
  - **Surface Elevation**: Implemented charcoal surfaces (`#1c1c1c`) for dialogs, menus, and dropdowns to provide better physical separation from the dashboard background.
  - **Accent Framing**: Form outlines and selector borders are now framed with the primary accent color for instant field identification.
  - **Structural Separators**: Increased divider and card border visibility to `0.2+` opacity.
  - **Interactive Feedback**: Enhanced visibility for sliders, toggle bars, and hover "glow" intensities.
  - **Depth & Focus**: Refined dialog scrim opacity and menu selection backgrounds for a more tactile, three-dimensional feel.
- **Element Expansion**: Added a number of new elements to improve visibility and contrast as well as increase native element support for HA 2026.4 and beyond:
  - **M3 & WA Tokens**: Added Material 3 and Web Awesome semantic tokens.
  - **Dynamic Color Scales**: Implemented HSL-based scales.
  - **Energy Dashboard**: High-contrast mappings for Energy dashboard elements.
  - **Graph Palette**: Graph color palette for consistency across multi-entity charts.
  - **Log & History**: Logbook and History table headers - specific backgrounds, improved row hover states.
  - **Named Colors**: Standard HA named color mappings (`red-color`, `blue-color`, etc.) for improved compatibility with third-party cards.
  - **Visibility & Contrast**: Brightened secondary text; improved radius and inset shadows on input fields; font smoothing for legibility on black backgrounds.
  - **Custom Card Compatibility**: Expanded global CSS exclusions to include Mushroom (Title/Chips), Bubble Card, Conditional cards, Custom Button cards, and native Heading/Glance cards.
- **IN DETAIL**:
  - **HA 2026.4 Support**: More comprehensive support for HA 2026.4+, includes Charts, Energy Dashboard, Color Scales, and Web Awesome elements.
  - **HA 2026.4 Semantic Coverage**: Full support for Web Awesome (WA) semantic tokens, restoring dropdown backgrounds and hover states.
  - **Dynamic Color Scales**: Implemented HSL-based scales (`ha-color-primary-05` to `95` and `ha-color-neutral-05` to `95`) for both primary and neutral tones.
  - **Energy Dashboard Support**: Added explicit high-contrast mappings for all Energy dashboard elements (Solar, Grid, Battery, etc.).
  - **Graph Palette**: Implemented a 10-series graph color palette for consistent data visualization across multi-entity charts.
  - **Named Colors**: Added standard HA named color mappings (`red-color`, `blue-color`, etc.) for improved compatibility with third-party cards.
  - **UI Depth & Polish**: Introduced granular radius scale (8px, 12px, 16px) and subtle inset shadows for all input fields.
  - **Enhanced Typography**: Implemented anti-aliased font smoothing and refined font weights for actions to improve legibility on black backgrounds.
  - **Improved Contrast**: Brightened secondary text to `#a8a8a8` to ensure WCAG AA compliance on pure black backgrounds.
  - **Custom Card Compatibility**: Expanded global CSS exclusions to include Mushroom (Title/Chips), Bubble Card, Conditional cards, Custom Button cards, and native Heading/Glance cards.
  - **Professional Data Tables**: Refined Logbook and History table headers with specific backgrounds and improved row hover states.
  - **Immersive Dialogs**: Increased dialog scrim opacity to 0.9 and removed dialog shadows for a cleaner, focused aesthetic.
  - **M3 & WA Tokens**: Added comprehensive coverage for Material 3 (`md-sys-color-*`) and Web Awesome semantic form tokens.
  - **Metadata**: Added theme metadata header for better project identification and support tracking.

### Fixed

- **Validate Badge**: Validate badge in Readme was pointing to a run, not latest. Now fixed.
- **YAML Anchor Duplication**: Resolved issue with duplicate YAML anchors that prevented theme reloading.
- **Duplicate YAML Keys**: Resolved "state-active-color" duplicate key warning by moving definitions from base config to individual variants.
- **YAML Execution Order**: Reordered color anchors to the top of the file to resolve fatal "undefined alias" errors.
- **File Integrity**: Cleaned up stray characters at end of theme file.

### Changed

- **Theme Architecture Refactor**: Centralized over 15 repetitive property mappings into the `Black Base (Shared Config)` using `var(--primary-color)` inheritance, significantly reducing code duplication and improving maintainability.
- **Infrastructure**: Updated the validation checks and added Codespell.
- **Infrastructure**: Improved the DevContainer setup process.
- **Readme**: Updated readme file.
  - Clarify that card-mod is recommended but not absolutely required.
  - Moved features first, requirements second.
  - Expanded install via HACS instructions including repo link.
  - Heading badges - added HACS Custom and License badges.
  - Standardized heading icons.
  - Included License info.

## [1.3.2] - 2026-04-03

### Fixed

- **Grey Drop-down Placeholder**: Fixed an issue where some element changes introduced in HA 2026.4.x caused drop-down placeholders to be grey.

### Added

- **Badges**: Added badges to README.

### Changed

- **Validation**: Additional GitHub and Local validation steps.
- **Formatting**: Additional local formatting checks.

## [1.3.1] - 2026-04-01

### Added

- **More Colors**: Added Purple, Indigo, and Silver (monochrome) variants.
- **Black Base**: Added a "Black Base (Shared Config)" utility theme for consistent inheritance.
- **Light Fallback**: Added explicit light mode block to ensure the UI stays dark on systems set to light mode.
- **Modern Tokens**: Added compatibility for `--ha-` and `--sl-` (Shoelace) variables used in Home Assistant 2025+.
- **Validation**: Implemented local infrastructure for YAML linting and JSON schema validation.

### Changed

- **Documentation**: Updated README with theme automation examples and detailed compatibility requirements.
- **Screenshots**: Added screenshots to README.

### Fixed

- **Ghost Themes**: Resolved issue where internal helper blocks appeared in the theme selection list.
- **UI Visibility**: Fixed "white-on-white" text issues in dropdown menus and selection lists.

### Removed

- **"with Test" Option**: Removed the "Black with Orange plus Test" variant to simplify the theme list.

## [1.2.2] - 2026-03-30

### Changed

- **GitHub**: Initial release to GitHub repository.

## [1.2.1] - 2026-01-16

### Added

- **TEST Visibility**: Added option for TEST text near top left, for identifying a test or backup system.

## [1.1.1] - 2025-12-04

### Added

- **Multi-Theme**: Added additional highlight color options to existing cyan - green, red, fuchsia, orange.

### Fixed

- **Invisible Menu Fix**: Fixed some of the black-on-black invisible menus.

## [1.0.1] - 2025-11-18

### Added

- **Initial Release**: Very dark black with cyan text and accents.

---

### Format

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
