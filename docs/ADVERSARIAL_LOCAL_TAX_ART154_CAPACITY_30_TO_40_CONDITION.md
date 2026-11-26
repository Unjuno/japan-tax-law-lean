# Independent adversarial review — 地方税法 第百五十四条 CONDITION (>30, <=40)

Unit: NORM|aa32cf8b9a6339adb0c07216fe43e73857aaea91f64393d2c754d5883c44b9bb
Verbatim source text (injected from the authoritative queue task, not hand-typed): 「（２）　乗車定員が三十人を超え、四十人以下のもの」

## Verdict: NO FINDINGS

The independent adversarial reviewer returned NO FINDINGS with all 15 mandated checks
reproduced from authoritative sources (raw law JSON, queue, INVENTORY, audit helpers)
— not from the author's prose. A separate programmatic cross-check also passed with
0 fails (only the expected pre-finalization evidence-field check was outstanding at
review time; it is now satisfied). No concrete H/T/D/C/U defect was reproduced,
including none of the four prior source-CJK defect classes.

Checks reproduced (all PASS):
1. Raw sha256 `3dd29e00…be68d53` exact (matches INVENTORY `raw_snapshot.source_sha256`).
2. Needle ×1 in whole law; codepoints FF08 FF12 FF09 3000 4E57 8ECA 5B9A 54E1 304C 4E09 5341 4EBA 3092 8D85 3048 3001 56DB 5341 4EBA 4EE5 4E0B 306E 3082 306E; `を超え` strict, `以下` inclusive.
3. Tree trace LawBody → MainProvision → Article Num=154 (第百五十四条) → Paragraph Num=1 → TableStruct → Table → TableRow → TableColumn → Sentence Num=1; matches queue `source_path` exactly.
4. Law identity 地方税法 / Act / 昭和二十五年法律第二百二十六号 / revision 2026-11-01 matches INVENTORY.
5. kind CONDITION, kinds=[CONDITION], unhandled_conditions=[].
6. Source fidelity: bounds from kanji 三十 (4E09 5341) / 四十 (56DB 5341); half-open interval (30,40] honoured; 31/40 qualify, 30/41 rejected; no table structure/rate invented; NOT MODELLED stated.
7. Needle present once with exact codepoints in all five artifacts; zero hits for 基準/留保/北海道運輸局長/東北海運局長/あつた; all other CJK is pinned metadata or boilerplate and exact.
8. Audit literal decodes exactly to needle; locator 第百五十四条 (7B2C 767E 4E94 5341 56DB 6761); name unique; 663 checks; run 663/663.
9. Imports wired exactly once each (`JapanTaxLaw.lean` L1247–L1249).
10. No forbidden placeholders or `simp` in proof bodies (comment prose only).
11. `#print axioms` on all seven theorems: each "does not depend on any axioms", including both `by decide` boundary theorems and `interval_spec_agreement`.
12. `SpecWithinInterval` representationally distinct; equivalence proved via Nat-specific core lemmas.
13. Full build succeeded (2209 jobs), 0 errors.
14. `dependencies=[]`; no cross-law constant; table structure/tax rate/legal correctness NOT MODELLED.
15. `LEGAL_REVIEW_PENDING`; no completion claim.

Human legal review remains `LEGAL_REVIEW_PENDING`.
