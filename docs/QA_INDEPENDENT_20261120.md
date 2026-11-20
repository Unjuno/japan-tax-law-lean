# Independent QA record — 2026-11-20 (measurement only, not a completion claim)

Author: independent verification agent (this session).
Scope: re-fetched `main` at `2224688` (reference commit `44fa08a`), then ran the
repository's own gates in the local working tree. This record does **not**
modify Lean sources, pinned data, or the four target scripts; it only records
what was actually observed. It is not human legal review.

## 1. Measured CI state (remote)

| item | measured value | source |
|---|---|---|
| latest main commit | `2224688` | GitHub Actions run #420 |
| CI run #420 | **FAILURE**, total 6m26s | run page |
| job `Build Lean project and check axioms` | passed, 3m1s | run page |
| job `Semantic audit and mutation injection` | **failed**, exit 1, 6m23s | run page annotation |
| warnings | 2 × Node.js 20 deprecation (checkout@v4, setup-python@v5) | run page |
| open PR #184 | cycle-22 in progress, run #421 running | workflow page |

Conclusion: the existing Lean proofs were **not** the cause of the main-branch
CI failure at this commit; the Python audit job was.

## 2. Measured local gate state (`python scripts/ci/run_python_gates.py`)

Passing gates (verbatim summaries from the run):

- structural audit tests: 44 tests OK
- mutation injection tests: 12 tests OK
- inventory selection tests: 7 tests OK
- cross-law consistency tests: 14 tests OK
- revision impact tests: 8 tests OK
- INVENTORY validation: 327 records, 325 resolved, 325 raw snapshots
  hash-verified, 2 unresolved (`508CO0000000106`, `508M60000040027`)
- cross_law: 517 Lean files, 446 pinned modules consistent, 0 failed,
  71 unpinned (not counted as verified)
- revision_impact: 325 pinned revisions, 0 problems, 48 original enactments,
  189 amendment laws, 186 outside the tax ledger (recorded, not judged)
- full sweep: parse_ok 325 / 325, articles 42,584, paragraphs 86,403,
  items 61,672, references extracted 476,500, internal 100,944,
  external unverified 157,983, unsupported 250,043,
  `findings_verified_anomaly = 0`, `findings_candidate = 3,438`
- transcription audit: **158/158 checks passed — transcription fidelity only**,
  findings total 22, verified-anomaly 0, candidate 22
- article obligations, rate consistency, article scope (158 scoped /
  0 whole-text), BLOCKED, coverage, L7 ledger, L7 candidates (3,438 rows),
  audit + report: deterministic PASS
- L1 audit explicitly lists NOT-YET-COVERED modules/areas (see audit output)

**Failing gates: 4**

| # | gate | observed failure |
|---:|---|---|
| 1 | normative identity / completion tests | `test_bare_15digit_is_underdetermined`: expected a dependency with `resolution == "unresolved_underdetermined"`, got none. 13/14 tests passed. |
| 2 | Per-law status ledger regeneration | script wrote `docs/LAW_STATUS.md` and exited 1 → committed doc differs from regenerated output |
| 3 | Persistent task queue regeneration | `AttributeError: module 'normative_core' has no attribute 'INVENTORY'` at `scripts/ci/task_queue.py:30` |
| 4 | Task selector smoke test | `KeyError: 'normative_id'` while indexing `build/task_queue.json` |
| — | Completion gate | **SKIP** (`scripts/ci/completion_gate.py`, `docs/COMPLETION_STATUS.md` missing). SKIP is not PASS. |

## 3. H / T / D / C / U record

### Detection D-1 — task queue regeneration crash (gate 3)

- **H**: H1 the refactor split identity/core logic into `normative_core.py`,
  but `task_queue.py` still reads `core.INVENTORY`, which the core no longer
  exports. H2 concurrent editing caused a transient inconsistent snapshot.
  H3 the failure file was later replaced, so the current tree may differ.
- **T**: re-run `python scripts/ci/task_queue.py`; inspect
  `grep -n "^INVENTORY" scripts/ci/normative_core.py`; compare with the
  `INVENTORY` definition in `task_queue.py` (observed at line 29 of a later
  revision, where it was defined locally rather than via `core`).
- **D**: at the time of the full gate run, H1 was the direct cause (traceback
  names `core.INVENTORY` at line 30 and the attribute did not exist).
