# FULL-COVERAGE adversarial source-fidelity review — FractionAmounts (301 units)

Auditor: independent general subagent (session ses_dea013d7dffeTbhaR7ap61rJoM).
Read-only mechanical check over EVERY one of the 301 units, not a sample.
Reproduce with `data/evidence_audits/full_coverage_fractions_audit.py`.
Not legal advice; not a completeness claim.

## Verdict: PASS (full coverage of the four mechanical checks)

| Check | Result |
|---|---:|
| records | 301 |
| pinned-byte SHA-256 matches `source_sha256` | 301 / 301 |
| exact `token` present in whitespace-normalized pinned source | 301 / 301 |
| `norm_fragment` contains `token` | 301 / 301 |
| independent `num`/`den` re-parse (num = after 分の, den = before 分の) | 301 / 301 |

35 distinct pinned source files; failure list empty.

Lean checks: no forbidden proof tokens in the three `FractionAmounts*.lean`
files; universal theorem `fracAmount_eq_decomposition` (sole assumption
`0 < den`) and `fracAmount` definition unchanged; files clean vs pinned HEAD.

## Scope
Full coverage applies to the four checks listed above. Semantic context
beyond the exact fraction phrase is out of scope. ADVERSARIAL_REVIEW is
recorded for all 301 units on the basis of this full-coverage mechanical
review; this is still not a claim that every target-version norm is complete.
