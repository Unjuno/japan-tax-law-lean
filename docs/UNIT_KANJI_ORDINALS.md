# Normative units — 漢数字の号番号・委任見出し・とする（45,621 units）

45,621 dependency-ready units in three §3 STRUCTURE families:

| family | count | variants | structure |
|---|---|---|---|
| kanji_numeral | 44,822 | 76 | bare kanji ordinal item label (一 … 六十九) → ordinal Nat |
| delegation_heading | 765 | 1 | （政令への委任） — section heading |
| connector | 34 | 1 | とする — structural connector |

| id | content |
|---|---|
| H | A kanji-numeral label establishes ordinal position in an enumeration; it maps 一..九十九 to a Nat. The delegation heading and とする are structural declaration/connector units. |
| T | `lake build JapanTaxLaw.KanjiOrdinalsTests`; `python scripts/ci/source_audit_kanji.py` |
| D | Kernel parser with all 76 variant parse results verified by `decide`, spec agreement by `rfl`, rejection of empty/non-kanji strings, heading declaration and connector identity; all 45,621 originals verbatim (4/4 checks). |
| C | Competing readings rejected: treating an item label as carrying substantive tax effect, or accepting a non-kanji/empty string as an ordinal. |
| U | The enumerated provisions' substantive content NOT MODELLED. Human legal review pending. |
