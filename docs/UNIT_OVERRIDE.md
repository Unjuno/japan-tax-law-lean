# Normative units — 規定にかかわらず（優先適用演算子）（495 units, FULLY_VERIFIED）

Whole norm = priority/override operator → `FULLY_VERIFIED`. Concrete effects and
conflicting provisions are caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| override | 495 | 規定にかかわらず — effect applies regardless of conflicting provisions |

| id | content |
|---|---|
| H | A notwithstanding clause applies its effect regardless of whether a conflicting provision exists; the result is independent of the conflict flag. |
| T | `lake build JapanTaxLaw.OverrideOperatorsTests`; `python scripts/ci/source_audit_override.py 495` |
| D | Kernel proofs of conflict/no-conflict branches, independence from the conflict flag, zero effect and independent spec agreement; all 495 originals verbatim (4/4 checks). |
| C | Competing readings rejected: an effect that is suppressed by a conflicting provision, and one that changes with the conflict flag. |
| U | Concrete effects/conflicts caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
