# Unit review — 相続税法 第6条(2) READING

Normative unit id: `NORM|6a9778cbcc93bdfeea0959a2d1564eb147745c8fdb27015070e8875a83e9923e`

Law: 325AC0000000073 (相続税法), Act. SHA-256 c01bb9be…f275043a7.

Verbatim source text (injected from the queue, not hand-typed; old kana preserved): 「前項の規定は、定期金給付契約について返還金その他これに準ずるものの取得があつた場合について準用する。」

Exact source position: `LawBody[3]/MainProvision/MainProvision[0]/Article:6/Article#6/Paragraph#2/ParagraphSentence/Sentence#1`.

Norm kind: **READING** (with CONDITION aspect) — the preceding paragraph applies mutatis mutandis where an annuity contract has yielded a refund or similar acquisition. Computable slice: case selection. CJK in the quote is byte-verbatim from the pinned source, including the old kana spelling; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | A refund-acquisition case is read in; an unrelated case is not. |
| T | `scripts/ci/transcription_audit.py` whole-law check for InheritanceTaxArt6RefundReading.lean. |
| D | PASS — transcription audit 767/767. |
| C | Only case selection is modeled. The preceding paragraph's content and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxArt6RefundReading.lean` — `Case`, `applies`, three boundary theorems.
- Independent spec: `SpecApplies` as a Prop disequality, representationally distinct; five unit theorems axiom-free (trivial, cases).
- Build: full lake build success (2578 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Content of the preceding paragraph, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ART6_REFUND_READING.md`.
