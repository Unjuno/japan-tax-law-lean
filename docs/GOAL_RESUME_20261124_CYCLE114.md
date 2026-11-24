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

## 5c. Cycle-116 (2026-11-25)

Two more bounded modules pushed at `badd196b`:
`LocalTaxRateCeiling2Percent` (art.51, 2% inclusive ceiling) and
`PropertyAcquisitionSpecialRate3` (附則 art.11の2, 3% rate). Lean/axiom job of
REST-verified run `45422155189` succeeded; both scoped `lean_job_only`
attestations were bound from committed blobs (`kernel_attested=True`).
Checks: 8/8 targeted Lean builds, transcription 564/564, `check_no_sorry`
clean, `verify_queue_invariants.py` 17/17 after regenerating the canonical
umbrella (a concurrent rewrite had truncated it; the guard was restored, not
disabled). Legal review remains `LEGAL_REVIEW_PENDING`.

Cycle-116 initially produced zero evidenced units despite green modules. Two
further generator defects were found and fixed (no module hash changed, so the
existing attestations remain valid):
1. `source_literals_verified` required a spec ratio pair for rate clauses,
   rejecting a faithful numerator-only spec of 「百分の二」. It now accepts
   `{2}` with the exact 「二」 spelling in the clause (a tenfold `20` still fails).
2. `scoped_article_text` returned only the FIRST Article with a given `Num`,
   hiding a supplementary provision (art.11の2). It now collects every matching
   article; the exact cell remains pinned by `source_path` + clause needle.
`scripts/tests/test_verification_evidence.py` and `test_structural_evidence.py`:
25/25 OK; targeted generator check now yields 3 cycle-116 units.

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
