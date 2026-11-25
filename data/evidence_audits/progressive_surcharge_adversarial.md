# Independent adversarial review — ProgressiveSurchargeBrackets (cycle 22)

Auditor: independent general subagent (session ses_decf1eac7ffeKCYKekF0fjYC2I).
Read-only audit of the three ProgressiveSurchargeBrackets Lean files against
17 pinned 地方税法 units. Not legal advice; not a completeness claim.

## Verdict: PASS
- Independent Python sweeps: 335,117 checks, 0 mismatches. The meaningful
  checks used the bracket-slice and reduced-rate spec forms (the quoted-form
  comparison is acknowledged as tautological by the auditor).
- Verbatim statutory phrase (五十万円以下 15% / 50万超300万以下 20% /
  300万超 30%) confirmed in 第71_14条, 第90条, 第721条 of the pinned
  地方税法 raw bytes. Thresholds, rates and marginal-slice direction match.
- No `sorry`/`admit`/`axiom`/`unsafe`; spec is a non-trivial algebraic
  re-expression with a proven `sliceMid` identity.

## Scope gaps recorded by the auditor (not counted as errors in the pinned norm)
1. 第4項 defines the surcharge as `prog(A) - prog(B)` for cumulative amounts
   A (after-addition) and B (before); the model returns `prog(base)` and is
   exact only when B = 0.
2. The 10% add-on is in 第5項 (conditioned on prior 不申告加算金/重加算金 within
   5 / 2 years), not 第2項/第3項 as the implementation header stated.
3. 第1項, 第3項 (5% add-on), 第6項 (5% flat) and 第8項 are unmodelled.

Item 2 has been corrected in the implementation header. ADVERSARIAL_REVIEW is
recorded only for the three sampled units; the other 14 stay PROVED_SCOPE.
