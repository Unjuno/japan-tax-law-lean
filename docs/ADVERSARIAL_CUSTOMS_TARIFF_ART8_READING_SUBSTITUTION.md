# Independent adversarial review — 関税定率法 第八条(14)（読替え）READING

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written and deleted; no repository file modified by the
reviewer; no build run by reviewer.

## Verdict: CONCRETE FINDING (1) — documentation; FIXED and CONFIRMED_FIXED

### Finding (D — false description of implementation & axiom-elimination mechanism) — FIXED

`JapanTaxLaw/CustomsTariffArt8ReadingSubstitutionSpec.lean` doc comment:
- line 11 described the implementation as `if text == oldPhrase ...` (BEq) — FALSE;
  current impl (`CustomsTariffArt8ReadingSubstitution.lean:54-55`) uses propositional
  `if text = oldPhrase then newPhrase else text`.
- line 14 called it "the boolean implementation" — FALSE; no boolean implementation.
- lines 31-32 attributed axiom-freeness to a LawfulBEq BEq→Eq coercion — FALSE and
  misleading; `agree_read_as` is proved by `by_cases h : text = oldPhrase; simp [h]`
  on PROPOSITIONAL equality, no BEq coercion involved. This contradicted the actual
  fix (switching off `==` to eliminate forbidden Classical.choice).

Fix: both stale doc blocks rewritten to describe the current propositional `=`
implementation and the `by_cases`/`simp [h]` proof, with a note that the earlier
BEq `==` version pulled in Classical.choice. Lean code/proofs unchanged (already
correct and axiom-clean). Spec rehashed `6cf6c5e9…7d99`.

### All other checks — verified-correct (no finding)

| # | Check | Result |
|---|---|---|
| 1 | independent sha256 | PASS — `924a01d3…e9c` (hashlib, raw bytes). |
| 2 | needle fidelity | PASS — whole-law count 1; Article Num=8 Title 第八条 Caption （不当廉売関税） ¶14 Sentence#2; Lean quote span (first 「 to last 」, since needle contains brackets) == queue needle byte-for-byte (len 54); old/new literals exact code points (廉 U+5EC9, not 安 U+5B89); audit `\\u` needle == queue. |
| 3 | law identity | PASS — 関税定率法 (NOT 関税法), 明治四十三年法律第五十四号, Act, revision …508AC0000000005; all statutory literals match INVENTORY/raw. |
| 4 | article-kind locator | PASS — `find_article_text("第八条")` len 6919 with needle. |
| 5 | axiom / proof | PASS — `readAs` uses propositional `=` (not `==`); `agree_read_as` only `[propext]`, `phrases_distinct` axiom-free; NO Classical.choice (probe _ax_t69.out); no sorry/admit/axiom; SpecReadAs distinct & equivalent in both cases. |
| 6 | audit name / duplicate | PASS — ASCII-only English check name; no duplicate (CustomsReadingSubstitution.lean is a different norm, art.7(15)). |

**U (non-blocking):** legal correctness remains `LEGAL_REVIEW_PENDING`; hash conventions
consistent with repo CRLF→LF normalization.

## Closing

One concrete documentation finding raised, reproduced, fixed; confirming review pending.
No legal correctness claim; human legal review remains `LEGAL_REVIEW_PENDING`.
