#!/usr/bin/env python3
"""Article verification obligations ledger (Objective §4 / §5).

Completion is derived ONLY from recorded evidence (task_state.derive_status).
Pinned-needle matches, module existence and theorem-name strings are diagnostic
hints, never a completion signal. Human legal review and adversarial review are
reported as separate axes. The report distinguishes registered checks passing
from the completion verdict.
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
REVIEW = REPO / "docs" / "ADVERSARIAL_REVIEW.md"
OUT = REPO / "docs" / "ARTICLE_OBLIGATIONS.md"

sys.path.insert(0, str(Path(__file__).resolve().parent))
import task_state as st  # noqa: E402


def build() -> str:
    state = st.load_state()
    evidence = st.load_evidence()
    q = json.loads(QUEUE.read_text(encoding="utf-8")) if QUEUE.exists() else {"tasks": []}
    tasks = q.get("tasks", [])
    review_text = REVIEW.read_text(encoding="utf-8") if REVIEW.exists() else ""
    review_modules = set(__import__("re").findall(r"(\w+\.lean)", review_text))

    counts = {s: 0 for s in st.STATUSES}
    hint_total = 0
    adversarial = 0
    human = 0
    rows: list[tuple[str, str, str, str]] = []
    for t in tasks:
        derived = st.derive_status(t, state, evidence)
        status = derived["status"]
        counts[status] = counts.get(status, 0) + 1
        ustate = state["units"].get(t["normative_id"], st.default_unit_state())
        if any("PIN" in str(x) for x in t.get("unresolved_conditions", [])):
            hint_total += 1
        if ustate.get("review_evidence"):
            adversarial += 1
        if ustate.get("legal_review") == st.LEGAL_REVIEWED:
            human += 1
        if status in ("PARTIAL", "FULLY_VERIFIED", "PROVED_SCOPE"):
            rows.append((t["normative_id"][:12], t["law_id"],
                         t.get("article", "") or t["provision_kind"], status))

    lines = [
        "# Article verification obligations (machine-generated)",
        "",
        "Do not hand-edit. Regenerate: `python scripts/ci/article_obligations.py`.",
        "",
        "A unit is FULLY_VERIFIED only when every mechanical evidence axis is",
        "recorded with a non-empty evidence reference and no unresolved condition",
        "or blocker exists. Needle matches, file existence and theorem-name",
        "strings are NOT completion evidence. Coverage audits certify character",
        "reconstruction only, never semantic fidelity to the statute.",
        "",
        "## Counts (independent axes)",
        "",
        f"- normative units: {len(tasks)}",
    ]
    lines += [f"- {s}: {counts[s]}" for s in st.STATUSES]
    lines += [
        f"- adversarial-review evidence recorded: {adversarial} (separate axis)",
        f"- human legal review completed: {human} (separate axis)",
        f"- registered checks passing does NOT imply all obligations complete",
        "",
        "## Required evidence axes",
        "",
        ", ".join(st.MECHANICAL_AXES),
        "",
        "## Non-default units (sample, first 30)",
        "",
        "| unit | law_id | article/provision | status |",
        "|---|---|---|---|",
    ]
    for rid, lid, art, status in rows[:30]:
        lines.append(f"| `{rid}` | {lid} | {art} | {status} |")
    lines.append("")
    return "\n".join(lines)


def main() -> int:
    text = build()
    OUT.parent.mkdir(parents=True, exist_ok=True)
    unchanged = OUT.exists() and OUT.read_text(encoding="utf-8") == text
    OUT.write_text(text, encoding="utf-8")
    print("article obligations ledger: " + ("unchanged" if unchanged else "updated"))
    return 0


if __name__ == "__main__":
    sys.exit(main())
