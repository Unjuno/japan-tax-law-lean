# Unit review — 関税定率法 第十二条(1)（条件）CONDITION

Normative unit id: `NORM|87b9f966c634326085c0f7d1a57c6e1e84993c717043f092084c05da4d7e4fe8`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.
Verbatim source text: 「凶作の場合又は天災、事変その他の緊急の場合において必要があるとき。」 — an enumerated case condition (mining or natural-disaster/incident emergency). The verbatim — including the source's own 「場合互は」 characters — is injected from the queue, never hand-typed or "corrected".

Exact source position: `LawBody[1]/MainProvision/MainProvision[23]/Article:12/Article#12/Paragraph#1/Item#2/ItemSentence/Sentence#1` — Article 第十二条 (Num=12). `find_article_text(...,"第十二条")` len 468 with needle → article-kind locator.

Norm kind: **CONDITION** — a case-discrimination label.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The enumerated case triggers application; the ordinary case does not. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt12MiningEmergencyCondition.lean. |
| D | PASS — transcription audit 403/403. |
| C | Only case discrimination modeled; substantive treatment out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt12MiningEmergencyCondition.lean` — Case, appliesTo.
- Independent spec: `SpecEnumerated` propositional equality; `agree_applies` axiom-free.
- Build: full lake build success (1264 jobs); all unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Substantive customs treatment, legal effect mechanics, legal correctness. Computable slice of one CONDITION norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART12_MINING_EMERGENCY_CONDITION.md`.
