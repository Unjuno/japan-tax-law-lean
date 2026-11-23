# Normative units — 除外（除く）演算子（6446 units, FULLY_VERIFIED）

Whole norm = exclusion operator → `FULLY_VERIFIED`. Concrete categories and
excluded items are caller-supplied and NOT MODELLED. Complements the earlier
exclusion/extension batch.

| family | units | structure |
|---|---|---|
| exclusion | 6446 | 除く — base category minus an excluded subcategory |

| id | content |
|---|---|
| H | An exclusion removes a specified subcategory from a base category; excluding nothing leaves the base intact, excluding the whole base leaves empty, and the result is always a subset of the base preserving non-excluded members. |
| T | `lake build JapanTaxLaw.ExclusionRemainderNormsTests`; `python scripts/ci/source_audit_excl2.py` |
| D | Kernel proofs of empty/self exclusion, member removal, subset property and member preservation; independent spec agreement; all 6446 originals verbatim (4/4 checks). |
| C | Competing readings rejected: an exclusion that adds items, omits a required exclusion, or retains an excluded member. |
| U | Concrete categories/excluded items caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
