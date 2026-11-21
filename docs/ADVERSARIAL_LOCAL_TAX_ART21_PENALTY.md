# Independent adversarial review — 地方税法 第二十一条(1)（罰則: 三年以下の拘禁刑又は二十万円以下の罰金）

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written and deleted; no repository file modified by the
reviewer; `lake build` not run by reviewer.

## Verdict: TWO CONCRETE FINDINGS (both documentation/provenance) — reproduced and FIXED. The four audited formalization files pass every substantive check.

### Critical disambiguation (H/T/D)

- **H:** the Lean quote/audit needle has a byte-level CJK defect `動いた` (U+3044) vs queue `動した` (U+3057).
- **T:** reviewer initially transcribed the prompt's paraphrase literally and got a false mismatch; then read the authoritative machine queue.
- **D: FAIL for the hypothesis** — the four audited files are byte-faithful. Queue `text` = `動した` (U+3057); QUEUE == Lean quote == audit needle == raw-law substring, 30 codepoints. The prompt paraphrase (`動いた`) was the outlier.

| # | Check | Result |
|---|---|---|
| 1 | sha256 raw JSON | PASS — `3dd29e00…68d53`, 12,181,725 B; INVENTORY same uppercase |
| 2 | needle whole-law count | PASS — 1 |
| 3 | containing structure | PASS — Article Num=21, ArticleTitle 第二十一条, len 251, Paragraph 1, Sentence 1; matches source path |
| 4 | law identity / revision | PASS — INVENTORY + raw revision_info consistent; Act, 地方税法, 昭和二十五年法律第二百二十六号; CurrentEnforced |
| 5 | article-kind locator claim | PASS — find_article_text(...,"第二十一条") returns len 251 str with needle |
| 6 | numeric ceilings | PASS — 三年以下 → 36 months, 二十万円以下 → 200,000, both inclusive; 36✓/37✗, 200000✓/200001✗ kernel-sound |
| 7 | 「又は」 modeling | PASS — inductive Penalty, no 併科 in article text (contrast とん税 clause with 併科); alternative not cumulative, consistent with UsForcesDutyFreePenalty |
| 8 | independent spec | PASS — specWithinLimits Prop successor-strict form distinct from Bool withinLimits; agree_within_limits universal, non-circular, proves claimed equivalence |
| 9 | axiom hygiene | PASS — no sorry/admit/axiom/Classical.choice/unsafe; [propext] via simp permitted |

## F1 — wrong kana in supporting docs/PR body (FIXED)

- **H:** `docs/UNIT_LOCAL_TAX_ART21_PENALTY.md:11,26,38` and `_pr_body33.md:3,26` had `動いた` (U+52D5 U+3044 U+305F U+8005) vs authoritative `動した` (U+3057).
- **T:** `print('動した者' in open('docs/UNIT_LOCAL_TAX_ART21_PENALTY.md'...).read())` → False; queue text `\u52d5\u3057\u305f...`.
- **D: FAIL** for docs/PR body (the four audited files PASS). **Fix:** replaced `動いた` → `動した` in the unit doc (3×), PR body (2×), and the impl's hand-written scope note (1×; the verbatim quote itself was already correct because injected from queue). Re-verified count 0. Impl hash refreshed `ae2fcc05…` → `b6186eee…`.
- **C:** the task prompt paraphrase contained `動いた`, but the machine queue, raw law, and injected quote are definitive: `動した`.
- **U:** label-only; no formalization impact, but the doc explicitly claimed byte fidelity while showing wrong kana.

## F2 — stale comment label in audit script (FIXED)

- **H:** `scripts/ci/transcription_audit.py:1304` had `# 相続税法 第十六条の表(1) — InheritanceTaxRateBracket30_50.lean` immediately above the 地方税法/LocalTaxArt21Penalty check — wrong law and model.
- **T:** read lines 1304–1312; the yield tuple was correct (325AC0000000226 / 第二十一条 / LocalTaxArt21Penalty), the genuine InheritanceTaxRateBracket30_50 check exists separately.
- **D: FAIL** (mislabel). **Fix:** removed the stale comment line. Cosmetic only — the check tuple was correct.
- **U:** none material.

## C/U (non-findings)

- U1: reviewer could not run lake/#print axioms (no lean on PATH, no .olean); source inspection only.
- U2: kind=CONDITION assigned by queue, not fabricated; docs honestly call it a penalty clause.
- C/U3: withinLimits accepts m=0/y=0; Criminal Code minima out of declared "numeric ceilings only" scope.
- U4: queue scope FULL_ARTICLE but model covers art.21(1); para.2 out of scope in docs.
- U5: evidence-ledger gap at review time (unit not yet registered) — expected mid-iteration.

## Closing

F1/F2 reproduced and fixed; four audited formalization files pass all substantive checks. No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
