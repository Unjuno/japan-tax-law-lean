# Independent adversarial review — 相続税法 第十三条(2) 第二号 EFFECT

Unit: NORM|4db9b05db4964c68d07dea49463fe1dd72302abd50067a924db0ecd6d0e054fb
Verbatim source text (injected from the authoritative queue task, not hand-typed): 「その財産を目的とする留置権、特別の先取特権、質権又は抵当権で担保される債務」

## Reviewer verdict: 1 HIGH FINDING — wrong-codepoint CJK in hand-typed prose; FIXED & CONFIRMED

The reviewer reproduced all 15 mandated checks and found one HIGH defect in prose
strings (the executable model, canonical quotes and audit were unaffected). The
review brief itself was wrong: authoritative source has **留置権** (置 U+7F6E), not
留保権 (保 U+4FDD). Confirmed in three places: raw law tree, queue `text`/`norm_fragment`,
and the audit's `\u`-literal (`\u7559\u7f6e\u6a29`). The canonical quotes in the unit
correctly used 留置権.

The defect: six hand-typed prose occurrences used 留保権 (U+4FDD) instead — three
in the implementation (line 20 prose, docstrings at lines 47 and 56), two in the
spec (docstrings), one in the UNIT doc. The English gloss "retention of title" was
also wrong (留置権 is a possessory lien / retention right, not retention of title),
and the impl claim "no hand-typed CJK" was false for those lines.

Fix: replaced all 留保権 → 留置権 programmatically in the deliverables and the
generator, changed the gloss to "possessory lien (retention right)", and retracted
the false provenance claim to "statutory terms above are reproduced from the verbatim
needle; the canonical quote is byte-verbatim." Confirmed: 留保権 count 0 in all five
artifacts; four source terms present in impl prose; generator regenerates correctly;
full `lake build` re-run (1741 jobs). Regression guards added (35 checks incl.
the 留置権/留保権 distinction, the wrong gloss, and the false claim).

All other mandated checks PASS:
1. Raw sha256 `c01bb9be…5043a7` exact (INVENTORY agrees).
2. Needle ×1; Item#2 node = ItemTitle 二 + Sentence = needle.
3. `source_path` exact: `LawBody[3]/MainProvision/MainProvision[1]/Article:13/Article#13/Paragraph#2/Item#2/ItemSentence/Sentence#1`.
4. Law identity 相続税法 / Act / INVENTORY revision matches.
5. kind EFFECT, unhandled_conditions=[].
6. Source fidelity: four enumerated rights listed, other not; boundary theorems; no invented effect; docs mark NOT MODELLED.
7. Canonical quote byte-identical in impl/spec/tests/both docs and the audit literal.
8. Audit name unique; 527 checks; run 527/527.
9. Imports wired (impl/spec/tests) exactly once each.
10. No forbidden placeholders or `simp` in Lean bodies.
11. `#print axioms` on all nine theorems: all "does not depend on any axioms".
12. Spec Prop disjunction vs Bool function; agreement axiom-free.
13. Full build succeeded (1741 jobs).
14. No dependencies; no cross-law constant; substantive effect NOT MODELLED.
15. `LEGAL_REVIEW_PENDING`, `completion_claim=false`; no completion claim.

No remaining findings. Human legal review remains `LEGAL_REVIEW_PENDING`.
