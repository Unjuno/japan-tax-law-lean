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

## REFERENCE BINDING FINDING (2026-11-24)

Investigated reducing the 175,186 `references_external_unverified` count:
- `scripts/law_audit/inventory/collect_references.py` loads only INVENTORY (325
  parsed) laws; I tested also loading the 380 now-on-disk verified discovered-law
  snapshots. Result: **no change** (external=175,186 both ways).
- Cause is by design: `scripts/law_audit/rules.py::_classify_law_name` resolves
  only FAMILY references (a law's own 施行令/施行規則, or an order/rule's parent
  act) as `act`/`order`/`rule`; every other named law is deliberately classified
  `external` so a differently-named law is never falsely bound to this one.
  `other_docs` is keyed by law TYPE, not law_id.
- Therefore binding the 175k external references needs a separate, reviewable
  law-name -> law-ID resolution layer (candidate/UNVERIFIED status, never an
  auto-bind), NOT extending `collect_references.py` with more raw files. Do not
  weaken the conservative classifier: that would create false cross-law claims.
- §2 raw-snapshot gap was closed this session: 349 missing snapshots re-fetched
  with per-file SHA-256 verification against the provenance ledger (0 mismatches;
  1 skip where the enforced revision advanced). 380/381 discovered laws now have
  verified raw bytes on disk, enabling future parse/decompose work.

## Resume addendum — 2026-11-26 (integration drift, two unmerged model PRs)

Measured merged main `86fcbefc`: 396,854 normative units; FULLY_VERIFIED=1057;
NOT_STARTED=395,794; PROVED_SCOPE=1; BLOCKED=2. Gates: 8/8 qa, 17/17 invariants
(locally after restoring dropped checks), 717/717 transcription, 25/25 evidence.

### Unmerged work (all artifacts on GitHub, nothing claimed as verified on main)

- PR #764 `formalize/separate-tariff-application` (SeparateTariffApplication.lean,
  3 units). CI green on `2bd958f6` / `5f92b76f` / `9e662076` / `dd70489e`;
  each green run was followed by a concurrent main rewrite, causing merge
  conflicts and ledger-regeneration gate failures. Latest branch head `5f981fec`.
- PR #832 `formalize/cabinet-order-matters-delegation`
  (CabinetOrderMattersDelegation.lean, 3 units, CI run `45827914144` FAILED:
  7 regeneration gates — L7, law-status, directive-axes, coordinator,
  source-layers, coverage, blocked). Head `e47f5e15`. A minimal PR with no
  ledger changes is NOT sufficient: adding Lean modules changes module counts,
  so coverage/source-layer/L7 ledgers must be regenerated.
- Branch `fix/restore-2-checks-final` head `746b3bbb`: restores transcription
  checks dropped by concurrent rewrites; not merged.

### Root cause (competing hypotheses)

1. Concurrent workstream rewrites `main` (umbrella, transcription checks and
   registry, generated ledgers) every few minutes, faster than a ~20-30 min CI
   run can finish. Each green PR head is stale by merge time.
2. The guard `registered transcription checks retained` compares checks against
   the registry, but the concurrent workstream edits BOTH, so dropping a check
   from both is invisible to the guard.
3. `progress_ledger.py` stores a snapshot keyed by HEAD, so a generated ledger
   committed with commit X is stale when CI checks out X (self-referential).

### Exact resume procedure (do not weaken gates)

1. Rebase the PR branch onto current `origin/main`; resolve conflicts keeping
   the new Lean modules, check, registry entry and umbrella import.
2. Run the FULL generator list in `scripts/ci/run_python_gates.py` order
   (NOT a subset) repeatedly until no file changes between runs (fixed point).
   Local PC needs >60 min per pass; allow a multi-hour timeout.
3. Commit regenerated ledgers; push; dispatch CI; verify green via REST with
   `gh run view` (REST rate limit 403 may require waiting or GraphQL).
4. Merge immediately after green; then create a SEPARATE scoped attestation
   file `data/PROOF_ATTESTATION_SCOPED_<MODEL>.json` from the green commit's
   git blobs (helper: `_mkscoped.py`). Never rewrite the contended main scoped
   attestation — PR #758 proved the separate-file approach merges.
5. Regenerate ledgers again on merged main; re-measure.

FilingDateException is already in the evidence ledger via PR #758's separate
scoped attestation. SeparateTariffApplication and CabinetOrderMattersDelegation
are NOT attested on main and must NOT be counted as progress.
