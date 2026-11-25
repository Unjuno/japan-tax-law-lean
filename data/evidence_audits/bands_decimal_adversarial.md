# Independent adversarial review — StatutoryBands / DecimalPercentRates (cycle 23)

Auditor: independent general subagent (session ses_decdea4a5ffeiI8oA0FWJCYPRm).
Read-only audit against bands.json (2 units) and dec.json (12 units).
Not legal advice; not a completeness claim.

## Verdict: PASS
Python reference implementations were transcribed from the Japanese numerals
in the pinned source, not from the Lean code. Sweeps: 5,022 salary cases,
5,017 basic-deduction cases, 3,014 cases per decimal rate — **0 mismatches**
against both implementation and independent spec. Boundary ±1 yen at each
threshold checked. SHA-256 of each cited source matched its pin.

Sampled source phrases confirmed:
- 9aa4d5d0… (所得税法 art.28): all five bands 65万 / 65万+30% / 116万+20% /
  176万+10% / 195万 — exact match.
- 46ace277… (art.86): 2350万→58万, 2400万→48万, 2450万→32万, 2500万→16万 —
  exact match.
- fa90c1d1… (332CO57 art.2): 百分の一・三五 = 135/10000 — match.
- c9a21932… (325AC226 art.594): 百分の一・四 = 14/1000 — match.

All six Lean files clean of `sorry|admit|axiom|unsafe|Classical.choice`; specs
are structurally distinct (tier tables/reduced and coprime fractions) with
universal agreement theorems proved, not assumed.

## Declared scope gaps (not errors)
- art.28(3) 別表第五 override for income < 6.6M not modelled.
- art.86 `else 0` is a saturating extension beyond its ≤25M scope.
- 読替え directions in decimal units (1.35→1.5, 40.85→44.65, 1→1.4,
  1.4→2.58) not modelled.

ADVERSARIAL_REVIEW recorded only for the four sampled units
(9aa4d5d0…, 46ace277…, fa90c1d1…, c9a21932…); the other 10 units remain
PROVED_SCOPE with a documented sampling scope gap.
