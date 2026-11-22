# Normative units — 損失・欠損・繰越（1,067 units, FULLY_VERIFIED）

Whole norm = amount/time operator → `FULLY_VERIFIED`. Concrete amounts/years
are caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| deficit | 591 | 欠損金額 — deficit amount computation/reporting |
| carryover | 293 | 繰越控除 — loss carried to future years |
| disaster_loss | 183 | 災害による雑損失 — disaster loss deduction window |

| id | content |
|---|---|
| H | A deficit is expense−income (0 if covered); a carryover applies when start≤year≤start+years; a disaster loss falls in [disaster, disaster+3]. |
| T | `lake build JapanTaxLaw.LossAndCarryoverNormsTests`; `python scripts/ci/source_audit_loss.py` |
| D | Kernel proofs of deficit-zero-when-covered, carry at-start/outside and disaster at-year/after-window; spec agreement; all 1,067 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a negative deficit, a carryover beyond the year window, and a disaster loss outside the 3-year band. |
| U | Concrete amounts/years caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
