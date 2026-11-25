# Independent adversarial review — FloorRoundingMinimum (cycle 20): FAIL

Auditor: independent general subagent (session ses_ded0535cdffeaRJT6MCusFpVee).
Read-only audit of the three FloorRoundingMinimum Lean files against 42 pinned
units. Not legal advice; not a completeness claim.

## Verdict
VERDICT: FAIL — 6 of 42 units are unfaithful to the pinned text.

## Evidence
- Python re-derivation over t ∈ {1,100,500,1000,10000}, a ∈ [0,3t+7]:
  34,843 cases, 0 mismatches for `floorAt a t = (a/t)*t`.
- Unit `a112a33c…` (337M50, 第5条, 五百円未満): pinned text says
  「五百円未満の端数…切り捨て、五百円以上千円未満の端数…千円として計算する」
  i.e. round-half-up to a 1,000 yen multiple with a 500 cutoff (7500→8000,
  550→1000). `floorAt a 500` yields 7500/500 (not the same). MISMATCH.
- Units `1477b607…`, `758d5a30…` (325CO245, 第35_12条, 五十銭):
  「五十銭未満の端数を切り捨て、五十銭以上一円未満の端数を一円とする」
  is round-half-up at 50銭; Nat yen cannot represent 50銭. `floorOrMinimum 0 1 1 = 1`
  whereas the statute gives 0. MISMATCH.
- The other sampled units (関税法 第12条 一万円 切捨て; 地方税法 第321条の7の2
  百円 minimum) matched exactly.
- No `sorry`/`admit`/`axiom`/`unsafe`; quotient-based spec is non-circular.

## Action taken
The 6 affected units are marked BLOCKED with blocker
`SPEC_FIDELITY_CONTRADICTION_ADVERSARIAL`; no ADVERSARIAL_REVIEW axis is
recorded for this family. The remaining 36 keep PROVED_SCOPE with an explicit
note that no family-level adversarial PASS was obtained. This finding is
recorded as a contradiction (H/T/D/C/U: H = spec misreads 端数 direction;
T = Python re-derivation + verbatim source phrase; D = FAIL; C = 五百円を
千円として計算する is a remainder round-up, not a floor; U = 五十銭 requires
a sub-yen representation).
