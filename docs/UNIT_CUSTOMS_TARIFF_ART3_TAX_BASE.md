# Unit review — 関税定率法 第三条(1)（課税標準及び税率）EFFECT

Normative unit id: `NORM|88116e54e6374f3a288fd1aa1e79fc8167d6e733288dae64920deaaa35ab05ba`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「関税は、輸入貨物の価格又は数量を課税標準として課するものとし、その税率は、別表による。」 — the 課税標準 of customs duty on 輸入貨物 is
価格 (price) OR 数量 (quantity); the 税率 is delegated to 別表 (separate table, NOT MODELLED).

Exact source position:
`LawBody[1]/MainProvision/MainProvision[2]/Article:3/Article#3/Paragraph#1/ParagraphSentence/Sentence#1` — MainProvision Article 第三条, caption （課税標準及び税率）. `find_article_text(...,"第三条")` returns that article (len 56) containing the needle → article-kind locator used.

Norm kind: **EFFECT** — a structural two-alternative tax-base disjunction (価格 or 数量). Modeled as an inductive type `TaxBase` with exactly two inhabitants, `price` (価格) and `quantity` (数量). 「価格又は数量」 is a disjunction — either alternative, not both, not a third. The 税率 delegated to 別表 is explicitly NOT MODELLED. No arithmetic/unit/dimension applies (structural EFFECT, not an amount formula). All statutory Japanese strings (価格/数量/課税標準/別表) extracted programmatically from the needle; title/number/caption/quote from INVENTORY/raw.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | 課税標準 ∈ {価格, 数量} — exactly two exclusive, exhaustive alternatives. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.3 tax base price-or-quantity…↔ CustomsTariffArt3TaxBase.lean」. Full audit: 284/284 checks passed. |
| D (decision) | PASS — audit reports `284/284 checks passed`. |
| C (competing interpretation) | Only the tax-base disjunction is modeled. The 別表 rate table, other paragraphs, other articles, and concrete duty computation are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt3TaxBase.lean` — inductive `TaxBase` (price | quantity), `isAdmissible` boolean classifier, `exhaustive`, `price_ne_quantity`, `admissibleBases_exact`.
- Independent spec: `SpecAdmissible b := b = price ∨ b = quantity` (propositional disjunction, distinct from the boolean classifier); `agree_admissible` and `enumerated_matches_spec` universal & axiom-free (proved by `cases b <;> simp`).
- Build: `lake build` → full build success (902 jobs); unit build 5 jobs. Axiom probe (direct, since generator uses git ls-files and files were untracked at probe time): 2 theorems axiom-free, 3 with only permitted `[propext]`; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

別表 rate table, other paragraphs, other articles, concrete duty computation. Computable slice of one EFFECT norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART3_TAX_BASE.md`.
