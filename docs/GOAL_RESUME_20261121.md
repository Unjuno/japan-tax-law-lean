# Goal resume record — 2026-11-21 (Japanese tax law formal verification)

This is a **status and resume record**, not a completion claim. It is written to
the repository as required by Objective §6 because the whole-target criterion
remains far from met.

## Baseline and provenance

- Repository: `Unjuno/japan-tax-law-lean`; baseline re-fetched from `origin/main`.
- Reference commit named by the directive: `44fa08a`.
- Pinned inventory snapshot: `2026-11-15`; 327 provisional laws, 325 with pinned
  raw snapshots, 324 current-enforced, 2 fully unenforced.

## Measured state (last full regeneration)

```
build/task_queue.json: 396,854 normative units
  NOT_STARTED=396,575   PARTIAL=0   PROVED_SCOPE=2
  FULLY_VERIFIED=275    BLOCKED=2
data/verification_evidence.json: 277 units; all 277 derive FULLY_VERIFIED
evidence generator: ZERO substantive blockers — every produced unit passes
  kernel-attestation, independent spec, source correspondence, boundary and
  adversarial-review gates; only units with a full Lean model appear here.
```
The session baseline was FULLY_VERIFIED=154; the latest measured value is 275.
The generator cannot produce further units from the existing models; the
remaining ~396,578 units need NEW Lean models, specs, tests and reviews created
at a scale far beyond a single session.

## What is established

### §1 measurement / completion determination (done, merged)
- Collision-free normative ids binding law id, history/revision id,
  main/supplementary/appendix provision, article/paragraph/item/sub-item/cell,
  kind and source digest.
- Clause decomposition with exact spans; UNRESOLVED text recorded; independent
  reconstruction audit; structured dependencies (law name + article + enforced
  revision; bare 15-character id is a hint only).
- Five-state vocabulary; status derived only from recorded evidence; needle
  matches, file existence and theorem-name strings cannot complete a unit.
- Durable per-unit state/evidence ledgers; H/T/D/C/U findings; separate,
  never-auto-satisfied human legal-review axis.
- `run_python_gates.py` prints SKIP separately; required SKIP is a FAIL.
- Independent completion audit (`qa_completion_audit.py`) reported 8/8 and
  `verify_queue_invariants.py` reported 14/14 (unbacked=0, mismatches=0).

### §2 target scope (partially done)
- Separate 7-layer source registry: L0 statutes (provisional), L1 appendix /
  supplementary, L2 municipal ordinances (1,788 declared unacquired), L3 treaties,
  L4 circulars, L5 case law, L6 historical revisions (795 names / 12,977
  occurrences unpinned). Auxiliary layers are never merged into L0.
- Historical-reference classification by real inventory fields; non-税 recursive
  discovery support.

### §3 evidence and proofs (bounded)
- CI-backed hash attestation: every FULLY_VERIFIED unit requires module hashes
  re-verified from a git blob at a commit whose Lean build+axiom job succeeded.
  Attestations are rebound only after REST-API verification of the run.
- Independent source correspondence checked OUTSIDE Lean: exact statutory rate
  rationals (`百分の九十・七` = 907/1000), multi-rate tables (two independent
  anchors), structural specs (pinned needles), genuine boundary categories
  (zero / small input / saturation).
- 60 independent adversarial review files with H/T/D/C/U; all BY-DESIGN,
  CONFIRMED=0. Review is separate from Lean proof and never auto-satisfied.
- Two genuine Lean kernel/syntax errors in a contributed model were caught by
  CI and fixed without relaxing any gate (multi-arg binder commas; a proof term
  used as an expected type). CI is the enforcement point for these errors.
- No `sorry`, `admit` or unexplained axioms introduced by this work.

