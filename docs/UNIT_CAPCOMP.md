# Normative units — を超えない（上限比較演算子）（107 units, FULLY_VERIFIED）

Whole norm = cap-comparison predicate → `FULLY_VERIFIED`. Concrete values and
limits are caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| cap_comparison | 107 | を超えない — value must not exceed a limit |

| id | content |
|---|---|
| H | A value satisfies a cap exactly when it is at or below the limit; a value above the limit fails, and a zero limit accepts only zero. |
| T | `lake build JapanTaxLaw.CapComparisonNormsTests`; `python scripts/ci/source_audit_capcomp.py 107` |
| D | Kernel proofs of at-cap, below-cap, above-cap and zero-cap cases plus independent spec agreement; all 107 originals verbatim (4/4 checks). |
| C | Competing readings rejected: accepting an above-cap value, and rejecting an at-cap value. |
| U | Concrete values/limits caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
