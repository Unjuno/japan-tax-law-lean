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
- Exercised on the live queue: `coordinator.py cycle 6 --write` produced 18
  durable claims (6 dependency-ready units × 3 distinct roles
  FORMALIZER/PROVER/INDEPENDENT_REVIEWER) in `data/COORDINATOR_CLAIMS.json`.
  A subsequent SELECT returned 6 different units with zero overlap with the
  claimed set, and status was not changed by the coordinator. Claims record
  assignment only; they are not proof, formalization or legal review.

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

### Seventh iteration

Six more 地方税法 art.34 units (`LocalTax34OldLife15k40k`,
`Income950M1000M`, `SpouseUpTo1M`, `Age16Plus`, `IncomeUpTo24M`,
`RelativeOver1_2M`) were validated (build 1925 jobs, invariants 17/17,
batch-241 review), including the inclusive-以上 boundary correction.
CI run `45499831068` on `25050ce84bce8206026e1e5abcb43fe557cbaece` completed
`success`; `data/PROOF_ATTESTATION_SCOPED_T7.json` binds 18 module hashes from
committed blobs at that commit to that run.

```
before: FULLY_VERIFIED=786  NOT_STARTED=396063  evidence=789
after:  FULLY_VERIFIED=799  NOT_STARTED=396050  evidence=802
delta:  FULLY_VERIFIED=+13 NOT_STARTED=-13  evidence=+13
progress_ledger: COUNTED; NOT_STARTED delta -13; new modules 18
```

All six target units carry `kernel_proof`. L5 now has 2 hash-pinned judgments;
all 9 pinned auxiliary sources re-verified byte-for-byte. Scoped-clause-only
and `LEGAL_REVIEW_PENDING` status is unchanged.

### Eighth iteration (EXCEPTION kind)

Four EXCEPTION units (`RegTax41_19_3IncomeOver10M`,
`RegTax41_19_3IndividualIncomeOver10M`, `Customs123PeriodCeiling60Days`,
`LocalTax15PeriodCeiling2Years`) were validated (build 1938 jobs, invariants
17/17, batch-243 review). A drafted 1-year ceiling was withdrawn before
attestation because a literal of 1 registers only two boundary categories;
the gate was not weakened. CI run `45633511544` on
`5b58bebbb39f732c1f643f98a92365081a1b64c6` completed `success`;
`data/PROOF_ATTESTATION_SCOPED_T8.json` binds 12 module hashes from committed
blobs at that commit to that run.

```
before: FULLY_VERIFIED=799  NOT_STARTED=396050  evidence=802
after:  FULLY_VERIFIED=811  NOT_STARTED=396038  evidence=814
delta:  FULLY_VERIFIED=+12 NOT_STARTED=-12  evidence=+12
progress_ledger: COUNTED; NOT_STARTED delta -12; new modules 12
```

All four target units carry `kernel_proof`. L2 now has 4 pinned municipal
ordinances (Tokyo, Osaka, Kanagawa, Yokohama). Scoped-clause-only and
`LEGAL_REVIEW_PENDING` status is unchanged.

### Ninth iteration (delegated formalization)

A separate High4 formalization agent produced five units
(`LocalTax154DisplacementOver6L`, `PassengersUpTo30`, `Population200k`,
`CommitteeMin3`, `FourWheelUp`) with independent specs, kernel boundary tests,
scoped needles and batch-245 review. Its temporary validation attestation was
removed before integration; build 1953 jobs, 605 transcription checks,
invariants 17/17. The first CI attempt failed only on stale-derived-ledger
gates; those ledgers were regenerated. CI run `45655699335` on
`e65446cdb6aa6096c00053808c5097ba9becf118` completed `success`;
`data/PROOF_ATTESTATION_SCOPED_T9.json` binds 15 module hashes from committed
blobs at that commit to that run.

```
before: FULLY_VERIFIED=811  NOT_STARTED=396038  evidence=814
after:  FULLY_VERIFIED=839  NOT_STARTED=396010  evidence=842
delta:  FULLY_VERIFIED=+28 NOT_STARTED=-28  evidence=+28
progress_ledger: COUNTED; NOT_STARTED delta -28
```

All five target units carry `kernel_proof`; the wider +28 includes previously
stale units recovered by honest regeneration. Legal review stays pending.

### Tenth iteration (second delegated batch)

