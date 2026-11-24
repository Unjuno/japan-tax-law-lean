#!/usr/bin/env python3
"""Review/acquisition backlog ledger (machine-generated, non-blocking).

Sponsor directive 2026-11-24: human legal review is a condition for a FINAL
legal determination, NOT a condition for starting Lean formalization. Nothing
here stops the Coordinator. Candidates stay LEGAL_REVIEW_PENDING; ordinances,
treaties, circulars and case law stay IN SCOPE in separate source layers;
UNSUPPORTED describes current implementation state, not permanent exclusion.

Objective §6 still requires: save blocked items, publish unresolved matters and
make no completion claim. All COUNTS below are derived from machine-generated
inputs; the two backlog sections are declarative authority boundaries and are
never used to skip a formalization task.

Regenerate with `python scripts/ci/blocked_ledger.py`; deterministic gate.
"""
from __future__ import annotations

import csv
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
CANDIDATES = REPO / "docs" / "L7_CANDIDATES_UNREVIEWED.csv"


def recorded_reviewers() -> int:
    """Derive the human-review count; never hardcode it to zero.

    A conservative derivation can only report a decision that is actually
    written in the CSV. Automation never adds a reviewer or review date.
    """
    if not CANDIDATES.exists():
        return 0
    with CANDIDATES.open(encoding="utf-8", newline="") as f:
        return sum(1 for row in csv.DictReader(f)
                   if (row.get("reviewer") or "").strip())


def _load(p: Path):
    return json.loads(p.read_text(encoding="utf-8")) if p.exists() else {}


def build() -> str:
    inv = _load(INVENTORY)
    sweep = _load(SWEEP).get("totals", {})
    unresolved = inv.get("summary", {}).get("unresolved", [])

    review_text = REVIEW.read_text(encoding="utf-8") if REVIEW.exists() else ""
    unresolved_reviews = len(re.findall(r"U-[A-Z]?\d+", review_text))
    review_sessions = len(re.findall(r"^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review", review_text, re.M))

    discovery_text = DISCOVERY.read_text(encoding="utf-8") if DISCOVERY.exists() else ""
    m = re.search(r"tax-name candidates prefixed '新' or '旧': (\d+) names / (\d+) occurrences", discovery_text)
    hist_names, hist_occ = (m.group(1), m.group(2)) if m else ("?", "?")

    cand = sweep.get("findings_candidate", "?")
    lines = [
        "# BACKLOG — review and acquisition state (machine-generated, non-blocking)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/blocked_ledger.py`.",
        "",
        "Sponsor directive 2026-11-24 overrides the former stop interpretation:",
        "human legal review is a condition for a FINAL legal determination, NOT for",
        "starting Lean formalization. Work on every executable unit continues while",
        "these axes are pending. No completion claim is made from green CI or hashes.",
        "",
        "## Independent human legal review — LEGAL_REVIEW_PENDING (not a gate)",
        "",
        f"- L7 candidates: {cand}",
        f"- candidates with recorded reviewer: {recorded_reviewers()}",
        f"- candidates still awaiting review: {int(cand) - recorded_reviewers() if isinstance(cand, int) else cand}",
        "",
        "A qualified Japanese tax lawyer must record `reviewer` / `review_date` per",
        "row in docs/L7_CANDIDATES_UNREVIEWED.csv before a FINAL legal determination.",
        "The Coordinator MUST NOT self-certify, auto-clear or fabricate these fields.",
        "Pending review does not stop formalize / prove / challenge / verify work.",
        "",
        "## Source-scope backlog — UNSUPPORTED is implementation state, not exclusion",
        "",
        "All families below remain IN SCOPE. Unacquired or unmodelled means a",
        "backlog item with its own versioned source layer, not a permanent exclusion:",
        "- 地方税条例 (~1,788 municipal ordinances) — in scope; collect per municipality with version pins",
        "- 租税条約 (tax treaties) — in scope; auxiliary legal source layer, not yet modelled",
        "- 通達 (administrative circulars) — in scope as interpretation material, kept separate from 法令本文",
        "- 裁判例 (case law) — in scope as interpretation material, kept separate from 法令本文",
        "",
        "The target ledger currently enumerates laws by the '税' name keyword only;",
        "delegation / reference / amendment discovery continues (see docs/RECURSIVE_DISCOVERY.md).",
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
        "The Coordinator continues on all dependency-ready units while the review",
        "and acquisition backlogs are pending. One blocked unit never stops the rest.",
        "No completion claim is made. Current coverage figures are in",
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
