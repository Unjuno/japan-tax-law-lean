#!/usr/bin/env python3
"""Durable task state and verification-evidence ledger (Objective §1 items 5/7, §5).

Authoritative, committed JSON:
  data/task_state.json           owner / status / blockers / artifacts / review
  data/verification_evidence.json evidence records per verification axis

`build/task_queue.json` is a derived PROJECTION. Regeneration preserves manual
fields; changed source digests downgrade a unit and add a revalidation blocker;
units that disappear become STALE rather than being silently dropped.

Statuses are distinct: NOT_STARTED / PARTIAL / PROVED_SCOPE / FULLY_VERIFIED /
BLOCKED / STALE. Human legal review is a separate axis and is never auto-set.
"""
from __future__ import annotations

import json
import os
import tempfile
from datetime import datetime, timezone
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
STATE_PATH = REPO / "data" / "task_state.json"
EVIDENCE_PATH = REPO / "data" / "verification_evidence.json"

SCHEMA_STATE = "task-state-v2"
SCHEMA_EVIDENCE = "verification-evidence-v1"

STATUS_NOT_STARTED = "NOT_STARTED"
STATUS_PARTIAL = "PARTIAL"
STATUS_PROVED_SCOPE = "PROVED_SCOPE"
STATUS_FULLY_VERIFIED = "FULLY_VERIFIED"
STATUS_BLOCKED = "BLOCKED"
STATUS_STALE = "STALE"
STATUSES = (STATUS_NOT_STARTED, STATUS_PARTIAL, STATUS_PROVED_SCOPE,
            STATUS_FULLY_VERIFIED, STATUS_BLOCKED, STATUS_STALE)
SELECTABLE_STATUSES = (STATUS_NOT_STARTED, STATUS_PARTIAL, STATUS_PROVED_SCOPE)

LEGAL_REVIEW_PENDING = "LEGAL_REVIEW_PENDING"
LEGAL_REVIEWED = "LEGAL_REVIEWED_BY_HUMAN"
LEGAL_REVIEW_VALUES = (LEGAL_REVIEW_PENDING, LEGAL_REVIEWED, "NOT_APPLICABLE")

MECHANICAL_AXES = (
    "SOURCE_LOCATION",
    "SOURCE_CORRESPONDENCE_AUDIT",
    "DECOMPOSITION_AUDIT",
    "SPEC_INDEPENDENT",
    "IMPLEMENTATION",
    "PROOF_SOUNDNESS",
    "PROOF_SCOPE",
    "PROOF_BOUNDARY",
    "TESTS",
    "ADVERSARIAL_REVIEW",
)
CONDITIONAL_AXES = ("PROOF_CROSS_LAW",)
REQUIRED_GATES = (
    "LEAN_BUILD", "AXIOM_AUDIT", "REGRESSION_TESTS", "QUEUE_REGENERATION",
    "ARTICLE_SCOPE_AUDIT", "ADVERSARIAL_REVIEW",
)


def _now() -> str:
    return datetime.now(timezone.utc).isoformat(timespec="seconds")


def _read_json(path: Path, default: dict) -> dict:
    if not path.exists():
        return json.loads(json.dumps(default))
    data = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(data, dict):
        raise ValueError(f"{path}: expected JSON object")
    return data


def _atomic_write(path: Path, payload: dict) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, tmp = tempfile.mkstemp(prefix=f".{path.name}.", dir=str(path.parent))
    try:
        with os.fdopen(fd, "w", encoding="utf-8", newline="\n") as f:
            json.dump(payload, f, ensure_ascii=False, indent=2, sort_keys=True)
            f.write("\n")
        os.replace(tmp, path)
    finally:
        if os.path.exists(tmp):
            os.unlink(tmp)


def load_state(path: Path = STATE_PATH) -> dict:
    state = _read_json(path, {"schema": SCHEMA_STATE, "units": {}, "updated_at": ""})
    state.setdefault("schema", SCHEMA_STATE)
    state.setdefault("units", {})
    state.setdefault("updated_at", "")
    return state


def save_state(state: dict, path: Path = STATE_PATH) -> None:
    state["schema"] = SCHEMA_STATE
    state["updated_at"] = _now()
    _atomic_write(path, state)


def default_unit_state() -> dict:
    return {
        "status": STATUS_NOT_STARTED,
        "owner": "",
        "blockers": [],
        "artifacts": [],
        "review_evidence": [],
        "notes": "",
        "legal_review": LEGAL_REVIEW_PENDING,
        "updated_at": "",
        "last_generated_digest": "",
    }


def prune_defaults(state: dict, evidence: dict | None = None) -> dict:
    """Keep only units with durable content; implicit units are NOT_STARTED.

    `last_generated_digest` is a regeneration aid, not durable content by
    itself: a pristine unit is implicitly NOT_STARTED. Units that carry
    evidence are always kept so a changed source can downgrade them.
    """
    default = default_unit_state()
    ignore = {"updated_at", "last_generated_digest"}
    evidenced = set((evidence or {}).get("records", {}))
    units = state.setdefault("units", {})
    for uid in list(units):
        entry = units[uid]
        if uid in evidenced:
            continue
        if all(entry.get(k) == v for k, v in default.items() if k not in ignore):
            del units[uid]
    return state


