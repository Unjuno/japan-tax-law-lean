# Unit review — 災害被害者租税減免法施行政令 第十六条(1) 第二号 REFERENCE

Normative unit id: `NORM|cbfd2fefa6e563861d9c68c577bdb9a62bb972f4231212d735d31790229829ee`

Law: 322CO0000000268 (災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令), CabinetOrder. SHA-256 f6fe1c93…f5f4e7ef.

Verbatim source text (injected from the queue, not hand-typed): 「同項に規定する申請書の提出があつた日」

Exact source position: `LawBody[1]/MainProvision/MainProvision[22]/Article:16/Article#16/Paragraph#1/Item#2/ItemSentence/Column#2/Sentence#1`. The source uses the old kana spelling あつた, preserved verbatim.

Norm kind: **REFERENCE** — a temporal anchor: the day on which the application form prescribed in the same paragraph was submitted. Computable slice: the anchor selection (submission day, not another reference date). CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The selected temporal anchor is the application submission day, not another date. |
| T | `scripts/ci/transcription_audit.py` article-kind check for DisasterTaxReliefOrderArt16ApplicationSubmissionDay.lean. |
| D | PASS — transcription audit 612/612. |
| C | Only the anchor selection is modeled. The actual date value, the application form's substance, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/DisasterTaxReliefOrderArt16ApplicationSubmissionDay.lean` — `TimeAnchor` (submissionDay/other), `timeAnchor=submissionDay`, two boundary theorems.
- Independent spec: `SpecTimeAnchor` Prop equality, representationally distinct; implementation/other theorems axiom-free (rfl, cases).
- Build: full lake build success (2002 jobs); all four unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Actual date value, application substance, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_DISASTER_TAX_RELIEF_ORDER_ART16_APPLICATION_SUBMISSION_DAY.md`.
