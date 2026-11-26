# FULL-COVERAGE adversarial review — ThresholdDeductions (2 units)

Auditor: independent general subagent (session ses_de902a8a3ffezmuAqVf47Us2Iu).
Read-only, non-sampled audit of e1ff699c49a9 and eb30477c44d8.
Reproduce with `data/evidence_audits/full_coverage_threshold.py`.
Not legal advice; not a completeness claim.

## Verdict: PASS
- pinned SHA-256 2/2; expected needles in full text: spouse 9/9, long-term 4/4;
  norm_fragment substring 2/2.
- Arithmetic sweep: spouse 20,020,012 comparisons, 0 mismatches; long-term
  25,006 comparisons, 0 mismatches (Lean constants parsed independently).
- 619 Lean files scanned for forbidden proof tokens: 0 hits.

Scope: SHA, phrase presence, fragment containment and arithmetic sweep only.
Surrounding context out of scope. ADVERSARIAL_REVIEW recorded for both units;
no completeness claim.
