#!/usr/bin/env python3
"""BLOCKED ledger — machine-generated record of out-of-repo prerequisites.

Objective §6 requires: save blocked items, publish unresolved matters, do not
claim completion while prerequisites remain. All COUNTS below are derived from
machine-generated inputs; the two sponsor-action items are declarative
statements of authority boundaries, not computed facts.

Regenerate with `python scripts/ci/blocked_ledger.py`; deterministic gate.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
INVENTORY = REPO / "data" / "INVENTORY.json"
SWEEP = REPO / "build" / "audit_sweep.json"
REVIEW = REPO / "docs" / "ADVERSARIAL_REVIEW.md"
DISCOVERY = REPO / "docs" / "RECURSIVE_DISCOVERY.md"
OUT = REPO / "docs" / "BLOCKED.md"


def _load(p: Path):
    return json.loads(p.read_text(encoding="utf-8")) if p.exists() else {}


def build() -> str:
    inv = _load(INVENTORY)
    sweep = _load(SWEEP).get("totals", {})
    unresolved = inv.get("summary", {}).get("unresolved", [])

    review_text = REVIEW.read_text(encoding="utf-8") if REVIEW.exists() else ""
    unresolved_reviews = len(re.findall(r"U-[A-Z]?\d+", review_text))
    review_sessions = len(re.findall(r"^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review", review_text, re.M))

    discovery_text = DISCOVERY.read_text(encoding="utf-8") if DISCOVERY.exists() else ""
    m = re.search(r"tax-name candidates prefixed '新' or '旧': (\d+) names / (\d+) occurrences", discovery_text)
    hist_names, hist_occ = (m.group(1), m.group(2)) if m else ("?", "?")

    lines = [
        "# BLOCKED — out-of-repo prerequisites (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/blocked_ledger.py`.",
        "",
        "This repository cannot satisfy the §6 completion criterion while the",
        "following prerequisites remain outside the Coordinator's authority.",
        "Green CI, pinned hashes and fidelity-only audits are process evidence",
        "only and do NOT establish completion.",
        "",
        "## Sponsor action 1 — independent human legal review",
        "",
        f"- L7 candidates: {sweep.get('findings_candidate', '?')}",
        f"- candidates with recorded reviewer: 0",
        f"- candidates still awaiting review: {sweep.get('findings_candidate', '?')}",
        "",
        "Required: a qualified Japanese tax lawyer reviews all candidates and records",
        "`reviewer` / `review_date` per row in docs/L7_CANDIDATES_UNREVIEWED.csv.",
        "The Coordinator MUST NOT self-certify, auto-clear or fabricate these fields:",
        "doing so would turn `verified-anomaly=0` into a false claim of legal review.",
        "",
        "## Sponsor action 2 — scope declaration for unsupported sources",
        "",
        "Required: an explicit in-repo declaration to model or declare unsupported:",
        "- 地方税条例 (~1,788 municipal ordinances) — currently unsupported / uncounted",
        "- 租税条約 (tax treaties) — auxiliary layer, not modelled",
        "- 通達 (administrative circulars) — auxiliary layer, not modelled",
        "- 裁判例 (case law) — auxiliary layer, not modelled",
        "",
        "The target ledger currently enumerates laws by the '税' name keyword only;",
        "recursive discovery remains incomplete (see docs/RECURSIVE_DISCOVERY.md).",
        "",
        "## Recorded unresolved items (not completion blockers by themselves)",
        "",
        f"- unresolved (unenforced) laws in ledger: {len(unresolved)} — "
        + (", ".join(str(x) for x in unresolved) if unresolved else "none"),
        f"- independent review sessions: {review_sessions}",
        f"- review-level UNRESOLVED markers: {unresolved_reviews} "
        "(require human legal judgement; not implementation defects)",
        f"- historical-version references (Phase F): {hist_names} names / "
        f"{hist_occ} occurrences — historical revisions not pinned to e-Gov snapshots",
        f"- verified anomalies: {sweep.get('findings_verified_anomaly', '?')} "
        "(means no independent legal review has established a defect)",
        "",
        "## Repo state is saved and resumable",
        "",
        "Work continues on bounded pinned-bytes L4 slices while prerequisites are",
        "unmet. No completion claim is made. Current coverage figures are in",
        "docs/COVERAGE.md (machine-generated).",
        "",
    ]
    return "\n".join(lines)


def main() -> int:
    text = build()
    if OUT.exists() and OUT.read_text(encoding="utf-8") == text:
        print("blocked ledger matches committed state (deterministic)")
        return 0
    OUT.write_text(text, encoding="utf-8")
    print("wrote", OUT)
    return 1


if __name__ == "__main__":
    sys.exit(main())
