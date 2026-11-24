# Unit review — 相続税法 第二十五条(1) 第一号 CONDITION

Normative unit id: `NORM|fa8a8f71f0be091e2a94232147a20ebd42a46628962557f1d83fdafcdab82cbb`

Law: 325AC0000000073 (相続税法), Act. SHA-256 c01bb9be…5043a7.

Verbatim source text (injected from the queue, not hand-typed): 「当該契約に係る掛金又は保険料が一時に払い込まれた場合」

Exact source position: `LawBody[3]/MainProvision/MainProvision[2]/Article:25/Article#25/Paragraph#1/Item#1/Subitem1#1/Subitem1Sentence/Column#1/Sentence#1`.

Norm kind: **CONDITION** — a valuation-rule branch condition: 当該契約に係る掛金又は保険料 (the premium or insurance payment under the contract) was paid in a lump sum (一時に払い込まれた). Computable slice: the payment-timing discriminator selecting this branch. All statutory terms derived programmatically from the needle; no hand-typed CJK.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Lump-sum payment selects this valuation branch; other timing does not. |
| T | `scripts/ci/transcription_audit.py` article-kind check for InheritanceTaxArt25LumpSumPremiumCondition.lean. |
| D | PASS — transcription audit 597/597. |
| C | Only the payment-timing discriminator is modeled. The column's valuation amount, the other items' branches, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxArt25LumpSumPremiumCondition.lean` — `PaymentTiming` (lumpSum/other), `isLumpSum` (true/false), two boundary theorems.
- Independent spec: `SpecLumpSum` Prop equality, representationally distinct; implementation/other theorems axiom-free (rfl, cases).
- Build: full lake build success (1957 jobs); all four unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Column valuation amount, other branches, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ART25_LUMP_SUM_PREMIUM_CONDITION.md`.
