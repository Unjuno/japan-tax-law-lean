# Normative units — 還付加算金・軽減免除・無税（212 units, FULLY_VERIFIED）

Whole norm = amount/date operator → `FULLY_VERIFIED`. Concrete dates/amounts caller-supplied
and NOT MODELLED.

| family | units | structure |
|---|---|---|
| refund_interest | 125 | 還付加算金 — interest from the later of two dates |
| reduce_or_exempt | 78 | 軽減又は免除を受けた関税を徴収 — recover relief |
| duty_free | 9 | 関税の率が無税 — zero rate |

| id | content |
|---|---|
| H | Refund interest starts from the later of two dates; relief recovery applies when a duty was reduced or exempted; a duty-free rate yields zero tax. |
| T | `lake build JapanTaxLaw.ReliefAndInterestNormsTests`; `python scripts/ci/source_audit_relief.py` |
| D | Kernel proofs of later-of max branches, interest zero-years, recovery OR and zero rate; spec agreement; all 212 originals verbatim (4/4 checks). |
| C | Competing readings rejected: using the earlier date, no recovery after relief, and a non-zero duty-free tax. |
| U | Concrete dates/amounts caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
