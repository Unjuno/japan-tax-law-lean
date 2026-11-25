# BACKLOG — review and acquisition state (machine-generated, non-blocking)

Do not hand-edit. Regenerate with `python scripts/ci/blocked_ledger.py`.

Sponsor directive 2026-11-24 overrides the former stop interpretation:
human legal review is a condition for a FINAL legal determination, NOT for
starting Lean formalization. Work on every executable unit continues while
these axes are pending. No completion claim is made from green CI or hashes.

## Independent human legal review — LEGAL_REVIEW_PENDING (not a gate)

- L7 candidates: 3438
- candidates with recorded reviewer: 0
- candidates still awaiting review: 3438

A qualified Japanese tax lawyer must record `reviewer` / `review_date` per
row in docs/L7_CANDIDATES_UNREVIEWED.csv before a FINAL legal determination.
The Coordinator MUST NOT self-certify, auto-clear or fabricate these fields.
Pending review does not stop formalize / prove / challenge / verify work.

## Source-scope backlog — UNSUPPORTED is implementation state, not exclusion

All families below remain IN SCOPE. Unacquired or unmodelled means a
backlog item with its own versioned source layer, not a permanent exclusion:
- 地方税条例 (~1,788 municipal ordinances) — in scope; collect per municipality with version pins
- 租税条約 (tax treaties) — in scope; auxiliary legal source layer, not yet modelled
- 通達 (administrative circulars) — in scope as interpretation material, kept separate from 法令本文
- 裁判例 (case law) — in scope as interpretation material, kept separate from 法令本文

The target ledger currently enumerates laws by the '税' name keyword only;
delegation / reference / amendment discovery continues (see docs/RECURSIVE_DISCOVERY.md).

## Recorded unresolved items (not completion blockers by themselves)

- unresolved (unenforced) laws in ledger: 2 — {'law_id': '508CO0000000106', 'status': 'fully_unenforced'}, {'law_id': '508M60000040027', 'status': 'fully_unenforced'}
- independent review sessions: 109
- review-level UNRESOLVED markers: 450 (require human legal judgement; not implementation defects)
- historical-version references (Phase F): 795 names / 12977 occurrences — historical revisions not pinned to e-Gov snapshots
- verified anomalies: 0 (means no independent legal review has established a defect)

## Repo state is saved and resumable

The Coordinator continues on all dependency-ready units while the review
and acquisition backlogs are pending. One blocked unit never stops the rest.
No completion claim is made. Current coverage figures are in
docs/COVERAGE.md (machine-generated).