A second delegated formalization agent produced five units
(`LocalTax72_24_7UpTo4M`, `72_25Over3Months`, `144_21TwoOrMore`,
`20_5_2OverTwoMonths`, `311TwoOrMore`) with independent specs, kernel boundary
tests, scoped needles and batch-247 review; its temporary attestation was
removed before integration. Build 1968 jobs, 610 transcription checks,
invariants 17/17. The first CI attempt failed only on stale L7 ledger drift;
that ledger was regenerated. CI run `45681067772` on
`45aa93a7b74a0397a9f1de48cc597c9541421c78` completed `success`;
`data/PROOF_ATTESTATION_SCOPED_T10.json` binds 15 module hashes from committed
blobs at that commit to that run.

```
before: FULLY_VERIFIED=839  NOT_STARTED=396010  evidence=842
after:  FULLY_VERIFIED=860  NOT_STARTED=395989  evidence=863
delta:  FULLY_VERIFIED=+21 NOT_STARTED=-21  evidence=+21
progress_ledger: COUNTED; NOT_STARTED delta -21; new modules 15
```

All five target units carry `kernel_proof`. The WSL Plan-9 mount made the
~880 MB queue write unusually slow (an environment constraint, not a logic
failure); no duplicate generator was started. Legal review stays pending.

### Eleventh and twelfth iterations (delegated batches 249 and 251)

Two more delegated agents produced five units each (249: `InheritanceTaxArt21_11_2TwoGiftors`, `LocalTax72_2_2ThreePrefectures`, `72_54TwoPrefectures`, `154LoadUpTo8Tons`, `72_26FiscalYearOver6Months`; 251: `InheritanceTax68PenaltyTo10Years`, `LocalTax154LoadOver8Tons`, `314_2PensionOver7Man`, `321_13TwoMunicipalities`, `72_38_2DeferralCeiling6Years`). Both attested from committed blobs to green runs `45750869176` (`07b6ae05`, T11) and `45758973561` (`1c7daa0c`, T12). Builds 1983/1998 jobs, transcription 615/620, invariants 17/17, temp attestations removed.

```
before: FULLY_VERIFIED=860  NOT_STARTED=396010  evidence=863
after:  FULLY_VERIFIED=921  NOT_STARTED=395928  evidence=924
delta:  FULLY_VERIFIED=+61 NOT_STARTED=-61  evidence=+61
progress_ledger: COUNTED; NOT_STARTED delta -61; new modules 30
```

The +61 includes both batches' units plus previously stale entries recovered
by honest regeneration. All ten target ids carry `kernel_proof`. Legal review
stays `LEGAL_REVIEW_PENDING`.

### Thirteenth iteration (batch 253)

A third delegated agent produced five units (`LocalTax57TwoPrefecturesResidentsTax`,
`34TenYearsInsurancePayments`, `72_25Over4Months`,
`321_14TwoMunicipalitiesEmployeeCount`, `58TwoPrefecturesEmployeeCount`) with
independent specs, kernel tests, scoped needles and batch-253 review; build
2013 jobs, transcription 625, invariants 17/17, temp attestation removed.
CI run `45769932933` on `b14d718507c83b962712e6f47ab6038f874de8ed` completed
`success`; `data/PROOF_ATTESTATION_SCOPED_T13.json` binds 15 module hashes from
committed blobs at that commit to that run.

```
before: FULLY_VERIFIED=921  NOT_STARTED=395928  evidence=924
after:  FULLY_VERIFIED=960  NOT_STARTED=395889  evidence=963
delta:  FULLY_VERIFIED=+39 NOT_STARTED=-39  evidence=+39
progress_ledger: COUNTED; NOT_STARTED delta -39; new modules 15
```

All five target ids carry `kernel_proof`. Legal review stays pending.

### Fourteenth iteration (batch 255)

A fourth delegated agent produced five units (`LocalTax53TwoPrefecturesNotice`,
`72_48TwoAllocationBases`, `72_49_16TwoPrefecturesApproval`,
`321_4TwoSpecialCollectors`, `389TwoMunicipalitiesMovable`) with independent
specs, kernel tests, scoped needles and batch-255 review; build 2028 jobs,
transcription 630, invariants 17/17, temp attestation removed. GitHub API rate
limit (HTTP 403) temporarily blocked CI monitoring; after reset both runs for
`8933814749423ec5eec773705c39662338e5e19d` reported `success`.
`data/PROOF_ATTESTATION_SCOPED_T14.json` binds 15 module hashes from committed
blobs at that commit to run `45810595166`.

