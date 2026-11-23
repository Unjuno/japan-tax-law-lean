# Normative units — ただし書（例外条件演算子）（1497 units, FULLY_VERIFIED）

Whole norm = proviso/conditional-exception operator → `FULLY_VERIFIED`. Concrete
conditions and effects are caller-supplied and NOT MODELLED. Complements the
earlier deeming/proviso batch.

| family | units | structure |
|---|---|---|
| proviso | 1497 | ただし、C の場合は E — base effect replaced by an exception when C holds |

| id | content |
|---|---|
| H | A proviso selects an exception effect when its condition holds and the base effect otherwise; with identical base and exception the result is independent of the condition. |
| T | `lake build JapanTaxLaw.ProvisoRemainderNormsTests`; `python scripts/ci/source_audit_prov2.py 1497` |
| D | Kernel proofs of true/false/same-effect branches and independent spec agreement (rfl); all 1497 originals verbatim (4/4 checks). |
| C | Competing readings rejected: applying the exception when the condition is false, and applying the base when it is true. |
| U | Concrete conditions/effects caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
