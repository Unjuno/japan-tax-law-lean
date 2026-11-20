# Unit review — 地方税法施行令 art.6の9の2(1)（二千円）

Normative unit id: `NORM|8f218ac0c48735c83d9984a2be0ad3731220bc855d1425dd950952af69cf7476`

Law: 325CO0000000245 (地方税法施行令, Local Tax Act Enforcement Order),
law number 昭和二十五年政令第二百四十五号, law_type CabinetOrder (政令),
revision `325CO0000000245_20261101_508CO0000000083`,
snapshot `data/raw/325CO0000000245_20261101_508CO0000000083.law.json`,
sha256 `9bc03b230fb0ed1039e33a1544cd53772939ee25d6d4648a386400ea269dfb17`.

Law identity verified: INVENTORY `official_title = 地方税法施行令`,
`law_num = 昭和二十五年政令第二百四十五号`, `law_type = CabinetOrder`;
needle container `ArticleTitle = 第六条の九の二` (attr Num=6_9_2).

Verbatim source text: 「法第十五条の四第一項に規定する政令で定める金額は、二千円とする。」

Exact source position:
`LawBody[3]/MainProvision/MainProvision[0]/Article:6_9_2/Article#6_9_2/Paragraph#1/ParagraphSentence/Sentence#1`.
Norm kind: **DELEGATION** (the amount prescribed by Cabinet Order under Local Tax Act art.15-4(1)).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This Cabinet Order fixes the amount "prescribed by Cabinet Order" under Local Tax Act art.15-4(1) to exactly ¥2,000 (二千円). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` check 「地方税法施行令 art.6の9の2(1)…↔ LocalTaxOrderArt15_4Amount.lean」 pinned to law 325CO0000000245, article locator 第六条の九の二, verbatim needle. Full audit: 189/189 checks passed. |
| D (decision) | PASS — audit reports `189/189 checks passed`. |
| C (competing interpretation) | The needle is a definitional amount clause referencing a statute's delegation; this slice models the amount only. The substantive Local Tax Act art.15-4(1) and applicability conditions are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LocalTaxOrderArt15_4Amount.lean` — `delegatedAmountYen=2_000`, `isDelegatedAmount a := a = delegatedAmountYen`.
- Independent spec: `specIsDelegatedAmount a := 2_000 ≤ a ∧ a ≤ 2_000` (degenerate interval, distinct from equality); `agree_delegated_amount` universal over all amounts.
- Boundary theorems: `at_delegated`, `below_delegated`, `above_delegated`, `amount_is_two_thousand`.
- Build: `lake build` → full build success (617 jobs); all 5 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The substantive Local Tax Act art.15-4(1), the conditions under which the amount applies, other paragraphs and 省令 details. This is a computable slice of one DELEGATION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_LOCAL_TAX_ORDER_ART15_4_AMOUNT.md` (H/T/D/C/U per finding).
