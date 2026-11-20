#!/usr/bin/env python3
"""Independent audit of build/task_queue.json against Objective §1.

Read-only verifier: checks the measured invariants of the generated queue and
exits non-zero on failure. Handles both the flat (one task = one normative unit)
and nested (task with normative_units[]) schemas.

Usage: python scripts/ci/verify_queue_invariants.py
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
EXPECTED = {"NOT_STARTED", "PARTIAL", "PROVED_SCOPE", "FULLY_VERIFIED", "BLOCKED"}

results = []


def check(name, cond, detail=""):
    results.append((name, bool(cond), detail))
    print(f"{'PASS' if cond else 'FAIL'} {name}" + (f" - {detail}" if detail else ""))


def main() -> int:
    results.clear()  # allow repeated in-process runs (tests / CI retries)
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    tasks = q.get("tasks", [])
    units = []
    for t in tasks:
        nested = t.get("normative_units")
        if nested:
            units.extend(nested)
        else:
            units.append(t)

    check("normative units generated", len(units) > 0, f"{len(units)} units")
    ids = [u.get("normative_id") for u in units]
    check("all normative ids present", all(ids))
    ids_str = [str(i) for i in ids]
    check("normative ids unique", len(set(ids_str)) == len(ids_str),
          f"{len(ids_str) - len(set(ids_str))} duplicates")
    # The canonical id carries a stable "NORM|" namespace prefix followed by
    # the full 64-hex SHA-256 (see normative_core.make_normative_id).
    check("normative ids are 64-hex after namespace prefix",
          all(re.fullmatch(r"(?:NORM\|)?[0-9a-f]{64}", i) for i in ids_str))

    vocab = set(q.get("status_values", q.get("status_vocabulary", [])))
    if not vocab:
        vocab = set(q.get("completion_rule", {}).get("statuses", [])) if isinstance(
            q.get("completion_rule"), dict) else set()
    check("status vocabulary is five-valued", vocab == EXPECTED, str(sorted(vocab)))

    statuses = {u.get("status") for u in units}
    check("only declared statuses used", statuses <= EXPECTED, str(sorted(statuses)))
    counts = q.get("status_counts", {})
    # Accept FULLY_VERIFIED only when every evidence axis is backed in the
    # committed ledger. The old rule (FULLY_VERIFIED must be zero) punished
    # successful verification; accepting FV without evidence rewards a false
    # completion claim. Check backing, not absence.
    evidence_path = REPO / "data" / "verification_evidence.json"
    evidence = {}
    if evidence_path.exists():
        try:
            evidence = json.loads(evidence_path.read_text(encoding="utf-8")).get("units", {})
        except (ValueError, OSError):
            evidence = {}
    # Required axes come from the canonical core, never from the ledger under
    # test: a partial ledger must not redefine what counts as complete.
    # The script is also imported in-process by tests, so its own directory is
    # not necessarily on sys.path.
    sys.path.insert(0, str(Path(__file__).resolve().parent))
    import normative_core  # noqa: E402
    axes = set(normative_core.EVIDENCE_AXES)
    fv_units = [u for u in units if u.get("status") == "FULLY_VERIFIED"]
    unbacked = [str(u.get("normative_id", ""))[:24] for u in fv_units
                if not evidence.get(str(u.get("normative_id", "")), {})
                or any(not str(evidence[str(u.get("normative_id", ""))].get(a, "")).strip()
                       for a in axes)]
    check("every FULLY_VERIFIED is evidence-backed",
          (not fv_units) or (bool(axes) and not unbacked),
          f"FULLY_VERIFIED={len(fv_units)} axes={len(axes)} unbacked={len(unbacked)}")

    sample = units[0]
    required = ("normative_id", "law_id", "article", "source_path", "kind",
                "text", "dependencies", "obligations", "owner", "blockers",
                "artifacts", "status")
    missing = [f for f in required if f not in sample]
    check("unit carries provenance/evidence fields", not missing, str(missing))

    kinds = {u.get("kind") for u in units}
    check("normative decomposition has multiple kinds", len(kinds) >= 4, str(sorted(str(k) for k in kinds)))
    check("UNRESOLVED norms recorded",
          any(str(k).upper() == "UNRESOLVED" for k in kinds)
          or any("unresolved" in str(u.get("kinds", "")).lower() for u in units[:2000]))

    dep_types = set()
    for u in units[:20000]:
        for d in u.get("dependencies", []):
            dep_types.add(d.get("type", d.get("kind")))
    check("dependencies beyond 15-digit id", len(dep_types) >= 2,
          str(sorted(str(x) for x in dep_types)))

    check("legal review is a separate axis",
          any(u.get("legal_review") for u in units[:100]) or "legal_review_axis" in q,
          str(q.get("legal_review_axis"))[:80])

    bad = [n for n, ok, _ in results if not ok]
    print(f"\n{len(results) - len(bad)}/{len(results)} invariants passed")
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
