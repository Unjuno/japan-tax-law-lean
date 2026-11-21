# Normative units — 法令構造マーカー（10,817 units, PROVED_SCOPE）

These 10,817 fragments have 原文 consisting only of a structural marker, so the
decomposer recorded them as UNRESOLVED with `unhandled_conditions = [fragment]`.
As with `docs/UNIT_BARE_LABELS.md`, only an **ordinal / structural** proof is
added; the unhandled condition is retained and all units derive `PROVED_SCOPE`,
never `FULLY_VERIFIED`.

| family | units | structure |
|---|---|---|
| structural_marker | 6,137 | 略, 削除, 算式, 算式の符号, 公布の日, ヽ, 次に掲げる規定/書類/事項, その他参考となるべき事項, 第一項 — declaration record |
| latin_label | 2,768 | 全角 Ａ..Ｚ → ordinal 1..26 (spec table lookup, per-variant kernel checks) |
| era_year | 1,564 | 令元/令１..令９ → Reiwa year 1..9 (per-variant kernel checks) |
| enforcement_clause | 348 | 政令/省令/法律は公布の日から施行する (or 翌日) → offset 0/1 |

| id | content |
|---|---|
| H | A structural marker records an ordinal, a year, a declaration or an enforcement offset; its substantive normative content is absent from the fragment. |
| T | `lake build JapanTaxLaw.LegalStructuralMarkersTests`; `python scripts/ci/source_audit_markers.py` |
| D | Kernel checks of all 26 Latin and 7 Reiwa variants against an independent table-based spec, plus marker declaration and enforcement-offset proofs; all 10,817 originals verbatim (4/4 checks). |
| C | Competing readings rejected: treating a marker or enforcement-offset record as carrying substantive tax effect, or mis-ordering Latin/Reiwa ordinals. |
| U | The provisions carrying these markers, their substantive conditions/effects and cross-references NOT MODELLED. Human legal review pending. Status remains `PROVED_SCOPE`. |
