# Unit review — 地方税法施行令 第八条の三（政令で定める金額: ¥3,000）

Normative unit id: `NORM|92588e30e308fe82f1159ad13f75bfdaa96ba59a454b7739c70ead26f70ef7c7`

Law: 325CO0000000245 (地方税法施行令), law number 昭和二十五年政令第二百四十五号,
law_type **CabinetOrder (政令)**, revision `325CO0000000245_20261101_508CO0000000083` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/325CO0000000245_20261101_508CO0000000083.law.json`,
sha256 `9bc03b230fb0ed1039e33a1544cd53772939ee25d6d4648a386400ea269dfb17`.

Verbatim source text: 「法第四十七条第一項第一号に規定する政令で定める金額は、三千円とする。」 (三千円 = ¥3,000).

Exact source position:
`LawBody[3]/MainProvision/MainProvision[1]/Article:8_3/Article#8_3/Paragraph#1/ParagraphSentence/Sentence#1` — MainProvision Article 第八条の三, caption （個人の道府県民税の徴収取扱費の算定の基礎となる金額）. `find_article_text(...,"第八条の三")` returns that article (len 66) containing the needle → article-kind locator used.

Norm kind: **DELEGATION** — the CabinetOrder fixes the amount delegated by 法第四十七条第一項第一号 at ¥3,000 (三千円), derived programmatically from the verbatim kanji numeral.

Byte fidelity: all statutory Japanese strings (title, law number, article caption, verbatim quote, numeric amount) injected programmatically from authoritative sources; descriptive prose hand-written but byte-verified (provision reference checked against needle). Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The delegated amount is ¥3,000 (三千円). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「delegated amount 3000 yen…↔ LocalTaxEnforcementDelegatedAmount3000.lean」. Full audit: 252/252 checks passed. |
| D (decision) | PASS — audit reports `252/252 checks passed`. |
| C (competing interpretation) | Only the delegated amount is modeled. The underlying Act provision, the rest of article 8-3, other paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LocalTaxEnforcementDelegatedAmount3000.lean` — `delegatedAmountYen=3_000` (programmatically derived); `amount_decoded` rfl.
- Independent spec: `specAmountPredecessor=2_999` with `agree_amount_successor` (succ 2999 = 3000), boundary decomposition distinct from rfl; axiom-free.
- Build: `lake build` → full build success (806 jobs); 2 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Underlying Act provision, rest of article 8-3, other paragraphs and articles. Computable slice of one DELEGATION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_LOCAL_TAX_ENFORCEMENT_DELEGATED_AMOUNT_3000.md`.
