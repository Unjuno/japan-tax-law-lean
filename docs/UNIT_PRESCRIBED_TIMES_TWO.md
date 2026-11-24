# Unit review — 沖縄復帰特例省令 art.26（二回）

Normative unit id: `NORM|23f9f0b92275bf292ef67ec9c8960150c623566ad2a5d52ef238574d14da3a25`

Law: 347M50000040042 (沖縄の復帰に伴う国税関係法令の適用の特別措置等に関する省令),
MinisterialOrdinance, revision `347M50000040042_20251231_507M60000040072`,
snapshot `data/raw/347M50000040042_20251231_507M60000040072.law.json`, sha256
`a403b5c2cb0edd15cd1ad54f18a7a33132c74ac80b7f9afcdce7935b51aaf667`.

Verbatim source text: 「令第八十七条第四項に規定する財務省令で定める回数は、二回とする。」
(verbatim-unique). Kind: **DELEGATION** — the prescribed count is fixed at 2.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This article fixes the number of times prescribed by the ordinance at two. |
| T (reproduction) | Durable pin `data/TRANSCRIPTION_PINS/PrescribedTimesTwo.json`: law 347M50000040042, article 第二十六条, verbatim needle unique. Generator checks pass. |
| D (decision) | PASS — needle located uniquely in scoped Article 第二十六条; 二 = 2 verified. |
| C (competing interpretation) | None affecting the count: 二回 denotes exactly two times, not "at least two". |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The underlying 政令 art.87(4) matter and the procedure require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `prescribedTimes=2`, `isPrescribedCount n := decide (n == 2)`.
- Independent spec: `specTimes := [unit,unit].length`, `specIsPrescribedCount n := decide (succ (succ 0) == n)` (distinct formulation); universal `agree_prescribed_count` over all Nat, kernel-checked by structural recursion (axiom-free).
- Boundary theorems: `two_true` (2 qualifies), `one_false`, `three_false`.
- Tests: 13 kernel-decided examples; 6 boundary categories including `{zero, small_input, saturation}`.

## Not modelled (explicitly retained as unhandled scope)

The underlying 政令 art.87(4) matter, the procedure, other articles and
enforcement rules. This is a computable slice of one DELEGATION norm unit.

## Adversarial review

See `docs/adversarial/reviews-prescribed-times-two.md` (H/T/D/C/U per check).
No legal correctness is claimed; human legal review remains pending.
