# FULL-COVERAGE adversarial review — SenSpecificDuty (71 units)

Auditor: independent general subagent (session ses_de8bf0b3bffegueKXrbtRRxWB9).
Read-only, non-sampled audit over all 71 units in sen2.json.
Reproduce with `data/evidence_audits/full_coverage_sen2.py`.
Not legal advice; not a completeness claim.

## Verdict: PASS (full coverage)
All checks 71/71: pinned SHA-256, verbatim token in normalized source and in
norm_fragment, sen_rate == 152, unique queue match, and — importantly after
the previous family's defect — **contiguous** norm_fragment in normalized full
provision text (0 non-contiguous, 0 missing). Independent parse confirms
一円五二銭 = 1 yen + 52 sen = 152 sen, matching the Lean literal and the
division by 100. Three Lean files free of forbidden proof tokens;
`senDuty_agrees` and its `aux` dependency intact.

Scope: SHA / phrase / numeral parse / fragment containment only. Surrounding
context (ad-valorem comparison, tariff classification) out of scope.
ADVERSARIAL_REVIEW recorded for all 71 units; no completeness claim.
