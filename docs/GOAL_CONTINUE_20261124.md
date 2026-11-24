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

## Second iteration — additional units and cross-check

Six more dependency-free 相続税法 units were formalized in the same pattern
(impl / independent spec / kernel boundary tests / pinned needle / adversarial
record), all from `325AC0000000073_20260401_506AC0000000008`:

| module | clause | normative id |
|---|---|---|
| `InheritanceGiftTaxRateBracket3M4M` | 21_7(1) 300万超400万以下 | `NORM|ba11d2cd9757bba62e0170670bdbca61193022421bd60ba07507240125ccbaf1` |
| `InheritanceGiftTaxRateBracket6M10M` | 21_7(1) 600万超1000万以下 | `NORM|8438fb053f6e98d98adc83fb213c6bb3cccbe3c8e510429fcaec4a7e1ed18d75` |
| `InheritanceTaxRateBracket10_30` | 16(1) 1000万超3000万以下 | `NORM|93b274d3db7616b01bf8ebe8da32b6a1bb33b66ca5f224d32215cd1108b0c470` |
| `InheritanceResidualPeriod10Years` | 23 残存期間十年以下 | `NORM|d5a66ff1b06fc056fd9ac865c49e901671853629ac2e087f189151171a59dc39` |
| `InheritanceTaxRateBracket30_50` | 16(1) 3000万超5000万以下 (repaired spec) | `NORM|2f9abe1626f614eaab2879239d801935a2a1b8cdbc5dde1de4f9c5925696a72b` |
| `InheritanceTaxRateBracket50_100` | 16(1) 5000万超1億以下 — previously missing row | `NORM|df94f143188b89690e03047e002c6a375e81d8d3c81f4313c1995b484310badc` |

`InheritanceTaxRateBracket30_50` originally had a spec that reused impl
identifiers and kept boundary theorems inside the spec; its evidence had become
stale. It was repaired (own literals, universal bridge, Tests-owned boundaries)
and honestly dropped to NOT_STARTED until a fresh CI attestation is bound.

Cross-check (§4/§5): `InheritanceGiftTaxRateBracketPartition.lean` proves
contiguity and universal pairwise disjointness of the six art.21_7(1) brackets.
The kernel **refuted** the naive assumption that the upper cell owns the shared
boundary: 「以下」 makes the LOWER cell own it, and the next cell's 「を超え」
excludes it. The correction is recorded in the module.

Before this iteration's attestation: `FULLY_VERIFIED=724`,
`NOT_STARTED=396125`, evidence ledger 727 units; queue invariants 17/17,
canonical umbrella OK, Lean build 1835 jobs green. All units passed the full
evidence pipeline under a temporary (never committed) attestation; no result
was claimed until a real CI run was bound.

CI run `45443514899` on commit `d85cd802ef2b260238e5b38e0112b74a2d3addc7`
completed with conclusion `success`. A scoped attestation
(`data/PROOF_ATTESTATION_SCOPED_SIX.json`) binds 21 module hashes read from
committed blobs at that commit to that green run. Honest regeneration measured:

```
before: FULLY_VERIFIED=724  NOT_STARTED=396125  evidence=727
after:  FULLY_VERIFIED=739  NOT_STARTED=396110  evidence=742
delta:  FULLY_VERIFIED=+15  NOT_STARTED=-15     evidence=+15
progress_ledger: COUNTED; NOT_STARTED delta -15; new modules 3
verify_queue_invariants: 17/17
local Python gate suite: 48/48 passed, 0 skipped
```

All seven target normative ids (the six new units plus the repaired
30M–50M row) now carry a `kernel_proof` evidence axis. The wider +15 includes
previously stale units recovered by the same honest regeneration. This is a
measurement from the evidence/queue ledgers, not a count of files or theorems.

## Third iteration — 地方税法 art.37_2(11) bands

Six further dependency-free units from `325AC0000000226_20261101_508AC0000000002`
were formalized with the same eight-axis treatment: `LocalTax37_2BandUpTo195`,
`195To330`, `330To695`, `695To900`, `900To1800`, `1800To4000`. Each has an
independent spec, universal axiom-free bridge, kernel-decided boundary cases,
a scoped pinned needle, a registry entry and a mechanical review in
`docs/adversarial/reviews-batch-221.md`.

CI run `45456853736` on commit `b41d78c31da1231de80ce5514e59a62ca0c0c143`
completed `success` (Lean job plus all Python gates). A scoped attestation
(`data/PROOF_ATTESTATION_SCOPED_372.json`) binds 18 module hashes read from
committed blobs at that commit to that green run. Honest regeneration measured:

```
before: FULLY_VERIFIED=739  NOT_STARTED=396110  evidence=742
after:  FULLY_VERIFIED=745  NOT_STARTED=396104  evidence=748
delta:  FULLY_VERIFIED=+6  NOT_STARTED=-6  evidence=+6
progress_ledger: COUNTED; NOT_STARTED delta -6; new modules 18
verify_queue_invariants: 17/17; all 6 target units in evidence
```

