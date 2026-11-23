# Unit review — 相続税法 第十九条の四(3) READING (準用)

Normative unit id: `NORM|e29e4e105e5b1ef84a82b9e35f096ec01045e79c65186e86f1a2fe08fedcd722`

Law: 325AC0000000073 (相続税法), Act. SHA-256 c01bb9be…5043a7.

Verbatim source text (injected from the queue, not hand-typed): 「前条第二項及び第三項の規定は、第一項の規定を適用する場合について準用する。」

Exact source position: `LawBody[3]/MainProvision/MainProvision[1]/Article:19_4/Article#19_4/Paragraph#3/ParagraphSentence/Sentence#1` — Sentence#1 of Paragraph 3. The enclosing paragraph's Sentence#2 contains a reading-substitution rule (「第十九条の三」), which is a separate norm and NOT MODELLED here.

Norm kind: **READING** — the 準用 (mutatis mutandis / quasi-application) clause: Paragraphs 2 and 3 of the preceding Article apply when Paragraph 1 of this Article is applied. All statutory facts derived from the needle; no hand-typed CJK.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | 前条第二項 and 前条第三項 are quasi-applied; 第一項 is the trigger paragraph and is not itself a quasi-applied source. |
| T | `scripts/ci/transcription_audit.py` article-kind check for InheritanceTaxArt19_4QuasiApplication.lean. |
| D | PASS — transcription audit 474/474. |
| C | Only the quasi-applied source-paragraph set and trigger are modeled. The content of the quasi-applied provisions, the reading-substitution sentence, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxArt19_4QuasiApplication.lean` — `Paragraph` (para1/para2/para3), `triggerParagraph=para1`, `quasiAppliedFromPreceding` (false/true/true), four boundary theorems.
- Independent spec: `SpecQuasiApplied` Prop disjunction, representationally distinct; `spec_para2/para3` and `agree_para2/agree_para1` axiom-free (rfl/left/right, rcases).
- Build: full lake build success (1558 jobs); all eight unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Quasi-applied provision content, reading substitution (Sentence#2), legal correctness.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ART19_4_QUASI_APPLICATION.md`.
