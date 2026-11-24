#!/usr/bin/env python3
"""Deterministic unfinished-obligation selector (Sponsor Directive §3/§4).

Reads the persistent normative-unit queue and selects unfinished obligations for
the Coordinator to assign to High4 subagents. Status comes from the evidence
ledger; a needle match, a file existing or a theorem name is never a reason to
select or to skip. Human legal review is a separate axis, not a filter.

Dependency readiness is delegated to ``normative_core.dependency_readiness``:
a dependency is satisfied only when the referenced law + article + enforced
revision is itself at least PROVED_SCOPE. A bare 15-digit id is insufficient.

Selection is deterministic and round-robin across laws for parallelism.
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
import normative_core as core  # noqa: E402

QUEUE = REPO / "build" / "task_queue.json"

COMPUTE_MARKERS = ("円", "百分", "割合", "税率", "控除", "千分", "乗じ", "除し",
                   "以上", "以下", "超え")


def normalize_task(t: dict) -> dict:
    """Accept v3 (string status) and legacy (status dict) queue entries."""
    t = dict(t)
    t.setdefault("normative_id", t.get("task_id", t.get("id", "")))
    t.setdefault("id", t.get("normative_id", ""))
    status = t.get("status")
    if isinstance(status, dict):
        t["status"] = status.get("formalized", core.STATUS_NOT_STARTED)
    if not isinstance(t.get("status"), str):
        t["status"] = core.STATUS_NOT_STARTED
    t.setdefault("owner", "")
    t.setdefault("blockers", [])
    t.setdefault("dependencies", [])
    t.setdefault("unhandled_conditions", [])
    return t


def computable(t: dict) -> int:
    """Score arithmetic content across every text field the queue may use.

    v3 normative units carry ``text``; older queue rows used ``norm_fragment``
    or ``verbatim``. Reading only the legacy fields made every v3 unit score
    zero, so the Coordinator never preferred a computable provision.
    """
    frag = " ".join(str(t.get(f) or "") for f in ("text", "norm_fragment", "verbatim"))
    return sum(1 for k in COMPUTE_MARKERS if k in frag)


def round_robin(tasks: list[dict]) -> list[dict]:
    """Deterministic law round-robin; within a law prefer computable units."""
    by_law: dict[str, list[dict]] = {}
    for t in tasks:
        by_law.setdefault(str(t.get("law_id", "")), []).append(t)
    laws = sorted(by_law)
    for law in laws:
        by_law[law].sort(key=lambda t: (-computable(t),
                                        len(t.get("unhandled_conditions", [])),
                                        str(t.get("id", ""))))
    ordered: list[dict] = []
    total = sum(len(v) for v in by_law.values())
    idx = 0
    while len(ordered) < total and laws:
        law = laws[idx % len(laws)]
        round_no = idx // len(laws)
        if round_no < len(by_law[law]):
            ordered.append(by_law[law][round_no])
        idx += 1
    return ordered


def select_tasks(tasks: list[dict], n: int, claims: dict | None = None) -> dict:
    """Pure, testable selection policy over normalized queue entries.

    `claims` maps a unit id to an owner (or an {"owner": ...} record). Claimed
    units are never selected: two agents must not edit the same artifact.

    An unresolved bare-id dependency blocks BOTH the referencing unit and every
    unit of the referenced law. A 15-digit id alone does not identify an article
    or an enforced revision, so it cannot establish dependency readiness.
    """
    claims = claims or {}
    norm = [normalize_task(t) for t in tasks]

    def is_unresolved_id_hint(d: dict) -> bool:
        typ = str(d.get("type", "")).upper()
        return (typ in ("LAW_ID_HINT", "LAW_ID")
                and (bool(d.get("unresolved"))
                     or d.get("sufficient") is False
                     or d.get("resolution") == "unresolved_underdetermined"))

    blocked_laws = {
        str(d.get("law_id"))
        for t in norm for d in t.get("dependencies", [])
        if is_unresolved_id_hint(d) and d.get("law_id")
    }
    for t in norm:
        reasons = []
        if any(is_unresolved_id_hint(d) for d in t.get("dependencies", [])):
            reasons.append("BLOCKED_BY_UNRESOLVED_BARE_ID_DEPENDENCY")
        if str(t.get("law_id", "")) in blocked_laws:
            reasons.append("BLOCKED_LAW_HAS_UNRESOLVED_BARE_ID_DEPENDENCY")
        if reasons:
            for reason in reasons:
                t.setdefault("blockers", []).append({"reason": reason, "resolved": False})
            # core.select_tasks skips STATUS_BLOCKED; an unresolved dependency
            # makes a unit non-selectable until it is explicitly resolved.
            t["status"] = core.STATUS_BLOCKED
        cid = str(t.get("id", ""))
        if cid in claims:
            claim = claims[cid]
            t["owner"] = claim.get("owner", "") if isinstance(claim, dict) else str(claim)

    effective_claims = {str(t["id"]): t["owner"] for t in norm if t.get("owner")}
    effective_claims.update({str(k): v for k, v in claims.items()})
    ordered = round_robin(norm)
    result = core.select_tasks(ordered, n, effective_claims)
    by_id = {t["id"]: t for t in ordered}
    selected = []
    for item in result["selected"]:
        t = by_id.get(item["id"], {})
        selected.append({
            "task_id": item["id"],
            "normative_id": item["id"],
            "law_id": item.get("law_id", ""),
            "law_title": t.get("law_title", ""),
            "revision": t.get("revision", ""),
            "enforcement_date": t.get("enforcement_date", ""),
            "article": item.get("article", ""),
            "article_title": t.get("article_title", ""),
            "norm_type": t.get("kind", t.get("norm_kind", "")),
            "source_file": t.get("source_file", ""),
            "source_path": t.get("source_path", ""),
            "norm_fragment": t.get("norm_fragment", ""),
            "dependencies": t.get("dependencies", []),
            "unhandled_conditions": t.get("unhandled_conditions", []),
            "status": item.get("status", ""),
            "remaining_axes": item.get("remaining_axes", []),
            "obligations": t.get("obligations", []),
            "legal_review": t.get("legal_review", core.LEGAL_REVIEW_PENDING),
            "scope": t.get("scope", ""),
        })
    selectable = [t for t in norm if t["status"] in (core.STATUS_NOT_STARTED,
                                                     core.STATUS_PARTIAL,
                                                     core.STATUS_PROVED_SCOPE)]
    return {
        "tool": "scripts/ci/task_selector.py",
        "queue_units": len(tasks),
        "selectable": len(selectable),
        "skipped_owner": sum(1 for t in norm if t.get("owner")),
        "skipped_dependency_or_blocker": len(result.get("blocked", [])),
        "legal_review_is_not_a_filter": True,
        "blocked": result.get("blocked", []),
        "selected_count": len(selected),
        "selected": selected,
    }


def main() -> int:
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 12
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    # Machine-readable output MUST be UTF-8. On Windows, sys.stdout defaults to
    # cp932; printing raw Japanese then corrupts the JSON for API/CI consumers.
    payload = json.dumps(select_tasks(q.get("tasks", []), n), ensure_ascii=False, indent=2)
    try:
        sys.stdout.reconfigure(encoding="utf-8")
    except (AttributeError, ValueError):
        pass
    print(payload)
    return 0


if __name__ == "__main__":
    sys.exit(main())
