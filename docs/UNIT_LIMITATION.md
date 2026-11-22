# Normative units — 時効・利子割・利子所得（471 units, FULLY_VERIFIED）

Whole norm = temporal/classification operator → `FULLY_VERIFIED`. Concrete periods
and amounts are caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| interest_income | 321 | 利子等 — interest income classification |
| limitation | 79 | 消滅時効/期間制限 — limitation period |
| interest_split | 71 | 利子割 — interest-split tax label |

| id | content |
|---|---|
| H | A right persists while elapsed ≤ limit; a special period is base+extension; interest is classified by a caller-supplied code; interest-split tax is base×rate. |
| T | `lake build JapanTaxLaw.LimitationAndInterestNormsTests`; `python scripts/ci/source_audit_lim.py` |
| D | Kernel proofs of limitation at/expired boundary, extended zero, interest code classification and split zero; spec agreement; all 471 originals verbatim (4/4 checks). |
| C | Competing readings rejected: an expired right treated as live, a wrong interest class, and non-zero split tax on zero base. |
| U | Concrete periods/amounts caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
