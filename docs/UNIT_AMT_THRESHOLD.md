# Normative units — 金額閾値（914 units, FULLY_VERIFIED）

Whole norm = comparison operator → `FULLY_VERIFIED`. Concrete amounts caller-supplied
and NOT MODELLED.

| family | units | structure |
|---|---|---|
| yen_threshold | 779 | 「N万円以下/超」 — amount vs threshold |
| total_income | 135 | 「合計所得金額がN円以下/超」 — total-income band |

| id | content |
|---|---|
| H | An amount is at-most a threshold (≤), exceeds it (>), or lies in an income band [lo,hi]; a per-person limit is threshold×count. |
| T | `lake build JapanTaxLaw.AmountThresholdNormsTests`; `python scripts/ci/source_audit_amtthresh.py` |
| D | Kernel proofs of at-most/exceeds boundaries, income-band lower/upper/outside and per-person-limit zero; spec agreement; all 914 originals verbatim (4/4 checks). |
| C | Competing readings rejected: equality treated as "exceeds", an income outside the band, and a non-zero limit for zero persons. |
| U | Concrete amounts caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