The eight status axes remain separate; these six units cover only their scoped
rate-table cells, not the whole of 地方税法 art.37_2.

### Fourth iteration (thresholds/tiers across 相続税法 and 地方税法)

Six further units (`LocalTax37_2Over40M`, `InheritanceTaxRateUpTo10M`,
`InheritanceTaxRateOver600M`, `InheritanceGiftRateOver30M`,
`InheritanceGiftRateUpTo2M`, `LocalTax71_14MidTier`) were validated with the
same axes (build 1871 jobs, invariants 17/17, batch-227 review). A source audit
again caught a `h.1`/`h.2` numeral leak in a proof and it was corrected before
attestation. CI run `45468592769` on `15b474270f88bca9a12b7b99f5ff412c9a9f6081`
completed `success`; `data/PROOF_ATTESTATION_SCOPED_T4.json` binds 18 module
hashes from committed blobs at that commit to that run.

```
before: FULLY_VERIFIED=743  NOT_STARTED=396106  evidence=746
after:  FULLY_VERIFIED=751  NOT_STARTED=396098  evidence=754
delta:  FULLY_VERIFIED=+8  NOT_STARTED=-8  evidence=+8
progress_ledger: COUNTED; NOT_STARTED delta -8; new modules 18
```

All six target units carry a `kernel_proof` axis; the wider +8 includes a
previously stale unit recovered by honest regeneration.

### Auxiliary source layers (§5, Directive §1)

Versioned official source bytes are pinned with SHA-256/byte count in
`data/SOURCE_ACQUISITIONS.json` and counted only when the local bytes hash-match:

- L2_ORDINANCE: 3 sources (Tokyo full ordinance 2026-07-01, Osaka City
  amendment 2026-03-31, Kanagawa Prefecture amendment 2026-05-18) out of
  1,788 declared municipalities — the rest remain backlog.
- L3_TREATY: MOF Japan–US income-tax treaty consolidated text (1).
- L4_CIRCULAR: NTA 2026-06-30 income-tax basic circular amendment (1).
- L5_CASELAW: Supreme Court 1962-02-28 withholding constitutionality judgment (1).

Every entry is `PINNED_BYTES_ONLY`, `NOT_MODELLED` and `LEGAL_REVIEW_PENDING`;
none is folded into the L0 statutory ledger. Nine source-layer tests pass.
L3 now has 2 treaty texts (US and Iceland); L2 has 3 municipal sources.

### Fifth iteration

Six more threshold/tier units (`InheritanceGiftRate4M6M`,
`LocalTax71_14UpTo500k`, `71_14Over3M`, `72_21UpTo100B`,
`72_21Band100B500B`, `LocalTax37Over2M`) were validated under the same axes
(build 1889 jobs, invariants 17/17, batch-233 review). CI run `45480158811`
on `82e0f430a1be7a2e222491755f1a66f7f8a2c0a2` completed `success`;
`data/PROOF_ATTESTATION_SCOPED_T5.json` binds 18 module hashes from committed
blobs at that commit to that run.

```
before: FULLY_VERIFIED=751  NOT_STARTED=396098  evidence=754
after:  FULLY_VERIFIED=764  NOT_STARTED=396085  evidence=767
delta:  FULLY_VERIFIED=+13 NOT_STARTED=-13  evidence=+13
progress_ledger: COUNTED; NOT_STARTED delta -13; new modules 18
```

All six target units carry `kernel_proof`; the wider +13 includes previously
stale units recovered by the same honest regeneration. Scoped-clause-only
status and `LEGAL_REVIEW_PENDING` are unchanged.

### Sixth iteration

Six 地方税法 art.34 threshold units (`LocalTax34DisasterExpense50k`,
`NewLifeInsurance56k`, `OldLifeInsurance70k`, `IncomeUpTo9M`,
`SpouseBand1M13M`, `SpouseOver13M`) were validated (build 1907 jobs,
invariants 17/17, batch-239 review). CI run `45490047094` on
`745b4fa34d1ddc75d88c12ce7ccdcc07d5985d05` completed `success`;
`data/PROOF_ATTESTATION_SCOPED_T6.json` binds 18 module hashes from committed
blobs at that commit to that run.

```
before: FULLY_VERIFIED=764  NOT_STARTED=396085  evidence=767
after:  FULLY_VERIFIED=786  NOT_STARTED=396063  evidence=789
delta:  FULLY_VERIFIED=+22 NOT_STARTED=-22  evidence=+22
progress_ledger: COUNTED; NOT_STARTED delta -22; new modules 18
```

The wider +22 includes previously stale units recovered by the honest
regeneration; all six target units carry `kernel_proof`. L4 now has 2 pinned
circulars. Scoped-clause-only status and `LEGAL_REVIEW_PENDING` are unchanged.

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
