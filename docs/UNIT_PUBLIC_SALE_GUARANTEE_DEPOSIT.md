# Unit review — 国税徴収法施行令 第四十二条の五（公売保証金: 50万円）

Normative unit id: `NORM|7e9db39251bc28440bf2799c75e0a9d152df7bb0d0dcc984788e68b272d6befd`

Law: 334CO0000000329 (国税徴収法施行令), law number 昭和三十四年政令第三百二十九号,
law_type **CabinetOrder (政令)**, revision `334CO0000000329_20260525_507CO0000000244` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/334CO0000000329_20260525_507CO0000000244.law.json`,
sha256 `f45ac77c8b3c57d8179d041ecda8b8823148e87d2c21512e4518a889c517a83f`.

Verbatim source text: 「法第百条第一項（公売保証金）に規定する政令で定める金額は、五十万円とする。」

Exact source position:
`LawBody[3]/MainProvision/MainProvision[4]/Article:42_5/Article#42_5/Paragraph#1/ParagraphSentence/Sentence#1` — MainProvision Article 第四十二条の五, caption （公売保証金を徴しないで公売することができる財産の見積価額）. `find_article_text(...,"第四十二条の五")` returns that article (len 74) containing the needle → article-kind locator used.

Norm kind: **DELEGATION** — the CabinetOrder fixes the amount for 法第百条第一項（公売保証金）at ¥500,000. The ¥500,000 constant was derived programmatically from the verbatim needle's kanji numeral 五十万円.

Byte fidelity: all Japanese strings (title, law number, article caption, verbatim quote, numeric constant) injected programmatically from authoritative sources — zero hand-typed Japanese. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The delegated 公売保証金 amount is ¥500,000. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「public sale guarantee deposit 500k yen…↔ PublicSaleGuaranteeDeposit.lean」. Full audit: 229/229 checks passed. |
| D (decision) | PASS — audit reports `229/229 checks passed`. |
| C (competing interpretation) | Only the delegated amount is modeled. The underlying Act provision (法第百条), auction procedure, other paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/PublicSaleGuaranteeDeposit.lean` — `publicSaleGuaranteeDepositYen=500_000` (programmatically derived); `amount_decoded` rfl.
- Independent spec: `specAmountPredecessor=499_999` with `agree_amount_successor` (succ predecessor = amount), a boundary decomposition distinct from plain rfl; axiom-free.
- Build: `lake build` → full build success (737 jobs); both theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Underlying Act provision 法第百条, auction procedure, other paragraphs and articles. Computable slice of one DELEGATION norm unit in a CabinetOrder, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_PUBLIC_SALE_GUARANTEE_DEPOSIT.md`.
