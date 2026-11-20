# Unit review — 災害被害者租税減免法 art.2(1)（合計所得金額七百五十万円以下）

Normative unit id: `NORM|ef7f5c0f1105d358392be865c4f7bac9f076278926d6a9faa8be0e5f000d68a2`

Law: 322AC0000000175 (災害被害者に対する租税の減免、徴収猶予等に関する法律),
revision `322AC0000000175_20220101_503AC0000000011`,
snapshot `data/raw/322AC0000000175_20220101_503AC0000000011.law.json`,
sha256 `c3bb5b0bdffbdefd2ee5f358d90ad9e0922d4c887ecb2b133aa7d613f5f4e7ef`.

Verbatim source text: 「合計所得金額が七百五十万円以下であるとき」

Exact source position (from the generated queue):
`LawBody[1]/MainProvision/MainProvision[1]/Article:2/Article#2/Paragraph#1/List/ListSentence/Column#1/Sentence#1`.
Norm kind: **CONDITION** (income threshold; inclusive 「以下」).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | art.2(1) lists a condition that total income amount is at most 7,500,000 yen (七百五十万円以下). 「以下」 is inclusive, so income exactly 7.5M qualifies. Unit 円; domain Nat. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` check 「災害被害者租税減免法 art.2(1)…↔ DisasterVictimIncomeLimit.lean (incomeLimit 7500000)」 pinned to law 322AC0000000175, article locator 第二条, verbatim fragment needle. Full-file count 1, located in Article 2 / Paragraph 1 / List / Column. |
| D (decision) | PASS — audit reports `180/180 checks passed`. |
| C (competing interpretation) | The needle is a clause fragment (no terminal 「。」), pinned verbatim. 七百五十万円 = 7,500,000 (750 × 10,000). The 合計所得金額 definition and the relief/deferment effects are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/DisasterVictimIncomeLimit.lean` — `incomeLimit : Money := 7_500_000`, `withinIncomeLimit totalIncome := totalIncome ≤ incomeLimit`.
- Independent spec: `specWithinIncomeLimit totalIncome := totalIncome - incomeLimit = 0` (truncated subtraction) — different from `≤`; `agree_income_limit` universal over all incomes.
- Boundary theorems: `income_at_limit`, `income_one_over_fails`, `income_monotone` (all variables).
- Build: `lake build` → full build success (590 jobs); axiom profile standard (one `propext`, three axiom-free); no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The other art.2(1) conditions, the substantive relief/deferment effects, the definition of 合計所得金額, other paragraphs, 政令 details. This is a computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_DISASTER_VICTIM_INCOME_LIMIT_2_1.md` (H/T/D/C/U per finding).