```
before: FULLY_VERIFIED=960  NOT_STARTED=395889  evidence=963
after:  FULLY_VERIFIED=1049 NOT_STARTED=395800  evidence=1052
delta:  FULLY_VERIFIED=+89 NOT_STARTED=-89  evidence=+89
progress_ledger: COUNTED; NOT_STARTED delta -89; new modules 15
```

All five target ids carry `kernel_proof`; the wider +89 includes previously
stale entries recovered by honest regeneration. Legal review stays pending.

### Fifteenth iteration (batch 257)

A fifth delegated agent produced five units (`LocalTax72_48_2TwoPrefecturesCorrection`,
`72_78PrincipalOfficeLocation`, `314_6IncomeOver2M`, `24_5IncomeOver1_35M`,
`314_2NewAnnuityOver56k`) with independent specs, kernel tests, scoped needles
and batch-257 review; build 2043 jobs, transcription 635, invariants 17/17.
`data/PROOF_ATTESTATION_SCOPED_T15.json` binds 15 module hashes from committed
blobs at `0d9dc909e20c691ef8c5372ebaab1285ebbf6616` to green run
`45825347686`. The attestation was first bound with `scope=lean_job_only`
while the semantic-audit job was still running, then upgraded to `full_run`
when that run completed `success`; no full-run success was claimed early.

The evidence generator was corrected in this iteration: `kernel_proof` strings
now cite the attestation that actually supplied each module hash, instead of
always citing the older main-attestation run.

```
before: FULLY_VERIFIED=1049 NOT_STARTED=395800 evidence=1052
after:  FULLY_VERIFIED=1074 NOT_STARTED=395775 evidence=1077
delta:  FULLY_VERIFIED=+25 NOT_STARTED=-25  evidence=+25
progress_ledger: COUNTED; NOT_STARTED delta -25; new modules 15
```

All five target ids carry `kernel_proof`. Legal review stays pending.

### Sixteenth iteration (batch 259)

A sixth delegated agent produced five units (`LocalTax28TwoAdjustmentParts`,
`51StandardRateCeiling2`, `7_2IncomeOver9M`, `72_24_7IncomeOver8M`,
`9_2Band4MTo1B`) with independent specs, kernel tests, scoped needles and
batch-259 review; build 2058 jobs, transcription 640, invariants 17/17.
CI run `45837967771` on `ceb1342edf1b4602a9d735066976dfcd084a91ae` completed
`success`; `data/PROOF_ATTESTATION_SCOPED_T16.json` binds 15 module hashes from
committed blobs at that commit to that run.

Three of the five units initially failed the evidence gate. Diagnosis and
repair (without weakening any gate):

- `spec_literals` was reading `h.1` / `h.2` theorem-proof field projections as
  statutory numerals; it now stops at the first `theorem ` / `example` marker.
- A single-literal spec for a 「百分のN」 ceiling (`amount ≤ 2`) did not satisfy
  the rate-ratio matcher; it is now accepted only when `N/100` is exactly the
  clause rate and the kanji spelling occurs verbatim in that clause.
- `scoped_article_text` returned the first article with a given `Num`, missing
  supplementary provisions; it now selects the same-`Num` occurrence carrying
  the pinned needle, so the unit text is checked in the corresponding article
  instance rather than an arbitrary same-numbered article.

```
before: FULLY_VERIFIED=1074 NOT_STARTED=395775 evidence=1077
after:  FULLY_VERIFIED=1142 NOT_STARTED=395707 evidence=1145
delta:  FULLY_VERIFIED=+68 NOT_STARTED=-68  evidence=+68
progress_ledger: COUNTED; NOT_STARTED delta -68; new modules 15
```

All five target ids carry `kernel_proof` citing the correct run; the wider +68
includes previously stale entries recovered by honest re-scoping. Legal review
stays pending.

### Seventeenth iteration (batch 261)

A seventh delegated agent produced five units (`LocalTax4PrefecturalIncomeOver30M`,
`7NoticeCountOver5`, `72_55TwoPrefectureIndividual`, `InheritanceTaxPenaltyOver5M`,
`321_11_2DeferralWithin3Months`) with independent specs, kernel tests, scoped
needles and batch-261 review; build 2073 jobs, transcription 645, invariants
17/17. CI run `45852570195` on `bb64a6cdaea2db01f6c0e7948bf438f495892312`
completed `success`; `data/PROOF_ATTESTATION_SCOPED_T17.json` binds 15 module
hashes from committed blobs at that commit to that run.

