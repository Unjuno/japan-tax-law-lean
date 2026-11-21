# Normative units — 擬制とただし書例外（4,115 units, FULLY_VERIFIED）

Whole norm = logical structure → `FULLY_VERIFIED`. Concrete conditions are
caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| deeming_apply | 3,201 | 「…ものとみなして…を適用する」 — treat X as Y then apply |
| proviso_exception | 914 | 「ただし、…ときは、この限りでない」 — exception disables rule |

| id | content |
|---|---|
| H | Deeming extends a rule's scope to deemed cases (real ∨ deemed); a proviso exception disables the rule when it holds. |
| T | `lake build JapanTaxLaw.DeemingAndProvisoNormsTests`; `python scripts/ci/source_audit_deem.py` |
| D | Kernel proofs of deeming extension, proviso disabling/keeping, applied⇒no-exception; spec agreement; all 4,115 originals verbatim (4/4 checks). |
| C | Competing readings rejected: ignoring a deemed case, applying a rule despite a satisfied exception, and treating exception+applied as compatible. |
| U | Concrete conditions caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
