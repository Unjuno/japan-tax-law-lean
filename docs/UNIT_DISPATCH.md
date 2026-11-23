# Normative units — 区分に応じ（区分別選択演算子）（1398 units, FULLY_VERIFIED）

Whole norm = category-dispatch/lookup operator → `FULLY_VERIFIED`. Concrete
categories and assigned values are caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| category_dispatch | 1398 | 区分に応じ当該各号に定めるもの — value selected by category |

| id | content |
|---|---|
| H | A dispatch table maps a category key to an assigned value; an empty table yields no value, a hit yields the assigned value, the first matching entry wins, and a miss skips non-matching entries. |
| T | `lake build JapanTaxLaw.CategoryDispatchNormsTests`; `python scripts/ci/source_audit_dispatch.py 1398` |
| D | Kernel proofs of empty/hit/miss/first-wins behaviour and independent find?-based spec agreement; all 1398 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a later entry overriding an earlier match, and a non-matching entry being selected. |
| U | Concrete categories/values caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
