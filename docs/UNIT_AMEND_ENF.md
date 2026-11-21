# Normative units — 改正規定の施行（1,259 units, FULLY_VERIFIED）

Whole norm = temporal operator → `FULLY_VERIFIED`. Concrete dates/items caller-supplied
and NOT MODELLED.

| family | units | structure |
|---|---|---|
| amendment_enforcement | 1,099 | 改正規定は各号に掲げる日から施行 — per-item date |
| delayed_enforcement | 139 | 公布の日から起算して N月以内の政令で定める日 — bounded delay |
| staged_enforcement | 21 | 各号に掲げる規定はそれぞれの日から施行 — staged dates |

| id | content |
|---|---|
| H | An amendment applies from its enforcement date; a delayed enforcement date lies within a bounded window after promulgation; staged provisions each have their own date. |
| T | `lake build JapanTaxLaw.AmendmentEnforcementNormsTests`; `python scripts/ci/source_audit_amendenf.py` |
| D | Kernel proofs of effective-at-boundary, not-before and enforcement-window lower/upper bounds; spec agreement; all 1,259 originals verbatim (4/4 checks). |
| C | Competing readings rejected: applying before the enforcement date, and an enforcement date outside the bounded window. |
| U | Concrete dates/items caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
