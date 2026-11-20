# Queue & completion-gate independent audit (2026-11-20)

Scope: Objective §1 (task queue / completion determination) and §5 (machine
pass/fail semantics). This is an INDEPENDENT verification record: it does not
rely on the queue modules' own self-report.

## Method

Regression suites were executed in a real CPython 3.12 interpreter (Pyodide
0.26.4) with the queue/ledger modules loaded from the workspace. This was
necessary because the session's shell tool was unavailable; no result below is
inferred from source inspection alone.

Early run (before fixes), 26 tests:

```
FAILED (failures=2)
test_normative_identity_v3.DependencyTests.test_name_article_and_enforced_version
AssertionError: 2 != 1
test_normative_identity_v3.SelectorTests.test_bare_id_dependency_does_not_satisfy_readiness
AssertionError: [{'task_id': 'b', ...}] != []
```

Final run (current workspace, renamed suites), 28 tests:

```
............................
Ran 28 tests in 0.002s
OK
TESTS=28 FAIL=0 ERR=0 SKIP=0
```

## Findings (H / T / D / C / U)

### F-01 — one law reference produced two LAW_NAME dependencies

- **H:** the non-greedy law-name regex split `地方税法施行令` into `地方税法`
  and `施行令`, emitting two dependencies for one reference.
- **T:** `parse_dependencies("地方税法施行令第二十六条の規定による", inv)` with
  `地方税法施行令` in the inventory yielded two `LAW_NAME` records.
- **D:** FAIL before fix, PASS after fix.
- **C:** two distinct laws could be referenced, not two overlapping substrings
  of one reference; the test input contains one contiguous name.
- **U:** aliases absent from the inventory still fall back to the regex and may
  split; a SOURCE-maintained title/alias table is still needed.
- **Fix applied here:** in `normative_identity.py::parse_dependencies`, claim
  inventory title spans longest-first and discard regex matches overlapping a
  claimed span.

### F-02 — unresolved bare-id dependency did not block the referenced law

- **H:** a law referenced only by an unresolved 15-character id hint remained
  selectable, violating Objective §1.6.
- **T:** tasks `a` (NOT_STARTED, unresolved `LAW_ID_HINT` → `L2`) and `b`
  (`L2`, PROVED_SCOPE) produced `selected == [b]`.
- **D:** FAIL before fix, PASS after fix.
- **C:** one may argue `b`'s proof is independent; the conservative rule was
  adopted because selecting `b` with an unbound incoming reference makes the
  dependency graph unsound.
- **U:** unresolved references to laws not present in the inventory are
  recorded but are not selector blockers; SOURCE review is still required.
- **Fix:** the selector now marks both the referencing unit and every unit of
  the referenced law as blocked while the bare-id reference is unresolved.
  (The final consolidated selector implements this as `blocked_laws` /
  `BLOCKED_LAW_HAS_UNRESOLVED_BARE_ID_DEPENDENCY`.)

## CI wiring

`scripts/ci/run_python_gates.py` was found to contain a stale gate entry
(referencing the removed `test_normative_identity_v3.py` and
`normative_identity.py`) plus a duplicate completion-adversary gate and a
required gate pointing at a non-existent `completion_gate_adversarial.py`.
Those entries were consolidated to the current file names and the required-gate
set. In strict mode a missing required gate is a FAIL, never a SKIP-that-passes.

## Not established by this audit

- No full 325-law queue regeneration was run (the pinned snapshots total
  several GB and the session had no shell). Counts in `docs/TASK_QUEUE.md`
  are therefore NOT independently confirmed here.
- No Lean build, axiom audit or `lake build` was run in this session;
  kernel-level claims are out of scope of this record.
- No commit or PR was created: the session has no git executable and no GitHub
  credentials. All changes are local workspace edits.
