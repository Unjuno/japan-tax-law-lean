# Normative units — 単独ラベル片（72,069 units, PROVED_SCOPE）

These 2,185 distinct fragments have 原文 consisting only of a label, so the
decomposer recorded them as UNRESOLVED with `unhandled_conditions = [fragment]`.
The decomposer was right: no self-contained norm can be extracted. This module
adds only an **ordinal / structural** proof, so all these units correctly derive
`PROVED_SCOPE`, never `FULLY_VERIFIED`.

| family | units | structure |
|---|---|---|
| digit | 46,220 | 全角/半角数字ラベル → 十進 Nat (arbitrary length, leading zeros) |
| kana | 11,927 | イロハ順のかな項目ラベル → 序数 |
| heading | 11,597 | （施行期日） etc. — structural section declaration |
| paren_digit | 2,325 | （１）..（９９） → 十進 Nat |

| id | content |
|---|---|
| H | A bare label establishes an ordinal position or a structural heading; its substantive normative content is absent from the fragment. |
| T | `lake build JapanTaxLaw.BareLabelFragmentsTests`; `python scripts/ci/source_audit_labels.py` |
| D | Per-variant kernel checks (2,185 variants) of digit parsing, Iroha ordinals, parenthesized digits and heading declaration; spec agreement by `decide`; all 72,069 originals verbatim (4/4 checks). |
| C | Competing readings rejected: treating an ordinal label or a parenthesized heading as carrying substantive tax effect; mis-ordering Iroha labels. |
| U | The provisions that carry these labels, their substantive conditions/effects and all cross-references NOT MODELLED. Human legal review pending. Status remains `PROVED_SCOPE`. |
