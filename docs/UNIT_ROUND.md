# Normative units — 端数処理（94 units, FULLY_VERIFIED）

Whole norm = rounding operator → `FULLY_VERIFIED`. Concrete amounts and units are
caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| rounddown | 56 | 切り捨て — round down to caller-supplied unit |
| roundhalf | 27 | 四捨五入 — round to nearest at half the unit |
| roundup | 11 | 切り上げ — round up to caller-supplied unit |

| id | content |
|---|---|
| H | Rounding maps an amount to a multiple of a caller-supplied unit: down via truncation, up via ceiling, and to nearest via half-unit. |
| T | `lake build JapanTaxLaw.RoundingBoundaryOperatorsTests`; `python scripts/ci/source_audit_round.py` |
| D | Kernel proofs of zero/one-unit and small-value boundaries for each rounding mode; independent spec agreement (rfl); all 94 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a non-truncated round-down, a non-raised round-up, and a wrong half-unit boundary. |
| U | Concrete amounts/units caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
