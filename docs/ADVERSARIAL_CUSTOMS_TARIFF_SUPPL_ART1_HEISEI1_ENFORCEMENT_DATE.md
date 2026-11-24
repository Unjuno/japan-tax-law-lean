# Independent adversarial review — 関税定率法 附則第一条 REFERENCE (平成元年四月一日)

Unit: NORM|c1eba0f628630c68c7f8946b94e9d3f7072b2686ad40ae64ab46e7bd1da7af6c
Verbatim source text (injected from the authoritative queue task, not hand-typed): 「この法律は、平成元年四月一日から施行する。」

## Verdict: NO FINDINGS

The independent adversarial reviewer returned NO FINDINGS with all 15 mandated checks
independently reproduced from authoritative sources (queue, INVENTORY, raw law JSON,
audit helpers) — not from the author's prose. A separate programmatic cross-check
also passed with 0 fails (only the expected pre-finalization evidence-field check
was outstanding at review time; it is now satisfied).

Checks reproduced (all PASS):

1. Raw sha256 `924a01d3…986ae9c` from the pinned raw law bytes; INVENTORY agrees.
2. Needle occurs exactly once in the whole law (also once after whitespace normalization).
   The 昭和42年 enforcement date is a DIFFERENT node: LawBody child [19]
   (AmendLawNum 昭和四二年五月二七日法律第一一号). The target node is LawBody child [48]
   (AmendLawNum 平成元年三月三一日法律第一三号) → Article#1 → Paragraph#1 → Sentence#1;
   flat text equals the needle byte-for-byte with codepoints 3053 306e 6cd5 5f8b 306f
   3001 5e73 6210 5143 5e74 56db 6708 4e00 65e5 304b 3089 65bd 884c 3059 308b 3002.
3. `source_path` exact: `LawBody[48]/SupplProvision/SupplProvision[1]/Article:1/Article#1/Paragraph#1/ParagraphSentence/Sentence#1`.
4. Law identity 関税定率法 / Act / INVENTORY revision (2026-06-01) all consistent.
5. kind REFERENCE, unhandled_conditions=[], dependencies=[].
6. Source fidelity: `enforcementDate=⟨1,4,1⟩` with 元=1 / 四月=4 / 一日=1 theorems;
   `leDate` lexicographic; `inForce` inclusive on/after; boundary theorems; no 昭和 date
   in code. Needle byte-identical once in all three Lean files and both docs; no
   wrong-codepoint variants. Gregorian identity, cross-era transitions and legal
   correctness marked NOT MODELLED; the "Heisei 1 = 1989" mention is prose only.
7. Audit literal `\u`-escaped decodes exactly to needle; name unique; whole-law locator
   correctly used (main-provision locator would miss the 附則 node); 482 checks;
   run 482/482 including this unit's PASS.
8. Imports wired in `JapanTaxLaw.lean` (impl/spec/tests) exactly once each.
9. No forbidden placeholders or `simp` in any Lean body (comment mentions only);
   date proofs use kernel `decide`, not `native_decide`.
10. `#print axioms` on all seven theorems: all "does not depend on any axioms".
11. Spec Prop conjunction vs Date ordering; `enforcement_satisfies_spec` by And.intro/rfl,
    axiom-free.
12. Full build succeeded (1585 jobs).
13. No dependencies; no cross-law constant; the different 昭和42年 date is a separate
    node and NOT MODELLED here.
14. `LEGAL_REVIEW_PENDING`, `completion_claim=false`; legal correctness NOT MODELLED;
    no completion claim.

Non-blocking observation (fixed): the audit comment said "Article-kind locator" while
the check uses the whole-law locator; comment corrected. The placeholder state at review
time was expected and is now replaced. Human legal review remains `LEGAL_REVIEW_PENDING`.
