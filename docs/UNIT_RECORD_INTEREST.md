# Normative units — 記録・利子計算規範（1,188 units, FULLY_VERIFIED）

Whole norm = operator → `FULLY_VERIFIED`. Concrete records/rates caller-supplied
and NOT MODELLED.

| family | units | structure |
|---|---|---|
| record | 945 | 「…を記録した…の提出をもつて…に代える」 — medium substitution |
| interest_calc | 243 | 利子/利息 calculation — interest operator |

| id | content |
|---|---|
| H | A recorded medium substitutes for document submission; interest = principal×rate×periods (simple interest = principal×rate). |
| T | `lake build JapanTaxLaw.RecordAndInterestNormsTests`; `python scripts/ci/source_audit_record.py` |
| D | Kernel proofs of submission substitution, all-recorded fold, interest zero-principal/period and simple-interest zero; spec agreement; all 1,188 originals verbatim (4/4 checks). |
| C | Competing readings rejected: unrecorded medium substituting for a document, and non-zero interest on a zero principal/period. |
| U | Concrete records/rates caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
