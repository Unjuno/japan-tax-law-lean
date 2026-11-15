#!/usr/bin/env python3
"""Phase E seed — cross-law pin consistency checker (L1 <-> L3).

Verifies that every pinned provenance header in ``JapanTaxLaw/*.lean`` is
consistent with the authoritative ledger ``data/INVENTORY.json`` (Phase A):

* ``Law id:`` must name a law present in the ledger;
* ``Revision:`` must equal ``current_revision.law_revision_id`` of that
  ledger entry (byte-for-byte, after trimming);
* ``Raw snapshot sha256:`` must equal ``raw_snapshot.source_sha256``
  (case-insensitive compare; both sides are upper-case in practice);
* ``current_revision_status`` of the ledger entry must be ``CurrentEnforced``;
* ``audit_ready`` of the ledger entry must be true;
* ledger-unresolved laws (``summary.unresolved`` — fully unenforced laws
  such as 508CO0000000106 / 508M60000040027) must never be pinned by any
  Lean module.

Modules carrying only a ``Revision:`` pin (e.g. ``*Spec.lean`` files) are
resolved by matching the pin against ``summary``-recorded current revisions.
A revision pin that matches no ledger entry is a hard failure.

Modules with no pins at all are *not* counted as verified; they are
listed under ``unpinned`` in the report so the unverified surface stays
visible.

Byte-level hash verification of the raw snapshots themselves is done by
``scripts/law_audit/inventory/validate_inventory.py``; this checker covers
the Lean-to-ledger consistency layer only.

Exit 0 iff every pinned header is consistent; exit 1 otherwise.
Emits ``build/cross_law.json`` with the full per-module report unless
``--out`` overrides it.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
LEAN_DIR = REPO_ROOT / "JapanTaxLaw"
INVENTORY = REPO_ROOT / "data" / "INVENTORY.json"
OUT = REPO_ROOT / "build" / "cross_law.json"

LAW_ID_RE = re.compile(r"Law id:\s*([0-9A-Za-z]{15})")
REVISION_RE = re.compile(r"Revision:\s*([0-9A-Za-z_]+)")
SHA_RE = re.compile(r"Raw snapshot sha256:\s*([0-9A-Fa-f]{64})")
ENFORCE_RE = re.compile(r"Amendment enforcement date:\s*([0-9]{4}-[0-9]{2}-[0-9]{2})")


def load_inventory(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def index_ledger(inv: dict) -> dict[str, dict]:
    return {rec["law_id"]: rec for rec in inv.get("laws", [])}


def unresolved_ids(inv: dict) -> set[str]:
    return {u.get("law_id") for u in inv.get("summary", {}).get("unresolved", [])}


def revision_index(inv: dict) -> dict[str, str]:
    """Map law_revision_id -> law_id using the ledger's current pins."""
    out: dict[str, str] = {}
    for rec in inv.get("laws", []):
        cur = rec.get("current_revision") or {}
        rid = cur.get("law_revision_id")
        if rid:
            out.setdefault(rid, rec["law_id"])
    return out


def parse_pins(text: str) -> dict:
    return {
        "law_ids": LAW_ID_RE.findall(text),
        "revisions": REVISION_RE.findall(text),
        "sha256s": [s.upper() for s in SHA_RE.findall(text)],
        "enforcement_dates": ENFORCE_RE.findall(text),
    }