Two units initially failed because their transcription names used kanji article
labels with paragraph annotations (`第四条(4)`, `第七条(6)3`). The article
parser now strips the parenthetical and the 第/条 decorations before kanji
conversion; both clauses then passed scoped correspondence.

```
before: FULLY_VERIFIED=1142 NOT_STARTED=395707 evidence=1145
after:  FULLY_VERIFIED=1162 NOT_STARTED=395687 evidence=1165
delta:  FULLY_VERIFIED=+20 NOT_STARTED=-20  evidence=+20
progress_ledger: COUNTED; NOT_STARTED delta -10 (snapshot offset); new modules 15
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

### Eighteenth iteration (batch 263)

An eighth delegated agent produced five units (`LocalTax71_16UnpaidOver2M`,
`4MunicipalIncomeOver30M`, `144_33FineCeiling7M`, `13LightOilOver30k`,
`62EvadedOver5M`) with independent specs, kernel tests, scoped needles and
batch-263 review; build 2088 jobs, transcription 650, invariants 17/17.
CI run `45863799970` on `00fd74ca907952848f9e5e5d92af008dbed995d6` completed
`success`; `data/PROOF_ATTESTATION_SCOPED_T18.json` binds 15 module hashes from
committed blobs at that commit to that run. All five units were pre-validated
against the generator's clause/scoping gates before the evidence run.

```
before: FULLY_VERIFIED=1162 NOT_STARTED=395687 evidence=1165
after:  FULLY_VERIFIED=1168 NOT_STARTED=395681 evidence=1171
delta:  FULLY_VERIFIED=+6 NOT_STARTED=-6  evidence=+6
progress_ledger: COUNTED; NOT_STARTED delta -16; new modules 15
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

### Nineteenth iteration (batch 265)

A ninth delegated agent produced five units (`LocalTax9_2IncomeOver4M`,
`314_2DisasterExpenseCeiling50k`, `InheritanceTax3RetirementAllowanceWithin3Years`,
`144_9OpinionWithin2Months`, `72_24_5TwoPrefectures`) with independent specs,
kernel tests, scoped needles and batch-265 review; build 2103 jobs,
transcription 655, invariants 17/17. CI run `45870345768` on
`b624ed2136863e4d741fec847c8e87a2258ba5af` completed `success`;
`data/PROOF_ATTESTATION_SCOPED_T19.json` binds 15 module hashes from committed
blobs at that commit to that run.

The initially selected 相続税法 art. 49 unit was UNRESOLVED with an unhandled
condition and was replaced before commitment by an art. 3(1) 三年以内 unit that
passed mandatory generator-gate pre-validation (verifiable kind, no unhandled
conditions, clause correspondence, scoped anchoring, coverage exact/unique,
source path). No same-numeral-only match was accepted.

```
before: FULLY_VERIFIED=1168 NOT_STARTED=395681 evidence=1171
after:  FULLY_VERIFIED=1184 NOT_STARTED=395665 evidence=1187
delta:  FULLY_VERIFIED=+16 NOT_STARTED=-16  evidence=+16
progress_ledger: COUNTED; NOT_STARTED delta -16; new modules 15
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

### Twentieth iteration (batch 267)

A tenth delegated agent produced five units (`LocalTax768CommitteeTermWithin3Years`,
`314_2DisasterExpenseOver50kDeduction`, `20_9_3CorrectionWithin2Months`,
`72_50CorrectionRequestWithin3Months`, `63TwoPrefecturesNotification`) with
independent specs, kernel tests, scoped needles and batch-267 review; build
2118 jobs, transcription 660, invariants 17/17. CI run `45877876173` on
`aff7b55fd4de8a7594b8521ad2865c955e150e28` completed `success`;
`data/PROOF_ATTESTATION_SCOPED_T20.json` binds 15 module hashes from committed
blobs at that commit to that run. Each id passed mandatory generator-gate
pre-validation before commitment; a two-numeral pick was replaced by a
single-numeral unit.

```
before: FULLY_VERIFIED=1184 NOT_STARTED=395665 evidence=1187
after:  FULLY_VERIFIED=1196 NOT_STARTED=395653 evidence=1199
delta:  FULLY_VERIFIED=+12 NOT_STARTED=-12  evidence=+12
progress_ledger: COUNTED; NOT_STARTED delta -12; new modules 15
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

