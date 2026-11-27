# Unit review — 関税定率法 第9条(11) READING

Normative unit id: `NORM|f55c47850f0fe15d2b1a966c8b34dda9488ecbc318966a97e974a14813bff0ad`

Law: 143AC0000000054 (関税定率法), Act. SHA-256 924a01d3…86ae9c.

Verbatim source text (injected from the queue, not hand-typed): 「第六項及び第七項の規定は、第一項の規定により指定された期間を前項の規定により延長する場合について準用する。」

Exact source position: `LawBody[1]/MainProvision/MainProvision[19]/Article:9/Article#9/Paragraph#11/ParagraphSentence/Sentence#1`.

Norm kind: **READING** (with CONDITION aspect) — paragraphs 6 and 7 are read in mutatis mutandis when the designated period is extended under the preceding paragraph. Computable slice: the extension gate. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | An extended period triggers the reading; a non-extended period does not. |
| T | `scripts/ci/transcription_audit.py` whole-law check for CustomsTariffArt9ExtendedPeriodReading.lean. |
| D | PASS — transcription audit 782/782. |
| C | Only the gate is modeled. Content of paragraphs 6/7 and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt9ExtendedPeriodReading.lean` — `applies` on a Bool flag, two boundary theorems.
- Independent spec: `SpecApplies` Prop negation of complementary case, representationally distinct; all three theorems axiom-free.
- Build: full lake build success (2644 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Content of paragraphs 6/7, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART9_EXTENDED_PERIOD_READING.md`.
