# Unit review — 関税定率法 第八条(28)（準用）READING

Normative unit id: `NORM|0eddc7c518823f0a15df18f78b861199b1187a2ecf3bf037a5045417ca0e8cbe`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.
Verbatim source text: 「第七項、第八項及び第二十三項の規定は、前項の調査が開始された場合について準用する。」 — the provisions of paragraphs 7, 8 and 23 are read (準用) into the case where the preceding paragraph (前項, para 27) investigation has begun.

Exact source position: `LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/Paragraph#28/ParagraphSentence/Sentence#1` — Article 第八条. `find_article_text(...,"第八条")` len 6919 with needle → article-kind locator.

Norm kind: **READING** — 準用 (mutatis-mutandis application), not a 読替え string substitution. Source paras 7/8/23 and trigger 前項=27 extracted structurally.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The provisions of paragraphs 7, 8 and 23 apply when the 前項 (para 27) investigation has begun. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt8PrevReading7_8_23.lean. |
| D | PASS — transcription audit green. |
| C | Only the cross-reference structure is modeled; substantive content of paras 7/8/23/27 out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt8PrevReading7_8_23.lean` — Provision para7/para8/para23, InvestigationState, appliesViaReading.
- Independent spec: `SpecApplies` three-way disjunction, equivalent for all inputs; `agree_applies_via_reading` axiom-free.
- Build: full lake build success; unit theorem axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Substantive content of paragraphs 7/8/23/27, trigger establishment, other reading rules, legal correctness. Computable slice of one READING norm unit, not an article-level or law-level completion claim.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART8_PREV_READING7_8_23.md`.
