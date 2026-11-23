# Unit review — 租税条約等実施特例法施行令 art.4(1)(4)（限度税率百分の七）

Normative unit id: `NORM|dfc45330a683e8b1b033e5b78eaf211d568a0c15cdf9ae0da6cdd3554c54c4fe`

Law: 362CO0000000335 (租税条約等の実施に伴う所得税法、法人税法及び地方税法の特例等に関する法律施行令),
CabinetOrder, revision `362CO0000000335_20260521_506CO0000000150`, snapshot
`data/raw/362CO0000000335_20260521_506CO0000000150.law.json`, sha256
`8b21ff78cd78a30af9f90521756b31c40e33d0fd919481bb90822de542421e18`.

Verbatim source text: 「限度税率が百分の七である場合」 (verbatim-unique in whole law).
Kind: **CONDITION** — the limit rate is exactly 7/100 (7%).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This item selects the case where the limit rate is 百分の七 = 7/100. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` pin 「租税条約等実施特例法施行令 art.4(1)(4)…↔ LimitRateSevenPercent.lean」 law 362CO0000000335, article 第四条; needle unique. Full audit: 453/453 passed. |
| D (decision) | PASS — needle located uniquely in scoped Article 第四条. |
| C (competing interpretation) | Reading 百分の七 as 7/1000 (a tenfold error) is rejected by the spec's denominator literal 100, which the source-literal audit verifies as 百. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The tax base and the gated measure require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `statutoryRatePercent=7`, `isSevenPercent p := decide (p == 7)`.
- Independent spec: numerator/denominator 7/100 with cross-multiplication
  `p * 100 == 7 * 100` (distinct formulation); universal `agree_rate` over all
  Nat, kernel-checked with `by omega`.
- Boundary theorems: `seven_true` (7 qualifies), `eight_false`, `zero_false`.
- Tests: 12 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

## Not modelled (explicitly retained as unhandled scope)

The tax base, other rate cases (百分の二/五/八/十/十二/十五/十六), the gated
measure, other items/paragraphs and enforcement rules. This is a computable
slice of one CONDITION norm unit.

## Adversarial review

See `docs/adversarial/reviews-limit-rate-seven-percent.md` (H/T/D/C/U per check).
No legal correctness is claimed; human legal review remains pending.
