# Resumable state — cycle-114 (2026-11-24)

This is a **status/resume record**, not a completion claim. The final target —
tracking formal specifications, kernel proofs and counterexample checks for every
normative content of the Japanese tax system — remains unmet.

## 1. Three independent states (do not merge)

| axis | state | evidence |
|---|---|---|
| 技術的検証済み | 8 C114 norm units (5 batch 1 + 3 batch 2), all kernel-attested | pinned raw snapshots, independent specs, kernel-attested impl/tests, H/T/D/C/U reviews |
| 形式化未完了 | ~396,000 of 396,854 norm units NOT_STARTED | `docs/TASK_QUEUE.md`, `docs/PROGRESS_DELTA.md` |
| 法的レビュー未完了 | **all** units `LEGAL_REVIEW_PENDING`; 0 human legal reviews recorded | `data/task_state.json`, `docs/COMPLETION_STATUS.md` |

No approval or legal-review record was fabricated. Human review is a condition for
legal finality, **not** a precondition for Lean formalization work.

## 2. What was added in cycle-114

Five bounded L4 models, each with an independent spec, kernel-decided boundary
tests, a clause-level transcription pin and an independent H/T/D/C/U review:

| module | law / revision | norm cell | scoped rule |
|---|---|---|---|
| `LocalGrantTaxShares` | 325AC0000000211 / ..._20261102_508AC0000000062 | art.6の2 §2, §3 | 普通交付税 94/100, 特別交付税 6/100 |
| `StandingTimberDeferredRate30` | 325CO0000000071 / ..._20260401_506CO0000000143 | art.28 §1 | 立木延納割合 30/100 |
| `WidowDependentIncomeCeiling5M` | 325AC0000000226 / ..._20261101_508AC0000000002 | art.23 第11号イ(2), 第12号ロ | 五百万円以下 (inclusive) |
| `LocalInterestTaxRate5` | 325AC0000000226 / same | art.71の6 | 利子割 5/100 |
| `LocalStockTransferTaxRate5` | 325AC0000000226 / same | art.71の49 | 株式等譲渡所得割 5/100 |

Each module covers **only the computable rule named above**; exceptions,
definitions, computation of the base, rounding, procedures and other paragraphs
are recorded as NOT MODELLED in the module docstring and in `docs/UNIT_*.md`.
No article is claimed as fully formalized.

Verification evidence:
- `lake build JapanTaxLaw` — 1777 jobs, success.
- `python scripts/ci/transcription_audit.py` — 538/538 checks passed.
- `python scripts/ci/check_no_sorry.py` — no `sorry`/`admit`.
- `python -m unittest scripts.tests.test_evidence_reference_audit` — 4/4 OK.
- `python scripts/ci/verify_queue_invariants.py` — 16/16 after restoring
  umbrella imports dropped by concurrent reconciliations (guard NOT disabled).
- Scoped attestations from REST-verified green Lean jobs:
  - `data/PROOF_ATTESTATION_SCOPED_C114_{GRANTS,TIMBER,WIDOW}.json` —
    commit `c491ceff`, run `45388371727`, `scope=lean_job_only`.
  - `data/PROOF_ATTESTATION_SCOPED_C114_{INTEREST,STOCK}.json` —
    commit `28c7e2c3`, run `45394310840`, `scope=lean_job_only`.
  `scope=lean_job_only` is honest: those runs' semantic-audit jobs failed on
  stale derived ledgers after concurrent pushes; only the required Lean/axiom
  job was green and is claimed.

## 3. Measured queue movement (from generated ledgers)

- Evidence generator: merged 6 units (703 → 709), then 4 (709 → 713), then the
  final 3 batch-2 units (713 → 716); 8 C114 units are now evidenced.
- Queue regeneration: `FULLY_VERIFIED` 687 → 706 → **713**,
  `NOT_STARTED` 396,167 → 396,143 → **396,136** (final delta −7),
  `PROVED_SCOPE=3`, `BLOCKED=2`, total 396,854.
- Final gates: evidence references 3503/3507 resolved (4 pre-existing unresolved),
  `verify_queue_invariants.py` 16/16, `progress: COUNTED`.
- `docs/PROGRESS_DELTA.md`, `data/PROGRESS_HISTORY.json`, `docs/TASK_QUEUE.md`
  and `data/SPEC_SCOPE_MAP.json` carry the machine-generated deltas.

## 4. Target scope is not narrowed

`data/SOURCE_LAYERS.json` keeps L2 municipal ordinances, L3 treaties, L4
circulars, L5 case law and L6 historical revisions as separate, versioned,
`IN_SCOPE_*_BACKLOG` layers with `LEGAL_REVIEW_PENDING`. `UNSUPPORTED` is only an
implementation state, never a permanent exclusion. A backlog record is not
evidence of acquisition or proof.

## 5. What is NOT established

