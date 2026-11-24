# Unit review — 租税特別措置透明化法 art.12（二年以下 / 百万円以下）

Normative unit id: `NORM|aa899a2aff6a364b1a8e0838170134762b03cd0a9655819f9a51aca918a2f697`

Law: 422AC0000000008 (租税特別措置の適用状況の透明化等に関する法律), Act, revision
`422AC0000000008_20260401_507AC0000000013`, snapshot
`data/raw/422AC0000000008_20260401_507AC0000000013.law.json`, sha256
`c77407cb86390875550d2fc40f5f88a1225b29e4b8cbd2618abff1dadeabbf11`.

Verbatim source text: 「第九条の規定に違反して、その業務に関して知り得た個人又は法人その他の団体の秘密を漏らした者は、二年以下の拘禁刑又は百万円以下の罰金に処する。」 (verbatim-unique).
Kind: **CONDITION** — penalty ceilings (imprisonment ≤ 2 months OR fine ≤ 1,000,000 yen).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This article caps imprisonment at two months and, as an alternative, the fine at one million yen. |
| T (reproduction) | Durable pin `data/TRANSCRIPTION_PINS/SecrecyBreachPenaltyCeilings.json`: law 422AC0000000008, article 第十二条, verbatim needle unique. Generator checks pass; `spec_literals = {2, 1000000}` verified against 原文. |
| D (decision) | PASS — needle located uniquely in scoped Article 第十二条; 二 = 2 and 百万 = 1000000 verified. |
| C (competing interpretation) | 以下 is inclusive (boundary theorems reject strict `<`); the penalties are alternatives (又は), not cumulative — two separate predicates. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. 第九条's duty, offence elements and sentencing require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: separate `imprisonmentMonthsCap=2` and `fineYenCap=1000000` predicates.
- Independent spec: own constants; imprisonment via negated strict order with universal structural-recursion theorem; fine via definitional `agree_fine_yen`. Both axiom-free.
- Boundary theorems: 2 inclusive / 3 rejected; 1000000 inclusive / 1000001 rejected.
- Tests: 16 kernel-decided examples; 5 boundary categories.

## Not modelled

第九条's duty, offence elements, which alternative applies, sentencing rules and
other articles. This is a computable slice of the two numeric ceilings.

## Adversarial review

See `docs/adversarial/reviews-secrecy-breach-penalty-ceilings.md` (H/T/D/C/U per check).
No legal correctness claimed; human legal review pending.
