# Independent adversarial review — 関税定率法 第15条(1) 第5号の2 EXCEPTION

Unit: NORM|b8c681082e69caab3f288bf5c824986816c4dde9fb96a4ff4338c23802a970a4
Verbatim source text (copied programmatically from build/task_queue.json, not hand-typed): 「ただし、博覧会等の開催の期間及び規模、物品の種類及び価格その他の事情を勘案して相当と認められるものに限る。」

## Verdict: NO FINDINGS

The unit survives independent, source-grounded adversarial review. No defect was
found. Evidence for each mandated check is reproduced below. Empty `evidence`
in the queue is expected bookkeeping, not a finding. Legal correctness is not
asserted: the unit remains `LEGAL_REVIEW_PENDING` with `completion_claim = false`.

## Reproduced checks

1. Raw SHA256: `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`
   hashes to `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c` — matches.
2. Needle occurs exactly once in the whole pinned law, at
   `LawBody[1]/MainProvision/MainProvision[28]/Article:15/Article#15/Paragraph#1/Item#5_2/ItemSentence/Sentence#2`.
   Ancestor walk confirms tag/attrs `Article Num=15`, `Paragraph Num=1`,
   `Item Num=5_2`, `Sentence Num=2`, `Function=proviso`. Text is byte-identical to
   the queue needle. Exception semantics (reasonableness limitation) confirmed.
3. `source_path` exact string occurs once in the impl header and once in the unit doc.
4. `data/INVENTORY.json` law identity matches: law_id `143AC0000000054`,
   official_title `関税定率法`, law_type `Act`, revision
   `143AC0000000054_20260601_508AC0000000005`, source_file and source_sha256 (uppercase
   hex = same SHA) all consistent with the queue.
5. Queue entry: `kind = EXCEPTION`, `unhandled_conditions = []`, `dependencies = []`.
6. Fidelity: `inScope` requires all three gates (period/scale, kind/price, other
   circumstances) via `&&`; no numeric or invented reasonableness threshold is added.
   "What counts as reasonable, the exhibition itself and legal correctness are
   NOT MODELLED" is documented in impl, spec, unit doc. CJK codepoints of the needle
   were enumerated and are correct (e.g. 博 U+535A, 覧 U+89A7, 相 U+76F8, 当 U+5F53, 。U+3002).
7. Needle occurs exactly once (exact match, zero near-miss lines containing 博覧会)
   in impl, spec, tests, unit doc and this review doc.
8. Audit literal at `scripts/ci/transcription_audit.py:5500` decodes byte-for-byte to
   the needle (`\u76f8` = 相, not a near-miss). This unit's check name is unique
   (exact-name count 1); it uses whole-law `file` locator with law id `143AC0000000054`.
   `checks()` total = 840; running the audit reported `840/840 checks passed`,
   including this unit's PASS line. (32 duplicate names exist elsewhere in the
   registry; none is this unit's.)
9. `JapanTaxLaw.lean` imports each of the three modules exactly once (lines 449–451).
10. No `sorry`/`admit`/`axiom`/`Classical.choice`/`simp`/`decide`/`propext` in any
    proof body after stripping comments (the only such tokens are inside doc comments).
11. `lake env lean _axiom_probe.lean` with `#print axioms` on all five theorems returned
    "does not depend on any axioms" for each:
    `all_true_in_scope`, `bad_period_scale_out_of_scope`, `bad_kind_price_out_of_scope`,
    `bad_other_out_of_scope`, `spec_agreement`.
12. Independent spec is representationally distinct (`inScope` Bool `&&` vs
    `SpecInScope` Prop conjunction `a = true ∧ b = true ∧ c = true`); agreement
    proved by exhaustive `cases a/b/c` in the kernel.
13. Full `lake build` succeeded: "Build completed successfully (2842 jobs)." All
    warnings are in unrelated modules; none in this unit's three modules.
14. No cross-law constant is defined or referenced by the unit; queue `dependencies=[]`.
    Reasonableness criteria, the exhibition itself and legal correctness are
    explicitly NOT MODELLED.
15. Queue `legal_review = LEGAL_REVIEW_PENDING` and `completion_claim = false`.
    No completion claim is made by this review. Human legal review remains pending.

## Scope of this verdict

"NO FINDINGS" means the transcription, source location, independent spec, kernel
proofs and stated modeling boundaries are internally consistent and reproduce
from authoritative sources. It is not a legal-correctness approval.
