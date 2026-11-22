# Unit review — 関税定率法 第十七条(1)（委任）DELEGATION

Normative unit id: `NORM|35c971a0758598e57593706d43c4732904e25dab80fb92770430a30ab0f83d3f`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.
Verbatim source text: 「加工される貨物又は加工材料となる貨物で政令で定めるもの」 — goods classes (processed goods or goods serving as processing materials) are prescribed by Cabinet Order (政令で定めるもの).

Exact source position: `LawBody[1]/MainProvision/MainProvision[30]/Article:17/Article#17/Paragraph#1/Item#1/ItemSentence/Sentence#1` — Article 第十七条 (Num=17), caption （再輸出免税）. `find_article_text(...,"第十七条")` len 1032 with needle → article-kind locator. Paragraph 1 has 13 enumerated Item nodes extracted structurally.

Norm kind: **DELEGATION**. All statutory strings injected from the queue (no hand-typed CJK).

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The goods class is prescribed by Cabinet Order (政令), not by the Act directly. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt17Delegation.lean. |
| D | PASS — transcription audit 366/366. |
| C | Only delegation structure + listed/other discrimination modeled; Cabinet Order content out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt17Delegation.lean` — GoodsClass, Authority, enumeratedItemCount 13, prescriptionAuthority.
- Independent spec: `SpecCabinetOrder` predicate; two agreement theorems axiom-free.
- Build: full lake build success (1195 jobs); all unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Cabinet Order content, legal effect mechanics, legal correctness. Computable slice of one DELEGATION norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART17_DELEGATION.md`.
