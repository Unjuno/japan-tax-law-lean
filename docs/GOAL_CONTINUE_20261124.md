# Goal continuation record — 2026-11-24 (sponsor directive: continue full formalization)

This is a **status and resume record**, not a completion claim. It records this
iteration's measured work and the exact state of each independent axis.

## Baseline reconciliation

- Directive names `main @ 0c9bb14` as the working baseline. That commit
  (2026-11-18, PR #153) is **925 commits behind** current `main` (`4485597a`,
  2026-11-24). Rewinding would discard the entire queue/evidence/attestation
  apparatus the directive itself relies on. Work therefore continues from the
  current `main` descendant; the discrepancy is recorded here, not silently
  ignored.
- Working branch: `goal/continue-rebased`, created from `origin/main`
  (`098c0a48`). Concurrent workstreams landed equivalent umbrella and stale
  ledger repairs on main (`e56040a1`, `801eb28f`, `005eb600`), so this branch
  contains only the unique contributions described below. The umbrella is
  maintained by main's deterministic `scripts/ci/generate_umbrella.py`, not by
  append-style repairs.

## Integrity repair (REQUIRED gate, not a policy change)

`verify_queue_invariants.py` reported `FAIL umbrella imports retained`: 24
modules added by `16c9def6` existed on disk but were never imported by
`JapanTaxLaw.lean`, leaving them outside the axiom probe. The guard was
**restored**, not disabled:

- `JapanTaxLaw.lean`: +27 imports (24 orphaned modules + 3 new unit modules).
- After repair: `16/16 invariants passed` (`umbrella imports retained -
  modules=1765 missing=0`, `registered transcription checks retained -
  lost=0`). On the rebased branch the canonical umbrella check (17/17) is
  satisfied by `generate_umbrella.py`, which automatically includes the three
  new modules.

## New normative unit (INSPECT → SELECT → FORMALIZE → PROVE → CHALLENGE)

Selected from the persistent queue (dependency-free, scoped verbatim clause):

| field | value |
|---|---|
| normative id | `NORM\|68cc7a516287f33351d259921d3e7dde2e314a75cde606a098b736c6e4319ab5` |
| law / revision | `325AC0000000073` / `325AC0000000073_20260401_506AC0000000008` |
| provision | 相続税法 第二十一条の七(1), rate-table upper-column cell |
| needle | 「千五百万円を超え三千万円以下の金額」 |
| kind | CONDITION (interval: 15,000,000 < x ≤ 30,000,000) |

Artifacts:

- `JapanTaxLaw/InheritanceGiftTaxRateBracket15M30M.lean` — implementation.
- `JapanTaxLaw/InheritanceGiftTaxRateBracket15M30MSpec.lean` — independent
  spec (`Nat.succ 15_000_000 ≤ amount ∧ amount ≤ 30_000_000`), no impl
  identifier reused, universal axiom-free equivalence bridge.
- `JapanTaxLaw/InheritanceGiftTaxRateBracket15M30MTests.lean` — kernel-decided
  boundary cases: zero, below, at_lower (excluded), just_above, interior,
  upper inclusive, above_upper; plus universal impl/spec agreement.
- `scripts/ci/transcription_audit.py` — module-specific pinned needle check
  (PASS in local audit).
- `data/TRANSCRIPTION_CHECK_REGISTRY.json` — +1 registered module.
- `docs/adversarial/reviews-batch-209.md` — mechanical independent
  re-extraction with H/T/D/C/U; explicitly **not** human review.

Local kernel evidence (this iteration):

- `lake.exe build`: **Build completed successfully (1768 jobs)**.
- `check_no_sorry.py`: no forbidden placeholder proofs.
- `_ax.lean` axiom probe: `sorryAx=0`, `Classical.choice=0` over 3838 lines.
- `verify_queue_invariants.py`: 16/16.
- `transcription_audit.py`: new check PASS, exit 0.

## Autonomous coordination (§3)

`scripts/ci/coordinator.py` operationalizes
INSPECT → SELECT → FORMALIZE → PROVE → CHALLENGE → VERIFY → COMMIT → REPEAT:

- INSPECT reads the persistent queue and reports independent status counts
  without declaring completion.
- SELECT reuses `task_selector` (dependency-ready, unclaimed, round-robin;
  human review is never a filter).
