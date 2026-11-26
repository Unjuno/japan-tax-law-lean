# Unit review — 関税定率法 第9条の2(2) DELEGATION

Normative unit id: `NORM|394bf11a8e17fa0cc29bcf58c0b9cfbc097d3c85ea48474966bcde22e685466e`

Law: 143AC0000000054 (関税定率法), Act. SHA-256 924a01d3…86ae9c.

Verbatim source text (injected from the queue, not hand-typed): 「前項の割当ての方法、割当てを受ける手続その他同項の規定の適用に関して必要な事項は、政令で定める。」

Exact source position: `LawBody[1]/MainProvision/MainProvision[20]/Article:9_2/Article#9_2/Paragraph#2/ParagraphSentence/Sentence#1`.

Norm kind: **DELEGATION** — matters necessary for applying the preceding paragraph's allocation method, procedures for receiving an allocation, and other necessary matters are delegated to Cabinet Order. Computable slice: delegation-target selection only. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The delegation target is Cabinet Order, not statute or an unspecified target. |
| T | `scripts/ci/transcription_audit.py` whole-law check for CustomsTariffArt9_2AllocationDelegation.lean. |
| D | PASS — transcription audit 707/707. |
| C | Only target selection is modeled. The delegated Cabinet Order content and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt9_2AllocationDelegation.lean` — `DelegationTarget`, `delegationTarget=cabinetOrder`, three boundary theorems.
- Independent spec: `SpecDelegationTarget` Prop equality, representationally distinct; implementation/statute/other theorems axiom-free (rfl, cases).
- Build: full lake build success (2344 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Delegated Cabinet Order content, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART9_2_ALLOCATION_DELEGATION.md`.
