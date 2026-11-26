# Unit review — 相続税法 第四条 ArticleCaption DEEMING

Normative unit id: `NORM|231c551d81dabb99d1af6fba695e53d8baf56b0b7e48a165b245be1e56c4226c`

Law: 325AC0000000073 (相続税法), Act. SHA-256 c01bb9be…f275043a7.

Verbatim source text (injected from the queue, not hand-typed): 「（遺贈により取得したものとみなす場合）」

Exact source position: `LawBody[3]/MainProvision/MainProvision[0]/Article:4/Article#4/ArticleCaption` — the needle IS the ArticleCaption; whole-law locator used.

Norm kind: **DEEMING** (with CONDITION aspect) — the caption labels cases in which property is deemed to have been acquired by inheritance. Computable slice: the classification of deemed/actual inheritance cases vs unrelated acquisitions, plus the deeming transformation. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | A deemed acquisition is classified as inheritance; an unrelated acquisition is not. |
| T | `scripts/ci/transcription_audit.py` whole-law check for InheritanceTaxArt4DeemedAcquisitionCaption.lean. |
| D | PASS — transcription audit 649/649. |
| C | Only the structural classification/deeming slice is modeled. Substantive conditions, valuation, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxArt4DeemedAcquisitionCaption.lean` — `Acquisition` (deemedByInheritance/byInheritance/other), `classifiedAsInheritance`, `deemAsInheritance`, five boundary theorems.
- Independent spec: `SpecClassified` Prop disjunction and `SpecDeeming` implication, representationally distinct; equivalence/implication agreement proved by cases. A catch-all pattern in the deeming function was found to introduce `propext` and was replaced with fully explicit branches; all seven unit theorems now axiom-free with no `decide`/`simp`/`propext`.
- Build: full lake build success (2158 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Substantive conditions, valuation, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ART4_DEEMED_ACQUISITION_CAPTION.md`.
