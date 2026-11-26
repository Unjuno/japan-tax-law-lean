# FULL-COVERAGE adversarial review — LifePremiumDeduction (3 units)

Auditor: independent general subagent (session ses_de91a6f90ffeCnx0pP8SrGCeUd).
Read-only, non-sampled audit over all 3 units in life.json.
Reproduce with `data/evidence_audits/full_coverage_life.py`.
Not legal advice; not a completeness claim.

## Verdict: PASS (full coverage)
- pinned SHA-256 (file and queue) 3/3; all four bands (2万/4万/8万/ceiling)
  and both rates (1/2, 1/4) present in full provision text 3/3;
  norm_fragment substring of normalized full text 3/3.
- Independent Python sweep over 66,667 values (0..200000 step 3): 0
  mismatches between the statutory formula and the Lean-mirrored model;
  boundaries 20000→20000, 40000→30000, 80000→40000, >80000→40000.
- No forbidden proof tokens in the three Lean files.

Scope: SHA, band/rate phrase presence, fragment containment and arithmetic
sweep only; surrounding context out of scope. ADVERSARIAL_REVIEW recorded
for all 3 units; no completeness claim.
