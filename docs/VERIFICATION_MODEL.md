# Verification model (machine-generated tooling, Sponsor Directive §1/§5)

This document describes the queue and completion model implemented by
`scripts/ci/normative_units.py`, `task_queue.py`, `task_selector.py`,
`article_obligations.py`, `law_audit/phase_e/article_scope.py`,
`completion_gate.py` and `run_python_gates.py`.

Baseline used for this change: `main` at `22246889a2d91e927cadb2c6382a9911904325e3`
(reference commit `44fa08a` touches none of the queue/completion files).

## 1. Unit of work

A work unit is one **normative unit**, not one article and not one file.
The identifier is a full 64-hex SHA-256 over length-prefixed components:

```
law_id | history_revision_id | 本則/附則/別表 path | 条項号細目/別表セル path
      | unit index | unit kind | sha256(unit text)
```

Collisions raise an error instead of overwriting a record. The legacy
16-hex id derived from a single string is gone.

## 2. Decomposition and its audit

Each 本則/附則/別表 block is split at sentence boundaries into units typed as
application condition, legal effect, exception, fiction, presumption,
delegation, reading-substitution, reference, definition, procedure,
transitional, penalty. Sentences with no recognised cue are recorded as
`UNRESOLVED`, never dropped.

`audit_decomposition()` independently recomputes coverage from the recorded
spans and reports gap / overlap / unresolved character counts. A unit is not
`decomposition_ok` unless all three are zero.

## 3. Dependencies

Dependencies are parsed as **law name + article + enforcement revision**, with
kinds `REFERENCE`, `QUASI_APPLICATION` (準用), `DELEGATION` (政令/省令/条例),
`READING_SUBSTITUTION` (読替え). Unresolvable targets are recorded as blockers,
not treated as "no dependency".

A bare identifier-shaped substring is kept only in `legacy_raw_ids` with
`legacy_ids_authoritative: false`. Incidentally, the old `\d{15}` pattern did
not even match real e-Gov law ids such as `340AC0000000033`; the new pattern
does, but is still non-authoritative.

## 4. Completion states

`NOT_STARTED / UNRESOLVED / PARTIAL / PROVED_SCOPE / FULLY_VERIFIED / BLOCKED`.

A terminal state requires all eight machine-evidence records in
`data/TASK_STATE.json`: source pin, independent coverage audit, independent
spec (hash distinct from the implementation hash), implementation,
kernel-checked proof result with zero `sorry`/`admit`/unexpected axioms,
named boundary tests with pass counts, dispositioned unhandled conditions, and
an independent adversarial audit by an agent distinct from the implementer.
Human legal review is recorded and reported, but is a separate axis and is
never a prerequisite for machine completion.

Needle matches, file existence and theorem-name string matches are explicitly
**not** evidence and can only ever produce `NOT_STARTED`.

Human legal review, adversarial review and machine verification are separate
axes and are reported with separate denominators.

## 5. Persistence

`data/TASK_STATE.json` records owner, attempts, claim time, blockers,
evidence artifacts, history and review trail. The Coordinator's selector
claims units; regeneration merges rather than overwrites, so work survives
process restarts. Human legal review is never a selection blocker.

## 6. CI reporting

`run_python_gates.py` prints `SKIP` separately and never counts a skipped gate
as a pass. `completion_gate.py` prints a machine-readable `COMPLETE` /
`INCOMPLETE` verdict; "registered checks passed" is never reported as
"all obligations complete".

## 7. Known limits (not silently closed)

- The corpus is still the 2026-11-15 inventory of 327 laws filtered by the
  `税` keyword. Recursive discovery of related laws without `税` in the name,
  local tax ordinances per municipality, treaties, notices and case law remain
  separate layers and are not covered by this change.
- Source-text cue classification is heuristic. `UNRESOLVED` units and units
  with unresolved dependencies are reported, not guessed away. Independent
  legal interpretation remains a human-review axis.
- `build/task_queue.json` is derived data (git-ignored); `data/TASK_STATE.json`
  is the durable ledger.
