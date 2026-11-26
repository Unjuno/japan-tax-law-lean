# Unit review — 相続税法 第26条の2(5) DELEGATION

Normative unit id: `NORM|71d63adebe639fdaa8b15a6c233f2b4f772ce393e183c33416e482e41a551e57`

Law: 325AC0000000073 (相続税法), Act. SHA-256 c01bb9be…f275043a7.

Verbatim source text (injected from the queue, not hand-typed): 「前二項に定めるもののほか、土地評価審議会の組織及び運営に関し必要な事項は、政令で定める。」

Exact source position: `LawBody[3]/MainProvision/MainProvision[2]/Article:26_2/Article#26_2/Paragraph#5/ParagraphSentence/Sentence#1`.

Norm kind: **DELEGATION** — beyond the preceding two paragraphs, matters necessary for the land valuation council's organisation and operation are prescribed by Cabinet Order. Computable slice: delegation-target selection. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Cabinet Order is selected as the delegation target; statute is not. |
| T | `scripts/ci/transcription_audit.py` whole-law check for InheritanceTaxArt26_2CouncilDelegation.lean. |
| D | PASS — transcription audit 757/757. |
| C | Only target selection is modeled. Delegated Cabinet Order content and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxArt26_2CouncilDelegation.lean` — `DelegationTarget`, `delegationTarget=cabinetOrder`, two boundary theorems.
- Independent spec: `SpecDelegationTarget` Prop equality, representationally distinct; all four unit theorems axiom-free (rfl, cases).
- Build: full lake build success (2551 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Delegated Cabinet Order content, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ART26_2_COUNCIL_DELEGATION.md`.
