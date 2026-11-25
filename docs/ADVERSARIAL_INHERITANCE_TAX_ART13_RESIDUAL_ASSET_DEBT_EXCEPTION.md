# Independent adversarial review — 相続税法 第十三条(2) EXCEPTION

Unit: NORM|e1208a4e5009376f0be8af0a4faaca058248f8ac09395b028762e51f640c3ddd
Verbatim source text (injected from the authoritative queue task, not hand-typed): 「前二号に掲げる債務を除くほか、その財産の取得、維持又は管理のために生じた債務」

## Verdict: 1 FINDING (LOW, documentation accuracy) — FIXED & CONFIRMED

The reviewer reproduced all 15 mandated checks; no HIGH defect and no mistranslated
CJK codepoints of the prior-cycle class were found. One LOW finding:

- F-1: `docs/UNIT…md:11` claimed "no hand-typed CJK", but the impl docstring at line 48
  hand-typed a summary string (`前二号の債務を除くほか、財産の取得・維持・管理のための債務`)
  which occurs 0 times in the pinned raw law and is not a substring of the needle.
  All its codepoints were correct and it was not presented as the verbatim quote
  (line 17 is byte-exact), so this is a claim-accuracy issue, not a transcription
  or translation error.
- Fix: replaced the docstring with neutral descriptive prose referring to the
  verbatim quote above, and corrected the UNIT doc claim to say statutory terms are
  reproduced programmatically while explanatory prose is descriptive. Regression
  guards added (28 checks incl. no false claim and no non-verbatim pseudo-quote).
  Confirmed; full `lake build` re-run successfully (1984 jobs).

All other mandated checks PASS:
1. Raw sha256 `c01bb9be…5043a7` exact (INVENTORY agrees).
2. Needle ×1 in whole law; Article 13 ¶2 item3 Sentence#1 flat text byte-identical.
3. `source_path` exact: `LawBody[3]/MainProvision/MainProvision[1]/Article:13/Article#13/Paragraph#2/Item#3/ItemSentence/Sentence#1`.
4. Law identity 相続税法 / Act / revision 2026-04-01 matches INVENTORY + raw.
5. kind EXCEPTION, unhandled_conditions=[].
6. Source fidelity: `isResidualAssetDebt` false/false/true/false; no invented valuation; NOT MODELLED documented; all codepoints correct; no 基準/留保/北海道運輸局長/あつた variants.
7. Needle verbatim in impl/spec/tests/both docs; no wrong variants.
8. Audit literal decodes exactly to needle; name unique; 607 checks; run 607/607.
9. Imports wired (impl/spec/tests) exactly once each.
10. No forbidden placeholders or `simp` in proof bodies.
11. `#print axioms` on all six theorems: all "does not depend on any axioms".
12. Spec Prop equality vs Bool function; axiom-free.
13. Full build succeeded (1984 jobs).
14. No dependencies; no cross-law constant; valuation/preceding items NOT MODELLED.
15. `LEGAL_REVIEW_PENDING`, no completion claim.

No remaining findings. Human legal review remains `LEGAL_REVIEW_PENDING`.
