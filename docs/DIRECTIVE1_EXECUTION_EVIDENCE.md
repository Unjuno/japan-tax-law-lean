# Directive §1 execution evidence — 2026-11-20

Measured values from commands executed in this session. This is a status
record, not a completion claim.

## Base refresh

- `origin/main` read via GitHub API: `22246889a2d91e927cadb2c6382a9911904325e3`
  (cycle-21 adversarial review). Local `refs/heads/main` matches.
- Reference commit named by the directive: `44fa08a`.
- Inventory snapshot remains `2026-11-15`; 327 provisional laws, 325 pinned
  raw snapshots, 324 current-enforced, 2 fully unenforced.

## Corrected queue / completion determination

The four target artifacts are now driven by one core (`normative_core.py`):

- `scripts/ci/normative_core.py` — length-prefixed, full SHA-256 ids binding
  law id, revision/history, provision kind, article/paragraph/item/subitem,
  table row/cell, ordinal, norm kind and exact source text; clause
  decomposition with exact spans; independent reconstruction audit;
  structured dependencies (law name + article + enforcement version; a bare
  15-character id is only an underdetermined weak signal); durable state and
  evidence-based status vocabulary.
- `scripts/ci/task_queue.py` — projection over all pinned article/appendix
  units; legal review separate; no completion from needle/file/name.
- `scripts/ci/task_selector.py` — selects only unfinished, dependency-ready,
  unowned units and reports the exact remaining evidence axes.
- `scripts/ci/article_scope.py` — source location, decomposition, dependency
  analysis and H/T/D/C/U finding records.
- `scripts/ci/article_obligations.py` — replaces the old
  needle + file-existence + `agree*` COMPLETE rule with evidence-derived state.
- `scripts/ci/completion_gate_adversary.py` — independent source-level audit
  of the completion rules (H/T/D/C/U per rule).

## Measured outputs

```
$ python -m py_compile scripts/ci/normative_core.py scripts/ci/task_queue.py \
    scripts/ci/task_selector.py scripts/ci/article_obligations.py \
    scripts/ci/article_scope.py scripts/ci/completion_gate_adversary.py
COMPILE_OK

$ python -m unittest scripts.tests.test_completion_gate_adversary -v
Ran 8 tests ... OK

$ python -m unittest scripts.tests.test_task_queue_semantics -v    (before the intervening reset)
Ran 18 tests ... OK

$ python scripts/ci/task_queue.py
normative-unit queue: 396854 units; NOT_STARTED=396852, PARTIAL=0,
PROVED_SCOPE=0, FULLY_VERIFIED=0, BLOCKED=2
state merge: 332266 change(s)

$ python scripts/ci/task_selector.py 3
queue_units=396854, selectable=396852, skipped_dependency_or_blocker=7,
selected_count=3 (all with 11 remaining evidence axes, LEGAL_REVIEW_PENDING)

$ python scripts/ci/article_obligations.py
article obligations: NOT_STARTED=52, PARTIAL=0, PROVED_SCOPE=0,
FULLY_VERIFIED=0, BLOCKED=0
```

Key point: no unit is FULLY_VERIFIED because no kernel attestation evidence
exists. The old implementation would have reported these as COMPLETE from
needle matches and file existence.

## Baseline CI (unchanged parts), measured by `run_python_gates.py`

- structural audit: 44 tests OK
- mutation injection: 12 tests OK
- inventory selection: 7 tests OK
- cross-law consistency: 14 tests OK; 517 Lean files scanned, 446 pinned,
  71 unpinned (not counted as verified), 0 failed
- revision impact: 8 tests OK; 325 pinned revisions, 0 problems
- inventory: 327 records, 325 resolved, 325 hash-verified, 2 unresolved
- structural sweep: 42,584 articles, 86,403 paragraphs, 61,672 items,
  0 verified anomalies, 3,438 candidates
- L1 transcription: 158/158 checks passed (fidelity only, not semantics)
- `SKIP` is printed separately and never counted as PASS.

## Outstanding (not hidden)

- The working tree contains several near-duplicate helper modules from
  concurrent edits (`norm_core.py`, `norm_ids.py`, `normative*.py`,
  `dependency_graph.py`, etc.). One canonical chain must be declared and the
  rest reduced to re-exports before merge.
- A full `run_python_gates.py` pass must be repeated after that de-duplication;
  an earlier run, taken while files were being rewritten concurrently, ended
  with 5 failures (mixed-state artifact, not a stable verdict).
- No commit or PR was made from this session while concurrent edits continued.
- `build/task_queue.json` is ~738 MB (396,854 units with full provenance).
  A compact projection format should be considered before committing it (it is
  a generated artifact).
- Human legal review: 3,438 L7 candidates, 0 recorded reviewers. Machine
  verification of the whole target set is not established: 175,186 external
  references unbound, recursive discovery incomplete, 795 historical names /
  12,977 occurrences not pinned.

**No completion claim is made.**
