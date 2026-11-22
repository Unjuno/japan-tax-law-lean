# Normative units — 下限・上限クランプ（52 units, FULLY_VERIFIED）

Whole norm = boundary-clamp operator → `FULLY_VERIFIED`. Concrete input values
are caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| neg_to_zero | 41 | 負数→0（clamp non-negative） |
| below_floor | 10 | 下限クランプ max(x, floor) |
| above_cap | 1 | 上限クランプ min(x, cap) |

| id | content |
|---|---|
| H | A negative value is clamped to zero; a value below a floor is clamped up to the floor; a value above a cap is clamped down to the cap. |
| T | `lake build JapanTaxLaw.ClampOperatorsTests`; `python scripts/ci/source_audit_clamp.py` |
| D | Kernel proofs of negative/non-negative clamping, floor lower bound, cap upper bound and independent spec agreement (max/min); all 52 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a negative value left negative, a value left below its floor, and a value left above its cap. |
| U | Concrete input values caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
