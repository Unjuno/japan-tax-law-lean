# Independent adversarial review — 関税定率法 第九条 CONDITION

Unit: NORM|7cfb458918c95cb9c89dfc9e3f230612412a98de1f8426918de7269131260be4
Verbatim source text (injected from the authoritative queue task, not hand-typed): 「当該貨物につき、別表の税率による関税のほか、当該輸入される貨物の課税価格と同額以下の関税を課すること。」

## Verdict: NO FINDINGS

The independent adversarial reviewer returned NO FINDINGS with all 15 mandated checks
reproduced from authoritative sources (raw law JSON, queue, INVENTORY, audit helpers)
— not from the author's prose. A separate programmatic cross-check also passed with
0 fails (only the expected pre-finalization evidence-field check was outstanding at
review time; it is now satisfied). No concrete H/T/D/C/U defect was reproduced.

Checks reproduced (all PASS):
1. Raw sha256 `924a01d3…86ae9c` exact (INVENTORY/queue agree).
2. Needle ×1 in whole law; resolves to Article 9 ¶4 item1 Sentence#1. `同額以下` = not exceeding (≤), `ほか` = additive — interpretation faithful.
3. `source_path` exact: `LawBody[1]/MainProvision/MainProvision[19]/Article:9/Article#9/Paragraph#4/Item#1/ItemSentence/Sentence#1`.
4. Law identity 関税定率法 / Act / 明治四十三年法律第五十四号 / revision 2026-06-01 matches INVENTORY and pinned metadata.
5. kind=CONDITION, kinds=[CONDITION,EFFECT], unhandled_conditions=[].
6. Source fidelity: `withinCap = additionalDuty ≤ taxableValue`, `totalDuty = tableDuty + additionalDuty`; boundary theorems (equal/zero/exceeded, total≥table, total≥additional); no rate/valuation invented; NOT MODELLED documented; weaker `SpecTotal` explicitly labeled "not the full arithmetic equality".
7. Needle byte-for-byte (153 bytes) ×1 in impl/spec/tests/both docs; codepoints match raw. All CJK runs enumerated: pinned title, law-num, `法律`, boilerplate labels, needle. No 基礎/基準, 留置/留保, 東北海運局長/北海道運輸局長, あつた/あった, or 課税価格 mistranslation.
8. Audit literal decodes exactly to needle; name unique; 615 checks; run 615/615 including this unit.
9. Imports wired exactly once each (`JapanTaxLaw.lean` lines 557–559).
10. No forbidden placeholders or `simp` in any proof body (docstring mentions only).
11. `#print axioms` on all seven theorems: each "does not depend on any axioms"; `Nat.le_add_right/left` used, no propext-dependent `Nat.add_sub_cancel_left`.
12. `SpecWithinCap` representationally distinct (`¬ taxableValue < additionalDuty`), equivalence proved; `SpecTotal` component bounds only, honestly labeled.
13. Full build succeeded (2017 jobs), 0 error lines.
14. `dependencies=[]`; no cross-law constant; rate/valuation/legal correctness NOT MODELLED.
15. `LEGAL_REVIEW_PENDING`, `completion_claim=false`; no completion claim.

Brief-only note (not a file defect): the review brief listed `課` as U+8A8D; the authoritative raw file uses **U+8AB2**, and all unit files correctly use 8AB2. Human legal review remains `LEGAL_REVIEW_PENDING`.
