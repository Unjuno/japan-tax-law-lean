# Normative units — 百分率・千分率・金額当たり率（926 units, FULLY_VERIFIED）

Whole norm = rate definition/application operator → `FULLY_VERIFIED`. Concrete
bases and numerators are caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| percent | 708 | 百分のn — rate = n/100 |
| permille | 200 | 千分のn — rate = n/1000 |
| per_amount | 18 | 千円につきn — rate = n per 1000-yen unit |

| id | content |
|---|---|
| H | A rate is applied as base×numerator/denominator (100 or 1000); a per-amount rate is units×amount-per-unit. |
| T | `lake build JapanTaxLaw.RateValueNormsTests`; `python scripts/ci/source_audit_rate.py` |
| D | Kernel proofs of percent-of-100, permille-of-1000, zero-base/zero-numerator and per-amount zero/one; spec agreement; all 926 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a rate that is not the specified fraction, and a non-zero rate on a zero base. |
| U | Concrete bases/numerators caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