### Gate coverage (§5)
- The stronger `completion_gate_adversarial.py` (5 extra §1 rules: id components,
  state persistence, ledger-no-bare-COMPLETE, unbacked FULLY_VERIFIED, scope
  candidates) was previously dead code referenced only in docs. It is now
  registered as a REQUIRED gate in `run_python_gates.py` (PR #434). CI confirmed
  it PASSes with 0 MUST failures.

## What is NOT established — no completion claim

- ~396,575 of 396,854 units remain `NOT_STARTED`; the whole-target criterion of
  §5 (every norm decomposed, formalized, proved and source-audited) is unmet.
- 175,186 external references unbound; 7,526 unmatched law names and 2,873
  tax-name candidates outside the ledger; 3,438 L7 candidates with **0** human
  reviewers; 795 historical names / 12,977 occurrences unpinned.
- Ordinances, treaties, circulars and case law are declared but unacquired.
- Main CI intermittently fails on stale derived ledgers (L7, LAW_STATUS,
  COVERAGE) after concurrent merges; regenerate them before judging a run.

## Resume procedure (exact next steps)

1. `git fetch origin main` and read `docs/TASK_QUEUE.md`, `data/QUEUE_INDEX.json`.
2. Select dependency-ready units: `python scripts/ci/task_selector.py 12`.
3. For each unit: add independent spec + boundary tests first; run an
   ADVERSARIAL agent with a **separate output file** under `docs/adversarial/`.
4. Open a PR; **wait for the Lean job on the PR to be green** before merging;
   then create a scoped attestation bound to THAT merge commit/run with hashes
   recomputed from git blobs (never the working tree), then
   `python scripts/ci/generate_verification_evidence.py` and
   `python scripts/ci/task_queue.py`; verify `FULLY_VERIFIED` rises and
   `NOT_STARTED` falls.
5. In parallel: non-税 recursive discovery, acquire/pin the declared source
   layers, and bind the remaining unbound references and historical revisions.
6. Regenerate L7 / LAW_STATUS / COVERAGE ledgers before evaluating CI.

Human legal review remains a separate pending axis; do not self-certify it.

## UPDATE 2026-11-24 (latest measured state and new integrity guards)

- Measured on merged main: 396,854 determined-target units;
  FULLY_VERIFIED=623, NOT_STARTED=396,228, PROVED_SCOPE=1, BLOCKED=2;
  evidence ledger 624 units. The §5 completion criterion remains unmet.
- Two new REQUIRED-gate invariants were added to `verify_queue_invariants.py`
  after repeated silent regressions by a concurrent reconcile workstream:
  1. `registered transcription checks retained` — every module in
     `data/TRANSCRIPTION_CHECK_REGISTRY.json` must still have a check in
     `transcription_audit.py`.
  2. `umbrella imports retained` — every on-disk `JapanTaxLaw/*.lean` module
     must be imported by `JapanTaxLaw.lean`. Without this, a stale-base rewrite
     of the umbrella turns the axiom probe red with "Unknown constant".
  When either guard fires, restore the dropped checks/imports via a PR; do NOT
  disable the guard. Also watch `FULLY_VERIFIED evidence refs resolve to current
  files` — one-off manual evidence entries (e.g. GiftTax) can carry stale hashes
  after a concurrent file edit; refresh those hashes to current file state.
- Queue-loop finding: the top 60,000 selector units contain no further clean,
  semantically-distinct numeric-norm candidates. Remaining candidates are
  cross-references, section headings, or multi-step computations whose only
  numerals are law/article identifiers or article-internal rates unrelated to
  the candidate clause. Do NOT model an identifier as a threshold to pad counts
  — that would violate the independent source-correspondence requirement.
  Further progress requires either (a) faithful multi-step arithmetic models,
  or (b) the parallel §2 tasks: acquiring more raw snapshots (only 31 of 381
  discovered laws have raw files on disk), pinning historical revisions, and
  binding external references.
- Attestation is rebound per model PR to a REST-confirmed CI-green commit's git
  blobs; latest binding 1494+ module hashes. Always re-derive evidence/queue
  after each rebind and re-measure FULLY_VERIFIED vs NOT_STARTED.
