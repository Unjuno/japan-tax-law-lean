# Independent adversarial review — 税関関係手数料令 第二条(1)第三号（保税蔵置場又は保税展示場の許可手数料: 16,400 / 16,200円）

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written and deleted; no repository file modified by the
reviewer; `lake build` not run by reviewer.

## Verdict: TWO CONCRETE FINDINGS (both false statutory labels from hand-typed headers) — reproduced and FIXED. All numeric/needle claims PASS.

### F1 — MEDIUM (FIXED): false statutory title 関税関係手数料令 → 税関関係手数料令

- **H:** "Law 329CO0000000164 is named 関税関係手数料令" — false.
- **T:** authoritative `raw.revision_info.law_title` = `税関関係手数料令` (`\u7a0e\u95a2\u95a2\u4fc2...`; 税 U+7A0E then 関 U+95A2); INVENTORY `official_title`, queue `law_title` agree. The string 関税関係手数料令 (関税 = U+95A2 U+7A0E, transposed) occurs **0** times in authoritative sources. It appeared in impl:4 (hand-written header, self-contradicting line 8 which had the correct injected title), spec:4,6, tests:4, doc:1,5,25, audit:1304,1308. The doc's "byte-fidelity confirmed" claim was false for its displayed title.
- **D: FAIL** (label only; no numeric/proof/hash impact).
- **Fix applied:** replaced 関税関係手数料令 → 税関関係手数料令 in all 5 files; re-verified 0 wrong occurrences. The programmatic title injection (impl:8) was already correct — the error was in hand-written header lines.
- **Post-fix D: PASS.**

### F2 — MEDIUM (FIXED): false article caption 保税貯蔵場 → 保税蔵置場

- **H:** "caption is （保税貯蔵場又は保税展示場の許可手数料）" — false.
- **T:** authoritative `ArticleCaption` = `（保税蔵置場又は保税展示場の許可手数料）` (`蔵置` = U+8535 U+7F6E). Raw count: 保税蔵置場 = **791**, 保税貯蔵場 (貯 U+8C29 蔵 U+8535) = **0**. Wrong form appeared in impl:4,17, spec:8, doc:1,14, audit:1304.
- **D: FAIL** (verbatim-label only; needle does not contain this phrase, so amounts/hash unaffected).
- **Fix applied:** replaced 保税貯蔵場 → 保税蔵置場 in all 5 files; re-verified 0 wrong occurrences.
- **Post-fix D: PASS.**

### Verified passes (no finding)

| Check | Result |
|---|---|
| sha256 raw JSON | PASS — `9ded2444…f83e8` matches |
| law identity / revision | PASS — CabinetOrder not Act, 昭和二十九年政令第百六十四号, real current revision |
| needle codepoints | PASS — U+FF08/FF09 parens, あつて = U+3042 U+3064 U+3066, verbatim |
| kanji reading | PASS — 一万六千四百円 = 16,400; 一万六千二百円 = 16,200; difference 200 |
| all numeric forms | PASS — 16_400/16,400/16400 and 16_200/16,200/16200 agree everywhere; no 576,600-type error |
| byte fidelity | PASS — audit needle == queue == Lean quote == doc quote; あつて preserved |
| needle location | PASS — whole-law count 1; Article 2 ¶1 Item 3 Column 2 Sentence 1; 3 articles titled 第二条 exist (main one holds needle) |
| article-kind locator | PASS — `find_article_text("第二条")` len 2048, has_needle=True |
| spec independence / proofs | PASS — `agree_fee_difference` (decomposition) distinct from `designated_lt_general` (inequality); both by decide, axiom-free; no forbidden constructs in code |
| interpretation | PASS — alternatives by applicant status faithful; kind CONDITION; boundaries/proration out of scope honestly declared |

## Closing

F1/F2 reproduced and fixed; all gates re-run green (734-job build, 228/228 audit, no-sorry, 2 axiom-free theorems). No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
