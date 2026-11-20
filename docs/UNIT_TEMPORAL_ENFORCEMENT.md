# Normative units — 施行日規定（時間的適用, 1462 units）

1462 units across 54 enforced revisions, in seven verbatim variants:

| variant | count (from audit) | modelled mode |
|---|---|---|
| 公布の日から施行する | 713 | immediate (effective = promulgation) |
| 一年を超えない範囲内 | 238 | deferred (window bound caller-supplied) |
| 六月を超えない範囲内 | 213 | deferred |
| 三月を超えない範囲内 | 151 | deferred |
| 九月を超えない範囲内 | 55 | deferred |
| 六月をこえない範囲内 | 48 | deferred (same constraint) |
| 三月をこえない範囲内 | 44 | deferred (same constraint) |

| id | content |
|---|---|
| H | Enforcement is either immediate (effective = promulgation) or deferred into a window `promulgation < effective <= promulgation + bound`. The 超えない/こえない spellings express the same lower-exclusive constraint and share a mode. |
| T | `lake build JapanTaxLaw.TemporalEnforcementDatesTests`; `python scripts/ci/source_audit_temporal.py` |
| D | Kernel proofs of immediate/deferred equivalences, their exclusivity, lower/upper window bounds, and equivalence of all deferred variants; spec agreement; all 1462 originals verbatim (5/5 checks). |
| C | Competing readings rejected: allowing the cabinet-order date on or before promulgation (wrong lower bound), or beyond the stated window (wrong upper bound). 「こえない」 treated as distinct from 「超えない」 is also rejected. |
| U | Month→day conversion, the actual cabinet-order date, and all other provisions of the laws are NOT MODELLED. Human legal review pending. |

This verifies the *temporal constraint structure*, not calendar arithmetic or actual enforcement dates.