- The 8 C114 evidence entries cover 8 scoped rule cells, not whole articles.
- ~396,000 norm units remain unstarted; 2 are blocked on missing source pins.
- 0 human legal reviews; 3,438 L7 candidates unreviewed.
- Ordinances, treaties (beyond those already in the statutory snapshot),
  circulars and case law remain unacquired; 175k external references unbound.
- Finite-grid kernel tests do not prove universal semantic correctness.

## 5b. Cycle-115 and clause-correspondence tightening

Three more bounded modules were pushed at `dfee13cf`
(`LocalSeparateIncomeTaxRate4` art.50の4 = 4%, `LocalSeparateIncomeTaxRate6`
art.328の3 = 6%, `LocalCorporateDeductionLimitRate6` 施行令 art.48の13 = 6%).
REST confirmed the Lean/axiom job of run `45399969290` as `success`; three
`lean_job_only` scoped attestations were bound from committed blobs.

Clause auditing found a genuine §4 false positive: an incidental 「六」 inside
「第六十九条」/「第百四十一条」 satisfied the numeral check, crediting 6
unrelated clauses of art.48の13 to the 6% module. `source_literals_verified`
now rejects rate-shaped specs (small numerator + `/100`) when the cited clause
states neither 「百分」 nor 「千分」 (25/25 tests OK; false-positive clause
rejected, actual 「百分の六」 clause accepted). Regeneration removed 8
over-credited units: evidence 726 → 718. This is an honesty correction, not a
completion regression. The umbrella is now canonically generated by
`scripts/ci/generate_umbrella.py` and the stricter `umbrella imports canonical`
invariant is enforced; dropped imports and a dropped registered transcription
check were restored, never disabled. Transcription audit 561/561;
`verify_queue_invariants.py` **17/17**.

Final measured state: `FULLY_VERIFIED=717`, `NOT_STARTED=396,134`,
`PROVED_SCOPE=1`, `BLOCKED=2` (total 396,854); evidence 718 units;
human legal reviews 0, all `LEGAL_REVIEW_PENDING`. Resumable tip pushed:
`7b8c6aaa`. Only scoped rule cells are ever claimed, never whole articles.

## 5g. Cycle-120 (2026-11-25)

Two bounded modules pushed at `fff1f95d`:
`SpecialMeasuresOwnershipThreshold50` (租税特別措置法施行令 art.19の3) and
`LocalBusinessOwnershipThreshold50` (地方税法施行規則 art.3の13の3), both the
「百分の五十を超える」 strict `>50` predicate. Checks: 8/8 Lean builds,
transcription 584/584, invariants 17/17, no `sorry`. CI run `45473747773`
Lean/axiom job verified before scoped attestation binding. Legal review stays
`LEGAL_REVIEW_PENDING`.

## 5h. Cycle-121 (2026-11-25)

Two bounded modules pushed at `277b2c9b`:
`LocalBusinessTaxRate77PerMille` (地方税法施行令 art.35の4の7) and
`LocalBusinessTaxRate77PerMilleB` (art.57の2の8), both the exact 7.7% rate
`77/1000` transcribed from 「百分の七・七」 in two distinct table cells.
An initial test expectation error (76×77/1000 = 5, not 0) was caught by the
local Lean build and fixed before push. Checks: 6/6 targeted Lean builds,
transcription 586/586, invariants 17/17. Cycle-120 scoped attestations were
bound from REST-green run `45473747773`; cycle-121 CI run `45476274333`
Lean/axiom job verified before its own attestation binding. Legal review stays
`LEGAL_REVIEW_PENDING`.

## 5i. Cycle-123 (2026-11-25)

Two bounded modules pushed at `3b68510f`:
`InheritanceTaxLateFilingFineCap500k` (相続税法 art.69, 「五十万円以下」 =
inclusive fine cap) and `LocalTaxDeferralSmallAmountException1M` (地方税法
art.55の2, 「百万円以下」 = inclusive tax amount condition). Checks: 8/8
targeted Lean builds, transcription 598/598, no `sorry`. CI run
`45491532407` Lean/axiom job verified before scoped attestation binding.
Legal review stays `LEGAL_REVIEW_PENDING`.

## 5j. Cycle-124 (2026-11-25) — CI infrastructure blocker

Two bounded modules pushed at `f93f990d`:
`LocalTaxFalseFilingFineCap500k` (地方税法 art.22の2) and
`InheritanceTaxFalseReportFineCap500k` (相続税法 art.70), both the inclusive
「五十万円以下」 fine cap. Local checks: 8/8 Lean builds, transcription
618/618, no `sorry`. Their CI run `45491532407` failed at
**Install Lean toolchain** (not a proof failure); a rerun of the failed job
also failed at the same step, and other concurrent runs showed the same
toolchain-install failure. However a later gh-verified green Lean job (run `45634025256`, head
`cb8eab772d04`) contains the same committed module blobs, so scoped
attestations were bound from that run and the two cells were added to the
evidence ledger and queue.
Legal review stays `LEGAL_REVIEW_PENDING`.

