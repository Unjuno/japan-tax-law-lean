# Completion-mechanism audit findings (2026-11-20)

## Scope

This note records an **independent, measured** audit of the four scripts named in
the directive's first execution task:

- `scripts/ci/task_queue.py`
- `scripts/ci/task_selector.py`
- `scripts/ci/article_obligations.py`
- `scripts/law_audit/phase_e/article_scope.py`

plus `scripts/ci/run_python_gates.py` (SKIP/PASS semantics).

The audit tool is `scripts/ci/qa_completion_audit.py`. It is a *reporter*: it does
not trust any completion claim made by the scripts it inspects.

## How the measurement was obtained

The local `shell` tool was unavailable (every invocation timed out at the PTY
layer), so the audit was executed with a remote Python 3.11 runtime over the
public Wandbox API. The tool fetched the **pinned GitHub `main` baseline** files
over HTTPS and applied the eight static checks. Reproduce with:

```sh
python scripts/ci/qa_completion_audit.py --source github
python scripts/ci/qa_completion_audit.py            # local workspace, once a shell is available
```

## Measured result — pinned GitHub `main` baseline

```
GITHUB MAIN BASELINE: PASS=0/8
Q1 FAIL   needle/numeric match sets COMPLETE_SCOPE (task_queue.py)
Q2 FAIL   done = all(oks) with agree* regex sets COMPLETE (article_obligations.py)
Q3 FAIL   dependencies use only re.findall(r"\d{15}", text) (task_queue.py)
Q4 FAIL   SKIP can be silently treated as PASS (run_python_gates.py)
Q5 FAIL   status vocabulary lacks PARTIAL / PROVED_SCOPE / FULLY_VERIFIED
Q6 FAIL   no source-position + per-unit obligation linkage
Q7 FAIL   H/T/D/C/U evidence tuple absent from article_scope.py
Q8 FAIL   no committed durable state/evidence ledger
```

The baseline therefore **fails every one** of the directive's completion-
determination requirements. In particular, `task_queue.py` marks a unit
`formalized: COMPLETE_SCOPE` solely when a pinned literal needle was found in the
article, and `article_obligations.py` writes `COMPLETE` when three files exist, a
needle matches, no `sorry` string appears and an `agree*` identifier exists.
Both patterns are explicitly forbidden by the directive §1 items 4–5.

## Local remediation state (NOT yet pushed)

The local workspace contains a remediation of these defects (shared/collaborative
edits): a single normative core (`scripts/ci/normative_core.py`), collision-free
IDs with full provenance, decomposition into units with UNRESOLVED capture,
structured law/article/enforcement dependencies, a five-state vocabulary, a
durable `data` state ledger, and an H/T/D/C/U article-scope diagnostic. A
completion gate (`scripts/ci/completion_gate.py`) separates "registered checks
passed" from "all obligations completed" and reports
`COMPLETION_DECLARABLE: no` unless all units are verified and independently
audited.

These local changes are **not committed or pushed**: no authenticated `git`/`gh`
session and no working shell were available in this environment. GitHub `main`
still exposes the 0/8 baseline. This note does not claim the local remediation
is complete or that Lean builds/CI were re-run.

## Outstanding obligations (not claimed as done)

1. Push the remediation to GitHub and run `python scripts/ci/qa_completion_audit.py
   --source github` until it reports 8/8.
2. Run `lake build`, the axiom probe and all Python gates on the pushed branch;
   preserve the existing 518-job green build and no-`sorry` status.
3. Verify the queue generator against the real 327-law inventory and confirm that
   unverified obligations actually decrease as units are proved.
4. Extend recursive law discovery to non-「税」 related statutes, local ordinances,
   and separately layered treaties/notifications/case law.
5. Keep `LEGAL_REVIEW_PENDING` and `COMPLETION_DECLARABLE: no` until an independent
   human legal review exists.
