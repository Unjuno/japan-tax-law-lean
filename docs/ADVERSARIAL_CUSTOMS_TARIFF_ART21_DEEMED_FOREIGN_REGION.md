# Independent adversarial review — 関税定率法 第二十一条 DEEMING

Unit: NORM|abdefe5d8becbbaf72feb57bf8fe19255467b5f2872b4c2d030feff151188908
Verbatim source text (injected from the authoritative queue task, not hand-typed): 「（外国とみなす地域）」

## Verdict: NO FINDINGS

The independent adversarial reviewer returned NO FINDINGS with all 15 mandated checks
independently reproduced from authoritative sources (queue, INVENTORY, raw law JSON,
audit helpers) — not from the author's prose. A separate programmatic cross-check
also passed with 0 fails (only the expected pre-finalization evidence-field check
was outstanding at review time; it is now satisfied).

Checks reproduced (all PASS):

1. Raw sha256 `924a01d3…986ae9c` from the pinned raw law bytes; sole matching raw file.
2. Needle occurs exactly once in the whole law at `law_full_text.children[1].children[1].children[38].children[0].children[0]`.
   The Article (Num=21) flat text is `（外国とみなす地域）第二十一条この法律の適用については、政令で定める本邦の地域は、当分の間、外国とみなす。`, byte-identical to the pinned context.
3. `source_path` exact: `LawBody[1]/MainProvision/MainProvision[38]/Article:21/Article#21/ArticleCaption`.
4. Law identity 関税定率法 / Act / INVENTORY revision (2026-06-01) all consistent.
5. kind DEEMING, unhandled_conditions=[], dependencies=[].
6. Source fidelity: designatedDomestic deemed foreign; domestic/foreign not. No
   designation mechanism or 当分の間 modelling in code; docs mark all three NOT MODELLED.
7. Needle exact codepoints `ff08 5916 56fd 3068 307f 306a 3059 5730 57df ff09` in all
   5 artifacts; full article text byte-identical in impl and UNIT doc; queue text/norm_fragment
   equals raw needle; no wrong-codepoint variants.
8. Audit name unique (count 1); literal decodes exactly to needle; whole-law locator
   (correct for a caption needle); 489 checks; run 489/489 with this unit's PASS.
9. Imports wired in `JapanTaxLaw.lean` (impl/spec/tests) exactly once each.
10. No forbidden placeholders or `simp` in any Lean body (doc-comment mentions only).
11. `#print axioms` on all six theorems: all "does not depend on any axioms".
12. Spec Prop equality vs Bool function; both agreement theorems axiom-free.
13. Full build succeeded (1603 jobs), zero errors (pre-existing unrelated warnings).
14. No dependencies; no cross-law constant; only local RegionStatus/isDeemedForeign.
15. `LEGAL_REVIEW_PENDING`, `completion_claim=false`; legal correctness NOT MODELLED;
    no completion claim.

Non-defect context: a separate pre-existing unit `CustomsTariffArt21Deeming.lean`
(different NORM id, operative-sentence needle) has its own audit check and imports;
it is not part of this unit and does not affect these results. The placeholder state
at review time has been replaced. Human legal review remains `LEGAL_REVIEW_PENDING`.
