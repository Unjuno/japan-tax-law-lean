#!/usr/bin/env python3
"""附則 新/旧 reference context ledger (Objective §2).

For every reference recorded as HISTORICAL_VERSION in build/discovered_laws.json,
extract the *defining clause* (「...（以下「新X法」という。）」) from the pinned
raw snapshot of its base law. The clause identifies WHICH amendment the
reference denotes (e.g. 昭和59年4月1日施行の改正後所得税法). This is context
evidence only: it does NOT map the reference to a law-data revision, and it
explicitly reports when an acquired snapshot is a 2026 revision and therefore
cannot be the defined historical amendment.
"""
from __future__ import annotations

import json
import re
import sys
from collections import defaultdict
from datetime import date
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(REPO / "scripts" / "law_audit"))
import kansuji  # noqa: E402

DISCOVERED = REPO / "build" / "discovered_laws.json"
SNAPSHOTS = REPO / "data" / "historical_law_snapshots.json"
PINS = REPO / "data" / "historical_revision_pins.json"
OUT_JSON = REPO / "build" / "historical_reference_contexts.json"
OUT_MD = REPO / "docs" / "HISTORICAL_REFERENCE_CONTEXTS.md"
RAW = REPO / "data" / "raw"
ERA = re.compile(
    r"(昭和|平成|令和)([一二三四五六七八九十百〇零0-9]+)年"
    r"(?:([一二三四五六七八九十]+)月(?:([一二三四五六七八九十]+)日)?)?"
)
ERA_BASE = {"昭和": 1925, "平成": 1988, "令和": 2018}
ERA_FULL = re.compile(
    r"(?:昭和|平成|令和)[一二三四五六七八九十百〇零0-9]+年"
    r"(?:[一二三四五六七八九十]+月(?:[一二三四五六七八九十]+日)?)?"
)


def era_phrases_to_dates(phrases):
    """Conservative conversion of era phrases to ISO dates (best effort)."""
    out = set()
    for phrase in phrases:
        m = ERA.fullmatch(phrase)
        if not m:
            continue
        try:
            year = ERA_BASE[m.group(1)] + kansuji.kanji_to_int(m.group(2))
            month = kansuji.kanji_to_int(m.group(3)) if m.group(3) else 1
            day = kansuji.kanji_to_int(m.group(4)) if m.group(4) else 1
            out.add(date(year, month, day).isoformat())
        except Exception:
            continue
    return out


def flatten(root):
    out = []

    def walk(node):
        if isinstance(node, dict):
            children = node.get("children")
            if "tag" in node and isinstance(children, list) \
                    and all(isinstance(x, str) for x in children):
                out.append("".join(children))
            else:
                for value in (children if children is not None else node.values()):
                    walk(value)
        elif isinstance(node, list):
            for value in node:
                walk(value)

    walk(root)
    return "".join(out)


