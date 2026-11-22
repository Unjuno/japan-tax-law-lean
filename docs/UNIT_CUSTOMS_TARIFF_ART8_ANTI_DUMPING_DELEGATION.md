# Unit review — 関税定率法 第八条(37)（委任）DELEGATION

Normative unit id: `NORM|0187b7b5ea69015b97344eeb2e2b28eef7be540ff68900577a2e77b1fc6273fe`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.
Verbatim source text: 「前各項に定めるもののほか、不当廉売関税の適用に関し必要な事項は、政令で定める。」 — besides matters in the preceding paragraphs, matters necessary for 不当廉売関税 application are prescribed by 政令.

Exact source position: `LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/Paragraph#37/ParagraphSentence/Sentence#1` — Article 第八条. `find_article_text(...,"第八条")` len 6919 with needle → article-kind locator.

Norm kind: **DELEGATION** — residual delegation. Statutory term 不当廉売関税 and residual 前各項に定めるもののほか / 政令で定める extracted structurally from the verbatim.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | In-Act matters remain with the Act; necessary application matters are delegated to 政令. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt8AntiDumpingDelegation.lean. |
| D | PASS — transcription audit 352/352. |
| C | Only delegating structure modeled; actual 政令 content out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt8AntiDumpingDelegation.lean` — Matter, LegalSource, determinedBy.
- Independent spec: two propositions, equivalent for both constructors; agreement theorems axiom-free.
- Build: full lake build success (1133 jobs); all unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Actual 政令 content, other articles, legal correctness. Computable slice of one DELEGATION norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART8_ANTI_DUMPING_DELEGATION.md`.
