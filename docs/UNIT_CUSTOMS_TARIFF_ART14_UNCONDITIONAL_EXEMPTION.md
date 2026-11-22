# Unit review — 関税定率法 第十四条(1)（委任）DELEGATION

Normative unit id: `NORM|f6d35dafe6f1a5d34c574d8205cb86f3a7c970ed725d5ad49d6d7824b4509d64`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.
Verbatim source text: 「次に掲げる貨物で輸入されるものについては、政令で定めるところにより、その関税を免除する。」 — the duty exemption for the enumerated imported goods is prescribed by Cabinet Order (政令で定めるところにより).

Exact source position: `LawBody[1]/MainProvision/MainProvision[25]/Article:14/Article#14/Paragraph#1/ParagraphSentence/Sentence#1` — Article 第十四条 (Num=14), caption （無条件免税）. `find_article_text(...,"第十四条")` len 1655 with needle → article-kind locator. Paragraph 1 has 21 enumerated Item nodes extracted structurally.

Norm kind: **DELEGATION**. All statutory strings injected from the queue (no hand-typed CJK).

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The exemption is prescribed by Cabinet Order (政令), not by the Act directly. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt14UnconditionalExemption.lean. |
| D | PASS — transcription audit 361/361. |
| C | Only delegation structure + listed/other discrimination modeled; item substance and Cabinet Order content out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt14UnconditionalExemption.lean` — Goods, Authority, enumeratedItemCount 21, exemptionAuthority.
- Independent spec: `SpecCabinetOrder` predicate; two agreement theorems axiom-free.
- Build: full lake build success (1177 jobs); all unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Item substance, Cabinet Order content, legal effect mechanics, legal correctness. Computable slice of one DELEGATION norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART14_UNCONDITIONAL_EXEMPTION.md`.