- **C**: an alternative reading is a deliberately staged refactor where the
  core is *expected* to gain the constant; that would make the crash an
  incomplete stage rather than a defect in design.
- **U**: the workspace is being edited by multiple agents concurrently, so
  the post-run tree must be re-measured before assigning ownership.

### Detection D-2 — selector `KeyError` (gate 4)

- **H**: H1 a stale `build/task_queue.json` produced by the old id scheme
  (fields `task_id`) was read by a selector expecting `normative_id`. H2 the
  queue generator crashed (D-1), so no fresh projection was written.
- **T**: `python -c ...` read keys of `build/task_queue.json`; regenerate the
  queue successfully, then re-run `python scripts/ci/task_selector.py 3`.
- **D**: consistent with H1/H2 together; the selector cannot be validated
  until D-1 is fixed and the projection regenerated.
- **C**: an alternative is that the selector should tolerate legacy queue
  projections (backward compatibility) rather than fail hard.
- **U**: not re-verified after the concurrent edits.

### Detection D-3 — 15-digit dependency test failure (gate 1)

- **H**: H1 the new dependency parser resolves a bare 15-digit token to a
  law, while the test requires it to be explicitly *underdetermined* unless
  law name + article + revision are present. H2 the test's expectation is
  stricter than the implementation contract.
- **T**: run `python -m unittest scripts.tests.test_normative_identity -v`
  and read the assertion at line 91 plus the parser branch that sets
  `resolution`.
- **D**: the test failed once, as recorded. The test module was later
  renamed/removed by concurrent agents; the currently checked-in equivalent
  could not be re-run at measurement time (`ModuleNotFoundError`).
- **C**: treating a bare 15-digit id as a resolvable law id is defensible in
  isolation; the objective specifically requires name/article/version axes
  *in addition*, not that the id alone be rejected.
- **U**: unresolved — requires a settled tree and a re-run.

### Detection D-4 — regeneration drift (gate 2)

- **H**: committed `docs/LAW_STATUS.md` did not match the script output.
- **T**: run `python scripts/ci/law_status_ledger.py` twice; second run should
  exit 0 if the first wrote the correct content.
- **D**: first run exited 1 and wrote the file; drift was real at that time.
- **C**: the drift may be an intentional intermediate state of another
  agent's regeneration.
- **U**: not re-verified.

## 4. Separate counts (Objective §5 — not combined into a completion rate)

| axis | measured count |
|---|---:|
| target laws in ledger (provisional mother set) | 327 |
| laws with pinned raw snapshot | 325 |
| unresolved / unenforced laws | 2 |
| articles in structural sweep | 42,584 |
| paragraphs / items in structural sweep | 86,403 / 61,672 |
| Lean modules scanned | 517 |
| pinned modules consistent | 446 |
| unpinned modules (not verified) | 71 |
| pinned literal checks (transcription fidelity) | 158 |
| articles with independent adversarial-review mention | 16 / 52 (earlier ledger) |
| human legal review completed | 0 |
| verified anomalies | 0 (not evidence of absence of defects) |
| unreviewed candidates | 3,438 |
| external references not bound to ledger | 157,983 |
| registration gates failing (local) | 4 |
| registration gates SKIPped (not PASS) | 1 |

## 5. Resume procedure

1. Re-fetch base: `git fetch origin main && git checkout main` (base `2224688`,
   reference `44fa08a`).
2. Let the concurrent refactor settle; then run
   `python scripts/ci/run_python_gates.py` and capture the full output.
3. Fix in order: D-1 (restore `INVENTORY` or import path), regenerate the
   queue, then D-2, then D-3, then D-4. Do not treat SKIP as PASS.
4. Re-run the full gate suite; require 0 FAIL and 0 unaccounted SKIP.
5. CI: require GitHub Actions run on the merged commit to show both jobs green.
6. Record any remaining `LEGAL_REVIEW_PENDING` items as unresolved; do not
   declare全件完成 while the completion gate is missing and human review is 0.

## 6. Honesty statement

No claim of full formalisation, legal correctness, or defect absence is made.
The passing transcription audit checks literal strings only; the Lean build
proves properties of the formal model only; the 0 verified anomalies is
different from evidence that no defect exists. Human legal review remains
pending.
