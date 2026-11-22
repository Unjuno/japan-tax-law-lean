# Unit review — 関税定率法 第九条(15)（委任）DELEGATION

Normative unit id: `NORM|0487f141eafcb7225b2ec1466a95d1352b743d3d6d2c42f1a051d94cb6f14f03`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.
Verbatim source text: 「前各項に定めるもののほか、これらの規定の適用に関し必要な事項は、政令で定める。」 — besides matters in the preceding paragraphs, matters necessary for これらの規定 application are prescribed by 政令.

Exact source position: `LawBody[1]/MainProvision/MainProvision[19]/Article:9/Article#9/Paragraph#15/ParagraphSentence/Sentence#1` — Article 第九条 (Num=9). `find_article_text(...,"第九条")` len 4135 with needle → article-kind locator.

Norm kind: **DELEGATION** — residual delegation. Statutory term これらの規定 and residual 前各項に定めるもののほか / 政令で定める extracted structurally from the verbatim.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | In-Act matters remain with the Act; necessary application matters are delegated to 政令. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt9Delegation.lean. |
| D | PASS — transcription audit 356/356. |
| C | Only delegating structure modeled; actual 政令 content out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt9Delegation.lean` — Matter, LegalSource, determinedBy.
- Independent spec: two propositions, equivalent for both constructors; agreement theorems axiom-free.
- Build: full lake build success (1150 jobs); all unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Actual 政令 content, other articles, legal correctness. Computable slice of one DELEGATION norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART9_DELEGATION.md`.
