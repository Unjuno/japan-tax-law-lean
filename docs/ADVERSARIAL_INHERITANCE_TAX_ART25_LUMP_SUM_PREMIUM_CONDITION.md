# Independent adversarial review — 相続税法 第二十五条(1) CONDITION

Unit: NORM|fa8a8f71f0be091e2a94232147a20ebd42a46628962557f1d83fdafcdab82cbb
Verbatim source text (injected from the authoritative queue task, not hand-typed): 「当該契約に係る掛金又は保険料が一時に払い込まれた場合」

## Verdict: NO FINDINGS

The independent adversarial reviewer returned NO FINDINGS with all 15 mandated checks
independently reproduced from authoritative sources (queue, INVENTORY, raw law JSON,
audit helpers) — not from the author's prose. A separate programmatic cross-check
also passed with 0 fails (only the expected pre-finalization evidence-field check
was outstanding at review time; it is now satisfied). No wrong-codepoint defect
class from prior cycles is present in the unit.

Checks reproduced (all PASS):
1. Raw sha256 `c01bb9be…5043a7` exact (INVENTORY agrees).
2. Needle ×1; node chain `LawBody/MainProvision/Chapter(3)/Article(25)/Paragraph(1)/Item(1)/Subitem1(1)/Subitem1Sentence/Column(1)/Sentence(1)`, flat text byte-identical.
3. `source_path` exact: `LawBody[3]/MainProvision/MainProvision[2]/Article:25/Article#25/Paragraph#1/Item#1/Subitem1#1/Subitem1Sentence/Column#1/Sentence#1`.
4. Law identity 相続税法 / Act / 昭和二十五年法律第七十三号 / revision 2026-04-01 matches.
5. kind CONDITION, unhandled_conditions=[].
6. Source fidelity: `PaymentTiming.lumpSum/other`, `isLumpSum` true/false — faithful; no numeric literals in code; valuation amount / other branches / legal correctness documented NOT MODELLED.
7. Needle ×1 in impl/spec/tests/both docs; all CJK runs verified — no 基礎/基準, 留置/留保, 東北海運局長/北海道運輸局長, あつた/あった variants.
8. Audit literal decodes byte-exactly to needle; name unique; 597 checks; run 597/597.
9. Imports wired (impl/spec/tests) exactly once each.
10. No forbidden placeholders or `simp` in proof bodies (only rfl/cases; keyword words in docstring prose).
11. `#print axioms` on all four theorems: all "does not depend on any axioms".
12. Spec Prop equality vs Bool function; representationally distinct, axiom-free.
13. Full build succeeded (1957 jobs).
14. `dependencies=[]`; no law-id tokens or cross-law constants in code; scope exclusions honored.
15. `LEGAL_REVIEW_PENDING` documented; no completion claim.

Correction to the review brief (not a unit defect): the brief asserted a codepoint
`307f` (み) inside `一時に払い込まれた`; authoritative is `307e` (ま). The unit files
already carry the correct `307e`; the typo was removed from evidence/PR descriptions
before finalization. The placeholder state at review time was expected bookkeeping
and has been replaced. Human legal review remains `LEGAL_REVIEW_PENDING`.
