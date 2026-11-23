# Unit review — 地価税法施行規則 art.3(6)(1)（修業期間一年以上）

Normative unit id: `NORM|f419b346978e27bf42b959afb590a4b25283346677b360f6c0c6e56d429b8c8f`

Law: 403M50000040031 (地価税法施行規則), MinisterialOrdinance, revision
`403M50000040031_20260401_508M60000040010`, snapshot
`data/raw/403M50000040031_20260401_508M60000040010.law.json`, sha256
`05474a3f79500c643a169b991d9a1cefe7d03dea229849424d511a9f3db13816`.

Verbatim source text: 「修業期間が一年以上であること。」 (verbatim-unique).
Kind: **CONDITION** — training period >= 1 year.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This item requires a training period of at least one year. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` durable pin `data/TRANSCRIPTION_PINS/TrainingPeriodOneYear.json`: law 403M50000040031, article 第三条, verbatim needle unique. Full audit: 467/467 passed. |
| D (decision) | PASS — needle located uniquely in scoped Article 第三条. |
| C (competing interpretation) | Reading 以上 as strict `>` would reject exactly one year; kernel theorem `floor_inclusive` rejects that. |
| U (uncertainty) | Structural spec: the statutory numeral 一 (1) is treated as structural, so source correspondence is anchored by the verbatim needle. Transcription fidelity only, not legal correctness; the qualification and 修業 definition require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `trainingFloorYears=1`, `meetsTrainingPeriod y := decide (1 <= y)`.
- Independent spec: `specMeetsTraining y := decide (¬ y < 1)` (negated strict order — distinct operator); universal `agree_training_floor` over all Nat, kernel-checked with `by omega`.
- Boundary theorems: `floor_inclusive` (1 qualifies), `zero_false`, `two_true`.
- Tests: kernel-decided examples with boundary categories `{zero, small_input, saturation}`.

## Not modelled (explicitly retained as unhandled scope)

The qualification, 修業 definition, other items/paragraphs and enforcement
rules. This is a computable slice of one CONDITION norm unit.

## Adversarial review

See `docs/adversarial/reviews-training-period-one-year.md` (H/T/D/C/U per check).
No legal correctness is claimed; human legal review remains pending.
