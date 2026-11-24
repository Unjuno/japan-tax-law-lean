# Unit review — 震災復興特別交付税額算定等省令 art.3(3)（九月額は零）

Normative unit id: `NORM|d749035b746df1b6685fb1a4af5c00df8468570b5fca56b2197055ec3e77861f`

Law: 507M60000008043 (地方団体に対して交付すべき令和七年度分の震災復興特別交付税の額の算定方法、決定時期及び決定額並びに交付時期及び交付額等の特例に関する省令), MinisterialOrdinance, revision
`507M60000008043_20250425_000000000000000`, snapshot
`data/raw/507M60000008043_20250425_000000000000000.law.json`, sha256
`02d256b8f5b48afc01a886eebb88ed78eec7d84d4726a543088115ba8f32f60e`.

Verbatim source text: 「この場合において、令和七年度九月震災復興特別交付税額は零とする。」 (verbatim-unique).
Kind: **CONDITION** — the September special grant amount is set to zero.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | In the cases described by the antecedent, the September 2025 disaster-reconstruction special grant amount is zero. |
| T (reproduction) | Durable pin `data/TRANSCRIPTION_PINS/DisasterGrantSeptemberZero.json`: law 507M60000008043, article 第三条, verbatim needle unique. Generator checks pass; `int_to_kanji(0) = 零` and the verbatim needle is verified directly. Note: `spec_literals` deliberately excludes 0/1 as structural, so the numeric-literal axis is vacuous for this zeroing unit; the kanji check and verbatim pin carry the source audit. |
| D (decision) | PASS — needle located uniquely in scoped Article 第三条/Paragraph 3; 零 = 0 verified independently. |
| C (competing interpretation) | Reading 零とする as "not specified" would admit nonzero amounts; `zero_true`, `one_false`, `two_false` reject that. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The 「この場合」 antecedent, calculation method and other months require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `septemberGrantYen=0`, `isZeroSeptemberGrant y := decide (y == 0)`.
- Independent spec: own zero constant, successor-shifted equality `decide (succ 0 == succ y)`; universal `agree_zero_amount` by structural recursion, axiom-free.
- Boundary theorems: `zero_true`, `one_false`, `two_false`.
- Tests: 9 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

## Not modelled (explicitly retained as unhandled scope)

The 「この場合」 antecedent conditions, the grant calculation method, other
months, and other articles. This is a computable slice of one CONDITION unit.

## Adversarial review

See `docs/adversarial/reviews-disaster-grant-september-zero.md` (H/T/D/C/U per check).
No legal correctness is claimed; human legal review remains pending.
