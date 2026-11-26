# Independent adversarial review — 租税特別措置法 第70条の6の6(2) PRESUMPTION

Unit: `NORM|293a349f6f7d21dda09ef6ffecee55039fbaab8d4060af0cf337703a58b76a3a`
Law: 332AC0000000026 (租税特別措置法), Act; pinned raw snapshot
`data/raw/332AC0000000026_20261101_507AC0000000013.law.json`,
SHA-256 `e6e6013bbc0608c6b48dea01d50ac847c3e5d094f0420223171ffe1b5cf8d5ee`.

Verbatim source text (copied programmatically from `build/task_queue.json` field `text`,
not hand-typed): 「当該個人が、当該相続の開始の直前において、当該被相続人の推定相続人であること。」

## Verdict: NO FINDINGS

The unit is faithful to the authoritative source. All 15 mandated checks were
reproduced independently below; none failed.

## Discrepancy in the review request (NOT a defect of the unit)

The task description supplied the needle with an extra U+306B (に) immediately
after 前 (U+524D) — i.e. `直前に` + `において` instead of `直前` + `において`.
That doubled-に form occurs **0 times** in `build/task_queue.json` and **0 times**
in the pinned raw law file. The queue `text`, the raw law, the audit literal and
every reviewed artifact all use the single-に form quoted above. Do not propagate
the doubled-に variant; it is a defect in the review request, not in the unit.

## Reproduced checks

1. **Raw SHA256** — computed from the pinned raw file equals the queue value and
   the INVENTORY value (case-insensitive): `e6e6013b…5cf8d5ee`. PASS.
2. **Needle location** — occurs exactly once in the whole raw law text. Raw XML
   tree chain: `Law/LawBody[3]/MainProvision[3]/Chapter[29]/Article[3]` with
   `attr.Num=70_6_6`, `Paragraph[5]` with `Num=2`, `Item` `Num=4`, `Subitem1`
   `Num=1`, `Subitem1Sentence/Sentence` `Num=1`; the sentence child text is the
   verbatim needle. Semantics: the individual was the presumed heir of the
   decedent immediately before the inheritance opened. PASS.
3. **source_path** — exact queue string occurs once in the impl (line 14) and
   once in the unit doc (line 9). PASS.
4. **Law identity** — `data/INVENTORY.json` entry `332AC0000000026`: title
   租税特別措置法, `law_type=Act`, current revision
   `332AC0000000026_20261101_507AC0000000013`, raw snapshot file and SHA-256 all
   match. PASS.
5. **Queue metadata** — `kind=PRESUMPTION`, `kinds=['PRESUMPTION']`,
   `unhandled_conditions=[]`, `dependencies=[]`. PASS.
6. **Source fidelity** — `qualifies true` / `¬ qualifies false` reproduce the
   presumed-heir/non-heir boundary; no heir-status determination invented;
   `... NOT MODELLED` documented in impl (lines 27–29), spec (line 15) and unit
   doc (line 28). PASS.
7. **Needle across artifacts** — exact count 1 in impl, spec, tests, unit doc and
   this review doc; doubled-に variant count 0 in all five. PASS.
8. **Audit** — check name occurs exactly once in `transcription_audit.py`; its
   `\u` literal decodes byte-identically to the queue needle; whole-law `file`
   locator (`kind='file'`, law `332AC0000000026`); run output ends with
   `transcription audit: 777/777 checks passed`, including the named check. PASS.
9. **Imports** — `JapanTaxLaw.lean` lines 2279–2281 import each of the three
   modules exactly once (3 total matches). PASS.
10. **Proof hygiene** — no `sorry`, `admit`, `axiom`, `simp`, `decide`, `propext`
    or `Classical.choice` in any proof body; the only textual matches are in
    doc comments. Proofs are `rfl`, `intro/cases`, and case analysis. PASS.
11. **Axioms** — `#print axioms` via `lake env lean` reports each of the three
    theorems (`presumed_heir_qualifies`, `non_heir_rejected`,
    `qualifies_spec_agreement`) as "does not depend on any axioms". PASS.
12. **Independent spec** — `SpecQualifies b := ¬ b = false` is representationally
    distinct from `qualifies b := b = true`; `qualifies_spec_agreement` proves
    the equivalence by `cases b` with no tactics relying on decision procedures.
    PASS.
13. **Build** — `lake build` completed: `Build completed successfully (2614 jobs)`.
    PASS.
14. **Dependency honesty** — no dependencies recorded; the only law id appearing
    in the three Lean modules is the same law (`332AC0000000026`, in doc
    comments); no cross-law constant. PASS.
15. **Review state** — queue `legal_review=LEGAL_REVIEW_PENDING`,
    `completion_claim=false`, `evidence` an empty object and empty artifacts at review time
    (expected bookkeeping), `status=NOT_STARTED`. No completion claim made here.
    PASS.

## Scope and limitations

Transcription fidelity and kernel checks only; not a semantics or legal-correctness
audit. Heir-status determination and legal correctness remain NOT MODELLED and
require independent human legal review (`LEGAL_REVIEW_PENDING`).
