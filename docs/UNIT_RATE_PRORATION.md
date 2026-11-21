# Normative units — 率乗・合算・差額・按分（1,546 units, FULLY_VERIFIED）

Whole norm = operator → `FULLY_VERIFIED`. Concrete amounts/rates are
caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| rate_mult | 1,129 | 割合を乗じて計算した金額 — multiplication by a rate |
| sum | 205 | 合算額/合計額とする — summation |
| proration | 161 | 率を乗じて得た額を…按分 — proportional allocation |
| difference | 51 | 差額に相当する額 — absolute difference |

| id | content |
|---|---|
| H | Rate multiplication computes base×rate; summation folds item amounts; proration allocates total×weight/sum; difference is |a−b|. |
| T | `lake build JapanTaxLaw.RateSumProrationTests`; `python scripts/ci/source_audit_rateproration.py` |
| D | Kernel proofs of rate zero/identity, sum associativity, difference symmetry/zero and proration zero/undefined; spec agreement; all 1,546 originals verbatim (4/4 checks). |
| C | Competing readings rejected: wrong rate, non-associative sum, signed instead of absolute difference, and zero-denominator proration. |
| U | Concrete amounts/rates caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
