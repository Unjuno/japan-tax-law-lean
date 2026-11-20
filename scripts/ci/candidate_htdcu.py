#!/usr/bin/env python3
"""H/T/D/C/U ledger for detection candidates (Sponsor Directive §5).

For every candidate emitted by the structural audit this records separately:
  H  falsifiable hypothesis (what the candidate claims about the pinned text)
  T  reproduction test (the machine check that can re-detect it)
  D  disposition (UNDETERMINED unless an independent reviewer recorded one)
  C  competing interpretation (NOT_CONSTRUED until someone records one)
  U  remaining uncertainty (why it cannot yet be called a defect or a non-issue)

Nothing here decides that a candidate is a legal defect. A candidate with no
recorded reviewer/review_date is UNDETERMINED, never PASS and never FAIL. This
complements the queue's completion states: it is an audit-trail layer, not an
additional completion claim. Human legal review is a separate axis.

Regenerate with `python scripts/ci/candidate_htdcu.py`; deterministic gate.
"""
from __future__ import annotations

import csv
import json
from collections import Counter
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
CANDIDATES = REPO / "docs" / "L7_CANDIDATES_UNREVIEWED.csv"
OUT_JSON = REPO / "build" / "candidate_htdcu.json"
OUT_MD = REPO / "docs" / "CANDIDATE_HTDCU.md"

T_TESTS = {
    "PAREN.UNBALANCED": "scripts.tests.test_structural_audit (bracket/quote checks)",
    "ART.DUPLICATE": "scripts.tests.test_structural_audit (numbering checks)",
    "REF.UNRESOLVED": "scripts.tests.test_structural_audit (reference checks)",
}


def main() -> int:
    rows = []
    with CANDIDATES.open(encoding="utf-8", newline="") as f:
        for row in csv.DictReader(f):
            rule = row.get("rule_id", "")
            reviewed = bool((row.get("reviewer") or "").strip()
                            and (row.get("review_date") or "").strip())
            rows.append({
                "rule_id": rule,
                "law_id": row.get("law_id", ""),
                "path": row.get("path", ""),
                "line": row.get("line", ""),
                "H": f"candidate {rule} at {row.get('path','')}: {row.get('message','')}",
                "T": T_TESTS.get(rule, "scripts.tests.test_structural_audit (rule-specific check)"),
                "D": "RECORDED" if reviewed else "UNDETERMINED",
                "C": "NOT_CONSTRUED",
                "U": ("no independent reviewer/date recorded; text may be a valid "
                      "cross-article quotation or a genuine transcription issue"),
                "reviewer": row.get("reviewer", ""),
                "review_date": row.get("review_date", ""),
            })

    OUT_JSON.parent.mkdir(parents=True, exist_ok=True)
    OUT_JSON.write_text(
        json.dumps({"candidates": rows}, ensure_ascii=False, separators=(",", ":")),
        encoding="utf-8",
    )
    by_rule = Counter(r["rule_id"] for r in rows)
    by_d = Counter(r["D"] for r in rows)
    lines = [
        "# Candidate H/T/D/C/U ledger (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/candidate_htdcu.py`.",
        "",
        "Sponsor Directive §5 requires every detection candidate to carry H",
        "(falsifiable hypothesis), T (reproduction test), D (disposition), C",
        "(competing interpretation) and U (remaining uncertainty). A candidate",
        "without an independent reviewer and review date is UNDETERMINED; it is",
        "never counted as PASS, FAIL or a verified defect.",
        "",
        f"- candidates: {len(rows)}",
        f"- D=UNDETERMINED: {by_d.get('UNDETERMINED', 0)}",
        f"- D=RECORDED: {by_d.get('RECORDED', 0)}",
        f"- C=NOT_CONSTRUED: {sum(1 for r in rows if r['C'] == 'NOT_CONSTRUED')}",
        "",
        "| rule_id | candidates |",
        "|---|---:|",
        *[f"| {k} | {v} |" for k, v in sorted(by_rule.items())],
        "",
        "## First 40 candidates",
        "",
        "| law_id | path | H | T | D | C | U |",
        "|---|---|---|---|---|---|---|",
    ]
    for r in rows[:40]:
        lines.append(
            f"| {r['law_id']} | {r['path'][:24]} | {r['H'][:90]} | "
            f"{r['T'][:44]} | {r['D']} | {r['C']} | {r['U'][:60]} |"
        )
    lines.append("")
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print(f"candidate H/T/D/C/U ledger: {len(rows)} candidates, "
          f"{by_d.get('UNDETERMINED', 0)} UNDETERMINED")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