def main() -> int:
    discovered = json.loads(DISCOVERED.read_text(encoding="utf-8")) if DISCOVERED.exists() else {}
    refs = [e for e in discovered.get("entries", [])
            if e.get("resolution") == "HISTORICAL_VERSION"]
    snaps = {}
    if SNAPSHOTS.exists():
        sd = json.loads(SNAPSHOTS.read_text(encoding="utf-8"))
        snaps = {s["law_id"]: s for s in sd.get("records", []) if s.get("law_id")}
    cand = {}
    if PINS.exists():
        pd = json.loads(PINS.read_text(encoding="utf-8"))
        cand = {
            l["law_id"]: {c.get("amendment_enforcement_date") for c in l.get("historical_candidates", [])}
            for l in pd.get("laws", [])
        }

    files = defaultdict(list)
    for path in list(RAW.glob("*.law.json")) + list((RAW / "historical").glob("*.law.json")):
        try:
            law_id = json.loads(path.read_text(encoding="utf-8"))["law_info"]["law_id"]
        except Exception:
            continue
        files[law_id].append(path)

    cache = {}

    def full_text(law_id):
        if law_id not in cache:
            cache[law_id] = "".join(
                flatten(json.loads(p.read_text(encoding="utf-8"))["law_full_text"])
                for p in sorted(files[law_id])
            )
        return cache[law_id]

    entries = []
    for ref in sorted(refs, key=lambda x: (-x.get("occurrences", 0), x["name"])):
        law_id = ref.get("law_id", "")
        text = full_text(law_id)
        pattern = "以下「" + ref["name"] + "」という"
        hits = [m for m in re.finditer(re.escape(pattern), text)]
        samples = []
        for m in hits[:3]:
            a, b = max(0, m.start() - 220), min(len(text), m.end() + 220)
            segment = text[a:b]
            samples.append({
                "context": segment,
                "era_phrases": sorted(set(ERA_FULL.findall(segment))),
            })
        snap = snaps.get(law_id)
        conflict = bool(hits and snap and str(snap.get("enforcement_date", "")).startswith("2026"))
        era_dates = sorted(set().union(*[era_phrases_to_dates(s["era_phrases"]) for s in samples]))
        intersection = sorted(set(era_dates) & cand.get(law_id, set()))
        entries.append({
            "reference_name": ref["name"],
            "occurrences": ref.get("occurrences", 0),
            "base_law_id": law_id,
            "defining_clause_count": len(hits),
            "samples": samples,
            "status": ("CONTEXT_EXTRACTED_MAPPING_NOT_DONE" if hits
                       else "DEFINING_CLAUSE_NOT_FOUND"),
            "acquired_snapshot_revision": (snap or {}).get("revision", ""),
            "snapshot_is_2026_revision": conflict,
            "era_dates": era_dates,
            "candidate_dates_in_era": intersection,
            "pin_feasible": bool(intersection),
            "note": (
                "defining clause identifies the amendment; NO revision mapping performed"
                if hits else "no defining clause found in pinned base-law text; still unresolved"
            ),
        })

    payload = {
        "tool": "scripts/law_audit/inventory/historical_reference_contexts.py",
        "snapshot_date": discovered.get("inventory_snapshot_date", ""),
        "historical_references": len(entries),
        "with_defining_clause": sum(1 for e in entries if e["defining_clause_count"]),
        "without_defining_clause": sum(1 for e in entries if not e["defining_clause_count"]),
        "acquired_snapshot_conflicts": sum(1 for e in entries if e["snapshot_is_2026_revision"]),
        "pin_feasible_references": sum(1 for e in entries if e["pin_feasible"]),
        "entries": entries,
    }
    OUT_JSON.parent.mkdir(parents=True, exist_ok=True)
    OUT_JSON.write_text(json.dumps(payload, ensure_ascii=False, sort_keys=True), encoding="utf-8")

    lines = [
        "# 附則 historical reference contexts (machine-generated)",
        "",
        "Do not hand-edit. Regenerate: "
        "`python scripts/law_audit/inventory/historical_reference_contexts.py`.",
        "",
        "For each 新/旧法 reference this ledger records whether the pinned base-law "
        "snapshot contains the defining clause (以下「X」という), and the era/date "
        "phrases in its context. This narrows the historical target but does NOT "
        "map the reference to a law-data revision. An acquired snapshot dated 2026 "
        "cannot be the historical amendment defined in a 昭和/平成 附則 and is "
        "flagged as a conflict, never as a mapping.",
        "",
        f"- historical references: {payload['historical_references']}",
        f"- with defining clause: {payload['with_defining_clause']}",
        f"- without defining clause: {payload['without_defining_clause']}",
        f"- acquired-snapshot conflicts: {payload['acquired_snapshot_conflicts']}",
        f"- references with a candidate enforcement date in their 附則 context: "
        f"{payload['pin_feasible_references']} (mapped: 0)",
        "",
        "| reference | occurrences | base law | defining clauses | status | 2026 conflict | pin feasible |",
        "|---|---:|---|---:|---|---|---|",
    ]
    for e in entries:
        lines.append(
            f"| {e['reference_name']} | {e['occurrences']} | `{e['base_law_id']}` | "
            f"{e['defining_clause_count']} | {e['status']} | "
            f"{'YES' if e['snapshot_is_2026_revision'] else 'no'} | "
            f"{'YES' if e['pin_feasible'] else 'no'} |"
        )
    lines.append("")
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print(f"historical reference contexts: {len(entries)} references, "
          f"{payload['with_defining_clause']} defining clauses extracted, "
          f"{payload['acquired_snapshot_conflicts']} snapshot conflicts "
          f"(mapping NOT done)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
