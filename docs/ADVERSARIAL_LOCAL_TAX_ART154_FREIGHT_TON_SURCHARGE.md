# Independent adversarial review — 地方税法 第百五十四条(1)（貨物自動車 標準税率 加算公式）

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written and deleted; no repository file modified by the
reviewer; no build run by reviewer.

## Verdict: NO FINDINGS. All checks pass.

| # | Check | Result |
|---|---|---|
| 1 | independent sha256 | PASS — `3dd29e00…68d53` (12,181,725 B) matches claim & INVENTORY `source_sha256`. |
| 2 | needle fidelity | PASS — queue needle byte-exact; whole-law count 1; Article Num=154 Caption （自動車税の標準税率） ¶1 table cell (row 43: （９）最大積載量が八トンを超えるもの … 四万五百円に…六千三百円を加算した額). Lean quote & audit `\\u` literal byte-equal to queue/raw. |
| 3 | law identity / labels | PASS — Act 地方税法, 昭和二十五年法律第二百二十六号, revision …508AC0000000002; every statutory literal matches INVENTORY/raw. Only non-statutory gloss is the descriptive header （貨物自動車 標準税率 加算）, a comment label, not asserted verbatim. |
| 4 | 40500 vs 45000 | PASS — base 四万五百: 百 = U+767E → 40,500; 八 → 8 → 8000 kg; 六千三百 → 6300. All Lean files use 40_500/8_000/6_300; zero 45,000/四万五千 residue in impl/spec/tests (sole mention in unit doc is the explicit historical-correction note). |
| 5 | article-kind locator | PASS — `find_article_text("第百五十四条")` len 3565, has_needle True. |
| 6 | proof soundness | PASS — spec genuinely distinct `(excess−1)/1000+1` vs impl `(excess+999)/1000`; `agree_chargeable_tons` universal & axiom-free (no sorry/admit/axiom/Classical.choice/omega/Quot.sound); `ceil_div_identity` sound (verified core signatures `Nat.add_mul_div_left (x z) {y} (H:0<y)`, `Nat.sub_add_cancel`, `Nat.add_sub_assoc`); boundaries 8000→0→40,500, 8001→1→46,800, 9000→1→46,800, 9001→2→53,100; corroborated by raw table row 42 (七トン超八トン以下 = 四万五百円). |
| 7 | rounding interpretation | PASS — 「一トンまでごとに」 = per started ton (round up), confirmed by bracketed-ton structure in raw. |
| 8 | audit check name | PASS — ASCII-only English check name; `\\u`-escaped needle equals queue. |
| 9 | duplicate | PASS — no pre-existing duplicate implementation for this norm id. |

**U (non-blocking):** reviewer did not run `lake build` per instructions; proof soundness established by source inspection and exact core-lemma signature verification. No legal correctness claim; human legal review remains `LEGAL_REVIEW_PENDING`.

## Closing

No concrete findings; no fixes required. No claim of legal correctness; human
legal review remains `LEGAL_REVIEW_PENDING`.
