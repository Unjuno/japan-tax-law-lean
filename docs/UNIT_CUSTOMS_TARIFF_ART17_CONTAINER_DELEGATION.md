# Unit review — 関税定率法 第十七条(1) 第2号（委任）DELEGATION

Normative unit id: `NORM|eb942c04756a7ec5c979ef888fe65f217714c5600aa0b2fa2e3585c110e99644`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.
Verbatim source text: 「輸入貨物の容器で政令で定めるもの」 — containers of imported goods are prescribed by Cabinet Order (政令で定めるもの).

Exact source position: `LawBody[1]/MainProvision/MainProvision[30]/Article:17/Article#17/Paragraph#1/Item#2/ItemSentence/Sentence#1` — Article 第十七条 (Num=17). `find_article_text(...,"第十七条")` len 1032 with needle → article-kind locator.

Norm kind: **DELEGATION**. All statutory strings injected from the queue (no hand-typed CJK).

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The goods class (imported-goods containers) is prescribed by Cabinet Order (政令), not by the Act directly. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt17ContainerDelegation.lean. |
| D | PASS — transcription audit 389/389. |
| C | Only delegation structure + listed/other discrimination modeled; Cabinet Order content out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt17ContainerDelegation.lean` — GoodsClass, Authority, prescriptionAuthority.
- Independent spec: `SpecCabinetOrder` predicate; two agreement theorems axiom-free.
- Build: full lake build success (1222 jobs); all unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Cabinet Order content, substantive customs treatment, legal correctness. Computable slice of one DELEGATION norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART17_CONTAINER_DELEGATION.md`.
