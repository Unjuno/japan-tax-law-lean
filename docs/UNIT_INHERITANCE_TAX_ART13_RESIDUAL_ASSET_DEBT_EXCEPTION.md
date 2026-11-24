# Unit review — 相続税法 第十三条(2) 第三号 EXCEPTION

Normative unit id: `NORM|e1208a4e5009376f0be8af0a4faaca058248f8ac09395b028762e51f640c3ddd`

Law: 325AC0000000073 (相続税法), Act. SHA-256 c01bb9be…5043a7.

Verbatim source text (injected from the queue, not hand-typed): 「前二号に掲げる債務を除くほか、その財産の取得、維持又は管理のために生じた債務」

Exact source position: `LawBody[3]/MainProvision/MainProvision[1]/Article:13/Article#13/Paragraph#2/Item#3/ItemSentence/Sentence#1`.

Norm kind: **EXCEPTION** — a residual debt category: 前二号に掲げる債務を除くほか (excluding the debts in the preceding two items), debts arising from the 取得、維持又は管理のため (acquisition, maintenance or management) of the property. Computable slice: the debt-category discriminator. All statutory terms are reproduced programmatically from the needle; explanatory prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The residual asset debt category is selected; item 1 and item 2 debts are excluded. |
| T | `scripts/ci/transcription_audit.py` article-kind check for InheritanceTaxArt13ResidualAssetDebtException.lean. |
| D | PASS — transcription audit 607/607. |
| C | Only the debt-category discriminator is modeled. Substantive debt valuation, the preceding items' content, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxArt13ResidualAssetDebtException.lean` — `DebtCategory` (item1/item2/residual/other), `isResidualAssetDebt` (false/false/true/false), four boundary theorems.
- Independent spec: `SpecResidualAssetDebt` Prop equality, representationally distinct; theorems axiom-free (rfl, cases).
- Build: full lake build success (1984 jobs); all six unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Substantive debt valuation, preceding items' content, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ART13_RESIDUAL_ASSET_DEBT_EXCEPTION.md`.
