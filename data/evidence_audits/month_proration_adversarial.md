# Independent adversarial review — MonthProration (cycle 26)

Auditor: independent general subagent (session ses_dec9b872cffe14E46gc6oT4iSd).
Read-only audit of three Lean files against 21 pinned units.
Not legal advice; not a completeness claim.

## Verdict: PASS
- Python re-derivation (no Lean trust): 2,691 points per denominator × 6
  denominators (12/24/36/48/60/180), `annual*months//den` vs staged
  `(annual*months//12)//(den//12)`: **0 mismatches**.
- All 21 source files verified by SHA-256; token kanji maps exactly into the
  six implemented denominators; no off-by-cofactor or kanji parse error.
- Three sampled units with distinct denominators checked verbatim:
  `0d7e10bc…` (十二/12), `07bc6eb4…` (百八十/180), `69646ed3…` (三十六/36).
- Zero forbidden tokens; spec structurally distinct with universal
  `prorate_by_cofactor` + `agreeNN` theorems; equality proved, not assumed.

## Declared scope gaps (not misreads)
Caps/comparisons, head-counts, surrounding additions, the annual base amount,
eligibility and the Nat-floor convention are caller-established / out of model.
Four fragments are truncated extraction windows, but the exact token phrase is
present in the pinned source.

ADVERSARIAL_REVIEW recorded only for the three sampled units; the other 18
remain PROVED_SCOPE with a documented sampling gap.
