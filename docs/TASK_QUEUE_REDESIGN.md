# Task queue and completion-criteria redesign — decision record

Date: 2026-11-20
Baseline: `main` @ `22246889a2d91e927cadb2c6382a9911904325e3`
Reference commit: `44fa08a` (as specified)
Objective section addressed first: §1 (measurement and completion criteria)

> This document does **not** claim legal correctness, completion, or coverage
> of Japanese tax law. It records a tooling change and its measured behaviour.

## 1. What was wrong before

| file | defect against §1 |
|---|---|
| `scripts/ci/task_queue.py` | `task_id = sha256(law\|rev\|path\|article)[:16]` — paragraph/item/subitem/table-cell absent; collisions possible. No norm decomposition. `formalized = COMPLETE_SCOPE` derived from a pinned needle match. `build/task_queue.json` is git-ignored and regenerated from scratch — all state lost. Dependencies were only 15-digit regex hits. |
| `scripts/ci/task_selector.py` | Selected only `formalized == NOT_STARTED` by computability keyword count; ignored dependencies, ownership, blockers, and persistence. |
| `scripts/ci/article_obligations.py` | Marked `COMPLETE` when needle found + impl/spec/tests files exist + no `sorry` string + an `agree*` string appears — precisely the "numeric match / file existence / theorem-name string match" completion that §1.4 forbids. Reported 52/52 COMPLETE. |
| `scripts/law_audit/phase_e/article_scope.py` | Reported only whether a needle appeared somewhere in an article; no offsets, no coverage audit, no unresolved register. |
| `scripts/ci/run_python_gates.py` | Printed SKIP for absent gates and exited 0 — a skipped required check was indistinguishable from PASS. |

## 2. What the replacement does

New shared module `scripts/ci/norm_identity.py`:

1. **Collision-free ids**: canonical key includes `law_id`, `revision_id`,
   `provision_kind` (Main/Supplementary/AppdxTable), section ordinal,
   article ordinal, article/paragraph/item/subitem number, appendix-table cell,
   provision path, unit index, kind and a SHA-256 of the normalized unit text.
   96-bit id (24 hex chars).
2. **Norm decomposition**: sentences are split at `。` and at `ただし`/`但し`;
   each fragment is classified into `APPLICATION_CONDITION`, `LEGAL_EFFECT`,
   `EXCEPTION`, `DEEMING`, `PRESUMPTION`, `DELEGATION`,
   `READING_SUBSTITUTION`, `REFERENCE`. Unclassifiable text becomes
   `UNRESOLVED_NORM` — recorded, never dropped. Secondary kinds are retained.
3. **Independent coverage audit** (`verify_coverage`): units must partition the
   original pinned text exactly — offsets contiguous from 0, each unit's text
   equal to its slice, rejoined text and SHA-256 equal to the original. The
   original is taken from the pinned JSON, not from the units.
4. **Dependencies**: law names, article numbers, enforcement dates and bare
   15-digit ids are separate channels; `resolution_channels` is recorded so a
   15-digit hit is never the sole dependency evidence.
5. **Durable overlay**: `state/norm_task_state.json` stores only non-default
   records keyed by norm id (status, evidence, owner, branch, PR, blocker,
   artifacts, history). Regeneration restores them. If a source fragment
   changes, prior verification is quarantined and status resets to
   `NOT_STARTED` with `SOURCE_FRAGMENT_CHANGED`.

Five-valued status: `NOT_STARTED / PARTIAL / PROVED_SCOPE / FULLY_VERIFIED /
BLOCKED`. `FULLY_VERIFIED` requires all 12 technical obligations **and** a
recorded human reviewer/date/conclusion. All technical obligations with review
pending gives `PROVED_SCOPE`. Legal review is a separate axis and is never
auto-satisfied.

### Evidence artifacts required for completion (all keyed by norm id)

| file | purpose |
|---|---|
| `evidence/module_bindings.json` | explicit impl/spec/tests module binding containing `norm-id: <id>`; the spec module must also declare a typed spec |
| `evidence/proof_obligations.json` | theorem names + individual proof obligations |
| `evidence/kernel_audit.json` | Lean exit code, version, axiom list, theorem set; `sorryAx`/`Classical.choice`/`Quot.sound` forbidden |
| `evidence/boundary_cases.json` | structured cases with `boundary_covered: true` |
| `evidence/adversarial_findings.json` | H (falsifiable hypothesis), T (reproduction test), D (decision), C (competing interpretation), U (uncertainty) |
| `evidence/unhandled_conditions.json` | explicit disclosure (empty list is a valid disclosure) |
| `evidence/legal_review.json` | reviewer, review_date, conclusion — human only |

A file's existence, a needle match or a name string produces at most `PARTIAL`.

## 3. Measured validation (evidence)

The shell tool recovered during the run, so the final validation is **native**
Python 3.11.9 against the full repository at the latest `main`
(`7391a9b7d5d23c94135f480342e720beb57be860`, "cycle-22"). An earlier partial
validation also ran in Pyodide (browser CPython 3.12) on two real pinned
snapshots (所得税法 14.2 MB, 国税通則法 0.63 MB): 19,221 units, 0 coverage
failures, 0 id collisions — this first pass found and fixed the table-wrapper
and article-ordinal collision bugs.