### Twenty-first iteration (batch 269)

An eleventh delegated agent produced five units (`LocalTax774DirectorTermWithin3Years`,
`15ThreeWheelsOrMoreEnvironmentLevy`, `20_9_3UnavoidableReasonWithin2Months`,
`73_27_4DeferralWithin2Years`, `702_4UrbanPlanningTaxRateCeiling`) with
independent specs, kernel tests, scoped needles and batch-269 review; build
2133 jobs, transcription 665, invariants 17/17. CI run `45882959830` on
`3b43b872ee0074208d91e4631963bd4d51b11dac` completed `success`;
`data/PROOF_ATTESTATION_SCOPED_T21.json` binds 15 module hashes from committed
blobs at that commit to that run. Every id passed mandatory generator-gate
pre-validation, including a 3/1000 rate ceiling.

```
before: FULLY_VERIFIED=1196 NOT_STARTED=395653 evidence=1199
after:  FULLY_VERIFIED=1203 NOT_STARTED=395646 evidence=1206
delta:  FULLY_VERIFIED=+7 NOT_STARTED=-7  evidence=+7
progress_ledger: COUNTED; NOT_STARTED delta -7; new modules 15
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

### Twenty-second iteration (batch 271)

A twelfth delegated agent produced five units (`LocalTax37_2DesignationBanWithin3Years`,
`59DecisionWithin30Days`, `72_54DecisionWithin60Days`, `73_34DemandWithin20Days`,
`701_31Population300kPlus`) with independent specs, kernel tests, scoped needles
and batch-271 review; build 2148 jobs, transcription 670, invariants 17/17.
Every id passed mandatory generator-gate pre-validation (verifiable kind, no
unhandled conditions, clause correspondence, scoped anchoring, coverage
exact/unique, source path).

The first CI run on `9a0293f8` failed three generated-ledger regeneration gates
because the batch-271 commit added 15 modules without refreshing LAW_STATUS,
COVERAGE and L7. Those ledgers were regenerated (`5606eb87`) and CI was re-run;
run `45893480411` on `5606eb8710c32522bee58d0e4208e70384c17fcd` completed
`success`. `data/PROOF_ATTESTATION_SCOPED_T22.json` binds 15 module hashes from
committed blobs at that commit to that green run — no attestation was bound to
the failed run.

```
before: FULLY_VERIFIED=1203 NOT_STARTED=395646 evidence=1206
after:  FULLY_VERIFIED=1214 NOT_STARTED=395635 evidence=1217
delta:  FULLY_VERIFIED=+11 NOT_STARTED=-11  evidence=+11
progress_ledger: COUNTED; NOT_STARTED delta -11; new modules 15
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

### Twenty-third iteration (batch 273)

A thirteenth delegated agent produced five units (`InheritanceTax39CorrectionWithin20Days`,
`LocalTax453FalseReportFine300k`, `144_35LightOilReportWithin30Days`,
`21LightOilTaxOver30000`, `63CovidRevenueCeiling70Percent`) with independent
specs, kernel tests, scoped needles and batch-273 review; build 2163 jobs,
transcription 675, invariants 17/17. Every id passed mandatory generator-gate
pre-validation and verbatim article+paragraph source scoping. Ledgers were
refreshed in the module commit, so the first CI attempt did not fail on drift.

Both CI runs on `6307d22c2e969fa1cd734169a7ae4c01c8cb845f` were queued for over
an hour behind other workstreams; run `45908400197` eventually completed
`success`. `data/PROOF_ATTESTATION_SCOPED_T23.json` binds 15 module hashes from
committed blobs at that commit to that green run.

```
before: FULLY_VERIFIED=1214 NOT_STARTED=395635 evidence=1217
after:  FULLY_VERIFIED=1228 NOT_STARTED=395621 evidence=1231
delta:  FULLY_VERIFIED=+14 NOT_STARTED=-14  evidence=+14
progress_ledger: COUNTED; NOT_STARTED delta -14; new modules 30
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

### Twenty-fourth iteration (batch 275)

A fourteenth delegated agent produced five units (`InheritanceTax49DisclosureWithin2Months`,
`68PenaltyOver10M`, `LocalTax166DemandWithin20Days`, `321_15DecisionWithin30Days`,
`382RegistryNoticeWithin10Days`) with independent specs, kernel tests, scoped
needles and batch-275 review; build 2178 jobs, transcription 680, invariants
17/17. All ids passed mandatory generator-gate pre-validation and verbatim
article+paragraph scoping. CI run `45911888111` on
`8a475ed313adbcbbd6dc475377f7441587fb7ca4` completed `success`;
`data/PROOF_ATTESTATION_SCOPED_T24.json` binds 15 module hashes from committed
blobs at that commit to that run.

```
before: FULLY_VERIFIED=1228 NOT_STARTED=395621 evidence=1231
after:  FULLY_VERIFIED=1241 NOT_STARTED=395608 evidence=1244
delta:  FULLY_VERIFIED=+13 NOT_STARTED=-13  evidence=+13
progress_ledger: COUNTED; NOT_STARTED delta -13; new modules 0
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

