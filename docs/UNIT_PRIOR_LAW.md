# Normative units — 従前の例による（6,921 units, FULLY_VERIFIED）

Whole norm = temporal version selection → `FULLY_VERIFIED`. Concrete provisions
and dates are caller-supplied and NOT MODELLED. Distinct from the earlier
旧法/新法 version-rule batch: these use 「なお従前の例による」 phrasing.

| family | units | structure |
|---|---|---|
| prior_before | 3,934 | 施行日前の行為/確認 → old law; 施行日以後 → new law |
| prior_matter | 2,987 | 特定の年分/事項 → old law; それ以後 → new law |

| id | content |
|---|---|
| H | New law applies at/after the enforcement date (or threshold year); prior matters remain under old law. The two branches are exclusive and exhaustive. |
| T | `lake build JapanTaxLaw.PriorLawNormsTests`; `python scripts/ci/source_audit_prior.py` |
| D | Kernel proofs of boundary behavior, exclusivity, exhaustiveness and year-threshold selection; spec agreement; all 6,921 originals verbatim (4/4 checks). |
| C | Competing readings rejected: both laws at once, neither at the boundary, and a prior matter switched to the new law. |
| U | Concrete provisions/dates caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
