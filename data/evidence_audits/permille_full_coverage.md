# FULL-COVERAGE adversarial review — PermilleAmounts (6 units)

Auditor: independent general subagent (session ses_de9443246ffe1paGccRFhwTV8u).
Read-only, non-sampled audit over all 6 units in permille_amount.json.
Reproduce with `data/evidence_audits/full_coverage_permille_amount.py`.
Not legal advice; not a completeness claim.

## Verdict: PASS (full coverage)

All checks 6/6: unique queue task, pinned SHA-256, on-disk SHA-256, token in
fragment, token verbatim in normalized source, independent Kanji-decimal parse
matching the assigned Lean function, fragment substring of source. Failure
list empty.

Independent parses: 八・五→85/10000→per85, 十三・六→136/10000→per136,
十二・二→122/10000→per122, 四・二→42/10000→per42, 二・五二→252/100000→per252,
十・四→104/10000→per104. Three Lean files have no forbidden proof tokens;
12 expected theorem declarations intact.

Scope: SHA / phrase / parse / containment checks only. Surrounding semantic
context out of scope. ADVERSARIAL_REVIEW recorded for all 6 units; no
completeness claim.
