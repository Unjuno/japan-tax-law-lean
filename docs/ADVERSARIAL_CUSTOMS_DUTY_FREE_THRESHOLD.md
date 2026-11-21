# Independent adversarial review — 関税暫定措置法施行令 第二十七条(1)2（課税価格 20万円以下 EXCEPTION）

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written and deleted; no repository file modified by the
reviewer.

## Verdict: ONE CONCRETE FINDING (U-1, documentation/provenance only) — reproduced and FIXED. All substantive checks PASS.

### U-1 — (FIXED): "zero hand-typed Japanese" provenance claim was literally false

- **H:** `docs/UNIT_CUSTOMS_DUTY_FREE_THRESHOLD.md:17` asserted "all Japanese strings … injected programmatically … — zero hand-typed Japanese."
- **T:** the generator template hard-codes descriptive Japanese (`第二十七条`, `（課税価格 20万円以下の物品）`, `政令`, `原文逐語`, `「以下」`, `前号`, `課税価格の総額 二十万円以下`); the spec/tests also contain hand-entered `第二十七条`, `二十万円以下`. The five enumerated **statutory** strings (title, law number, article caption, verbatim quote, numeric constant) ARE injected from authoritative sources; the absolute phrasing was false.
- **D: FAIL** (method misrepresentation only; no byte-fidelity or correctness impact — every hand-typed fragment was verified byte-accurate).
- **Fix applied:** reworded doc:17 to "all **statutory** Japanese strings (title, law number, article caption, verbatim quote, numeric constant) injected programmatically from authoritative sources; descriptive prose in the model is hand-written but byte-verified against authoritative sources." The evidence ledger's corresponding phrase was reworded identically. Re-verified: false claim gone.

### Verified clean (no finding)

| Check | Result |
|---|---|
| sha256 raw JSON | PASS — `b64be40d…121a` matches (INVENTORY stores uppercase form) |
| needle fidelity | PASS — whole-law count 1; full-width parens U+FF08/FF09; Article Num 27, Title 第二十七条, Caption （原産地の証明）, ¶1 Item 2 Sentence 1; queue text == Lean quote == doc quote == decoded audit needle |
| law identity | PASS — CabinetOrder not Act; law num 昭和三十五年政令第六十九号; title 関税暫定措置法施行令; no 関税/税関 or 貯蔵場/蔵置場 transposition; every CJK run traced to authoritative source |
| article caption | PASS — impl:17 and doc:13 match raw ArticleCaption exactly |
| amount | PASS — 二十万 → 200000; forms 200_000/200,000/200000/20万 agree; 以下 inclusive (≤) |
| article-kind locator | PASS — `find_article_text("第二十七条")` len 780, needle + caption present |
| Lean proofs | PASS — `Money = Nat`; `agree_duty_free_threshold` proves `p ≤ 200000 ↔ p < Nat.succ 200000` with core lemmas only, axiom-free; boundary theorems by decide; no forbidden constructs in code; EXCEPTION scope (前号 exclusion) declared |
| audit check name | PASS — ASCII-only English; audit 231/231 |

## Closing

U-1 reproduced and fixed; all gates remain green (743-job build, 231/231 audit, no-sorry, 3 axiom-free theorems). No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
