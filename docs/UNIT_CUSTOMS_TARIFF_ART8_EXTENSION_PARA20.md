# Unit review — 関税定率法 第八条(30)（条件）CONDITION

Normative unit id: `NORM|49816f0201acd08b02754683d53a55008f897714937b0ffa08fdce6bba139efc`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.
Verbatim source text: 「第二十項の規定により延長する場合」 — the case where a designated period is extended under paragraph 20.

Exact source position: `LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/Paragraph#30/Item#1/ItemSentence/Column#1/Sentence#1` — Article 第八条. `find_article_text(...,"第八条")` len 6919 with needle → article-kind locator.

Norm kind: **CONDITION** — a case label in paragraph 30's discriminated case analysis. Paragraph number 20 extracted structurally from the verbatim 第二十項.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The case where the period is extended under paragraph 20 is distinguishable from other bases. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt8ExtensionPara20.lean. |
| D | PASS — transcription audit 356/356. |
| C | Only case discrimination modeled; anchor date, five-year cap, paragraph-20 substance out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt8ExtensionPara20.lean` — ExtensionBasis, extensionParagraph 20, isPara20Extension.
- Independent spec: `SpecIsPara20Extension` propositional equality, equivalent for all inputs; `agree_is_para20_extension` axiom-free.
- Build: full lake build success (1118 jobs); unit theorem axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Anchor date, five-year cap, paragraph-20 substance, legal correctness. Computable slice of one CONDITION norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART8_EXTENSION_PARA20.md`.
