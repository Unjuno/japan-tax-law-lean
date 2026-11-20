# Directive §1 — measured status (task queue and completion determination)

This is a decision/evidence record, **not a completion claim**. It records what
was measured in an isolated worktree after re-fetching `main` at
`22246889a2d91e927cadb2c6382a9911904325e3` (reference commit in the directive:
`44fa08a`). No Lean source or proof was modified by this work.

## 1. Baseline defect that was corrected

At `main`, `scripts/ci/task_queue.py`:

* derived `task_id` from `sha256(law|revision|path|article)[:16]` — a truncated
  prefix, and the components omitted the norm kind, paragraph/item detail,
  appendix cell and exact source span;
* emitted **one work unit per article** (`scope: FULL_ARTICLE`), so exceptions,
  deeming, delegation and references were never separate obligations;
* set `formalized = "COMPLETE_SCOPE"` whenever a pinned literal needle appeared
  in the article — exactly the numeric/string match prohibited by §1.4;
* treated a 15-digit id search as the whole dependency analysis;
* regenerated status on every run, so owner/blocker/artifact state was lost.

`article_obligations.py` used the same six-signal syntactic rule;
`article_scope.py` matched needles to whole articles only; `task_selector.py`
had no durable ownership and treated missing dependencies loosely.

## 2. Implementation now in this branch

A single canonical core, `scripts/ci/normative_core.py`, is imported by all four
adapters. It provides:

* §1.1 full 64-hex SHA-256 identity over law id, revision/history id,
  provision kind (本則/附則/別表), article, paragraph, item, subitem, table cell,
  norm kind, unit ordinal, exact source span, source digest, normalized-text
  digest **and structural path**. The structural path includes a deterministic
  sibling index: the pinned 関税定率法 snapshot contains ~85 unnumbered
  `SupplProvision` blocks, and omitting that index produced **88,998 colliding
  ids in the first measured run** (the strict uniqueness assertion now fails
  loudly rather than silently deduplicating).
* §1.2 clause decomposition into `APPLICATION_CONDITION`, `LEGAL_EFFECT`,
  `EXCEPTION`, `DEEMING`, `PRESUMPTION`, `DELEGATION`,
  `READING_SUBSTITUTION`, `REFERENCE`; §1.3 undecidable text becomes
  `UNRESOLVED` with a mechanical coverage audit. Independent original-text
  fidelity remains a separate evidence axis (`SOURCE_CORRESPONDENCE_AUDIT`).
* §1.4 `derive_status()` takes only recorded evidence as input. Needles, file
  existence and theorem names appear solely in `weak_hints` with
  `sufficient_for_completion = false`.
* §1.5 per-unit evidence slots for source position, independent spec,
  implementation, kernel proof, tests, boundary/precedence/cross-law/revision
  obligations, unhandled conditions and review evidence.
* §1.6 four dependency extractors (alphanumeric 15-char law ids, law names
  including non-「税」 names, law numbers, article/paragraph/item refs,
  enforcement versions). A bare id is explicitly flagged `bare_id_only` and
  unresolved dependencies are reported, never assumed satisfied.
* §1.7 durable state in `data/task_state.json` plus evidence in
  `data/verification_evidence.json`; regeneration preserves owner, blockers,
  artifacts, attempts and review and moves vanished ids to `stale_units`.

`run_python_gates.py` now declares mandatory gates: a missing mandatory gate is
a FAIL, and SKIPPED optional gates are printed separately and never counted as
PASS.

## 3. Measured results (this worktree)

| measurement | value |
|---|---:|
| inventory snapshot | 2026-11-15 |
| laws in inventory / with pinned snapshot | 327 / 325 |
| normative units generated | 289,583 |
| units with full 64-hex unique id | 289,583 (0 collisions) |
| NOT_STARTED / PARTIAL / PROVED_SCOPE / FULLY_VERIFIED / BLOCKED | 289,583 / 0 / 0 / 0 / 0 |
| unresolved (auto-decomposition failed) | 42,338 |
| decomposition coverage gaps | 0 |
| norm kinds | see `docs/TASK_QUEUE.md` |
| scoped needle checks / whole-text-only | 124 / 34 (of 158) |
| UNRESOLVED units in scoped text | 773 |
| pinned transcription checks | 158 / 158 PASS |
| new §1 regression tests | 14 / 14 PASS |
| pre-existing Python tests | 85 / 85 PASS |
| full Python gate suite | all present gates passed; 0 skipped, 0 failed |
| Lean build | NOT RUN (no `lean`/`lake` on PATH in this environment) |
| human legal review | 0 recorded; 3,438 L7 candidates remain pending |

## 3a. Independent review of the branch (PR #191)

The automated Codex reviewer on PR #191 raised three findings, all reproduced
and fixed with regressions in `scripts/tests/test_directive1.py`:

1. `provision_of()` tested for the literal path component `Main`, but the
   structural walker emits indexed components such as `Main#2`; every main
   provision was therefore labelled `Unknown`. Fixed and verified in the
   regenerated `docs/TASK_QUEUE.md` (all sample units now show `Main`).
2. `task_selector.py` loaded durable ownership *after* selection and skipped
   units with no state entry, so consecutive runs could reassign a unit and
   assignments were lost. Ownership is now loaded before selection and missing
   state entries are created on assignment.
3. Dependency readiness compared `resolved_law_id` (a law id) against a set of
   64-hex normative-unit ids, so no dependency could ever become ready. It now
   resolves against law ids that have a proved unit.


## 4. Scope of the claim

The completion judgment is now evidence-based and the queue is durable and
decomposed to norm units. **This is a measurement-infrastructure correction,
not a formalization progress claim.** Adding 289,583 new work units increases
the count of unverified obligations; per the directive it must not be counted as
formalization progress. No new Lean model, theorem or proof was introduced, and
all existing Lean proofs are untouched.

Outstanding: 175,186 external references remain unbound to the ledger,
recursive discovery is incomplete, 42,338 units need manual decomposition
review, and human legal review is an unresolved external prerequisite.
