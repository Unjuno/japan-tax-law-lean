# Unit review — 地方税法 第二十三条(1)第八号（控除対象配偶者: 納税義務者の千万円所得要件）

Normative unit id: `NORM|1c803e2d190195eb3ae5d4c1ebd12bfb79992ddc99b46827d139146b79c178fc`

Law: 325AC0000000226 (地方税法, Local Tax Act), law number 昭和二十五年法律第二百二十六号,
law_type Act (法律), revision `325AC0000000226_20261101_508AC0000000002` (from INVENTORY
`current_revision.law_revision_id`, matched raw), snapshot
`data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
sha256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.

Verbatim source text: 「同一生計配偶者のうち、前年の合計所得金額が千万円以下である道府県民税の納税義務者の配偶者をいう。」

Exact source position:
`LawBody[2]/MainProvision/MainProvision[1]/Article:23/Article#23/Paragraph#1/Item#8/ItemSentence/Column#2/Sentence#1` — MainProvision Article 第二十三条. `find_article_text(...,"第二十三条")` returns that article (len 8258) containing the needle → article-kind locator used.

## Statutory-term attribution (corrected after adversarial finding F1)

Structural walk of Article 23 confirms:
- **Item 7** defines 同一生計配偶者 (a same-household spouse whose prior-year total income ≤ ¥580,000).
- **Item 8** (this unit's needle) defines **控除対象配偶者** by cross-referencing 同一生計配偶者 from Item 7. The relative clause 「前年の合計所得金額が千万円以下である」 modifies **道府県民税の納税義務者 (the taxpayer)** — so ¥10M is the TAXPAYER's prior-year total income ceiling, NOT the spouse's. (Item 7 already caps the spouse at ¥580,000, which would make a ¥10M spouse cap redundant.)

An earlier draft mislabeled the unit "同一生計配偶者の所得要件" and attributed the ¥10M to the spouse. This was reproduced via structural walk and corrected. The numeric slice `income ≤ 10_000_000` is faithful to the needle regardless; only the label/attribution was wrong.

Norm kind: **CONDITION** — an upper-bound-only income predicate in a definition: the taxpayer's prior-year total income ≤ ¥10,000,000 (千万円以下, inclusive). No lower bound (source has none).

Byte fidelity: authoritative CJK strings injected programmatically from INVENTORY/queue; byte-fidelity confirmed (`quote equal: True`, title/lawnum present, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The clause sets a taxpayer income ceiling: prior-year total income ≤ ¥10,000,000 (no lower bound), within the definition of 控除対象配偶者. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「地方税法 第二十三条(1)第八号 (控除対象配偶者, taxpayer income ceiling 10M)…↔ LocalTaxDeductionSpouse.lean」. Full audit: 218/218 checks passed. |
| D (decision) | PASS — audit reports `218/218 checks passed`. |
| C (competing interpretation) | Only the taxpayer income ceiling is modeled. The defined term 控除対象配偶者, the cross-reference to 同一生計配偶者 (Item 7), other items/paragraphs and other articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LocalTaxDeductionSpouse.lean` — `incomeCeilingYen=10_000_000`, `withinIncomeRequirement income := income ≤ incomeCeilingYen` (income = taxpayer's prior-year total income).
- Independent spec: `specWithinIncomeRequirement income := income < Nat.succ incomeCeilingYen` (successor-strict form, distinct); `agree_income_requirement` universal over all incomes, axiom-free.
- Boundary theorems: `at_ceiling` (¥10M qualifies — 以下 inclusive), `above_ceiling` (¥10,000,001 fails), `ceiling_decoded`.
- Build: `lake build` → full build success (704 jobs); all 4 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The defined term 控除対象配偶者, the cross-reference to 同一生計配偶者 (Item 7, ¥580,000), other items, other paragraphs and other articles. Computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_LOCAL_TAX_DEDUCTION_SPOUSE.md`.
