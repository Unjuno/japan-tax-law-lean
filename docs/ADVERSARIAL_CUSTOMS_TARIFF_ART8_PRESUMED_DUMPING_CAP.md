# Independent adversarial review — 関税定率法 第八条(9)（不当廉売関税）PRESUMPTION

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written and deleted; no repository file modified by the
reviewer; no build run by reviewer.

## Initial verdict: CONCRETE FINDINGS (1) — subsequently CONFIRMED_FIXED

### Finding 1 (C — false statutory/article label) — FIXED

`JapanTaxLaw/CustomsTariffArt8PresumedDumpingCap.lean:4` initially read
`… 関税定率法 ARTICLE_関税定率法(9)（不当廉売関税）PRESUMPTION` — the law title was
substituted into the article-number slot with an unreplaced `ARTICLE_` prefix,
instead of `第八条(9)`. Root cause: in the generator, `.replace("TITLE_PLACEHOLDER",
title)` ran before `.replace("ARTICLE_TITLE_PLACEHOLDER", article_title)`; since
`ARTICLE_TITLE_PLACEHOLDER` contains `TITLE_PLACEHOLDER` as a substring, the law
title clobbered it into `ARTICLE_関税定率法`, so 第八条 was never inserted.

Reproduction: `ascii()` of line 4 showed `\u95a2\u7a0e\u5b9a\u7387\u6cd5 ARTICLE_\u95a2\u7a0e\u5b9a\u7387\u6cd5(9)`.
Fix: reorder the replacements so `ARTICLE_TITLE_PLACEHOLDER` is substituted first,
then regenerate. Line 4 now reads `… 関税定率法 第八条(9)（不当廉売関税）PRESUMPTION`
(`\u7b2c\u516b\u6761` present, no `ARTICLE_`, law title once).

Confirming review: **CONFIRMED_FIXED** — independent byte-level re-read, scanned
all 1,275 deliverable `.lean`/`.md` files for broken article-label patterns (0 hits),
re-confirmed quote fidelity (ends `…を課すること。`), U+5B89 安 count 0,
不当廉売価格 (U+5EC9 廉) and 暫定的な関税 (U+66AB) intact, and recomputed the
CRLF→LF-normalized impl sha256 `be5fc5a8…5314` (matches). No new findings.

## All other checks (verified-correct, no finding)

| # | Check | Result |
|---|---|---|
| 1 | independent sha256 | PASS — `924a01d3…e9c` (hashlib, raw bytes) matches claim & INVENTORY. |
| 2 | needle fidelity | PASS — queue needle byte-identical to source-path text (61 codepoints); whole-law count 1; Article Num=8 Title 第八条 Caption （不当廉売関税） ¶9 Item#1 ItemSentence; Lean quote/doc/audit `\\u` literal all byte-equal. |
| 3 | law identity | PASS — 関税定率法 (NOT 関税法), 明治四十三年法律第五十四号, Act, revision …508AC0000000005; all statutory literals byte-correct; 廉/安 and 暫/一時 distinctions verified. |
| 4 | interpretive faithfulness | PASS — saturating-subtraction cap is a faithful computable slice; investigation method & 正常価格 definition correctly out of scope; additive spec genuinely distinct & equivalent in both branches (unfair ≤ normal and > normal). |
| 5 | article-kind locator | PASS — `find_article_text("第八条")` len 6919 with needle; ASCII-only English audit check name; no duplicate implementation. |
| 6 | proof soundness | PASS — `agree_within_cap` universal & axiom-free; dumping branch `Nat.le_sub_iff_add_le` correct; non-dumping branch reduces to duty=0 correct; `margin_zero_when_no_dumping` correct; no sorry/admit/axiom/Classical.choice. |
| 7 | boundary tests | PASS — margin 400, duty≤400 allowed, duty=401 rejected, no-dumping margin 0. |

**U (non-blocking):** legal correctness remains `LEGAL_REVIEW_PENDING`; axiom profile
and compilation inferred from source/artifact inspection (no `lake build` per instruction).

## Closing

One concrete finding raised, reproduced, fixed, and independently confirmed fixed.
No legal correctness claim; human legal review remains `LEGAL_REVIEW_PENDING`.
