# Independent adversarial review — 災害被害者租税減免法 第八条(2) DELEGATION

Unit: NORM|d351e6ace9606ec2a4061c0a13824f8b21e9bbee9be7c1457e7d7cafbf136433
Verbatim source text (injected from the authoritative queue task, not hand-typed): 「前項に定めるもののほか、同項の規定の適用に関し必要な事項は、政令で定める。」

## Verdict: NO FINDINGS

The independent adversarial reviewer returned NO FINDINGS with all 15 mandated checks
independently reproduced from authoritative sources (queue, INVENTORY, raw law JSON,
audit helpers) — not from the author's prose. A separate programmatic cross-check
also passed with 0 fails (only the expected pre-finalization evidence-field check
was outstanding at review time; it is now satisfied).

Checks reproduced (all PASS):

1. Raw sha256 `c3bb5b0b…f5f4e7ef` from the pinned raw law bytes; INVENTORY (uppercase) agrees.
2. Needle occurs exactly once across all string leaves; raw navigation
   `children[1](LawBody)→[1](MainProvision)→[7](Article Num=8)→[2](Paragraph Num=2)→[1](ParagraphSentence)→[0](Sentence Num=1)`
   lands on the needle; the whole Paragraph 2 flat text equals the needle (37 chars).
3. `source_path` exact: `LawBody[1]/MainProvision/MainProvision[7]/Article:8/Article#8/Paragraph#2/ParagraphSentence/Sentence#1`.
4. Law identity: `LawType=Act`, `Num=175`, INVENTORY revision `322AC0000000175_20220101_503AC0000000011`, raw SHA matches.
5. kind DELEGATION, kinds=['DELEGATION'], unhandled_conditions=[], dependencies=[].
6. Source fidelity: needle ends 政令で定める — delegation target is 政令 (Cabinet Order),
   NOT 法律; `delegatedTarget=cabinetOrder`; residual predicate `!alreadyPrescribed &&
   necessaryForApplication` = necessary AND not already prescribed in 前項. Boundaries:
   false/true→true, true/true→false, false/false→false. No Cabinet Order content invented;
   docs mark content / preceding-paragraph substance / legal correctness NOT MODELLED.
7. Needle byte-identical (once) in impl L17, spec L7, tests L6, UNIT L8, ADVERSARIAL L4.
   Codepoints 前 U+524D, 項 U+9805, 政 U+653F, 令 U+4EE4 match; no 省令/前条/法律で定める
   variants. 法律 appears only in law-title/type descriptions and the explicit contrast
   constructor — never as the claimed target.
8. Audit literal `\u`-escaped decodes exactly to the 37-codepoint needle; name unique (count 1);
   473 checks defined; run 473/473 including this unit's PASS.
9. Imports wired in `JapanTaxLaw.lean` (impl/spec/tests) exactly once each.
10. No forbidden placeholders or `simp` in any Lean body (impl L39 is a doc comment only).
11. `#print axioms` on all seven theorems: all "does not depend on any axioms".
12. Spec Prop conjunction vs impl Bool conjunction; `agree_residual` axiom-free.
13. Full build succeeded (1555 jobs); linter warnings are from unrelated modules.
14. No dependencies; no cross-law constant; 政令 content NOT MODELLED.
15. `LEGAL_REVIEW_PENDING`, `completion_claim=false`; legal correctness NOT MODELLED;
    no completion claim.

Expected pre-review bookkeeping (queue status NOT_STARTED with empty evidence, and the
placeholder in this file at review time) is not a defect and has been replaced.

No concrete H/T/D/C/U finding was reproduced. Human legal review remains
`LEGAL_REVIEW_PENDING`.
