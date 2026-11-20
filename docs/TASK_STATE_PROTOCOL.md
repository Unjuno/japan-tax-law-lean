# Durable task state (Directive §1 item 7)

`data/task_state.json` is committed and authoritative for everything a worker
changes by hand. `build/task_queue.json` is only a generated projection:
regenerating it must never erase an owner, blocker, artifact, evidence record,
or review decision.

## Schema

```json
{"schema": "task_state/v1", "units": { "<normative_id>": { ... } }}
```

A unit record has the shape produced by `normative_core.default_state(uid)`:

- `status` — one of `NOT_STARTED`, `PARTIAL`, `PROVED_SCOPE`,
  `FULLY_VERIFIED`, `BLOCKED`, `UNRESOLVED`, `RETIRED`;
- `owner` — the agent currently allowed to edit this unit (empty = unowned);
- `blockers` — list of `{"code": ..., "resolved": false}` records;
- `artifacts`, `evidence` — named references to source pins, independent spec,
  implementation, kernel proof, boundary/cross-law tests, source audit and
  adversarial review;
- `unhandled_conditions`, `legal_review`, `history`.

## Rules

1. Only recorded evidence (a non-empty reference in `evidence`) can advance a
   status. A numeric needle match, a file's existence or a theorem-name regex
   is a presence fact, never evidence of proof or legal correctness.
2. `legal_review` starts at `LEGAL_REVIEW_PENDING`; only an explicitly recorded
   human decision may change it.
3. When a pinned source digest changes, `merge_state` resets the evidence and
   records a `source-changed` history event. A previously verified unit is not
   silently carried forward.
4. Units that disappear from the projection are `RETIRED`, not deleted.
5. `task_selector.select_tasks(tasks, n, claims)` skips owned/claimed units so
   two agents never edit the same artifact in parallel.

The file is intentionally empty at baseline: no unit has recorded evidence yet.
