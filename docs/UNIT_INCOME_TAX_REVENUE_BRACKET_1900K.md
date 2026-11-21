# Unit review — 所得税法 第二十八条(3)1（収入金額 百九十万円以下 = ¥1,900,000）

Normative unit id: `NORM|29b80207cb1b9b303c8f2a8d3c08e25749e128999613e26b7902d375f1f78853`

Law: 340AC0000000033 (所得税法), law number 昭和四十年法律第三十三号,
law_type Act (法律), revision `340AC0000000033_20261001_507AC0000000070` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`,
sha256 `94c4a7ad83726cde60787967ed4e959585ad0af9279d25db9aa02264b3fe606b`.

Verbatim source text: 「前項に規定する収入金額が百九十万円以下である場合」 (百九十万円 = ¥1,900,000, inclusive).

Exact source position:
`LawBody[3]/MainProvision/MainProvision[1]/Article:28/Article#28/Paragraph#3/Item#1/ItemSentence/Column#1/Sentence#1` — MainProvision Article 第二十八条, caption （給与所得）. `find_article_text(...,"第二十八条")` returns that article (len 593) containing the needle → article-kind locator used.

Norm kind: **REFERENCE** — tier 1 revenue ceiling ≤ ¥1,900,000 (百九十万円以下, inclusive), derived programmatically from the verbatim kanji numeral.

Byte fidelity: all statutory Japanese strings (title, law number, article caption, verbatim quote, numeric ceiling) injected programmatically from authoritative sources; descriptive prose hand-written but byte-verified. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | Revenue ≤ ¥1,900,000 (百九十万円以下, inclusive) defines tier 1. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「income tax revenue bracket <= 1.9M yen…↔ IncomeTaxRevenueBracket1900k.lean」. Full audit: 261/261 checks passed. |
| D (decision) | PASS — audit reports `261/261 checks passed`. |
| C (competing interpretation) | Only this tier's numeric upper bound is modeled. The preceding paragraph's revenue definition, other tiers, tax computation and other articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/IncomeTaxRevenueBracket1900k.lean` — `revenueCeilingYen=1_900_000` (programmatically derived); `inBracket revenue := revenue ≤ ceiling`.
- Independent spec: successor-strict `revenue < Nat.succ ceiling`; `agree_in_bracket` universal & axiom-free.
- Boundary checks: ¥1,900,000 qualifies; ¥1,900,001 fails.
- Build: `lake build` → full build success (833 jobs); 3 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Preceding paragraph's revenue definition, other tiers, tax computation, other items/paragraphs and other articles. Computable slice of one REFERENCE norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_INCOME_TAX_REVENUE_BRACKET_1900K.md`.
