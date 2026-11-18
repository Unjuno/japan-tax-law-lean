#!/usr/bin/env python3
"""Per-law verification status ledger (Objective §1/§6/§7).

Records the verification status of EVERY law in the authoritative ledger, one
row per law — not just the modelled ones. Status columns derive only from
machine-generated inputs:

  * INVENTORY.json            — law id, title, revision, enforcement status
  * audit_sweep.json          — parse/audit status and structural counts
  * transcription_audit checks — pinned literal checks (semantic modelling)
  * ADVERSARIAL_REVIEW.md     — independent review coverage
  * L7 candidates CSV         — human legal review (reviewer / review_date)

Reading a law into the corpus is NOT semantic modelling; a fidelity-only
literal check is NOT legal review. Columns are kept separate and never
collapsed into a single completion flag.

Regenerate with `python scripts/ci/law_status_ledger.py`; deterministic gate.
"""
from __future__ import annotations

import csv
import importlib.util
import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
INVENTORY = REPO / "data" / "INVENTORY.json"
SWEEP = REPO / "build" / "audit_sweep.json"
AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"
REVIEW = REPO / "docs" / "ADVERSARIAL_REVIEW.md"
CANDIDATES = REPO / "docs" / "L7_CANDIDATES_UNREVIEWED.csv"
OUT = REPO / "docs" / "LAW_STATUS.md"


def audit_checks():
    spec = importlib.util.spec_from_file_location("ls_ta", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return list(mod.checks())


def build() -> str:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    sweep = json.loads(SWEEP.read_text(encoding="utf-8")) if SWEEP.exists() else {}
    sweep_laws = sweep.get("laws", {})
    checks = audit_checks()
    pinned_laws = {cid for _, cid, _, _, _ in checks}
    pin_counts: dict[str, int] = {}
    for _, cid, _, _, _ in checks:
        pin_counts[cid] = pin_counts.get(cid, 0) + 1

    review_text = REVIEW.read_text(encoding="utf-8") if REVIEW.exists() else ""
    review_modules = set(re.findall(r"(\w+\.lean)", review_text))

    human_reviewed_laws: set[str] = set()
    if CANDIDATES.exists():
        with CANDIDATES.open(encoding="utf-8", newline="") as f:
            for row in csv.DictReader(f):
                if (row.get("reviewer") or "").strip():
                    human_reviewed_laws.add(row.get("law_id", ""))

    rows = []
    for law in inv.get("laws", []):
        lid = law["law_id"]
        sw = sweep_laws.get(lid, {})
        title = (law.get("official_title") or "").replace("|", "\\|")
        rev = ((law.get("current_revision") or {}).get("law_revision_id") or "-")
        status = (law.get("current_revision_status") or "-")
        raw = "YES" if (law.get("raw_snapshot") or {}).get("source_file") else "NO"
        parse = sw.get("status", "-")
        articles = sw.get("articles_checked", 0)
        pinned = "YES" if lid in pinned_laws else "NO"
        pins = pin_counts.get(lid, 0)
        reviewed = "YES" if lid in human_reviewed_laws else "NO"
        rows.append(
            f"| `{lid}` | {title[:44]} | {rev} | {status} | {raw} | {parse} | "
            f"{articles} | {pinned} ({pins}) | {reviewed} |"
        )

    n = len(rows)
    n_raw = sum(1 for l in inv.get("laws", []) if (l.get("raw_snapshot") or {}).get("source_file"))
    n_parse = sum(1 for l in inv.get("laws", []) if sweep_laws.get(l["law_id"], {}).get("status") == "ok")
    n_pinned = len(pinned_laws)

    lines = [
        "# Per-law verification status (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/law_status_ledger.py`.",
        "",
        "Objective §1/§6/§7: one row for EVERY law in the authoritative ledger,",
        "including laws with no semantic model. Columns are separate: ingesting a",
        "law is not parsing it, parsing is not semantic modelling, and a fidelity-",
        "only literal check is not human legal review. No column is collapsed into",
        "a completion flag.",
        "",
        f"- laws in ledger: {n}",
        f"- with pinned raw snapshot: {n_raw}",
        f"- structural audit status ok: {n_parse}",
        f"- with >=1 pinned literal check (semantic model): {n_pinned}",
        f"- with recorded human legal review: {len(human_reviewed_laws)}",
        "",
        "## All laws",
        "",
        "| law_id | title | revision | enforcement | raw | parse | articles | pinned checks | human review |",
        "|---|---|---|---|---|---|---:|---|---|",
        *rows,
        "",
        f"review modules seen in docs/ADVERSARIAL_REVIEW.md: {len(review_modules)}",
        "",
    ]
    return "\n".join(lines)


def main() -> int:
    text = build()
    if OUT.exists() and OUT.read_text(encoding="utf-8") == text:
        print("law status ledger matches committed state (deterministic)")
        return 0
    OUT.write_text(text, encoding="utf-8")
    print("wrote", OUT)
    return 1


if __name__ == "__main__":
    sys.exit(main())
