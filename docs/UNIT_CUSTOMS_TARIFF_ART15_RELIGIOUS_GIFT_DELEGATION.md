# Unit review — 関税定率法 第十五条(1)（特定用途免税）DELEGATION

Normative unit id: `NORM|fa7a3092ac09ddfe08ed1fc2f6df6297910fd9d29f82ded988b0f644938c19fa`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.

Verbatim source text: 「儀式又は礼拝の用に直接供するため宗教団体に寄贈された物品で財務省令で定めるもの」 — a DELEGATION: a class of articles donated to a religious body for direct use at ceremonies/weddings is prescribed by **財務省令** (an Ordinance of the Ministry of Finance), not by 政令 (Cabinet Order). The verbatim is injected from the authoritative queue, never hand-typed or "corrected".

Exact source position: `LawBody[1]/MainProvision/MainProvision[28]/Article:15/Article#15/Paragraph#1/Item#4/ItemSentence/Sentence#1` — Article 第十五条 (Num=15), caption （特定用途免税）. `find_article_text(...,"第十五条")` len 1419 with needle → article-kind locator.

Norm kind: **DELEGATION** — prescription of a goods class by 財務省令.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The prescribed-goods class is set by 財務省令 (Ministry-of-Finance Ordinance), not by 政令 or the Act itself. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt15ReligiousGiftDelegation.lean. |
| D | PASS — transcription audit 408/408. |
| C | Only the delegating structure and listed/other discrimination modeled; ordinance content and substantive treatment out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt15ReligiousGiftDelegation.lean` — `GoodsClass` (listed/other), `Authority` (act/cabinetOrder/financeMinistryOrdinance), `prescriptionAuthority = financeMinistryOrdinance`.
- Independent spec: `SpecFinanceOrdinance` propositional predicate, representationally distinct from the constant; `agree_prescription_authority` axiom-free (rfl); `spec_not_cabinet` axiom-free (intro/cases).
- Build: full lake build success (1282 jobs); all five unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Ordinance content, substantive customs treatment, legal effect mechanics, legal correctness. Computable slice of one DELEGATION norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART15_RELIGIOUS_GIFT_DELEGATION.md`.
