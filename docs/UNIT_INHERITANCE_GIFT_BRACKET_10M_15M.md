# Unit review — 相続税法 第二十一条の七(1)（贈与税 税率表 区分 10M–15M）

Normative unit id: `NORM|ea52192b370dfc9fb140a8fd3bce79fc75c7f620238385eeaff1a960ed9db653`

Law: 325AC0000000073 (相続税法), law number 昭和二十五年法律第七十三号,
law_type Act (法律), revision `325AC0000000073_20260401_506AC0000000008` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
sha256 `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`.

Verbatim source text: 「千万円を超え千五百万円以下の金額」 (千万円を超え千五百万円以下: 10,000,000 < amount ≤ 15,000,000).

Exact source position:
`LawBody[3]/MainProvision/MainProvision[1]/Article:21_7/Article#21_7/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1` — MainProvision Article 第二十一条の七, caption （贈与税の税率）. `find_article_text(...,"第二十一条の七")` returns that article (len 253) containing the needle → article-kind locator used.

Norm kind: **CONDITION** — a two-sided gift-tax rate-table bracket: lower bound ¥10,000,000 strictly excluded (を超え), upper bound ¥15,000,000 inclusive (以下). Both derived programmatically from the verbatim needle.

Byte fidelity: all statutory Japanese strings (title, law number, article caption, verbatim quote, numeric bounds) injected programmatically from authoritative sources; descriptive prose hand-written but byte-verified. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The bracket is 10,000,000 < amount ≤ 15,000,000 (lower exclusive, upper inclusive). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「gift-tax rate bracket 10M-15M…↔ InheritanceGiftTaxRateBracket10M15M.lean」. Full audit: 277/277 checks passed. |
| D (decision) | PASS — audit reports `277/277 checks passed`. |
| C (competing interpretation) | Only the bracket interval is modeled. The paired tax rate, other brackets, deduction rules, other paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/InheritanceGiftTaxRateBracket10M15M.lean` — `lowerExclusiveYen=10_000_000`, `upperInclusiveYen=15_000_000`; `inBracket amount := lower < amount ∧ amount ≤ upper`.
- Independent spec: successor-based half-open form `Nat.succ lower ≤ amount ∧ amount ≤ upper`; `agree_in_bracket` universal & axiom-free.
- Boundary checks: ¥10,000,000 excluded; ¥10,000,001 and ¥15,000,000 included; ¥15,000,001 excluded.
- Build: `lake build` → full build success (881 jobs); 5 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Paired tax rate, other brackets, deduction rules, other paragraphs and articles. Computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_GIFT_BRACKET_10M_15M.md`.
