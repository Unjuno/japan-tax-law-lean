# Unit review — 関税定率法 第九条(13)（条件）CONDITION

Normative unit id: `NORM|295ccda6a0b3cf28951dffd64407d01984af6262dd2e744bd27833c6c2af1e52`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.
Verbatim source text: 「過去五年以内に当該短期の措置に係る貨物について緊急措置が三回以上とられていない場合」 — fewer than three emergency measures were taken for the goods in the past five-year window.

Exact source position: `LawBody[1]/MainProvision/MainProvision[19]/Article:9/Article#9/Paragraph#13/Item#2/ItemSentence/Sentence#1` — Article 第九条 (Num=9). `find_article_text(...,"第九条")` len 4135 with needle → article-kind locator.

Norm kind: **CONDITION** — numeric-boundary case label. Window 5 years and threshold 3 measures extracted structurally from the verbatim; all statutory strings injected from the queue (no hand-typed CJK).

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The condition holds iff fewer than 3 emergency measures were taken in the 5-year window (boundary at 3). |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt9ShortTermCondition.lean. |
| D | PASS — transcription audit 359/359. |
| C | Only the numeric boundary slice modeled; measure substance/goods scope/legal effect out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt9ShortTermCondition.lean` — lookbackYears 5, thresholdCount 3, conditionMet Bool gate.
- Independent spec: `SpecConditionMet` negated antonym; `agree_condition` axiom-free via core Nat/decide lemmas.
- Build: full lake build success (1171 jobs); all unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Measure substance, goods scope, legal effect, legal correctness. Computable slice of one CONDITION norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART9_SHORT_TERM_CONDITION.md`.
