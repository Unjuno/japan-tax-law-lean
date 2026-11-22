# Unit review — 関税定率法 第八条の二(17)（委任）DELEGATION

Normative unit id: `NORM|a47e5aa14609c0eef0be0a85e916d931d04b515d7999c7b0c06e8b0680fa73a9`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.
Verbatim source text: 「前各項に定めるもののほか、第一項の規定による関税の適用に関し必要な事項は、政令で定める。」 — besides matters in the preceding paragraphs, matters necessary for 第一項の規定による関税 application are prescribed by 政令.

Exact source position: `LawBody[1]/MainProvision/MainProvision[18]/Article:8_2/Article#8_2/Paragraph#17/ParagraphSentence/Sentence#1` — Article 第八条の二 (Num=8_2). `find_article_text(...,"第八条の二")` len 4324 with needle → article-kind locator.

Norm kind: **DELEGATION** — residual delegation. Statutory term 第一項の規定による関税 and residual 前各項に定めるもののほか / 政令で定める extracted structurally from the verbatim.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | In-Act matters remain with the Act; necessary application matters are delegated to 政令. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt8_2Delegation.lean. |
| D | PASS — transcription audit 354/354. |
| C | Only delegating structure modeled; actual 政令 content out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt8_2Delegation.lean` — Matter, LegalSource, determinedBy.
- Independent spec: two propositions, equivalent for both constructors; agreement theorems axiom-free.
- Build: full lake build success (1139 jobs); all unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Actual 政令 content, other articles, legal correctness. Computable slice of one DELEGATION norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART8_2_DELEGATION.md`.
