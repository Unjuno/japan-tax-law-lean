# Unit review — 税理士法施行規則 第二十二条の四(2)（貸借対照表の金額表示単位: 1円/1千円/1百万円）

Normative unit id: `NORM|70d9948f3c285aa1bca4e2e5dc6a76fd82dede46f1b4739c742e85b5d838098c`

Law: 326M50000040055 (税理士法施行規則), law number 昭和二十六年大蔵省令第五十五号,
law_type **MinisterialOrdinance (省令)**, revision `326M50000040055_20260901_506M60000040025` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/326M50000040055_20260901_506M60000040025.law.json`,
sha256 `79731fc38da1bf120231f6ffd7053986c1f2f2fa0c7bf573e7f0bbde09121354`.

Verbatim source text: 「貸借対照表に係る事項の金額は、一円単位、千円単位又は百万円単位をもつて表示するものとする。」

Exact source position:
`LawBody[3]/MainProvision/MainProvision[3]/Article:22_4/Article#22_4/Paragraph#2/ParagraphSentence/Sentence#1` — MainProvision Article 第二十二条の四, caption （貸借対照表）. `find_article_text(...,"第二十二条の四")` returns that article (len 711) containing the needle → article-kind locator used.

Norm kind: **EFFECT** — balance-sheet amounts are presented in one of three permitted units: 1 yen (一円単位), 1,000 yen (千円単位), or 1,000,000 yen (百万円単位). All three values derived programmatically from the verbatim needle.

Byte fidelity: all statutory Japanese strings (title, law number, article caption, verbatim quote, numeric units) injected programmatically from authoritative sources; descriptive prose hand-written but byte-verified. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The three permitted presentation units are 1 / 1,000 / 1,000,000 yen (alternative). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「balance-sheet presentation units 1/1000/1000000 yen…↔ TaxAccountantBalanceSheetUnits.lean」. Full audit: 235/235 checks passed. |
| D (decision) | PASS — audit reports `235/235 checks passed`. |
| C (competing interpretation) | Only the three permitted units are modeled. Balance-sheet preparation rules, rounding, other paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/TaxAccountantBalanceSheetUnits.lean` — `oneYenUnit=1`, `thousandYenUnit=1_000`, `millionYenUnit=1_000_000` (programmatically derived); `isAllowedUnit u := u = 1 ∨ u = 1000 ∨ u = 1000000`.
- Independent spec: `specIsAllowedUnit u := u = 10^0 ∨ u = 10^3 ∨ u = 10^6` (powers-of-ten form, distinct); `agree_allowed_unit` universal & axiom-free (`rfl` after unfold).
- Boundary checks: 1 / 1,000 / 1,000,000 allowed; 2 rejected.
- Build: `lake build` → full build success (755 jobs); theorem axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Balance-sheet preparation rules, rounding, other paragraphs and articles. Computable slice of one EFFECT norm unit in a MinisterialOrdinance, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_TAX_ACCOUNTANT_BALANCE_SHEET_UNITS.md`.
