# Independent adversarial review — 関税定率法 第十四条(1)（ただし書）EXCEPTION

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written and deleted; no repository file modified by the
reviewer; no build run by reviewer.

## Verdict: NO CONCRETE FINDINGS. All 7 checks independently reproduced and passed.

| # | Check | Result |
|---|---|---|
| 1 | independent sha256 | PASS — `924a01d3…e9c` (hashlib, 9,407,678 B) matches claim, INVENTORY `source_sha256`, queue entry. |
| 2 | needle / source path | PASS — whole-law count 1; Article `Num=14` Title 第十四条 Caption （無条件免税） ¶1 / Item#6 / ItemSentence Sentence#2 (`Function=proviso`, `Num=2`); Lean quote (impl:20), audit `\\u` literal, docs quote all byte-equal to queue needle. |
| 3 | law identity | PASS — 関税定率法, NOT 関税法 (distinct law); 明治四十三年法律第五十四号, Act, revision …508AC0000000005 `CurrentEnforced`; caption/title match raw exactly. |
| 4 | interpretive faithfulness | PASS — `ItemClass{samplesOnly, lowPriceByOrder, other}` honest computable slice of the に限る + 又は scope restriction; `other` outside faithful; `SpecWithinException` Prop disjunction representationally distinct from Bool function; `agree_within_exception` universal via exhaustive cases; `samples_inside`/`lowprice_inside`/`other_outside` rfl, `classes_distinct` by decide with derived DecidableEq — all logically correct, not vacuous (3 constructors, full case split); underlying duty-free item / 政令 low-price determination honestly out of scope. |
| 5 | article-kind locator | PASS — `find_article_text("第十四条")` len 1655 containing needle. |
| 6 | code hygiene / proofs | PASS — no sorry/admit/axiom/Classical.choice/sorryAx/unsafe in code (only comments); theorems universal & axiom-free (propext at most); file hashes impl `2662408451…`/spec `e59e05b7…`/tests `ccd55214…` match evidence claims. |
| 7 | audit name / duplicates | PASS — ASCII-only English audit name; no pre-existing duplicate implementation for this norm id. |

### CJK byte-fidelity — trap resolved against authoritative source

The prompt's typed "verbatim" literals were WRONG and were correctly NOT used as ground truth. Authoritative raw/queue needle (codepoints verified): low-price clause 著しく**価額**の低いもの… (**額 U+984D**, not 格 U+683C); samples clause 見本用にのみ適する**と認められるもの** (no extra もの after 適する). Byte comparisons: impl:20 quote, audit `\\u` needle, docs:10 quote — all byte-equal to queue needle. U+6EDE count 0 throughout.

**U (non-blocking, addressed):** the evidence ledger and PR-body prose contained hand-typed wrong clause forms (価格/適するもの) outside the four audited files. Author corrected the evidence ledger to authoritative terms (価額 U+984D / 見本用にのみ適すると認められるもの); wrong forms no longer remain in the evidence entry. The four audited files (impl/spec/tests/audit) were byte-correct throughout.

## Closing

No concrete findings; no fixes required to the formalization. No legal correctness claim; human legal review remains `LEGAL_REVIEW_PENDING`.
