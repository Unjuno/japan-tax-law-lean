# Independent adversarial review — 関税定率法 第七条 EXCEPTION

Unit: NORM|1432e7d9fd592fd3f859fd0bb6be8bf74a4119a191bd87e0ad89bbc16a123d15
Verbatim source text (injected from the authoritative queue task, not hand-typed): 「第七項、第八項（第一号を除く。）及び第九項の規定は、前項の調査が開始された場合について準用する。」

## Verdict: NO FINDINGS

The independent adversarial reviewer returned NO FINDINGS with all 15 mandated checks
reproduced from authoritative sources (raw law JSON, queue, INVENTORY, audit helpers)
— not from the author's prose. A separate programmatic cross-check also passed with
0 fails (only the expected pre-finalization evidence-field check was outstanding at
review time; it is now satisfied). No concrete H/T/D/C/U defect was reproduced,
including none of the four prior source-CJK defect classes.

Checks reproduced (all PASS):
1. Raw sha256 `924a01d3…86ae9c` exact (matches INVENTORY `raw_snapshot.source_sha256`).
2. Needle ×1 in whole raw law; located at LawBody[1]→MainProvision→Article Num=7→Paragraph Num=15→ParagraphSentence→Sentence Num=1; contains the item-1 carve-out and the investigation gate.
3. `source_path` exact: `LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/Paragraph#15/ParagraphSentence/Sentence#1`.
4. Law identity Act / 明治四十三年法律第五十四号 / 関税定率法 / revision 2026-06-01 matches INVENTORY.
5. kinds=[EXCEPTION,READING,CONDITION], unhandled_conditions=[].
6. Source fidelity: included p7/p8Other/p9=true, p8Item1/other=false; `applies = investigationStarted && included p`; no invented amounts/effects; NOT MODELLED documented.
7. All CJK in five artifacts extracted and verified: needle contains `調` = **U+8ABF** (never 8AB2/8AB3); pinned title/law-num exact; no 基準/留保/東北海運局長/あつた variants.
8. Audit literal `\u`-escapes decode byte-for-byte to needle (`\u8abf`); name unique; 621 checks; run 621/621 including this unit.
9. Imports wired exactly once each (`JapanTaxLaw.lean` lines 407–409).
10. No forbidden placeholders or `simp` in proof bodies (docstring mentions only).
11. `#print axioms` on all seven theorems: each "does not depend on any axioms"; `applies_spec` uses only cases/constructor/refine/rfl — no decide/simp/propext.
12. `SpecApplies : Bool → Provision → Prop` representationally distinct from the Bool selector; equivalence proved by exhaustive cases.
13. Full build succeeded (2038 jobs), 0 errors.
14. `dependencies=[]`; no cross-law constant; incorporated content / legal effect / legal correctness NOT MODELLED.
15. `LEGAL_REVIEW_PENDING`, `completion_claim=false`; no completion claim.

Human legal review remains `LEGAL_REVIEW_PENDING`.
