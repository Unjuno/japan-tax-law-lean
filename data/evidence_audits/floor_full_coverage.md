# FULL-COVERAGE adversarial review — FloorRoundingMinimum (83 units)

Auditor: independent general subagent (session ses_de9d4a3cdffeb1R41YiCsBgiLi).
Full-coverage mechanical check over all 83 remaining floor-rounding units.
Reproduce with `data/evidence_audits/full_coverage_floor_audit.py`.
Not legal advice; not a completeness claim.

## Verdict: PASS (full coverage, five checks)

| Check | Result |
|---|---:|
| pinned SHA-256 == source_sha256 (plus queue hash/fragment cross-check) | 83 / 83 |
| full text has `円未満の端数` and a floor cue | 83 / 83 |
| threshold kanji maps to modelled value, consistent with evidence/Lean | 83 / 83 |
| no in-scope round-up clause (`以上…未満…とする`, 四捨五入, 切り上げ) | 83 / 83 |
| norm_fragment substring of normalized full text | 83 / 83 |

Failure list empty. One non-failing flag: `05f6ffcef9bc…` contains `切り上げ`
for a *month-count* remainder (一月未満の端数), a different quantity from the
pinned money floor rule; not a contradiction of the pinned norm.

Lean scan: no forbidden proof tokens in the three `FloorRoundingMinimum*.lean`
files; universal theorems and all files byte-identical to git HEAD.

## Scope
Full coverage applies to SHA, exact phrase, threshold, direction and fragment
checks only; surrounding semantic context is out of scope. ADVERSARIAL_REVIEW
is recorded for all 83 units on this basis; no completeness claim.
