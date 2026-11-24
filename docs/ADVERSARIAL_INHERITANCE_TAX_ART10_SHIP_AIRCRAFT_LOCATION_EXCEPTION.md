# Independent adversarial review — 相続税法 第十条(1) 第一号 EXCEPTION

Unit: NORM|424b2bac8659abc04e9d8a1ad5d253983282371dfd1da0a4afcb881ca4e8072a
Verbatim source text (injected from the authoritative queue task, not hand-typed): 「ただし、船舶又は航空機については、船籍又は航空機の登録をした機関の所在」

## Verdict: NO FINDINGS

The independent adversarial reviewer returned NO FINDINGS with all 15 mandated checks
independently reproduced from authoritative sources (queue, INVENTORY, raw law JSON,
audit helpers) — not from the author's prose. A separate programmatic cross-check
also passed with 0 fails (only the expected pre-finalization evidence-field check
was outstanding at review time; it is now satisfied). No defect class from prior
cycles is present.

Checks reproduced (all PASS):
1. Raw sha256 `c01bb9be…5043a7` exact (INVENTORY agrees).
2. Needle ×1; node is `Sentence` (`Function=proviso`, `Num=2`), flat text byte-equal.
3. `source_path` exact: `LawBody[3]/MainProvision/MainProvision[0]/Article:10/Article#10/Paragraph#1/Item#1/ItemSentence/Sentence#2`.
4. Law identity 相続税法 / Act / revision 2026-04-01 matches INVENTORY.
5. kind EXCEPTION, unhandled_conditions=[].
6. Source fidelity: discriminator `ordinary=false, ship=true, aircraft=true`; no location-determination function; Sentence#1 explicitly NOT MODELLED; all CJK codepoints correct in every string including comments (船舶 8239 8236, 航空機 822a 7a7a 6a5f, 船籍 8239 7c4d, 登録をした機関の所在 767b 9332 3092 3057 305f 6a5f 95a2 306e 6240 5728).
7. Needle verbatim once in impl/spec/tests/both docs; no wrong variants (基準, 留保, 北海道運輸局長, 舶舶, あつた) anywhere.
8. Audit literal decodes exactly to needle; name unique; 582 checks; run 582/582.
9. Imports wired (impl/spec/tests) exactly once each.
10. No forbidden placeholders or `simp` in proof bodies.
11. `#print axioms` on all seven theorems: all "does not depend on any axioms".
12. Spec Prop disjunction vs Bool function; agreement theorems axiom-free.
13. Full build succeeded (1918 jobs).
14. No dependencies; no cross-law constant; Sentence#1 / substantive location NOT MODELLED.
15. `LEGAL_REVIEW_PENDING`, `completion_claim=false`; no completion claim.

Non-defect note: the review brief asserted `船舶 8236 8236`, a typo — the authoritative
codepoints are 船=U+8239, 舶=U+8236. The unit files and audit literal already used the
correct `8239 8236`; the typo was removed from the evidence/PR descriptions before
finalization. The placeholder state at review time was expected bookkeeping and has
been replaced. Human legal review remains `LEGAL_REVIEW_PENDING`.