def check_module(name: str, pins: dict, inv: dict) -> dict:
    problems: list[str] = []
    by_id = index_ledger(inv)
    rev_to_id = revision_index(inv)
    unresolved = unresolved_ids(inv)

    pinned = bool(pins["law_ids"] or pins["revisions"] or pins["sha256s"])

    # Hard rule: unresolved laws may never be pinned.
    for lid in pins["law_ids"]:
        if lid in unresolved:
            problems.append(f"{name}: pins unresolved (unenforced) law {lid}")
    for rev in pins["revisions"]:
        lid = rev_to_id.get(rev)
        if lid in unresolved:
            problems.append(f"{name}: revision pin matches unresolved law {lid}")

    # Law-id pins: full consistency check against the ledger entry.
    for lid in sorted(set(pins["law_ids"])):
        rec = by_id.get(lid)
        if rec is None:
            problems.append(f"{name}: law_id {lid} not present in ledger")
            continue
        cr = rec.get("current_revision") or {}
        if rec.get("current_revision_status") != "CurrentEnforced":
            problems.append(
                f"{name}: ledger status for {lid} is "
                f"{rec.get('current_revision_status')!r}, expected 'CurrentEnforced'"
            )
        if not rec.get("audit_ready"):
            problems.append(f"{name}: ledger audit_ready is not true for {lid}")
        if pins["revisions"]:
            expected_rev = cr.get("law_revision_id")
            for rev in pins["revisions"]:
                if rev != expected_rev:
                    problems.append(
                        f"{name}: Revision {rev} != ledger current_revision.law_revision_id "
                        f"{expected_rev}"
                    )
        if pins["sha256s"]:
            snap = rec.get("raw_snapshot") or {}
            expected_sha = (snap.get("source_sha256") or "").upper()
            if not expected_sha:
                problems.append(f"{name}: ledger has no raw_snapshot.source_sha256 for {lid}")
            for sha in pins["sha256s"]:
                if sha != expected_sha:
                    problems.append(
                        f"{name}: Raw snapshot sha256 {sha} != ledger {expected_sha}"
                    )
        if pins["enforcement_dates"]:
            expected_date = cr.get("amendment_enforcement_date")
            for d in pins["enforcement_dates"]:
                if expected_date and d != expected_date:
                    problems.append(
                        f"{name}: Amendment enforcement date {d} != ledger {expected_date}"
                    )

    # Revision-only / sha-only pins not anchored to a law-id line.
    if not pins["law_ids"]:
        for rev in sorted(set(pins["revisions"])):
            lid = rev_to_id.get(rev)
            if lid is None:
                problems.append(f"{name}: Revision {rev} matches no ledger current_revision")
        for sha in sorted(set(pins["sha256s"])):
            matches = [
                rec["law_id"]
                for rec in inv.get("laws", [])
                if ((rec.get("raw_snapshot") or {}).get("source_sha256") or "").upper() == sha
            ]
            if not matches:
                problems.append(f"{name}: Raw snapshot sha256 {sha} matches no ledger entry")

    return {
        "file": name,
        "pinned": pinned,
        "law_ids": sorted(set(pins["law_ids"])),
        "revisions": sorted(set(pins["revisions"])),
        "sha256s": sorted(set(pins["sha256s"])),
        "ok": not problems,
        "problems": problems,
    }


def run(lean_dir: Path, inventory_path: Path) -> dict:
    inv = load_inventory(inventory_path)
    modules = []
    for path in sorted(lean_dir.glob("*.lean")):
        text = path.read_text(encoding="utf-8")
        modules.append(check_module(path.name, parse_pins(text), inv))

    ok_files = [m for m in modules if m["ok"]]
    bad_files = [m for m in modules if not m["ok"]]
    unpinned = [m["file"] for m in modules if not m["pinned"]]

    report = {
        "tool": "phase_e.cross_law",
        "snapshot_date": inv.get("snapshot_date"),
        "inventory": str(inventory_path.relative_to(REPO_ROOT))
        if inventory_path.is_relative_to(REPO_ROOT)
        else str(inventory_path),
        "modules": modules,
        "summary": {
            "lean_files_scanned": len(modules),
            "pinned_modules_ok": sum(1 for m in ok_files if m["pinned"]),
            "pinned_modules_failed": sum(1 for m in bad_files if m["pinned"]),
            "unpinned_modules": unpinned,
            "unresolved_unenforced_laws": sorted(unresolved_ids(inv)),
        },
        "ok": not bad_files,
    }
    return report


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--lean-dir", type=Path, default=LEAN_DIR)
    ap.add_argument("--inventory", type=Path, default=INVENTORY)
    ap.add_argument("--out", type=Path, default=OUT)
    args = ap.parse_args()

    if not args.lean_dir.is_dir():
        print(f"cross_law: lean dir not found: {args.lean_dir}", file=sys.stderr)
        return 2
    if not args.inventory.is_file():
        print(f"cross_law: inventory not found: {args.inventory}", file=sys.stderr)
        return 2

    report = run(args.lean_dir, args.inventory)
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")

    s = report["summary"]
    print(
        f"cross_law: scanned {s['lean_files_scanned']} Lean files; "
        f"{s['pinned_modules_ok']} pinned modules consistent, "
        f"{s['pinned_modules_failed']} failed; "
        f"{len(s['unpinned_modules'])} unpinned (not counted as verified); "
        f"unresolved unenforced laws: {', '.join(s['unresolved_unenforced_laws']) or 'none'}"
    )
    for m in report["modules"]:
        if not m["ok"]:
            for p in m["problems"]:
                print(" -", p)
    return 0 if report["ok"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
