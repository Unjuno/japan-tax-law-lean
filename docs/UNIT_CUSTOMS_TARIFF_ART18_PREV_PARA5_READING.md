# Unit review — 関税定率法 第十八条(3)（準用）READING

Normative unit id: `NORM|7c7c72010fb03b1074a0a2d4b307a2077af62f784e1a64424b59c5ee7dbf1101`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.

Verbatim source text: 「この場合においては、前条第五項の規定を準用する。」 — a READING (準用, mutatis-mutandis application): in the trigger case この場合 (article 18 paragraph 3), the provisions of 前条第五項 (the preceding article's paragraph 5 — here 第十七条第五項) are read in. The verbatim is injected from the authoritative queue, never hand-typed or "corrected".

Exact source position: `LawBody[1]/MainProvision/MainProvision[31]/Article:18/Article#18/Paragraph#3/ParagraphSentence/Sentence#2` — Article 第十八条 (Num=18), caption （再輸出減税）. `find_article_text(...,"第十八条")` len 432 with needle → article-kind locator.

Norm kind: **READING** — a cross-paragraph 準用 with source paragraph number 5 (第五項) and preceding-article offset 1 (前条).

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | In この場合, the 前条第五項 provisions are read in; outside it they are not. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt18PrevPara5Reading.lean. |
| D | PASS — transcription audit 409/409. |
| C | Only the cross-reference structure (source provision, trigger case, paragraph number, article offset) modeled; substantive content out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt18PrevPara5Reading.lean` — `Provision` (prevArticlePara5), `Case` (thisCase/other), `appliesViaReading`, `sourceParagraph = 5`, `sourceArticleOffset = 1`.
- Independent spec: `SpecApplies` explicit case-and-provision conjunction, representationally distinct from the implementation function; `agree_applies_via_reading` axiom-free (cases/rfl).
- Build: full lake build success (1285 jobs); all four unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Substantive content of 前条第五項, establishment of この場合, other reading rules, legal correctness. Computable slice of one READING norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART18_PREV_PARA5_READING.md`.
