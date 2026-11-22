# Normative units — 購入費用の加算（31 units, FULLY_VERIFIED）

Whole norm = conditional cost-addition operator → `FULLY_VERIFIED`. Concrete
amounts are caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| cost_addition | 31 | 購入代価 + 付随費用（費用がある場合） |

| id | content |
|---|---|
| H | The acquisition cost is the purchase price plus incidental costs when costs exist, and equals the price when no costs exist; it is never below the price. |
| T | `lake build JapanTaxLaw.CostAdditionOperatorsTests`; `python scripts/ci/source_audit_costadd.py` |
| D | Kernel proofs of zero-cost identity, positive-cost addition, price lower bound and zero-price-with-costs; independent spec agreement; all 31 originals verbatim (3/3 checks). |
| C | Competing readings rejected: omitting existing costs, and a cost-inclusive amount below the purchase price. |
| U | Concrete prices/costs caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
