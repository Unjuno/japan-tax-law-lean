# Independent adversarial review — TariffSpecificFloor (cycle 33)

Auditor: independent general subagent (session ses_dea16e50affeFMqQEZ8d4V6nAX).
Read-only audit of three Lean files against 93 pinned tariff units.
Not legal advice; not a completeness claim.

## Verdict: PASS
- Python sweep: 11 (rate_num, rate_den, floor) pairs × 231 prices × 6 kg
  weights = 15,246 checks comparing the if-comparison implementation with the
  max-form independent spec: **0 mismatches**.
- All 93 units' phrases located in pinned sources with an independent kanji
  parser: 0 parse failures, 0 rate mismatches, 0 floor mismatches. Decimal
  rates 二・八％ → 28/1000 and 二二・四％ → 224/1000 parsed correctly.
- Six sampled units independently re-parsed: `3c2c0c8d…` (25/100,60),
  `8d8123fb…` (50/100,12), `96640b54…` (10/100,6), `e6c416c0…` (7/100,7),
  `36772703…` (224/1000,720), `6aae5e0f…` (28/1000,20) — all matched.
- No forbidden tokens; spec structurally distinct (max vs if-comparison);
  universal agreement tactic-proved, no axiom.
- No statutory misread: no num/den reversal, no wrong floor. Classification
  codes and other tariff conditions are declared out of scope.

ADVERSARIAL_REVIEW recorded only for the six sampled units; the other 87
remain PROVED_SCOPE with a documented sampling gap.
