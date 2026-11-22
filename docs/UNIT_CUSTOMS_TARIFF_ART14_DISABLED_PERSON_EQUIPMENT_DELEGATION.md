# Unit review — 関税定率法 第十四条(1) 第16号（委任）DELEGATION

Normative unit id: `NORM|c8d2540f3dcbd0d71d4c31a4833f7616bb803940ef8c78479d752b2588172adc`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.
Verbatim source text: 「身体障害者用に特に製作された器具その他これに類する物品で政令で定めるもの」 — equipment specially made for use by persons with disabilities and similar articles are prescribed by Cabinet Order (政令で定めるもの).

Exact source position: `LawBody[1]/MainProvision/MainProvision[25]/Article:14/Article#14/Paragraph#1/Item#16/ItemSentence/Sentence#1` — Article 第十四条 (Num=14). `find_article_text(...,"第十四条")` len 1655 with needle → article-kind locator.

Norm kind: **DELEGATION**. All statutory strings injected from the queue (no hand-typed CJK).

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The goods class (disabled-person equipment) is prescribed by Cabinet Order (政令), not by the Act directly. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt14DisabledPersonEquipmentDelegation.lean. |
| D | PASS — transcription audit 400/400. |
| C | Only delegation structure + listed/other discrimination modeled; Cabinet Order content out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt14DisabledPersonEquipmentDelegation.lean` — GoodsClass, Authority, prescriptionAuthority.
- Independent spec: `SpecCabinetOrder` predicate; two agreement theorems axiom-free.
- Build: full lake build success (1255 jobs); all unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Cabinet Order content, substantive customs treatment, legal correctness. Computable slice of one DELEGATION norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART14_DISABLED_PERSON_EQUIPMENT_DELEGATION.md`.
