# Unit review — 租税特別措置法施行規則 第十九条の十の五（寄附金合計額 千円に満たない — STRICT < ¥1,000）

Normative unit id: `NORM|f9d7893b78c08532ce572d0c5aae7b2d0e7d7c8519ae58683652401a1808c3a7`

Law: 332M50000040015 (租税特別措置法施行規則), law number 昭和三十二年大蔵省令第十五号,
law_type **MinisterialOrdinance (省令)**, revision `332M50000040015_20261101_507M60000040026` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/332M50000040015_20261101_507M60000040026.law.json`,
sha256 `2e5d3e585b99e15ffb030c8b6fa0dcc6ccf7cc9532924fa5b6438a68cc05767c`.

Verbatim source text: 「実績判定期間における同一の者から受け入れた寄附金の額の合計額が千円に満たない場合の当該合計額」

Exact source position:
`LawBody[4]/MainProvision/MainProvision[1]/Article:19_10_5/Article#19_10_5/Paragraph#8/Item#2/ItemSentence/Sentence#1` — MainProvision Article 第十九条の十の五, caption （公益社団法人等に寄附をした場合の所得税額の特別控除）. `find_article_text(...,"第十九条の十の五")` returns that article (len 4558) containing the needle → article-kind locator used.

Norm kind: **CONDITION** — a **strict** upper bound: aggregate donations from one person < ¥1,000 (千円に満たない = strict <, unlike 以下). The ¥1,000 limit derived programmatically from the verbatim needle.

Byte fidelity: all statutory Japanese strings (title, law number, article caption, verbatim quote, numeric limit) injected programmatically from authoritative sources; descriptive prose hand-written but byte-verified. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The donation aggregate must be strictly less than ¥1,000 (¥1,000 excluded). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「donation aggregate strict limit < 1000 yen…↔ DonationAggregateStrictLimit.lean」. Full audit: 237/237 checks passed. |
| D (decision) | PASS — audit reports `237/237 checks passed`. |
| C (competing interpretation) | Only the strict bound is modeled. Assessment-period definition, donation acceptance rules, other items/paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/DonationAggregateStrictLimit.lean` — `strictLimitYen=1_000` (programmatically derived); `withinStrictLimit total := total < strictLimitYen` (strict).
- Independent spec: `specWithinStrictLimit total := total ≤ Nat.pred 1000` (inclusive complement, distinct); `agree_strict_limit` universal & axiom-free (`Nat.le_pred_of_lt`, `Nat.lt_of_le_pred`).
- Boundary checks: 999 qualifies; 1,000 fails (strict, boundary excluded).
- Build: `lake build` → full build success (761 jobs); 3 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Assessment-period definition, donation acceptance rules, other items, other paragraphs and other articles. Computable slice of one CONDITION norm unit in a MinisterialOrdinance, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_DONATION_AGGREGATE_STRICT_LIMIT.md`.
