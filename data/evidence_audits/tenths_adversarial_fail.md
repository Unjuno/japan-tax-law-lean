# Independent adversarial review — TenthsFractions / HalfSenRounding: FAIL

Auditor: independent general subagent (session ses_decc635afffeIu0DfWQlcSd9PB).
Read-only audit. Not legal advice; not a completeness claim.

## Verdict: FAIL (1 of 13 tenths units)

- Python sweeps: 3,149 points per rate × 6 rates + roundSen over [0,1000]:
  0 mismatches between implementation and independent spec. SHA-256 of all
  8 cited sources matched pins. All six Lean files free of forbidden markers.
- 12 of 13 tenths units and both 五十銭 units matched their pinned phrases.

## Genuine statutory misread
Unit `1639d5959edea6a590d409b8a469f4d99652f922853340ac13cfa0f7309129fe`
(363CO360, 第25_5条) was tokenized as `十分の百` and modelled as
`tenths100 a = a*100/10 = a*10`. The pinned source contains **百十分の百**
(100/110 = 10/11), with an additional 百八分の百 case; the leading 百 was
dropped during tokenization. Numeric effect: for a=110 the statute gives 100
but the model gives 1100 (~11× overstatement); a=1000 gives 909 vs 10000.
This is not a declared scope gap — internal spec agreement is not fidelity.

## H/T/D/C/U
H = the unit's rate is 100/110, not 100/10. T = verbatim source phrase
(18 occurrences of 百十分の百) + Python counter-example a=110. D = FAIL for
`tenths100`. C = the truncated token 十分の百 also occurs as a substring of
百十分の百; token-level matching cannot distinguish them. U = the 百八分の百
special case is not modelled.

## Action
The unit was BLOCKED, then re-modelled with the exact fraction 100/110
(`FractionRates110`); the wrong family axes were replaced. No
ADVERSARIAL_REVIEW axis is claimed from this review for that unit.
The other 12 tenths units and the 2 sen units are unaffected.
