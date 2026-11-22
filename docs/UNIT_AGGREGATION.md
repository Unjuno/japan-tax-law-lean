# Normative units — 合算額（税目ごとの合算）（367 units, FULLY_VERIFIED）

Whole norm = cross-category aggregation operator → `FULLY_VERIFIED`. Concrete
per-category amounts are caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| aggregation | 367 | 合算額 — combined amount is the total of per-category amounts |

| id | content |
|---|---|
| H | A combined amount (合算額) is the sum of the per-category amounts; aggregation is associative, commutative and identity-preserving. |
| T | `lake build JapanTaxLaw.AggregationNormsTests`; `python scripts/ci/source_audit_agg.py` |
| D | Kernel proofs of aggregate nil/single/combine/append, permutation invariance and spec agreement (induction); all 367 originals verbatim (3/3 checks). |
| C | Competing readings rejected: a combined amount omitting a category, and an order-dependent combined amount. |
| U | Concrete per-category amounts caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
