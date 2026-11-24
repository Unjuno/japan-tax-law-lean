# Unit review — 相続税法 第十九条 ArticleCaption CONDITION

Normative unit id: `NORM|5516848edbb7f5724c02b0141483fea8ef899ac593f2f53c9f5391cf56330214`

Law: 325AC0000000073 (相続税法), Act. SHA-256 c01bb9be…5043a7.

Verbatim source text (injected from the queue, not hand-typed): 「（相続開始前七年以内に贈与があつた場合の相続税額）」

Exact source position: `LawBody[3]/MainProvision/MainProvision[1]/Article:19/Article#19/ArticleCaption` — the needle IS the ArticleCaption; whole-law locator used for caption nodes. Full Article 19 flat text length 943.

Norm kind: **CONDITION** — the ArticleCaption labels the condition: a 贈与 within 七年以内 before 相続開始前 (inheritance commencement) triggers the 相続税額 (gift add-back) rule. The computable slice models the applicability condition: gift occurred AND years-before-inheritance <= 7 (七年以内 inclusive). All statutory terms derived programmatically from the needle; no hand-typed CJK.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | A gift within seven years (inclusive, years 0–7) applies; beyond seven years or no gift does not. |
| T | `scripts/ci/transcription_audit.py` whole-law check for InheritanceTaxArt19SevenYearGiftCondition.lean. |
| D | PASS — transcription audit 572/572. |
| C | Only the caption-level applicability condition is modeled. The 相続税額 amount computation (GiftAddBack.lean, a separate module), add-back property definition, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxArt19SevenYearGiftCondition.lean` — `applies` (gift && years<=7) with four boundary theorems.
- Independent spec: `SpecApplies` Prop conjunction with Nat inequality, representationally distinct; agreement and universal implication theorems axiom-free (rfl/cases/decide/of_decide_eq_true, no simp).
- Build: full lake build success (1867 jobs); all seven unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Tax amount computation, add-back property definition, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ART19_SEVEN_YEAR_GIFT_CONDITION.md`.
