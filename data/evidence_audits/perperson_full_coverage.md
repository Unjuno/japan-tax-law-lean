# FULL-COVERAGE adversarial review — PerPersonDeduction (8 units)

Auditor: independent general subagent (session ses_de95acfc9ffe69wqSN67eFpu5x).
Read-only, non-sampled audit over all 8 units in perperson.json. Reproduce with
`data/evidence_audits/full_coverage_perperson.py`.
Not legal advice; not a completeness claim.

## Verdict: PASS

| Check | Result |
|---|---:|
| records | 8 |
| pinned SHA-256 == source_sha256 | 8 / 8 |
| 「一人につき」+ yen amount matches token | 8 / 8 |
| token verbatim in normalized pinned source | 8 / 8 |
| norm_fragment substring of normalized source | 8 / 8 |

Failure list empty. Tokens: 一人につき五万円 ×2, 一人につき一万円 ×3,
一人につき三万円, 一人につき四万八千円, 一人につき二十七万円.
No forbidden proof tokens in the three Lean files; theorem declarations
`base_eq_amount`, `commute`, `monotone_count` intact. The files were untracked
at the time of the audit, so no HEAD baseline existed for a literal diff;
this is reported as a fact, not a fidelity failure.

Scope: SHA / phrase / containment only. Surrounding semantic context and
eligibility conditions are out of scope. ADVERSARIAL_REVIEW recorded for all
8 units on this basis; no completeness claim.
