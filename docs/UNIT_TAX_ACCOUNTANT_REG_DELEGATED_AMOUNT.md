# Unit review — 税理士法施行令 art.6の2(2)（八千八百円）

Normative unit id: `NORM|5a5e264f44439540b3d5bdd4efa72bc7e2980f2b11cd22c3acb7863e8cb240a7`

Law: 326CO0000000216 (税理士法施行令, Tax Accountant Act Enforcement Order),
law number 昭和二十六年政令第二百十六号, law_type CabinetOrder (政令),
revision `326CO0000000216_20240401_505CO0000000146`,
snapshot `data/raw/326CO0000000216_20240401_505CO0000000146.law.json`,
sha256 `346e24c2512be9a2ef3524e48a54b67b3bff30d1d81468f69e3f39b92cf8d296`.

Law identity verified via unicode escapes: INVENTORY `official_title = 税理士法施行令`,
`law_num = 昭和二十六年政令第二百十六号`, `law_type = CabinetOrder`.

Verbatim source text: 「法第九条第二項に規定する政令で定める額は、八千八百円とする。」

Exact source position:
`LawBody[2]/MainProvision/MainProvision[8]/Article:6_2/Article#6_2/Paragraph#2/ParagraphSentence/Sentence#1`.
Norm kind: **DELEGATION** (the amount prescribed by Cabinet Order under Tax Accountant Act art.9(2)).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This Cabinet Order fixes the amount "prescribed by Cabinet Order" under Tax Accountant Act art.9(2) to exactly ¥8,800 (八千八百円). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` check 「税理士法施行令 art.6の2(2)…↔ TaxAccountantRegDelegatedAmount.lean」 pinned to law 326CO0000000216, article locator 第六条の二, verbatim needle. Full audit: 190/190 checks passed. |
| D (decision) | PASS — audit reports `190/190 checks passed`. |
| C (competing interpretation) | The needle is a definitional amount clause referencing a statute's delegation; this slice models the amount only. The substantive 税理士法 art.9(2) and applicability conditions are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/TaxAccountantRegDelegatedAmount.lean` — `delegatedAmountYen=8_800`, `isDelegatedAmount a := a = delegatedAmountYen`.
- Independent spec: `specIsDelegatedAmount a := 8_800 ≤ a ∧ a ≤ 8_800` (degenerate interval, distinct from equality); `agree_delegated_amount` universal over all amounts.
- Boundary theorems: `at_delegated`, `below_delegated`, `above_delegated`, `amount_is_eight_thousand_eight_hundred`.
- Build: `lake build` → full build success (620 jobs); all 5 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The substantive 税理士法 art.9(2), the conditions under which the amount applies, other paragraphs and 省令 details. This is a computable slice of one DELEGATION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_TAX_ACCOUNTANT_REG_DELEGATED_AMOUNT.md` (H/T/D/C/U per finding).
