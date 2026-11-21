# Unit review — 普通交付税に関する省令 第十条(18)（４，８８０円×Ｌの千円未満端数を四捨五入）

Normative unit id: `NORM|fe7a9ceb0231c6a7b59824ffad4d0f3cbeb1793f4f5d17fb8adea3a931e499aa`

Law: 337M50000008017 (普通交付税に関する省令), law number 昭和三十七年自治省令第十七号,
law_type **MinisterialOrdinance (省令)**, revision `337M50000008017_20260724_508M60000008092` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/337M50000008017_20260724_508M60000008092.law.json`,
sha256 `c2a411e7dbb3b65f6d41cef894263fdd6c384ad7789f9242d29917139632ad98`.

Verbatim source text: 「４，８８０円×Ａに千円未満の端数があるときは、その端数を四捨五入する。」 (full-width digits ４，８８０ in source; product 4,880 × L).

Exact source position:
`LawBody[4]/MainProvision/MainProvision[1]/Article:10/Article#10/Paragraph#18/List/ListSentence/Sentence#1/ArithFormula` — MainProvision Article 第十条, caption （普通態容補正係数の算定方法）. `find_article_text(...,"第十条")` returns that article (len 11846) containing the needle → article-kind locator used.

Norm kind: **CONDITION** — a rounding rule: when 4,880 × L has a fraction under ¥1,000 (千円未満の端数), round it half-up (四捨五入: remainder ≥ ¥500 rounds up). Base 4,880 parsed programmatically from full-width digits; unit ¥1,000 and half-threshold ¥500 derived from 千円/四捨五入.

Byte fidelity: all statutory Japanese strings (title, law number, article caption, verbatim quote, numeric values) injected programmatically from authoritative sources; descriptive prose hand-written but byte-verified. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | For 4,880 × L, a sub-¥1,000 fraction is rounded half-up (remainder ≥ ¥500 rounds up). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「sub-1000 rounding half-up of 4880yen*L…↔ LocalAllocationTaxRounding.lean」. Full audit: 238/238 checks passed. |
| D (decision) | PASS — audit reports `238/238 checks passed`. |
| C (competing interpretation) | Only the rounding condition and direction are modeled. Determination of L, the table reference, other paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LocalAllocationTaxRounding.lean` — `baseYen=4_880`, `roundingUnit=1_000`, `halfThreshold=500`; `hasFraction l := (baseYen*l) % 1000 ≠ 0`; `roundsUp l := 500 ≤ (baseYen*l) % 1000`.
- Independent spec: `specRoundsUp l := ¬ (baseYen*l) % 1000 < 500` (negation form, distinct); `agree_rounds_up` universal & axiom-free (`Nat.not_lt_of_ge`, `Nat.le_of_not_gt`).
- Boundary examples: L=1 → 880 ≥ 500 rounds up; L=5 → 400 < 500 rounds down.
- Build: `lake build` → full build success (764 jobs); 3 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Determination of L, the table reference, other paragraphs and articles. Computable slice of one CONDITION norm unit in a MinisterialOrdinance, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_LOCAL_ALLOCATION_TAX_ROUNDING.md`.
