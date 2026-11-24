# Unit review — 租税条約等特例法 art.13(4)（六月以下 / 五十万円以下）

Normative unit id: `NORM|06ce1bd2e2b43bb2fb31d77ec0beca6f0da0b72a0704e63fc9126cbf83722dc9`

Law: 344AC0000000046 (租税条約等の実施に伴う所得税法、法人税法及び地方税法の特例等に関する法律), Act, revision
`344AC0000000046_20260521_508AC0000000012`, snapshot
`data/raw/344AC0000000046_20260521_508AC0000000012.law.json`, sha256
`cd3975f035bee127e86b7cf244e137d624685182c7523f46a38c43f2e977b9ce`.

Verbatim source text: 「次の各号のいずれかに該当する場合には、その違反行為をした者は、六月以下の拘禁刑又は五十万円以下の罰金に処する。」 (verbatim-unique).
Kind: **CONDITION** — penalty ceilings (imprisonment ≤ 6 months OR fine ≤ 500,000 yen).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This paragraph caps imprisonment at six months and, as an alternative, the fine at 500,000 yen. |
| T (reproduction) | Durable pin `data/TRANSCRIPTION_PINS/PenaltyCeilingsSixMonthsFiveHundredThousand.json`: law 344AC0000000046, article 第十三条, verbatim needle unique. Generator checks pass; spec literals `{6, 500000}` verified against 原文. |
| D (decision) | PASS — needle located uniquely in scoped Article 第十三条; 六 = 6 and 五十万 = 500000 verified. |
| C (competing interpretation) | Reading 以下 as strict `<` would reject the boundary values; kernel theorems `six_months_inclusive` and `five_hundred_thousand_inclusive` reject that. The two penalties are alternatives (又は), not cumulative; the model exposes each ceiling separately. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The 各号 conditions, offence elements and sentencing require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `imprisonmentMonthsCap=6`, `fineYenCap=500000`, with separate `withinImprisonmentCeiling` / `withinFineCeiling` predicates.
- Independent spec: own constants; imprisonment ceiling expressed as negated strict order (`¬ 6 < m`) with universal `agree_imprisonment_months` by structural recursion; fine ceiling with own constant and definitional `agree_fine_yen`. Both axiom-free.
- Boundary theorems: 6 inclusive, 7 rejected, 500000 inclusive, 500001 rejected.
- Tests: 16 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

## Not modelled (explicitly retained as unhandled scope)

The 各号 conditions that trigger the penalty, offence elements, which alternative
applies, sentencing rules, other paragraphs and enforcement rules. This is a
computable slice of the two numeric ceilings in one CONDITION norm unit.

## Adversarial review

See `docs/adversarial/reviews-penalty-ceilings-six-months-five-hundred-thousand.md` (H/T/D/C/U per check).
No legal correctness is claimed; human legal review remains pending.