### Twenty-fifth iteration (batch 277)

A fifteenth delegated agent produced five units (`InheritanceTax42PaymentDecisionWithin3Months`,
`46ApprovalWithin3Months`, `LocalTax8DecisionWithin60Days`,
`37_2ReturnCostCeiling30Percent`, `62PenaltyOver10M`) with independent specs,
kernel tests, scoped needles and batch-277 review; build 2193 jobs,
transcription 685, invariants 17/17. Every id passed mandatory generator-gate
pre-validation, including a 30/100 rate ceiling. After a temporary GitHub API
rate limit (HTTP 403) blocked CI dispatch, run `45919753626` on
`9dcaa9198d4648d8c6e94206b0a100b2ed0560ed` completed `success`;
`data/PROOF_ATTESTATION_SCOPED_T25.json` binds 15 module hashes from committed
blobs at that commit to that green run.

```
before: FULLY_VERIFIED=1241 NOT_STARTED=395608 evidence=1244
after:  FULLY_VERIFIED=1274 NOT_STARTED=395575 evidence=1277
delta:  FULLY_VERIFIED=+33 NOT_STARTED=-33  evidence=+33
progress_ledger: COUNTED; NOT_STARTED delta -33; new modules 15
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

### Twenty-sixth iteration (batch 279)

A sixteenth delegated agent produced five units (`InheritanceTax1_3DoneeNoResidenceWithin10Years`,
`LocalTax24_3BeneficiariesTwoOrMoreDelegation`, `72_21SubsidiaryOver50Percent`,
`15_8CancellationWithin3Years`, `292SpouseIncomeUpTo10M`) with independent
specs, kernel tests, scoped needles and batch-279 review; build 2208 jobs,
transcription 690, invariants 17/17. All ids passed mandatory generator-gate
pre-validation with verbatim scoped article+paragraph needles; several failing
candidates were replaced before commitment. CI run `45924527495` on
`d918fe1ee4680efba5fbde7c22bfadd3dd322bc9` completed `success`;
`data/PROOF_ATTESTATION_SCOPED_T26.json` binds 15 module hashes from committed
blobs at that commit to that green run.

```
before: FULLY_VERIFIED=1274 NOT_STARTED=395575 evidence=1277
after:  FULLY_VERIFIED=1294 NOT_STARTED=395555 evidence=1297
delta:  FULLY_VERIFIED=+20 NOT_STARTED=-20  evidence=+20
progress_ledger: COUNTED; NOT_STARTED delta -20; new modules 15
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

### Twenty-seventh iteration (batch 281)

A seventeenth delegated agent produced five units (`InheritanceTax10DebtorsTwoOrMoreDelegation`,
`LocalTax72_38_2ExtensionWithin3Years`, `72_113PaymentWithin30Days`,
`23DependentsTwoOrMoreDeeming`, `144_16CertificateReturnWithin10Days`) with
independent specs, kernel tests, scoped needles and batch-281 review; build
2223 jobs, transcription 695, invariants 17/17. All ids passed mandatory
generator-gate pre-validation with verbatim scoped article+paragraph needles;
failing candidates were replaced. Ledgers were refreshed in the module commit.
CI run `45931006347` on `6935ba7353e51e128ac656526d3cc2c5a9a51810` completed
`success`; `data/PROOF_ATTESTATION_SCOPED_T27.json` binds 15 module hashes from
committed blobs at that commit to that green run.

