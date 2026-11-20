# Normative units — 範囲列挙・同条項参照・切捨て・合算（1175 units）

| family | count | structure |
|---|---|---|
| range_enum | 644 | 一及び二 / 一から三まで / 一、二 — ordinal ranges/enumerations |
| short_xref | 419 | 同項の規定による検査 etc. — short-form cross reference |
| sum_calc | 59 | 次の各号によって算定した額の合算額とする |
| round_down_100 | 53 | 百円未満の端数を切り捨てる |

| id | content |
|---|---|
| H | Ranges select ordinals in [lo,hi] or an explicit list; a short reference resolves to a caller-supplied target; round-down yields the largest multiple of 100 not exceeding the amount; summation folds item amounts. |
| T | `lake build JapanTaxLaw.EnumRefsAndOperatorsTests`; `python scripts/ci/source_audit_enumrefs.py` |
| D | Kernel proofs of interval membership/boundary/outside, enumeration membership, reference identity, round-down divisibility/bounds/identity and fold-sum algebra (nil/cons/append/nonneg); spec agreement; all 1175 originals verbatim (4/4 checks). |
| C | Competing readings rejected: an ordinal outside the listed range, a reference resolved to a different target, a round-down exceeding the amount or not a multiple of 100, and a non-associative sum. |
| U | Referenced provisions, amounts and enumerated items NOT MODELLED. Human legal review pending. |
