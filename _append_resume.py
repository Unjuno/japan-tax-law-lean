from pathlib import Path
p = Path('docs/GOAL_RESUME_20261121.md')
t = p.read_text(encoding='utf-8')
add = '''
## UPDATE 2026-11-27 (CI-red root cause, honest fix, new unit, resume state)

Measured on merged main `96f0f5ff`: 396,854 normative units, FULLY_VERIFIED=1,183,
NOT_STARTED=395,669, BLOCKED=2; human legal reviews 0/3,438.
`docs/COMPLETION_STATUS.md` reports `all normative units decomposed, formalized,
proved and source-audited: False`, `technical all-complete claimable: False`,
`registered checks all green: False`. Passing registered checks are NOT §5 completion.

Main CI has been red on every recent commit (e.g. workflow run 45898010319 at
`96f0f5ff`: the Lean job passed, the Python audit job failed 9 gates). Root causes
found and corrected in this branch WITHOUT weakening any gate:

1. `scripts/law_audit/phase_e/cross_law.py` exited 1 because
   `JapanTaxLaw/ReconstructionSpecialIncomeTaxEnforcementDate.lean` claimed a
   verification pin on law `424CO0000000016`. INVENTORY records that law as
   `selection_status=historical_fallback` with `current_revision_status=PreviousEnforced`;
   no CurrentEnforced revision exists. The module was reclassified as an explicit
   HISTORICAL REFERENCE (law-id/revision pin markers removed, reason documented).
   The gate is unchanged. Verified result: `scanned 2641 Lean files; 1321 pinned
   modules consistent, 0 failed; 1320 unpinned (not counted as verified)`.
2. The reconciliation generator list had omitted `scripts/ci/sweep_gate.py`
   (-> `build/audit_sweep.json`) and `scripts/law_audit/phase_e/cross_law.py`
   (-> `build/cross_law.json`); `coverage_ledger.py` and `l7_ledger.py` correctly
   refused to emit zero-filled ledgers without them. Both are now prerequisites.
3. A background reconciliation had failed its `git checkout` and consequently
   merged main into PR 832's branch while hardcoded to force-push to PR 764.
   It was terminated before the push; remote PR heads were verified unchanged.

Separate PR-764 integrity repair: main's side of the merge had dropped the
`SeparateTariffApplication` transcription check; it was restored explicitly and
the audit then reported `transcription audit: 782/782 checks passed`. Umbrella is
canonical (`2641/2641`, 0 duplicates) and both required guards pass
(`registered transcription checks retained: 521 lost=0`, `umbrella imports
retained: 2641 missing=0`).

New queue unit authored on a separate isolated worktree/branch
`formalize/customs-art7-investigation-start-one-year` (head `d3d0f9348`):
`NORM|30ed71fa...`, 関税定率法 art.7(7), one-year deadline measured from
investigation start. Collision-checked against main and PRs 764/832; pinned raw
needle verified byte-for-byte. Kernel build succeeded (5 jobs) and all six key
theorems report `does not depend on any axioms`; transcription 782/782; queue
invariants 17/17. Not merged and not attested — not counted as progress yet.

Resume steps (do not skip): let both reconciliation drivers reach generator fixed
point; require ALL gates green locally; push; obtain REST-confirmed green CI via
`gh run view`; merge; bind separate scoped attestations from the green commit's
git blobs; regenerate verification_evidence.json / task_queue.json / ledgers on
merged main to fixed point; re-measure; then continue collision-checked queue
selection over dependency-ready NOT_STARTED units. Never weaken gates, the two
required integrity guards, or the family-only `rules.py::_classify_law_name`
classifier.
'''
if 'UPDATE 2026-11-27 (CI-red root cause' not in t:
    p.write_text(t.rstrip() + '\n' + add, encoding='utf-8')
    print('APPENDED', len(add))
else:
    print('ALREADY PRESENT')
