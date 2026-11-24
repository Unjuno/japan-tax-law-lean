# Sponsor directive 2026-11-24 — execution resume record

This is a **status/resume record, not a completion claim**. The goal remains
the full formalization of the Japanese tax-law system. No scope has been
reduced and no human approval has been recorded or fabricated.

## Baseline actually used

- The directive names `main @ 0c9bb14`. That commit is an ancestor of the
  current remote `origin/main`; the working baseline is therefore the latest
  fetched `main`, `4485597a5ff02ace23d94d62c4790f54ae27696e`.
- Work is isolated in a worktree so unrelated uncommitted work in the primary
  checkout is never overwritten.
- Measured queue at this baseline (after `python scripts/ci/task_queue.py`):
  `396854` normative units; `NOT_STARTED=396162`, `PARTIAL=0`,
  `PROVED_SCOPE=3`, `FULLY_VERIFIED=687`, `BLOCKED=2`.

## §1 — stop condition corrected

- Human legal review is a condition for a FINAL legal determination, **not** a
  condition for starting Lean formalization. Pending candidates remain
  `LEGAL_REVIEW_PENDING` (never auto-cleared).
- Local ordinances and tax treaties remain IN SCOPE in versioned source
  layers; unacquired items are backlog entries, not exclusions.
- Circulars and case law are staged as an interpretation-material layer,
  separate from 法令本文.
- `UNSUPPORTED` / `NOT_IMPLEMENTED` describes implementation state only.
- Implemented in `scripts/ci/blocked_ledger.py` (docs/BLOCKED.md is now a
  non-blocking backlog ledger) and `scripts/ci/source_layers.py`
  (`sponsor_directive_2026_11_24` flags in data/SOURCE_LAYERS.json).

## §2 — completion determination corrected

- `FULLY_VERIFIED` is now explicitly only the *technical evidence headline*.
- `scripts/ci/directive_axes.py` generates `data/DIRECTIVE_AXES.json` and
  `docs/DIRECTIVE_AXES.md`: eight independently tracked axes per unit —
  source acquisition, version pin, structure identification, normative
  decomposition, conditions/exceptions/effects formalization,
  spec↔implementation correspondence proof, boundary/conflict/undefined
  verification, and independent source audit — plus the separate
  `LEGAL_REVIEW_PENDING` axis.
- `scope_kind` records `FULL_ARTICLE` vs `COMPUTABLE_SLICE_ONLY`. A proved
  single-clause slice is never presented as a whole-article norm.
- Registered as REQUIRED gates in `scripts/ci/run_python_gates.py`.

## §3 — autonomous loop

- `scripts/ci/coordinator.py` implements
  `INSPECT → SELECT → FORMALIZE → PROVE → CHALLENGE → VERIFY → COMMIT → REPEAT`.
- It selects unfinished dependency-ready units, separates the three work
  roles, honours owner/claims so two agents never edit one artifact, reports
  blockers separately, and never filters on legal review.
- One iteration is recorded in `data/COORDINATOR_STATE.json` /
  `docs/COORDINATOR_STATE.md`; the worker packet is
  `build/coordinator_assignments.json`.
- Measured first inspection: 12 selected (formalize role), 32 dependency-
  blocked, while 396,162 other units remain selectable — a blocked unit does
  not stop the queue.

## §4 / §5 — verification and expansion

- Existing evidence generator already requires CI-backed hash attestation,
  independent spec definitions, clause/cell-level source correspondence and
  a module-specific H/T/D/C/U review; no `sorry`/`admit` is accepted.
- §5 work continues on delegation/reference/amendment discovery, versioned
  ordinance acquisition, historical revision pinning and cross-law
  definition/exception/enforcement-date checks. These remain measurable
  backlogs, not reasons to stop.

## §6 — reporting

- No user confirmation requested; no reviewer or approval field fabricated.
- Each iteration saves measured deltas to the committed ledgers.
- This work resumes the loop; it makes no whole-law completion claim.
