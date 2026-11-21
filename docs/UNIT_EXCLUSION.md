# Normative units — 適用除外・期間延長（997 units, FULLY_VERIFIED）

Whole norm = operator → `FULLY_VERIFIED`. Concrete conditions/periods caller-supplied
and NOT MODELLED.

| family | units | structure |
|---|---|---|
| exclusion | 967 | 「…場合は、適用しない」 — rule excluded when condition holds |
| deadline_ext | 30 | 「期間を…延長することができる」 — discretionary capped extension |

| id | content |
|---|---|
| H | A rule is excluded when its condition holds (multiple exclusions OR together); a period may be extended up to a caller-supplied cap. |
| T | `lake build JapanTaxLaw.ExclusionAndExtensionNormsTests`; `python scripts/ci/source_audit_excl.py` |
| D | Kernel proofs of exclusion negation/or, extension within/over cap; spec agreement; all 997 originals verbatim (4/4 checks). |
| C | Competing readings rejected: applying a rule despite a satisfied exclusion, treating exclusions as AND, and an extension exceeding the cap. |
| U | Concrete conditions/periods caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
