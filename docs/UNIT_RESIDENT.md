# Normative units — 居住者分類（2,065 units, FULLY_VERIFIED）

Whole norm = classification → `FULLY_VERIFIED`. Concrete persons are
caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| resident | 1,211 | 居住者 — resident classification |
| non_resident | 848 | 非居住者 — non-resident classification |
| temp_resident | 6 | 一時居住者 — temporary resident |

| id | content |
|---|---|
| H | Residency is one of resident/non-resident/temporary (exclusive); residents and temporary residents are subject to resident taxation, non-residents are not. |
| T | `lake build JapanTaxLaw.ResidentClassificationNormsTests`; `python scripts/ci/source_audit_resident.py` |
| D | Kernel proofs of classification by code, taxable-resident flags and classification exclusivity; spec agreement; all 2,065 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a single person in two classes, a non-resident treated as a resident for resident tax. |
| U | Concrete persons caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
