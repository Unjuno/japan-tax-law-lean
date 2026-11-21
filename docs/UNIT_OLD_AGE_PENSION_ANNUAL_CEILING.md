# Unit review — 地方税法施行令 附則第三条(1)5（老齢等年金 年額 十八万円未満 — STRICT < ¥180,000）

Normative unit id: `NORM|ce36009183d70cb6fbd8f7c665ef5c61f4a650f71c3d0715a220c72f780eb0ce`

Law: 325CO0000000245 (地方税法施行令), law number 昭和二十五年政令第二百四十五号,
law_type **CabinetOrder (政令)**, revision `325CO0000000245_20261101_508CO0000000083` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/325CO0000000245_20261101_508CO0000000083.law.json`,
sha256 `9bc03b230fb0ed1039e33a1544cd53772939ee25d6d4648a386400ea269dfb17`.

Verbatim source text: 「当該世帯主の老齢等年金給付の年額が十八万円未満である場合」 (十八万円 = ¥180,000; 未満 = strict <, boundary excluded).

Exact source position:
`LawBody[499]/SupplProvision/SupplProvision[2]/Article:3/Article#3/Paragraph#1/Item#5/ItemSentence/Sentence#1` — 附則 Article 第三条, caption （国民健康保険税の特別徴収の開始に伴う経過措置）. This is a 附則 (supplementary) provision: `find_article_text(...,"第三条")` returns the MainProvision article (without the needle), so the audit uses a FILE-KIND transcription locator (verbatim needle unique in whole law).

Norm kind: **CONDITION** — a strict upper bound: annual old-age pension amount < ¥180,000 (十八万円未満 = strict <), derived programmatically from the verbatim kanji numeral.

Byte fidelity: all statutory Japanese strings (title, law number, article caption, verbatim quote, numeric ceiling) injected programmatically from authoritative sources; descriptive prose hand-written but byte-verified. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | Annual pension amount must be strictly less than ¥180,000 (¥180,000 excluded). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` file-kind check 「old-age pension annual amount < 180k yen…↔ OldAgePensionAnnualAmountCeiling.lean」. Full audit: 255/255 checks passed. |
| D (decision) | PASS — audit reports `255/255 checks passed`. |
| C (competing interpretation) | Only the strict ceiling is modeled. The rest of the 附則 provision, recipient definition, other items and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/OldAgePensionAnnualAmountCeiling.lean` — `annualCeilingYen=180_000` (programmatically derived); `belowAnnualCeiling amount := amount < 180_000` (strict).
- Independent spec: `specBelowAnnualCeiling amount := amount ≤ Nat.pred 180000` (≤179,999, distinct); `agree_below_ceiling` universal & axiom-free.
- Boundary checks: 179,999 qualifies; 180,000 fails (strict).
- Build: `lake build` → full build success (815 jobs); 3 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Rest of the 附則 provision, recipient definition, other items and articles. Computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_OLD_AGE_PENSION_ANNUAL_CEILING.md`.
