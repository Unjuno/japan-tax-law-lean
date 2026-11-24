# Independent adversarial review — 相続税法 第十九条 ArticleCaption CONDITION

Unit: NORM|5516848edbb7f5724c02b0141483fea8ef899ac593f2f53c9f5391cf56330214
Verbatim source text (injected from the authoritative queue task, not hand-typed): 「（相続開始前七年以内に贈与があつた場合の相続税額）」

## Verdict: 1 FINDING (HIGH) — hand-typed CJK mistranscription; FIXED & CONFIRMED

The reviewer found one HIGH defect (the same defect class as prior cycles):

- F-1: `JapanTaxLaw/InheritanceTaxArt19SevenYearGiftCondition.lean:41` had a hand-typed
  docstring `相続開始前七年以内に贈与があった場合` using **あった** (U+3042 U+3063 U+305F,
  small tsu U+3063), whereas the authoritative caption uses **あつた** (U+3042 U+3064
  U+305F, tsu U+3064). Verified from raw law: `あつた` present in the Article 19
  ArticleCaption, `あった` count 0 there. The canonical quote (impl:17), spec, tests,
  both docs and the audit literal were already correct; only line 41 (and its generator
  template) were hand-typed from the brief's wrong needle. This falsified the impl's
  "all statutory terms reproduced programmatically" claim and the doc's "no hand-typed
  CJK" claim for that line.
- Fix: replaced あった → あつた programmatically in the implementation AND the generator
  (so regeneration is stable). Confirmed: あった count 0, あつた count 2 in impl; 0 wrong
  variants in all deliverables. Regression guards added (33 checks incl. the
  あつた/あった distinction). Full `lake build` re-run successfully (1867 jobs).

Other mandated checks (all PASS):
1. Raw sha256 `c01bb9be…5043a7` exact (INVENTORY agrees).
2. Caption occurs exactly once; confirmed it IS Article 19's ArticleCaption via the
   queue's own decomposition (tags `('Article','ArticleCaption')`, ordinal 0).
3. `source_path` exact: `LawBody[3]/MainProvision/MainProvision[1]/Article:19/Article#19/ArticleCaption`.
4. Law identity 相続税法 / Act / INVENTORY revision matches.
5. kind CONDITION, unhandled_conditions=[].
6. Source fidelity: 七年以内 inclusive (years 0–7 apply, 8 does not, no-gift does not);
   no amount computation duplicated (GiftAddBack.lean is separate); NOT MODELLED documented.
7. Needle verbatim (now with あつた) in impl/spec/tests/both docs; audit `\u`-literal
   decodes to exact needle; name unique; 572 checks; run 572/572.
8. Imports wired (impl/spec/tests) exactly once each.
9. No forbidden placeholders or `simp` in any Lean body.
10. `#print axioms` on all seven theorems: all "does not depend on any axioms".
11. Spec Prop conjunction vs Bool function; agreement/universal implication axiom-free.
12. Full build succeeded (1867 jobs).
13. No dependencies; no cross-law constant; amount computation / add-back definition NOT MODELLED.
14. `LEGAL_REVIEW_PENDING`, `completion_claim=false`; no completion claim.

Note: the review brief itself asserted the wrong あった needle — it is not authoritative;
the queue/raw source (あつた) was used for the fix. No remaining findings. Human legal
review remains `LEGAL_REVIEW_PENDING`.