```
before: FULLY_VERIFIED=1294 NOT_STARTED=395555 evidence=1297
after:  FULLY_VERIFIED=1327 NOT_STARTED=395522 evidence=1330
delta:  FULLY_VERIFIED=+33 NOT_STARTED=-33  evidence=+33
progress_ledger: COUNTED; NOT_STARTED delta -33; new modules 15
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

### Twenty-eighth iteration (batch 283)

An eighteenth delegated agent produced five units (`InheritanceTax1_4TenYearLookbackReference`,
`LocalTax73_18ReportWithin10Days`, `404TwoMunicipalitiesJointAppointment`,
`349_5TwoLargeAssetsMerger`, `321_7_4TwoAnnuityPaymentsDelegation`) with
independent specs, kernel tests, scoped needles and batch-283 review; build
2238 jobs, transcription 700, invariants 17/17. All ids passed mandatory
generator-gate pre-validation; numeral-only and non-verbatim candidates were
rejected. Ledgers were refreshed in the module commit. CI run `45937271027` on
`542a507d619f99da051e7cda1f7c77cfbd8fefd4` completed `success`;
`data/PROOF_ATTESTATION_SCOPED_T28.json` binds 15 module hashes from committed
blobs at that commit to that green run.

```
before: FULLY_VERIFIED=1327 NOT_STARTED=395522 evidence=1330
after:  FULLY_VERIFIED=1346 NOT_STARTED=395503 evidence=1349
delta:  FULLY_VERIFIED=+19 NOT_STARTED=-19  evidence=+19
progress_ledger: COUNTED; NOT_STARTED delta -19; new modules 15
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

### Twenty-ninth iteration (batch 285)

A nineteenth delegated agent produced five units (`LocalTax17_4TwoOrMoreInstallmentsDeeming`,
`73_24TwoYearNewHouseCondition`, `144_30NotificationWithin60Days`,
`292TwoResidentTaxpayersDeeming`, `433DecisionWithin30Days`) with independent
specs, kernel tests, scoped needles and batch-285 review; build 2253 jobs,
transcription 705, invariants 17/17. All ids passed mandatory generator-gate
pre-validation; ten 相続税法施行日 candidates were rejected for failing the
verbatim scoped-article check or being numeral traps, per the REPLACE rule.
CI run `45943050228` on `b2437a96805e191f56d6a876221f850e9af494d2` completed
`success`; `data/PROOF_ATTESTATION_SCOPED_T29.json` binds 15 module hashes from
committed blobs at that commit to that green run.

```
before: FULLY_VERIFIED=1346 NOT_STARTED=395503 evidence=1349
after:  FULLY_VERIFIED=1380 NOT_STARTED=395469 evidence=1383
delta:  FULLY_VERIFIED=+34 NOT_STARTED=-34  evidence=+34
progress_ledger: COUNTED; NOT_STARTED delta -34; new modules 15
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

### Thirtieth iteration (batch 287)

A twentieth delegated agent produced five units (`LocalTax72_80_2TwoTrusteesDeeming`,
`72_40DecisionWithinThreeMonths`, `73_30EvadedTaxAboveOneMillion`,
`703_4EighteenPlusInsuredAmount`, `72_66DemandNoticeWithin20Days`) with
independent specs, kernel tests, scoped needles and batch-287 review; build
2268 jobs, transcription 710, invariants 17/17. All ids passed mandatory
generator-gate pre-validation with verbatim scoped article+paragraph needles;
no numeral-only or UNRESOLVED units were accepted. Ledgers were refreshed in
the module commit. CI run `45947814229` on
`eb5602c68b6d0f5edc67fbb47bb54ecab6d50a49` completed `success`;
`data/PROOF_ATTESTATION_SCOPED_T30.json` binds 15 module hashes from committed
blobs at that commit to that green run.

```
before: FULLY_VERIFIED=1380 NOT_STARTED=395469 evidence=1383
after:  FULLY_VERIFIED=1400 NOT_STARTED=395449 evidence=1403
delta:  FULLY_VERIFIED=+20 NOT_STARTED=-20  evidence=+20
progress_ledger: COUNTED; NOT_STARTED delta -20; new modules 15
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

### Thirty-first iteration (batch 289)

A twenty-first delegated agent produced five units (`LocalTax314_2IncomeCeiling25M`,
`718_2TwoAnnuityBenefits`, `328_16EvadedAboveTwoMillion`,
`198DemandWithin20Days`, `72_2CapitalCeiling100M`) with independent specs,
kernel tests, scoped needles and batch-289 review; build 2283 jobs,
transcription 715, invariants 17/17. All ids passed mandatory generator-gate
pre-validation with verbatim scoped article+paragraph needles; 相続税法
candidates were rejected for non-threshold numerals. CI run `45953412623` on
`3b789f3015283611c901a68234620e8f4ade5286` completed `success`;
`data/PROOF_ATTESTATION_SCOPED_T31.json` binds 15 module hashes from committed
blobs at that commit to that green run.

