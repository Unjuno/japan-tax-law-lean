# Unit review — 地方税法施行規則 第二条の三の五(3)2（特定親族の所得要件: 合計所得金額 八十五万円以下）

Normative unit id: `NORM|82fb8eb5c1e96b8c4ba285efcd8506848b999781b461e977bb759c1932819c31`

Law: 329M50000002023 (地方税法施行規則, Local Tax Act Enforcement Regulations), law number 昭和二十九年総理府令第二十三号,
law_type **MinisterialOrdinance (省令)**, revision `329M50000002023_20261101_508M60000008045` (from INVENTORY
`current_revision.law_revision_id`, matched raw), snapshot
`data/raw/329M50000002023_20261101_508M60000008045.law.json`,
sha256 `5ffb833bd3a3d7c477efecd41ace0d53ea8e8a14e61567f6ee18d08000bb217e`.

Verbatim source text: 「退職手当等に係る所得を有する者であって、合計所得金額が八十五万円以下である特定親族の氏名」

Exact source position:
`LawBody[2]/MainProvision/MainProvision[41]/Article:2_3_5/Article#2_3_5/Paragraph#3/Item#2/ItemSentence/Column#2/Sentence#1` — MainProvision Article 第二条の三の五, caption （公的年金等受給者の扶養親族等申告書の提出方法）. `find_article_text(...,"第二条の三の五")` returns that article (len 852) containing the needle → article-kind locator used.

Norm kind: **CONDITION** — an upper-bound-only income predicate in a form-item specification: a 特定親族 (with 退職手当等 income) whose total income ≤ ¥850,000 (八十五万円以下, inclusive). No lower bound (source has none).

Byte fidelity: authoritative CJK strings injected programmatically from INVENTORY/queue; byte-fidelity confirmed (`quote equal: True`, title/lawnum present, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The clause sets an income ceiling: total income ≤ ¥850,000 (no lower bound), for a 特定親族 named on the form. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「地方税法施行規則 第二条の三の五(3)2 specified-relative income ceiling 850k…↔ LocalTaxSpecifiedRelativeIncomeCeiling.lean」. Full audit: 224/224 checks passed. |
| D (decision) | PASS — audit reports `224/224 checks passed`. |
| C (competing interpretation) | Only the income ceiling is modeled. The form-submission procedure, 特定親族 definition, 退職手当等 income concept, other items/paragraphs and other articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LocalTaxSpecifiedRelativeIncomeCeiling.lean` — `incomeCeilingYen=850_000`, `withinIncomeRequirement income := income ≤ incomeCeilingYen`.
- Independent spec: `specWithinIncomeRequirement income := income < Nat.succ incomeCeilingYen` (successor-strict form, distinct); `agree_income_requirement` universal over all incomes, axiom-free.
- Boundary theorems: `at_ceiling` (¥850,000 qualifies — 以下 inclusive), `above_ceiling` (¥850,001 fails), `ceiling_decoded`.
- Build: `lake build` → full build success (722 jobs); all 4 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The form-submission procedure, the 特定親族 definition, the 退職手当等 income concept, other items, other paragraphs and other articles. Computable slice of one CONDITION norm unit in a MinisterialOrdinance, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_LOCAL_TAX_SPECIFIED_RELATIVE_INCOME_CEILING.md`.
