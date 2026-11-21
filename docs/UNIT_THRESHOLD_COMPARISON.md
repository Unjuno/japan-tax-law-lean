# Normative units — 閾値比較（990 units, FULLY_VERIFIED）

Whole norm = comparison operator → `FULLY_VERIFIED`. Concrete amounts are
caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| exceeds | 709 | 「…を超える場合…当該超える部分」 — excess over a threshold |
| threshold | 281 | 「…以下/以上/未満の場合」 — threshold band comparison |

| id | content |
|---|---|
| H | Excess applies when value > threshold (excess part = value − threshold); a band selects lo < value ≤ hi; at-most/at-least/below compare to a boundary. |
| T | `lake build JapanTaxLaw.ThresholdComparisonNormsTests`; `python scripts/ci/source_audit_threshold.py` |
| D | Kernel proofs of boundary behavior, excess zero/positive, band lower/upper/outside and at-most/at-least/below boundaries; spec agreement; all 990 originals verbatim (4/4 checks). |
| C | Competing readings rejected: treating equality as "exceeds", including the lower band boundary, or a negative excess. |
| U | Concrete amounts caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
