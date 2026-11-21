# BLOCKED — out-of-repo prerequisites (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/blocked_ledger.py`.

This repository cannot satisfy the §6 completion criterion while the
following prerequisites remain outside the Coordinator's authority.
Green CI, pinned hashes and fidelity-only audits are process evidence
only and do NOT establish completion.

## Sponsor action 1 — independent human legal review

- L7 candidates: 3438
- candidates with recorded reviewer: 0
- candidates still awaiting review: 3438

Required: a qualified Japanese tax lawyer reviews all candidates and records
`reviewer` / `review_date` per row in docs/L7_CANDIDATES_UNREVIEWED.csv.
The Coordinator MUST NOT self-certify, auto-clear or fabricate these fields:
doing so would turn `verified-anomaly=0` into a false claim of legal review.

## Sponsor action 2 — scope declaration for unsupported sources

Required: an explicit in-repo declaration to model or declare unsupported:
- 地方税条例 (~1,788 municipal ordinances) — currently unsupported / uncounted
- 租税条約 (tax treaties) — auxiliary layer, not modelled
- 通達 (administrative circulars) — auxiliary layer, not modelled
- 裁判例 (case law) — auxiliary layer, not modelled

The target ledger currently enumerates laws by the '税' name keyword only;
recursive discovery remains incomplete (see docs/RECURSIVE_DISCOVERY.md).

## Recorded unresolved items (not completion blockers by themselves)

- unresolved (unenforced) laws in ledger: 2 — {'law_id': '508CO0000000106', 'status': 'fully_unenforced'}, {'law_id': '508M60000040027', 'status': 'fully_unenforced'}
- independent review sessions: 34
- review-level UNRESOLVED markers: 138 (require human legal judgement; not implementation defects)
- historical-version references (Phase F): 795 names / 12977 occurrences — historical revisions not pinned to e-Gov snapshots
- verified anomalies: 0 (means no independent legal review has established a defect)

## Repo state is saved and resumable

Work continues on bounded pinned-bytes L4 slices while prerequisites are
unmet. No completion claim is made. Current coverage figures are in
docs/COVERAGE.md (machine-generated).
