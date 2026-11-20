# Unit review — 相続税法施行規則 art.30（百万円）

Normative unit id: `NORM|6b83a747a7e86cb520e53a9ba162dd0beda902d06616239281a19e2cb5460f75`

Law: 325M50000040017 (相続税法施行規則, Inheritance Tax Act Enforcement
Regulations), law number 昭和二十五年大蔵省令第十七号 — a **ministerial ordinance
(省令)**, revision `325M50000040017_20260901_506M60000040016`,
snapshot `data/raw/325M50000040017_20260901_506M60000040016.law.json`,
sha256 `a4e46e6eba52b6f8a47365590d34aff35e9eeea4bbc7186ecdace837e35b552f`.

Law identity verified: INVENTORY `official_title = 相続税法施行規則` and raw
`law_title = 相続税法施行規則` (both checked, guarding against earlier wrong-law
findings on other units).

Verbatim source text: 「法第五十九条第一項ただし書に規定する財務省令で定める額は、百万円とする。」

Exact source position:
`LawBody[2]/MainProvision/MainProvision[44]/Article:30/Article#30/Paragraph#3/ParagraphSentence/Sentence#1`.
Norm kind: **EXCEPTION** (Ministry-of-Finance-ordinance amount referenced from a proviso).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | art.30(3) fixes the amount prescribed by Ministry of Finance ordinance under the proviso of 相続税法 art.59(1) to exactly ¥1,000,000 (百万円). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` check 「相続税法施行規則 art.30…↔ InheritanceRegPrescribedAmount.lean」 pinned to law 325M50000040017, article locator 第三十条, verbatim needle. Full audit: 188/188 checks passed. |
| D (decision) | PASS — audit reports `188/188 checks passed`. |
| C (competing interpretation) | The ordinance defines an amount that the statute's proviso says "shall be prescribed by 財務省令"; this slice models the amount only. The substantive 相続税法 art.59(1) proviso and the conditions under which the amount applies are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/InheritanceRegPrescribedAmount.lean` — `prescribedAmountYen=1_000_000`, `isPrescribedAmount a := a = prescribedAmountYen`.
- Independent spec: `specIsPrescribedAmount a := 1M ≤ a ∧ a ≤ 1M` (degenerate interval, distinct from equality); `agree_prescribed_amount` universal over all amounts.
- Boundary theorems: `at_prescribed`, `below_prescribed`, `above_prescribed`, `amount_is_one_million`.
- Build: `lake build` → full build success (614 jobs); all 5 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The substantive 相続税法 art.59(1) proviso, the conditions under which the amount applies, other paragraphs and 政令 details. This is a computable slice of one EXCEPTION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_INHERITANCE_REG_PRESCRIBED_AMOUNT_30.md` (H/T/D/C/U per finding).
