# Resumable state — 2026-11-24 (Directive §6)

Status and resume record, **not** a completion claim. Human legal review remains
`LEGAL_REVIEW_PENDING`; no approval or human review record has been fabricated.

## Position

- Directive baseline: `main @ 0c9bb14` (ancestor of current `main`).
- Work landed by this iteration: `41eb056c` (scope backlog + restored
  transcription checks + strengthened LongTermGain spec/tests/independent
  review), pushed to `origin/main`.
- CI for `41eb056c`: run `45387962311`; job *Build Lean project and check
  axioms* = **success** (kernel build, axiom probe, two clean rebuilds);
  job *Semantic audit and mutation injection* = failure on stale derived
  ledgers (known CI flake; SKIP is never PASS).
- Scoped `lean_job_only` attestation `data/PROOF_ATTESTATION_SCOPED_LONGTGAIN.json`
  binds the three `LongTermGainSpecialMeasure*` module SHA-256 values to commit
  `41eb056c456d065a7ef32fb40b5e669dd96e967c` and that green CI run. Hashes were
  computed from git blobs, never from the working tree.

## Executed loop (INSPECT → SELECT → FORMALIZE → PROVE → CHALLENGE → VERIFY → COMMIT)

1. **INSPECT** — synced `origin/main`; preserved a pre-existing stale uncommitted
   ledger regeneration as `C:\Users\junny\AppData\Local\Temp\opencode\jtll-uncommitted-backup-20261124.patch`;
   ran the 51-gate Python suite and identified 5 stale-ledger failures.
2. **Directive §1/§5 scope correction** — L2 ordinances, L3 treaties, L4
   circulars, L5 case law and L6 historical revisions changed from
   `DECLARED_UNSUPPORTED`/`OUT_OF_SCOPE` to explicit `IN_SCOPE_BACKLOG`,
   `BACKLOG_NOT_ACQUIRED` and `IN_SCOPE_INTERPRETATION_BACKLOG`. Each has a
   durable `backlog` task record (task class, status, `LEGAL_REVIEW_PENDING`,
   empty acquisition/formalization evidence, next action). `UNSUPPORTED` is an
   implementation state, never a sponsor scope exclusion. 8/8 source-layer
   tests pass.
3. **Integrity restore** — re-added the two transcription checks dropped by a
   stale-base merge (`LongTermGainSpecialMeasure` cycle-113 and
   `DisasterTaxReliefOrderArt10Item5FieldCondition`) and registered both;
   registry invariant shows `lost=[]`. Added the durable transcription pin
   `data/TRANSCRIPTION_PINS/LongTermGainSpecialMeasure.json` with the scoped
   article key `34_2` so the evidence generator can locate the clause.
4. **FORMALIZE / PROVE** — independent spec of `LongTermGainSpecialMeasure`
   now carries the statutory rate pair `(2, 100)` (designated city `(1, 100)`)
   transcribed from 百分の二 / 百分の一; kernel-decided boundary grid extended
   to `0`, `19,999,999`, `20,000,000`, `20,000,001`. Measured:
   `independent_spec_ok=True`, `spec_literals=[2, 100, 20000000]`, boundary
   categories `{zero, saturation, threshold_below, threshold_at,
   threshold_above}`, 8 kernel-decided tests. `lake build`: 1774 jobs green;
   `check_no_sorry.py` clean; axiom probe has no `sorryAx`/`Classical.choice`.
5. **CHALLENGE** — mechanical, independent re-extraction recorded in
   `docs/adversarial/reviews-long-term-gain-special-measure.md`: pinned raw
   SHA-256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`,
   verbatim needle in the scoped article, exact rate ratio 1/50, H/T/D/C/U
   (BY-DESIGN / CONFIRMED). This is not a human review.
6. **VERIFY / COMMIT** — `generate_verification_evidence.py` merged the unit
   `NORM|e56c635c…d5a` with all 11 evidence axes; `task_state.json` records
   `NOT_STARTED → FULLY_VERIFIED`. Repository queue last read:
   `NOT_STARTED=396143`, `FULLY_VERIFIED=706`, `PROVED_SCOPE=3`, `BLOCKED=2`
   (includes other concurrent workstreams' units).

## Three independent states — do not merge

| axis | state |
|---|---|
| technical verification | Lean kernel build green; hash-scoped attestation bound to a real CI run; evidence generator enforces source / independent-spec / boundary / review axes. Note: the generator's `kernel_proof` reference string names the main attestation commit; the hash itself is re-verified from the merged scoped module map, so the proof is still bound to the CI-green blob. |
| formalization completeness | incomplete — ~396 thousand normative units remain; this iteration adds one bounded computable slice and keeps five source families in an explicit backlog |
| legal review | incomplete — `LEGAL_REVIEW_PENDING` on every unit; no human decision fabricated |

A file's existence, a theorem name, or a numeric needle appearing anywhere in a
law is never completion. `FULLY_VERIFIED` requires all 11 evidence axes;
`PROVED_SCOPE` and `FULLY_VERIFIED` remain distinct.

## Next executable tasks (resume here)

1. Land the regenerated evidence / task-state / progress deltas and confirm
   `FULLY_VERIFIED` rose **and** `NOT_STARTED` fell (Directive §5).
2. Fix the 5 stale derived ledgers (`LAW_STATUS`, `COVERAGE`, `L7`, `BLOCKED`,
   evidence) so the Python audit job is green on `main`; regenerate before
   judging CI, never weaken a gate.
3. `python scripts/ci/task_selector.py 12` measured `queue_units=396854`,
   `selectable=396153`, `selected=12`, `skipped_owner=1`,
   `skipped_dependency_or_blocker=32`, `legal_review_is_not_a_filter=true`.
   Unmodelled computable candidates include `143AC0000000054` art. 9 and
   `330AC0000000104` art. 15; selection is not formalization.
4. Work the new backlog entries: acquire versioned raw bytes, pin SHA-256,
   decompose into normative units; never fold auxiliary layers into L0.
5. Keep human legal review pending until an actual human decision is recorded.

## Claim boundaries

`UNSUPPORTED` is an implementation state, not a sponsor exclusion. Circulars
and case law are interpretation layers to be collected gradually. The
whole-target criterion of Directive §5 is **not met**.
