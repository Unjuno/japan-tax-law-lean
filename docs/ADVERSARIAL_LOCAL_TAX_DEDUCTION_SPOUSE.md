# Independent adversarial review — 地方税法 第二十三条(1)第八号（控除対象配偶者）

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written and deleted; no repository file modified by the
reviewer; `lake build` not run by reviewer.

## Verdict: ONE CONCRETE SUBSTANTIVE FINDING (F1) — reproduced and FIXED. All other audited claims PASS.

### F1 — FAIL (reproduced): false statutory term label / income attribution

- **H:** the unit is "a definition clause for 同一生計配偶者" modeling "同一生計配偶者の所得要件" (the same-household spouse's income requirement ≤ ¥10M).
- **T:** structural walk of `data/raw/325AC0000000226_20261101_508AC0000000002.law.json` → Article `Num=23` → Paragraph `Num=1` → `Item`s by `attr.Num`, printing leading text.
- **D: FAIL.** Item 7 defines 同一生計配偶者 with a ¥580,000 ceiling; **this unit's needle is Item 8**, whose defined term is **控除対象配偶者**. The relative clause 「前年の合計所得金額が千万円以下である」 modifies **道府県民税の納税義務者 (the taxpayer)** — ¥10M is the taxpayer's income ceiling (spouse-deduction income limit), not the spouse's. 同一生計配偶者 appears in the needle only as a cross-reference to Item 7.
- **Author-side false labels:** impl `:4`/`:17`, spec header, unit doc `:1`/`:15`, audit check name.
- **C:** the bare numeric predicate `income ≤ 10_000_000` is faithful to the needle; only the term name/attribution was wrong.
- **U:** the queue entry contained only `kind=CONDITION art=23`, the needle and path — no term label. The mislabel was author-introduced and propagated.
- **Fix applied:** renamed the module to `LocalTaxDeductionSpouse`, corrected all doc/header/audit labels to 控除対象配偶者, and stated that ¥10M is the 納税義務者's prior-year total income ceiling (not the spouse's). Verified: old labels absent everywhere, new labels present, needle byte-fidelity preserved (`quote equal: True`, U+6EDE=0). Numeric predicate and proofs unchanged. Hashes refreshed. (If a 同一生計配偶者 income ceiling were genuinely intended, that would be Item 7 with ¥580,000 — a different normative unit.)
- **Post-fix D: PASS.**

### PASS checks

| # | Check | Result |
|---|---|---|
| P1 | independent SHA-256 of raw JSON | PASS — `3dd29e00…68d53`, 12,181,725 B; INVENTORY matches |
| P2 | needle location/count/byte fidelity | PASS — whole-law count 1; Article 23 ¶1 Item 8 Column 2 Sentence 1; Lean quote, audit `\u` literal, queue needle identical (SHA256 `52def0f6…f70f82`) |
| P3 | law identity + real revision | PASS — Act, 地方税法, real current revision, snapshot on disk |
| P4 | article-kind locator | PASS — `find_article_text(...,"第二十三条")` returns len-8258 article containing needle; full audit 218/218 |
| P5 | Lean soundness | PASS — successor-strict spec distinct; `agree_income_requirement` universal & axiom-free (`Nat.lt_of_le_of_lt`/`Nat.le_of_lt_succ`); no `sorry`/`admit`/`axiom`/`Classical.choice` in code; `by decide` kernel-checked |
| P6 | inclusive ceiling / no lower bound / kind=CONDITION / Act + 第二十三条 labels / Nat lemmas | PASS (the statutory-term sub-label fails — see F1) |

## Closing

F1 reproduced and fixed; all formalization content (numeric predicate, spec, proofs, transcription) verified correct. No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
