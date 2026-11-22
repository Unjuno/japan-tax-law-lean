# Unit review — 関税定率法 第十八条(4)（準用）READING

Normative unit id: `NORM|33d7dae28845cef88c65728396c225a449cf3732b9a9e4340988b3c8addb54a9`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.

Verbatim source text: 「前条第三項の規定は、第一項の規定により関税の軽減を受けた者について準用する。」 — a READING (準用): the provisions of the preceding article's paragraph 3 (前条第三項, here 第十七条第三項) are read in for a person who received a customs-duty reduction (関税の軽減) under paragraph 1. The verbatim is injected from the authoritative queue, never hand-typed or "corrected".

Exact source position: `LawBody[1]/MainProvision/MainProvision[31]/Article:18/Article#18/Paragraph#4/ParagraphSentence/Sentence#1` — Article 第十八条 (Num=18), caption （再輸出減税）. `find_article_text(...,"第十八条")` len 432 with needle → article-kind locator.

Norm kind: **READING** — cross-paragraph 準用 with source paragraph 3 (前条第三項), preceding-article offset 1, trigger paragraph 1 (第一項), and a recipient class.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The 前条第三項 provisions are read in for a recipient of 第一項 duty reduction, not otherwise. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt18PrevPara3ReliefReading.lean. |
| D | PASS — transcription audit 412/412. |
| C | Only the cross-reference structure (source provision, paragraph numbers, recipient class) modeled; substantive content out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt18PrevPara3ReliefReading.lean` — `Provision` (prevArticlePara3), `PersonClass` (reliefRecipient/other), `appliesViaReading`, `sourceParagraph=3`, `sourceArticleOffset=1`, `triggerParagraph=1`.
- Independent spec: `SpecApplies` explicit recipient-and-provision conjunction, representationally distinct from the implementation function; `agree_applies_via_reading` axiom-free (cases/rfl, no simp/propext/decide).
- Build: full lake build success (1294 jobs); all six unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Substantive content of 前条第三項 and 第一項, how the reduction was granted, other reading rules, legal correctness. Computable slice of one READING norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART18_PREV_PARA3_RELIEF_READING.md`.