## 5k. Cycle-125 (2026-11-26)

Two bounded modules pushed at `6a7b17ca`:
`LocalTaxOffenseFineCap500k` (地方税法 art.27) and `LocalCapitalCeiling10M`
(art.52 ホ, 資本金等の額千万円以下). Checks: 8/8 Lean builds, transcription
618/618, no `sorry`. CI run `45644875727` Lean/axiom job verified green;
scoped attestations bound from committed blobs and both cells added to the
evidence ledger and queue. Legal review stays `LEGAL_REVIEW_PENDING`.

## 5l. Cycle-128 (2026-11-26)

Two bounded modules pushed at `d365c382`:
`LocalTaxArt70FineCap500k` and `LocalTaxArt71_21FineCap500k` (地方税法
art.70 / art.71の21, inclusive 「五十万円以下」 fine caps). Checks: 8/8
Lean builds, transcription 634/634, no `sorry`. The first CI run
`45666627767` failed at **Install Lean toolchain** (infrastructure, not a
proof failure); no attestation was bound from it. Resume step: bind scoped
attestations for these two modules from the first REST/gh-verified green
Lean job whose commit contains their blobs, then regenerate the ledgers.
Legal review stays `LEGAL_REVIEW_PENDING`.

## 6. Resume procedure (exact)

1. `git fetch origin main`; `python scripts/ci/generate_verification_evidence.py`
2. `python scripts/ci/task_queue.py`; `python scripts/ci/progress_ledger.py`
3. `python scripts/ci/verify_queue_invariants.py` and
   `python scripts/ci/audit_evidence_references.py`
4. `python scripts/ci/task_selector.py 12` — select dependency-ready unfinished
   units; the last run reported 396,146 selectable and surfaced e.g.
   `NORM|6f539e...` (関税定率法 art.9, CONDITION),
   `NORM|d59565...` (災害被害者減免法 art.7, EXCEPTION),
   `NORM|04b6d4...` (相続税法 art.59, CONDITION).
5. For each unit: independent spec + boundary tests first, then pinned source
   audit and a separate H/T/D/C/U review; never self-certify human review.
6. Push, wait for the green Lean/axiom CI job, bind a scoped attestation from
   committed blobs (never the working tree), regenerate the ledgers, commit.
7. In parallel: acquire/version municipal ordinances and treaties, interpretive
   layers (通達・裁判例), bind external references and historical revisions.

Keep `技術的検証済み / 形式化未完了 / 法的レビュー未完了` separate in every report.


## 7. Cycles 130-132 (2026-11-26)

- **C130** LocalInhabitantReducedRate3or4 (地方税法 art.314の6, 3%/指定都市4%):
  pushed 9126605e; Lean/axiom job of run 45698525135 confirmed green via
  gh run view; pinned blobs matched; scoped attestation bound
  (data/PROOF_ATTESTATION_SCOPED_C130_INHABITANT.json); 5 evidence cells added.
- **C131** RndExcessOver3 / RndExcessOver12 (租税特別措置法 art.10, 3%/12% 超過):
  8/8 Lean builds, transcription 651/651; pushed 26ac886a; Lean/axiom job of
  run 45748786558 confirmed green; scoped attestations bound
  (data/PROOF_ATTESTATION_SCOPED_C131_OVER3.json, ..._OVER12.json).
  Evidence-cell generation via uild/gen_c131.py was still running at this write-up.
- **C132** RndExcessOver15 / RndExcess3To15 (租税特別措置法 art.10, 15%超 and
  3%超15%以下): 8/8 Lean builds, transcription 654/654; pushed 88090e0c;
  CI run 45750346126 pending. No attestation bound yet.
- Concurrent merges repeatedly dropped registered transcription checks
  (FreshCheeseCardQualification, DefenseCorpShortfallSum, etc.); every one
  was **restored** and the queue re-derived to 17/17 invariants - guards never disabled.
- Measured state before C131 cells: FULLY_VERIFIED=938, NOT_STARTED=395,913,
  BLOCKED=2, PROVED_SCOPE=1 (total 396,854); evidence 939.
- Human legal reviews: still **0**; all units LEGAL_REVIEW_PENDING.
  Ordinances/treaties/circulars/case law/historical revisions remain
  IN_SCOPE_BACKLOG. Only scoped computable rule cells are claimed.

### Resume procedure for C131/C132

1. Confirm uild/gen_c131.py + 	ask_queue.py finish; erify_queue_invariants.py 17/17.
2. When run 45750346126 Lean/axiom job is green, verify the C132 blobs at its
   head commit, bind scoped attestations, add cells (uild/gen_c132.py pattern),
   regenerate ledgers, commit and push.
3. Restore any transcription check or umbrella import dropped by a concurrent merge.
