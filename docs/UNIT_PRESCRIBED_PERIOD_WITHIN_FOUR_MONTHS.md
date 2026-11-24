# Unit review — 不当廉売関税等政令 art.17（四月以内の期間）

Normative unit id: `NORM|037bb6e3fe28f9a5a0fe2cccca2f02f31361d9cab5042c7b8502186955db1cdb`

Law: 406CO0000000416 (不当廉売関税等に関する政令), CabinetOrder, revision
`406CO0000000416_20260401_508CO0000000085`, snapshot
`data/raw/406CO0000000416_20260401_508CO0000000085.law.json`, sha256
`d974e780d80a9ce51dec77692539d954417b8382bed7af33a0ba949066e21425`.

Verbatim source text: 「法第八条第九項に規定する政令で定める期間は、四月以内の期間とする。」
(verbatim-unique). Kind: **DELEGATION** — period at most 4 months.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This article ceilings the prescribed period at four months. |
| T (reproduction) | Durable pin `data/TRANSCRIPTION_PINS/PrescribedPeriodWithinFourMonths.json`: law 406CO0000000416, article 第十七条, verbatim needle unique. Generator checks pass. |
| D (decision) | PASS — needle located uniquely in scoped Article 第十七条; 四 = 4 verified. |
| C (competing interpretation) | Reading 以内 as strict `<` would reject exactly four months; kernel theorem `cap_inclusive` rejects that. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The underlying 法第八条第九項 matter and what the period measures require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `periodMonthCap=4`, `withinPrescribedPeriod m := decide (m <= 4)`.
- Independent spec: `specMonthCap := 4`, `specWithinPeriod m := decide (¬ 4 < m)` (negated strict order — distinct operator); universal `agree_period_cap` over all Nat, kernel-checked by structural recursion (axiom-free).
- Boundary theorems: `cap_inclusive` (4 qualifies), `five_false`, `three_true`.
- Tests: 11 kernel-decided examples; 5 generator boundary categories including `{zero, small_input, saturation}`.

## Not modelled (explicitly retained as unhandled scope)

The underlying 法第八条第九項 matter, what the period measures, other articles
and enforcement rules. The ¶1 proviso extending the period (六月以内／九月以内
in prescribed cases) is a separate EXCEPTION unit and is NOT MODELLED here.
This is a computable slice of one DELEGATION norm unit.

## Adversarial review

See `docs/adversarial/reviews-prescribed-period-within-four-months.md` (H/T/D/C/U per check).
No legal correctness is claimed; human legal review remains pending.
