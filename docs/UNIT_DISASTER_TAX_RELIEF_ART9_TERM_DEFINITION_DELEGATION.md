# Unit review — 災害被害者租税減免法 第九条(2) DELEGATION

Normative unit id: `NORM|200175613e1a4cd1c5e1d7911ce4f45bd97c4d71bebd705ed18c1f06db87cab1`

Law: 322AC0000000175 (災害被害者に対する租税の減免、徴収猶予等に関する法律), Act. SHA-256 c3bb5b0b…f5f4e7ef.

Verbatim source text (injected from the queue, not hand-typed): 「前項において、次の各号に掲げる用語の意義は、当該各号に定めるところによる。」

Exact source position: `LawBody[1]/MainProvision/MainProvision[8]/Article:9/Article#9/Paragraph#2/ParagraphSentence/Sentence#1` — the whole ParagraphSentence is this sentence; Paragraph 2 also contains Item#1–3 with the actual term definitions (those items are a separate norm, NOT MODELLED here).

Norm kind: **DELEGATION** — a definitional delegation clause: in 前項, the 用語の意義 (meanings of terms) are as prescribed by the following 各号. Computable slice: the definition-source selection (listed items, not other). All statutory terms derived programmatically from the needle; no hand-typed CJK.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The meanings of terms in the preceding paragraph are supplied by the listed items, not by another source. |
| T | `scripts/ci/transcription_audit.py` article-kind check for DisasterTaxReliefArt9TermDefinitionDelegation.lean. |
| D | PASS — transcription audit 560/560. |
| C | Only the definition-source selection is modeled. The content of the items' definitions, the preceding paragraph's substance, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/DisasterTaxReliefArt9TermDefinitionDelegation.lean` — `DefinitionSource` (listedItems/other), `definitionSource=listedItems`, two boundary theorems.
- Independent spec: `SpecDefinitionSource` Prop equality, representationally distinct; implementation/other theorems axiom-free (rfl, cases).
- Build: full lake build success (1816 jobs); all four unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Item definitions, preceding paragraph substance, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_DISASTER_TAX_RELIEF_ART9_TERM_DEFINITION_DELEGATION.md`.
