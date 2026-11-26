# FULL-COVERAGE adversarial review — FixedDeductions (7 units)

Auditor: independent general subagent (session ses_de8959661fferPswvZ1yitxUmy).
Read-only, non-sampled audit over all 7 units in fixed.json.
Reproduce with `data/evidence_audits/full_coverage_fixed.py`.
Not legal advice; not a completeness claim.

## Verdict: PASS (full coverage)
SHA 7/7, verbatim 「からX円を控除」 phrase 7/7, independent kanji re-parse
7/7, and — after the earlier non-contiguous defect — all 7 norm_fragments
CONTIGUOUS in normalized full provision text. Failure list empty.
Parsed amounts: 600000, 1100000, 2000, 500000, 145000, 1, 1; Lean example
constants for 600000/2000/1 agree; no forbidden proof tokens;
`fixedDeduction_agrees` intact.

Scope: SHA / phrase / parse / containment only. Surrounding context and
`base` definition out of scope. ADVERSARIAL_REVIEW recorded for all 7 units;
no completeness claim.
