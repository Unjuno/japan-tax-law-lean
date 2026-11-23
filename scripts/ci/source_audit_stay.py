#!/usr/bin/env python3
"""Per-provision source audit: 地方税法 第十五条の七 (2 units)."""
from __future__ import annotations
import hashlib, json, sys
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_stay.json"
EXPECTED = 2


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def main():
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    selected = [t for t in q["tasks"] if t.get("status") == "NOT_STARTED"
                and t.get("law_title") == "地方税法" and t.get("article") == "15_7"]
    cache = {}
    records = []
    for t in selected:
        sf = t.get("source_file", "")
        if sf not in cache:
            rawp = REPO / sf
            raw = rawp.read_bytes()
            cache[sf] = (hashlib.sha256(raw).hexdigest(),
                         "".join(text_of(json.loads(raw)["law_full_text"])))
        sha, all_text = cache[sf]
        frag = (t.get("norm_fragment") or "").strip()
        records.append({"normative_id": t.get("normative_id", ""),
                        "verbatim": bool(frag) and frag in all_text,
                        "family": "local_tax_collection_stay", "text": frag,
                        "source_path": t.get("source_path", ""),
                        "revision": t.get("revision", ""), "raw_sha256": sha})
    checks = {"all_units_verbatim": len(records) == EXPECTED and all(r["verbatim"] for r in records),
              "expected_count": len(records) == EXPECTED,
              "all_units_no_unhandled": all(not t.get("unhandled_conditions") for t in selected)}
    mod = "JapanTaxLaw/LocalTaxCollectionStay"
    rec = {"tool": "scripts/ci/source_audit_stay.py", "article": "地方税法 第十五条の七",
           "provision": "per-provision (collection stay: hardship ground + 3-year stay→obligation extinction)",
           "units_found": len(records), "records": records, "checks": checks,
           "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest()
                             for p in [mod + ".lean", mod + "Spec.lean", mod + "Tests.lean"]}}
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
