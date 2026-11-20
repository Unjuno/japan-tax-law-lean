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
  NOT_STARTED=396,706   PARTIAL=0   PROVED_SCOPE=2
  FULLY_VERIFIED=144    BLOCKED=2
data/verification_evidence.json: 146 units; 143 derive FULLY_VERIFIED
```
Unverified obligations fell from 396,852 (session start) to 396,706.

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
- Independent completion audit (`qa_completion_audit.py`) reported 8/8.

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
- 18 independent adversarial reviews with H/T/D/C/U; all BY-DESIGN, CONFIRMED=0.
- A Lean build failure (Prop-valued `by decide`) was caught by CI and fixed.
- No `sorry`, `admit` or unexplained axioms introduced by this work.

## What is NOT established — no completion claim

- 396,706 of 396,854 units remain `NOT_STARTED`; the whole-target criterion of
  §5 (every norm decomposed, formalized, proved and source-audited) is unmet.
- 175,186 external references unbound; 7,526 unmatched law names and 2,873
  tax-name candidates outside the ledger; 3,438 L7 candidates with **0** human
  reviewers; 795 historical names / 12,977 occurrences unpinned.
- Ordinances, treaties, circulars and case law are declared but unacquired.
- Duplicate gate modules (`completion_gate_adversary.py` and
  `completion_gate_adversarial.py`) serve different contracts (pure testable
  library vs repo-aware durable-audit CLI) and still need a single canonical
  declaration; they are NOT evidence of parallel edits to one artifact.
- Main CI intermittently fails on stale derived ledgers (L7, LAW_STATUS,
  COVERAGE) after concurrent merges; regenerate them before judging a run.

## Resume procedure (exact next steps)

1. `git fetch origin main` and read `docs/TASK_QUEUE.md`, `data/QUEUE_INDEX.json`.
2. Select dependency-ready units: `python scripts/ci/task_selector.py 12`.
3. For each unit: add independent spec + boundary tests first; run an
   ADVERSARIAL agent with a **separate output file** under `docs/adversarial/`.
4. Open a PR; after the Lean job succeeds, create a scoped attestation bound to
   THAT commit/run with hashes recomputed from git blobs (never the working
   tree), then `python scripts/ci/generate_verification_evidence.py` and
   `python scripts/ci/task_queue.py`; verify `FULLY_VERIFIED` rises and
   `NOT_STARTED` falls.
5. In parallel: non-税 recursive discovery, acquire/pin the declared source
   layers, and consolidate the two gate variants into one canonical module.
6. Regenerate L7 / LAW_STATUS / COVERAGE ledgers before evaluating CI.

Human legal review remains a separate pending axis; do not self-certify it.
