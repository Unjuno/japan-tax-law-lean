#!/usr/bin/env python3
"""Normative-unit source-scope diagnostic (Sponsor Directive §4).

Reports, for every normative unit in the persistent queue, the exact
本則/附則/別表 + 条項号細目/別表セル locator, character span, source hash,
unit kind, decomposition audit result and dependency resolution state.

This is a DIAGNOSTIC, not a completion gate: a whole-text numeric match is
never reported as article-level verification. Unresolved source characters and
unresolved dependencies are counted explicitly.

Regenerate with `python scripts/law_audit/phase_e/article_scope.py`.
"""
from __future__ import annotations

import json
import sys
from collections import Counter
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(REPO / "scripts" / "ci"))
from normative_units import DONE_STATES, load_state  # noqa: E402

QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "docs" / "ARTICLE_SCOPE.md"


def main() -> int:
    if not QUEUE.exists():
        print("task queue missing; run scripts/ci/task_queue.py first", file=sys.stderr)
        return 1
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    state = load_state()
    tasks = q.get("tasks", [])

    kinds = Counter()
    scopes = Counter()
    states = Counter()
    rows = []
    for t in tasks:
        u = t.get("unit", {})
        audit = t.get("decomposition", {}).get("audit", {})
        deps = t.get("dependencies", {})
        rec = state["tasks"].get(t["task_id"], {})
        kinds[u.get("kind", "UNRESOLVED")] += 1
        scopes[t.get("scope", "-")] += 1
        states[rec.get("completion_state", "NOT_STARTED")] += 1
        rows.append(
            f"| `{t.get('normative_ref', t['task_id'])[:44]}` | "
            f"{u.get('locator', '')} | {u.get('kind', '')} | "
            f"{u.get('char_start', 0)}-{u.get('char_end', 0)} | "
            f"{str(u.get('sha256', ''))[:12]} | "
            f"{'OK' if audit.get('decomposition_ok') else 'FAIL'} | "
            f"{deps.get('unresolved_dependency_count', 0)} | "
            f"{t.get('scope', '-')} | "
            f"{rec.get('completion_state', 'NOT_STARTED')} |"
        )

    unresolved_units = kinds.get("UNRESOLVED", 0)
    unresolved_deps = sum(
        1 for t in tasks if t.get("dependencies", {}).get("unresolved_dependency_count", 0)
    )
    lines = [
        "# Normative-unit source-scope diagnostic (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `scripts/law_audit/phase_e/article_scope.py`.",
        "",
        "Sponsor Directive §4: a numeric match anywhere in the whole pinned text",
        "is NOT unit-level verification. This report records the exact structural",
        "locator, character span and source hash for every normative unit, plus its",
        "decomposition audit and dependency resolution state. It is a diagnostic",
        "for the independent-audit axis, not a completion gate.",
        "",
        "## Totals",
        "",
        f"- normative units: {len(tasks)}",
        f"- UNRESOLVED units (source text that could not be decomposed): {unresolved_units}",
        f"- units with unresolved dependencies: {unresolved_deps}",
        f"- terminal-state units: {sum(states.get(s, 0) for s in DONE_STATES)}",
        "",
        "| unit kind | units |",
        "|---|---:|",
        *[f"| {k} | {v} |" for k, v in sorted(kinds.items())],
        "",
        "| scope | units |",
        "|---|---:|",
        *[f"| {k} | {v} |" for k, v in sorted(scopes.items())],
        "",
        "## Per-unit source scope",
        "",
        "| unit | locator | kind | span | sha256[:12] | audit | unresolved deps | scope | state |",
        "|---|---|---|---|---|---|---:|---|---|",
        *rows,
        "",
    ]
    OUT.write_text("\n".join(lines), encoding="utf-8")
    print(
        f"article-scope diagnostic: {len(tasks)} units, "
        f"{unresolved_units} unresolved, {unresolved_deps} with unresolved deps"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
