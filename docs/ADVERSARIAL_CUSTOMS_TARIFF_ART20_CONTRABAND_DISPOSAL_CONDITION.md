# Independent adversarial review — 関税定率法 第二十条（ArticleCaption）CONDITION

Unit: NORM|6c30cf8dbebe8cce20c0fcc0c11f69394a2c8dab5b47cd3d1c36c2b6fa7d4e1b
Verbatim (injected from the authoritative queue task, not hand-typed):
  「（違約品等の再輸出又は廃棄の場合の戻し税等）」

## Verdict: NO FINDINGS (independent adversarial review + programmatic cross-check)

The independent adversarial reviewer returned NO FINDINGS with all 16 mandated checks
independently reproduced from authoritative sources (pinned raw law, queue, INVENTORY,
audit harness, Lean toolchain) — not from the author's prose. A separate 26-point
programmatic cross-check also passed with 0 fails.

Checks reproduced (all PASS):

1. Raw sha256 `924a01d3…86ae9c` matches.
2. Needle occurs exactly once in the whole law text and in raw JSON bytes.
3. `find_article_text("第二十条")` len 1487, needle present once.
4. `source_path` resolved node-by-node in the raw JSON: LawBody → MainProvision →
   Article (Num=20, ArticleTitle=第二十条) → ArticleCaption, whose single string
   child is the needle byte-for-byte.
5. Law identity 関税定率法 / 明治四十三年法律第五十四号 / Act; INVENTORY current
   revision matches.
6. kind CONDITION, kinds=['CONDITION'], unhandled_conditions = [].
7. Fidelity/scope: sub-terms 違約品等 / 再輸出 / 廃棄 / 戻し税等 / 又は all faithful
   (no 廢/還 variants); impl `GoodsCase{reexport,disposal,other}` + Bool
   `withinCondition`; spec Prop disjunction; three boundary theorems + agreement;
   又は = inclusive OR (either listed case true, other false). Docs explicitly mark
   operative text, drawback mechanics, 等 extensions and legal correctness NOT MODELLED.
8. Needle verbatim (byte-exact) in impl (×2), spec (×1), tests (×1), UNIT doc (×1),
   this doc (×1).
9. Audit literal ASCII-only `\u`-escaped, decodes codepoint-exact to needle; name
   unique; 452 checks defined; run 452/452 including the unit's PASS.
10. Imports wired in `JapanTaxLaw.lean` (impl/spec/tests), exactly once each.
11. No forbidden constructs in code bodies (only doc-comment prose mentions them).
12. `#print axioms` on the four theorems: all "does not depend on any axioms".
13. Spec independence: `SpecWithinCondition : Prop` vs Bool impl; agreement proof
    uses only cases/constructor/left/right/rfl/rcases.
14. Full build succeeded (1381 jobs).
15. No 15-digit law IDs in the Lean files; task dependencies = [].
16. `LEGAL_REVIEW_PENDING`, `completion_claim=False`; no completion claim. The
    pre-review verdict placeholder was expected bookkeeping, now replaced.

No concrete H/T/D/C/U finding was reproduced. Human legal review remains
`LEGAL_REVIEW_PENDING`.