### Full-repository results (native)

```
norm-unit queue: 548437 units across 325 law snapshots; unresolved=324348;
                 coverage_failures=0; persisted_records=0
```

- Norm kinds: REFERENCE 119,974 / UNRESOLVED_NORM 324,348 / EXCEPTION 33,010 /
  DELEGATION 24,790 / APPLICATION_CONDITION 17,159 / LEGAL_EFFECT 16,261 /
  READING_SUBSTITUTION 6,859 / DEEMING 5,985 / PRESUMPTION 51.
- Obligation ledger (`docs/ARTICLE_OBLIGATIONS.md`) over the 52 pinned article
  checks: **178,949 norm units**, **0** all-technical-obligations-satisfied,
  **178,796 SKIPPED** obligations recorded separately, status
  `PARTIAL 178,949 / FULLY_VERIFIED 0 / PROVED_SCOPE 0 / BLOCKED 0`.
- Article scope: 126 checks with norm-unit-scoped needles, 33 whole-text-only,
  0 coverage failures.
- Selector (smoke assignment of 3 units): 501,755 candidates, 46,682 excluded
  by unresolved dependencies, 3 assigned and persisted.
- File sizes after compactness fixes: `build/task_queue.json` 84 KB,
  `state/norm_task_state.json` 194 B, `docs/ARTICLE_OBLIGATIONS.md` 84 KB.
  The full 178,949-row ledger is in the git-ignored
  `build/article_obligations.json` (46 MB).

This is the intended correction: the previous ledger reported 52/52 COMPLETE
from file existence and string matches; the new ledger reports zero completions
and 178,796 explicitly labelled SKIPs.

### Gates

`python scripts/ci/run_python_gates.py` — **24 gates executed, 0 skipped,
0 failed**. This includes 44 structural-audit tests, 18 norm-identity tests,
12 mutation-injection tests, 7 inventory tests, 14 cross-law tests,
8 revision-impact tests, the 159/159 transcription audit, Lean-adjacent audits,
and all regeneration gates.

`python -m unittest scripts.tests.test_norm_identity -v` — **18 tests,
0 failures, 0 errors**.

Existing Lean proofs were not modified; `lake build` was not run locally.

## 4. H / T / D / C / U for this change

- **H (falsifiable)**: if completion were still derivable from file existence
  or name strings, the real-data ledger would contain `FULLY_VERIFIED` rows.
- **T (reproduction)**: `python scripts/ci/article_obligations.py` against the
  baseline pins; also `python -m unittest scripts.tests.test_norm_identity -v`.
- **D (decision)**: no `FULLY_VERIFIED` rows; 178,796 SKIPs recorded separately.
  H is not confirmed.
- **C (competing interpretation)**: one could argue a needle FOUND plus a
  bound module is sufficient "machine verification". Under §1.4 that is
  explicitly insufficient, so the competing reading is rejected for this
  ledger.
- **U (uncertainty)**: 324,348 of 548,437 units remain `UNRESOLVED_NORM`
  because the conservative marker set does not classify bare rate-table cells
  and unmarked prose. This is recorded, not hidden; it is a genuine remaining
  decomposition obligation.

## 5. Environment status

The shell tool was initially hung (`opencode-pty request timed out` for every
command, including in a fresh subagent session). It recovered during the run.
The repository was then cloned, the patch applied, native tests and gates run,
and the result committed/pushed via the authenticated `gh`/`git` CLI
(account `Unjuno`). Pyodide validation in §3 documents the earlier partial
pass that was possible while the shell was unavailable.

## 6. Resume procedure (for a fresh session)

1. Restore a working shell (restart the OpenCode session / reattach the PTY).
2. `git clone https://github.com/Unjuno/japan-tax-law-lean.git` and
   `git checkout -b fix/task-queue-norm-units`.
3. Copy each file from `repo_patch/` to the same repo-relative path.
4. Create empty evidence files in `evidence/` using the keys shown in §2
   (initially `{}` for each).
5. Add `scripts/tests/test_norm_identity.py` to
   `scripts/ci/run_python_gates.py` (already included in the patched runner).
6. Run:
   - `python -m unittest scripts.tests.test_norm_identity -v`
   - `python scripts/ci/task_queue.py`
   - `python scripts/ci/article_obligations.py`
   - `python scripts/law_audit/phase_e/article_scope.py`
   - `python scripts/ci/run_python_gates.py`
7. Commit the regenerated `docs/TASK_QUEUE.md`, `docs/ARTICLE_OBLIGATIONS.md`,
   `docs/ARTICLE_SCOPE.md` and `state/norm_task_state.json` (the state file is
   now **not** under `build/` and must be version-controlled).
8. Open a PR; do not merge until CI is green. Keep `LEGAL_REVIEW` pending.

## 7. Explicit non-claims

- No legal conclusion, no defect discovery, no completion of the Japanese tax
  law formalization is claimed.
- Existing Lean proofs were not modified.
- 11,370 unresolved units in 所得税法 are an open obligation, not a pass.
- Human legal review remains pending (out of repo).
