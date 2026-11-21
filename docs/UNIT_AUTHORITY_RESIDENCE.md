# Normative units — 権限・居住者・地方債（1,874 units, PROVED_SCOPE）

| family | units | structure |
|---|---|---|
| bond_issuance | 813 | 発行について同意又は許可を得た地方債 — approval-gated issuance |
| mutual_treaty | 458 | 外国居住者等…相互主義による… — reciprocity reference |
| residence | 455 | 居住者又は恒久的施設を有する非居住者… — residence classification |
| authority_power | 92 | 当該職員は…証票を携帯し…呈示しなければならない — credential duty |
| joint_property | 56 | 併用住宅…共同住宅等…床面積 — area apportionment |

Only shared structure is kernel-proven; concrete persons, dates, amounts and
provisions are NOT MODELLED. Unhandled conditions retained → `PROVED_SCOPE`.

| id | content |
|---|---|
| H | Bond issuance requires consent; specified residents are taxable; reciprocity applies when its condition is met; officials have a credential duty; joint property uses area apportionment. |
| T | `lake build JapanTaxLaw.AuthorityResidenceAndBondsTests`; `python scripts/ci/source_audit_authority.py` |
| D | Kernel proofs of consent gating, residence classification, reciprocity identity, credential declaration and zero-safe area share; spec agreement; all 1,874 originals verbatim (4/4 checks). |
| C | Competing readings rejected: issuance without consent, treating other non-residents as taxable, and a zero-denominator area share. |
| U | Concrete persons/dates/amounts NOT MODELLED. Human legal review pending. Status remains `PROVED_SCOPE`. |
