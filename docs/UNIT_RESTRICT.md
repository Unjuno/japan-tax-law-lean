# Normative units — に限る（限定演算子）（4954 units, FULLY_VERIFIED）

Whole norm = restriction/membership operator → `FULLY_VERIFIED`. Concrete cases
and allowed values are caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| restriction | 4954 | に限る／に限り — application limited to a specified case |

| id | content |
|---|---|
| H | A restriction holds exactly when a candidate equals the allowed case; a candidate equal to itself is always accepted, and a distinct candidate is rejected. |
| T | `lake build JapanTaxLaw.RestrictionNormsTests`; `python scripts/ci/source_audit_restrict.py 4954` |
| D | Kernel proofs of hit/miss/zero cases and independent spec agreement; all 4954 originals verbatim (4/4 checks). |
| C | Competing readings rejected: accepting a non-allowed candidate, and rejecting the allowed candidate. |
| U | Concrete cases/values caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
