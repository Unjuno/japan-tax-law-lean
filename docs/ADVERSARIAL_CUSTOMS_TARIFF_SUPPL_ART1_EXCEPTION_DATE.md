# Independent adversarial review — 関税定率法 附則第一条 EXCEPTION

Unit: NORM|34bc97d6d32588ad832ab14de19ae658b3d7e00e7bb4bacc59564498bfe859c3
Verbatim source text (injected from the authoritative queue task, not hand-typed): 「ただし、次に掲げる規定は、平成四年一月一日から施行する。」

## Verdict: NO FINDINGS

The independent adversarial reviewer returned NO FINDINGS with all 15 mandated checks
independently reproduced from authoritative sources (queue, INVENTORY, raw law JSON,
audit helpers) — not from the author's prose. A separate programmatic cross-check
also passed with 0 fails (only the expected pre-finalization evidence-field check
was outstanding at review time; it is now satisfied).

Checks reproduced (all PASS):

1. Raw sha256 `924a01d3…986ae9c` from the pinned raw law bytes; INVENTORY (uppercase) agrees.
2. Needle occurs exactly once in whole law (36,531 string leaves flattened), and once as a
   standalone leaf. Raw `Sentence` node has `attr.Function="proviso"`, `Num="2"`, flat text
   exactly the needle. The enclosing `ParagraphSentence` contains BOTH dates verbatim.
3. `source_path` exact: `LawBody[50]/SupplProvision/SupplProvision[1]/Article:1/Article#1/Paragraph#1/ParagraphSentence/Sentence#2`;
   raw tree confirms the proviso/Num=2 node.
4. Law identity 関税定率法 / Act / INVENTORY revision (2026-06-01) all consistent.
5. kind EXCEPTION, unhandled_conditions=[].
6. Source fidelity: 平成三年四月一日 = ⟨3,4,1⟩ (三 U+4E09, 四 U+56DB, 一 U+4E00) and
   平成四年一月一日 = ⟨4,1,1⟩ (四, 一, 一) parsed correctly; exception date later;
   `applicableDate` overrides only `listed`; no specific provisions invented (the raw
   Item 第一条の規定 is not modelled); listed provisions themselves, cross-era
   conversion, other supplementary provisions and legal correctness all marked NOT MODELLED.
7. Needle verbatim (byte-for-byte) in impl/spec/tests and both docs; enclosing sentence
   with both dates in impl and UNIT doc. No wrong-numeral variants.
8. Audit literal `\u`-escaped decoding exactly to needle; target name unique (the 6 duplicate
   names elsewhere are unrelated pre-existing checks); 472 checks defined; run 472/472.
9. Imports wired in `JapanTaxLaw.lean` (impl/spec/tests) exactly once each.
10. No forbidden placeholders or `simp` in any Lean body; no `native_decide`/`unsafe`/`trust`.
    The `by decide` date-ordering proofs are kernel reduction, not a trust shortcut.
11. `#print axioms` on all nine theorems: all "does not depend on any axioms".
12. Spec `SpecApplicableDate` Prop equality-disjunction vs pattern-match `applicableDate`;
    agreement theorems axiom-free via And.intro/rfl.
13. Full build succeeded (1552 jobs); warnings are pre-existing in unrelated modules.
14. One dep: `enforcement_version`, value 平成四年一月一日, resolution textual, sufficient=false;
    docs state this verbatim; no claim of full resolution beyond the 15-digit law id; no
    external-law constant introduced.
15. `LEGAL_REVIEW_PENDING`, `completion_claim=false`; legal correctness NOT MODELLED;
    no completion claim.

Expected pre-review bookkeeping (queue status NOT_STARTED with empty evidence, and the
placeholder in this file at review time) is not a defect and has been replaced.

No concrete H/T/D/C/U finding was reproduced. Human legal review remains
`LEGAL_REVIEW_PENDING`.
