# FULL-COVERAGE adversarial review — ProportionalAllocation (85 units)

Auditor: independent general subagent (session ses_de85e3017ffeiNmCfKRvWYyNcR).
Read-only, non-sampled audit over all 85 units in anbun.json.
Reproduce with `data/evidence_audits/full_coverage_anbun.py`.
Not legal advice; not a completeness claim.

## Verdict: PASS (full coverage)
SHA 85/85, 「按分」 verbatim in normalized source and fragment 85/85, and all
85 norm_fragments CONTIGUOUS in normalized full provision text (0 non-contiguous).
Failure list empty. Three Lean files free of forbidden proof tokens;
`allocate_decomposition` intact.

Modelling assessment kept distinct from source fidelity: 按分 means pro-rata
apportionment, so `total * part / whole` is a defensible reading of the term's
core meaning. The identity of part/whole, Nat floor truncation, and handling of
statutes that split totals into sub-totals are modelling choices explicitly
disclosed as caller-established — not hidden assumptions.

Scope: SHA / phrase / containment only. ADVERSARIAL_REVIEW recorded for all
85 units; no completeness claim.