```
before: FULLY_VERIFIED=1400 NOT_STARTED=395449 evidence=1403
after:  FULLY_VERIFIED=1409 NOT_STARTED=395440 evidence=1412
delta:  FULLY_VERIFIED=+9 NOT_STARTED=-9  evidence=+9
progress_ledger: COUNTED; NOT_STARTED delta -9; new modules 15
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

### Thirty-second iteration (batch 291)

A twenty-second delegated agent produced five units (`LocalTax455FineCeiling1M`,
`74_15EvadedAbove1M`, `703_5AdultEqualCharge18`, `400RegisterWithin10Days`,
`371DemandWithin20Days`) with independent specs, kernel tests, scoped needles
and batch-291 review; build 2298 jobs, transcription 720, invariants 17/17.
All ids passed mandatory generator-gate pre-validation with verbatim scoped
article+paragraph needles; numeral-only 相続税法 candidates were rejected.
CI run `45959360537` on `3f869a0dd8c68dcfae82eb5a0abc3df799f6fb03` completed
`success`; `data/PROOF_ATTESTATION_SCOPED_T32.json` binds 15 module hashes from
committed blobs at that commit to that green run.

```
before: FULLY_VERIFIED=1409 NOT_STARTED=395440 evidence=1412
after:  FULLY_VERIFIED=1419 NOT_STARTED=395430 evidence=1422
delta:  FULLY_VERIFIED=+10 NOT_STARTED=-10  evidence=+10
progress_ledger: COUNTED; NOT_STARTED delta -10; new modules 15
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

### Thirty-third iteration (batch 293)

A twenty-third delegated agent produced five units (`LocalTax433ReviewNoticeWithin10Days`,
`700_61HuntingFineCeiling1M`, `604EvadedAbove1M`, `92DemandWithin20Days`,
`328_8SeparationFineCeiling100k`) with independent specs, kernel tests, scoped
needles and batch-293 review; build 2313 jobs, transcription 725, invariants
17/17. All ids passed mandatory generator-gate pre-validation with verbatim
scoped article+paragraph needles; numeral-only and literal-1 candidates were
rejected, and one unresolvable supplementary-provision unit was replaced.
CI run `45966925531` on `ee0725404b0b4ff3e1b45a2f537ab946853adba2` completed
`success`; `data/PROOF_ATTESTATION_SCOPED_T33.json` binds 15 module hashes from
committed blobs at that commit to that green run.

```
before: FULLY_VERIFIED=1419 NOT_STARTED=395430 evidence=1422
after:  FULLY_VERIFIED=1425 NOT_STARTED=395424 evidence=1428
delta:  FULLY_VERIFIED=+6 NOT_STARTED=-6  evidence=+6
progress_ledger: COUNTED; NOT_STARTED delta -6; new modules 15
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

### Thirty-fourth iteration (batch 295)

A twenty-fourth delegated agent produced five units (`LocalTax27PenaltyFineCeiling500k`,
`73_30EvadedAbove500k`, `86UnpaidAbove1M`, `522_2MiningFilingFineCeiling100k`,
`700_64HuntingDemandWithin20Days`) with independent specs, kernel tests, scoped
needles and batch-295 review; build 2328 jobs, transcription 730, invariants
17/17. All ids passed mandatory generator-gate pre-validation with verbatim
scoped article+paragraph needles; supplementary-provision and numeral-only
candidates were replaced. CI run `45974823839` on
`ca5f35af52f5a3a80c37112da65d948416c661e4` completed `success`;
`data/PROOF_ATTESTATION_SCOPED_T34.json` binds 15 module hashes from committed
blobs at that commit to that green run.

```
before: FULLY_VERIFIED=1425 NOT_STARTED=395424 evidence=1428
after:  FULLY_VERIFIED=1432 NOT_STARTED=395417 evidence=1435
delta:  FULLY_VERIFIED=+7 NOT_STARTED=-7  evidence=+7
progress_ledger: COUNTED; NOT_STARTED delta -7; new modules 15
```

All five target ids carry `kernel_proof` citing the correct run. Legal review
stays pending.

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
