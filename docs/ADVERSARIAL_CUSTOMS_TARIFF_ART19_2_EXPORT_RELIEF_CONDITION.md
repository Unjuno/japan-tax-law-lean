# Independent adversarial review — 関税定率法 第十九条の二（ArticleCaption）CONDITION

Unit: NORM|94f8ac863c981996cb5c2c94d16ae32907d432241027cf14c7a43894887c873a
Verbatim (injected from the authoritative queue task, not hand-typed):
  「（課税原料品等による製品を輸出した場合の免税又は戻し税等）」

## Verdict: NO FINDINGS (independent adversarial review + programmatic cross-check)

The independent adversarial reviewer returned NO FINDINGS with all 16 mandated checks
independently reproduced from authoritative sources (queue needle, raw JSON, INVENTORY,
audit helpers) — not from the author's prose. A separate 29-point programmatic
cross-check also passed with 0 fails.

Checks reproduced (all PASS):

1. Raw sha256 `924a…e9c` exact match.
2. Needle whole-law count exactly 1.
3. `find_article_text("第十九条の二")` len 1574, needle present once.
4. `source_path` exact; resolved `LawBody[1] → MainProvision → Article(Num=19_2,
   idx 33) → ArticleCaption`; the caption node's single string equals the needle
   byte-for-byte.
5. Law identity 関税定率法 / 明治四十三年法律第五十四号 / Act; revision = INVENTORY
   current (raw LawNum also matches).
6. kind CONDITION, unhandled_conditions = [].
7. Caption sub-terms 課税原料品等 (U+8AB2 課) / 免税 / 戻し税 (U+623B) faithful;
   impl `ProductCase`/`Relief`/Bool `withinCondition` models exportCase with
   exemption or drawback; four boundary theorems; no operative-text overclaim;
   no 還税 (U+9084) in any caption string.
8. Needle verbatim (byte-exact) in impl, spec, tests, UNIT doc and this doc.
9. Audit literal ASCII-only `\u`-escaped, decodes exactly to needle; unique name;
   436 checks defined; run 436/436, rc 0.
10. Impl/spec/tests imports in `JapanTaxLaw.lean`, exactly once each.
11. No forbidden placeholder in code bodies (all mentions are doc comments).
12. After `lake build`, `#print axioms`: all five theorems "does not depend on
    any axioms".
13. Spec is Prop predicate vs impl Bool; `agree_within_condition` uses only
    cases/rfl/rcases — no decide/simp/propext.
14. `lake build` succeeded (1342 jobs); nested `match`, no multi-pattern
    `match c, r with`.
15. `dependencies = []`; no cross-law constant claimed.
16. Queue `legal_review = LEGAL_REVIEW_PENDING`, `completion_claim = false`; docs
    state legal correctness NOT MODELLED; no completion claim.

The reviewer confirmed both recorded development fixes are substantively present:
correct needle bytes / U+623B 戻 everywhere plus the `\u`-escaped audit literal
(CJK fix), and nested `match` with a fresh rebuild yielding axiom-free theorems
(propext fix).

Non-blocking observations (not defects): the queue entry is still `NOT_STARTED`
with empty evidence at review time (expected before finalization); the transient
dev-script structural assertions are not in the tree (the substantive fix —
programmatic needle injection — is verified); and the UNIT doc's earlier label
"関税 (U+8AB2)" was a prose slip for 課税 (U+8AB2) — corrected, since the needle
bytes were always correct. No concrete H/T/D/C/U finding was reproduced.
Human legal review remains `LEGAL_REVIEW_PENDING`.