def merge_state(state: dict, generated_units: list[dict]) -> dict:
    """Merge a generated projection into durable state without losing work."""
    units = state.setdefault("units", {})
    seen: set[str] = set()
    for unit in generated_units:
        uid = unit["normative_id"]
        seen.add(uid)
        digest = str(unit.get("projection_digest", ""))
        if uid not in units:
            fresh = default_unit_state()
            fresh["last_generated_digest"] = digest
            fresh["updated_at"] = _now()
            units[uid] = fresh
            continue
        existing = units[uid]
        previous = str(existing.get("last_generated_digest", ""))
        if previous and previous != digest:
            existing["status"] = STATUS_PARTIAL
            blocker = "SOURCE_PROJECTION_CHANGED_REVALIDATE"
            if blocker not in existing.setdefault("blockers", []):
                existing["blockers"].append(blocker)
            existing["notes"] = (existing.get("notes", "") +
                                 " | source projection changed; previous verification must be re-established"
                                 ).strip(" |")
        if existing.get("last_generated_digest") != digest:
            existing["last_generated_digest"] = digest
            existing["updated_at"] = _now()
    for uid, existing in units.items():
        if uid not in seen and existing.get("status") != STATUS_STALE:
            existing["status"] = STATUS_STALE
            blockers = existing.setdefault("blockers", [])
            if "NO_LONGER_IN_PROJECTION" not in blockers:
                blockers.append("NO_LONGER_IN_PROJECTION")
            existing["updated_at"] = _now()
    return state


def load_evidence(path: Path = EVIDENCE_PATH) -> dict:
    ev = _read_json(path, {"schema": SCHEMA_EVIDENCE, "records": {}})
    ev.setdefault("schema", SCHEMA_EVIDENCE)
    ev.setdefault("records", {})
    return ev


def save_evidence(evidence: dict, path: Path = EVIDENCE_PATH) -> None:
    evidence["schema"] = SCHEMA_EVIDENCE
    _atomic_write(path, evidence)


def record_evidence(evidence: dict, normative_id: str, axis: str, *, evidence_ref: str,
                    tool: str = "", reviewer: str = "ci", note: str = "") -> dict:
    """Append one evidence record. Artifact existence is not evidence."""
    if not evidence_ref:
        raise ValueError("evidence_ref is required; artifact existence is not evidence")
    if axis not in MECHANICAL_AXES + CONDITIONAL_AXES + ("LEGAL_REVIEW",):
        raise ValueError(f"unknown evidence axis: {axis}")
    evidence.setdefault("records", {}).setdefault(normative_id, []).append({
        "axis": axis, "evidence_ref": evidence_ref, "tool": tool,
        "reviewer": reviewer, "date": _now(), "note": note,
    })
    return evidence


def _effective_axes(evidence: dict, normative_id: str, has_dependencies: bool) -> tuple[set[str], set[str]]:
    records = evidence.get("records", {}).get(normative_id, [])
    valid = {r.get("axis") for r in records if r.get("evidence_ref") and r.get("date")}
    missing = set(MECHANICAL_AXES) - valid
    if has_dependencies and "PROOF_CROSS_LAW" not in valid:
        missing.add("PROOF_CROSS_LAW")
    return valid, missing


def derive_status(unit: dict, state: dict, evidence: dict) -> dict:
    """Derive status from recorded evidence only — never from names or files."""
    uid = unit["normative_id"]
    ustate = state.get("units", {}).get(uid, default_unit_state())
    has_deps = bool(unit.get("dependency_ids") or unit.get("dependencies"))
    satisfied, missing = _effective_axes(evidence, uid, has_deps)
    blocked_list = ustate.get("blockers", [])

    if ustate.get("status") == STATUS_STALE or "NO_LONGER_IN_PROJECTION" in blocked_list:
        return {"status": STATUS_STALE, "satisfied_axes": sorted(satisfied),
                "missing_axes": sorted(missing), "completion_claim": False}
    if ustate.get("status") == STATUS_BLOCKED or any(
        b not in ("NO_LONGER_IN_PROJECTION",) for b in blocked_list
    ):
        return {"status": STATUS_BLOCKED, "satisfied_axes": sorted(satisfied),
                "missing_axes": sorted(missing), "completion_claim": False}

    unresolved = unit.get("unresolved_conditions") or []
    if not missing and not unresolved:
        status = STATUS_FULLY_VERIFIED
    elif {"PROOF_SOUNDNESS", "PROOF_SCOPE", "SPEC_INDEPENDENT", "IMPLEMENTATION"} <= satisfied:
        status = STATUS_PROVED_SCOPE
    elif satisfied:
        status = STATUS_PARTIAL
    else:
        status = STATUS_NOT_STARTED
    return {
        "status": status,
        "satisfied_axes": sorted(satisfied),
        "missing_axes": sorted(missing),
        "completion_claim": False,
    }


def completion_claim(units: list[dict], state: dict, evidence: dict) -> dict:
    derived = [derive_status(u, state, evidence) for u in units]
    all_verified = bool(derived) and all(d["status"] == STATUS_FULLY_VERIFIED for d in derived)
    all_legal = bool(units) and all(
        state.get("units", {}).get(u["normative_id"], {}).get("legal_review") == LEGAL_REVIEWED
        for u in units
    )
    return {
        "units_total": len(units),
        "fully_verified": sum(1 for d in derived if d["status"] == STATUS_FULLY_VERIFIED),
        "proved_scope": sum(1 for d in derived if d["status"] == STATUS_PROVED_SCOPE),
        "partial": sum(1 for d in derived if d["status"] == STATUS_PARTIAL),
        "not_started": sum(1 for d in derived if d["status"] == STATUS_NOT_STARTED),
        "blocked": sum(1 for d in derived if d["status"] == STATUS_BLOCKED),
        "stale": sum(1 for d in derived if d["status"] == STATUS_STALE),
        "human_legal_reviewed": sum(
            1 for u in units
            if state.get("units", {}).get(u["normative_id"], {}).get("legal_review") == LEGAL_REVIEWED
        ),
        "all_complete_claimable": all_verified and all_legal,
    }


if __name__ == "__main__":
    raise SystemExit(0)
