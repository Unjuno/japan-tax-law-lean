# Unit review — 相続税法 第1条の2(1) DELEGATION

Normative unit id: `NORM|5535e9d60fcc528b55dc71a8ebb602f33891361f92b80dab7ad53701dca864dd`

Law: 325AC0000000073 (相続税法), Act. SHA-256 c01bb9be…f275043a7.

Verbatim source text (injected from the queue, not hand-typed): 「この法律において、次の各号に掲げる用語の意義は、当該各号に定めるところによる。」

Exact source position: `LawBody[3]/MainProvision/MainProvision[0]/Article:1_2/Article#1_2/Paragraph#1/ParagraphSentence/Sentence#1`.

Norm kind: **DELEGATION** (with REFERENCE aspect) — in this Act, the meaning of each listed term is governed by the respective following item. Computable slice: definition-source selection. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Following items are selected as the source of term meanings; an unspecified alternative is not. |
| T | `scripts/ci/transcription_audit.py` whole-law check for InheritanceTaxArt1_2TermDefinitionSource.lean. |
| D | PASS — transcription audit 752/752. |
| C | Only the source selection is modeled. Actual term definitions and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxArt1_2TermDefinitionSource.lean` — `DefinitionSource`, `definitionSource=followingItems`, two boundary theorems.
- Independent spec: `SpecDefinitionSource` Prop equality, representationally distinct; all four unit theorems axiom-free (rfl, cases).
- Build: full lake build success (2512 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Actual term definitions, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ART1_2_TERM_DEFINITION_SOURCE.md`.