- ASSIGN gives each selected unit to three **separate** High4 roles
  (FORMALIZER / PROVER / INDEPENDENT_REVIEWER) with durable claims in
  `data/COORDINATOR_CLAIMS.json`, so a stopped task cannot block others and no
  two agents edit the same artifact.
- RELEASE frees claims; CYCLE records only measurable counts and never changes
  a task's status.
- `scripts/tests/test_coordinator.py` (6 tests) verifies role separation,
  durable claims, release, dependency blocking isolation and that legal review
  is never auto-satisfied. Registered as a REQUIRED gate in
  `run_python_gates.py`.

## Independent status axes (never collapsed into one "COMPLETE")

| axis | state for the new unit | why |
|---|---|---|
| technical verification (Lean kernel) | done locally | build + no-sorry + axiom probe green |
| independent spec / source correspondence | done | spec literals 千五百万 / 三千万 found verbatim in the scoped clause; needle scoped |
| formalization of the whole article | **not done** | only this bracket cell is modelled; paired rate, other brackets, deductions and other paragraphs are out of scope |
| CI hash attestation | done | `data/PROOF_ATTESTATION_SCOPED_15M30M.json` binds the three module hashes to commit `4f57f7014561a175cb8b3cd5c11d3eba3954ea4a` and green run `https://github.com/Unjuno/japan-tax-law-lean/actions/runs/45409652393` (conclusion `success`) |
| queue status | `FULLY_VERIFIED` | after attestation + honest evidence regeneration; status derives only from recorded evidence, never from a file or theorem name |
| human legal review | `LEGAL_REVIEW_PENDING` | no human reviewer; no approval is recorded or implied |

### Attestation-to-promotion measurement

```
before attestation: FULLY_VERIFIED=697  NOT_STARTED=396152  evidence=700
after attestation:  FULLY_VERIFIED=698  NOT_STARTED=396151  evidence=701
progress_ledger: COUNTED; NOT_STARTED delta -16; new modules 3
verify_queue_invariants: 16/16; new unit evidence present = True
```

The delta of -16 is measured against the committed head snapshot
(`682/396167`), not against the file count. The new unit is one of those 16;
the rest came from the umbrella repair described above.

## Measured delta (this iteration)

Restoring the 24 orphaned imports made those modules reachable to the axiom
probe and to the attestation/evidence generator. Honest regeneration after
removing the temporary pipeline-validation attestation measured:

```
before: FULLY_VERIFIED=687  NOT_STARTED=396162  evidence ledger=690 units
after:  FULLY_VERIFIED=697  NOT_STARTED=396152  evidence ledger=700 units
delta:  FULLY_VERIFIED=+10  NOT_STARTED=-10    evidence=+10
```

This is a real reduction in unverified units caused by the integrity repair,
not by counting files or theorem names. `progress_ledger.py` reports
`UNCOUNTED` because its committed head snapshot predates this branch; the raw
queue/evidence counts above are the authoritative measurement.

The new bracket unit itself is **not** included in that +10: it is fully
modelled and locally kernel-verified, but its CI hash attestation is pending,
so it remains NOT_STARTED by design (see the status axes above).

## Whole-target scope (unchanged, no completion claim)

- Queue: 396,854 determined-target units; after regeneration
  `FULLY_VERIFIED=697`, `NOT_STARTED=396152`, `PROVED_SCOPE=3`, `BLOCKED=2`.
- Local ordinances, treaties, circulars and case law remain separate source
  layers; unacquired items stay in the backlog, not excluded from scope.
- `UNSUPPORTED`/`NOT_STARTED` describes implementation state, not a sponsor
  decision to exclude a law.

## Resume procedure

1. `git fetch origin main`; re-measure with `python scripts/ci/task_queue.py`,
   `python scripts/ci/verify_queue_invariants.py`.
2. Use `python scripts/ci/task_selector.py N` for dependency-ready, unclaimed
   units; formalize / prove / independently review in separate artifacts.
3. Push the branch, open a PR, wait for the Lean & Audit workflow to be green
   on the PR head commit.
4. Bind a scoped attestation to that exact commit + green run with
   `make_scoped_attestation.py`; regenerate evidence, queue and progress
   ledgers; verify `FULLY_VERIFIED` rises and `NOT_STARTED` falls.
5. Keep legal review pending until a human reviewer records it.
