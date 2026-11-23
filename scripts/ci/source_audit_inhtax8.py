#!/usr/bin/env python3
"""Per-provision source audit: 相続税法 第八条 (2 proviso items, 実質的形式化)."""
from __future__ import annotations
import hashlib, json, sys
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_inhtax8.json"
EXPECTED = 2
# 第八条の2つの号（ただし書例外）の規範 id
IDS = {
 "NORM|6935c6cb4be9fc5938f7ff6b768e1eaa590f06a2c83076c0003215fa1dbd4ccc",  # 号1 免除
 "NORM|943923680fa5520263f1b339fd12269b63d60aa5346652e82a84b6fad6659872",  # 号2 引受/弁済
}


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def main():
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    selected = [t for t in q["tasks"] if t.get("normative_id") in IDS]
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
                        "family": "inheritance_tax_art8", "text": frag,
                        "source_path": t.get("source_path", ""),
                        "revision": t.get("revision", ""), "raw_sha256": sha})
    checks = {"all_units_verbatim": len(records) == EXPECTED and all(r["verbatim"] for r in records),
              "expected_count": len(records) == EXPECTED,
              "all_units_no_unhandled": all(not t.get("unhandled_conditions") for t in selected)}
    mod = "JapanTaxLaw/InheritanceTaxDebtForgiveness"
    rec = {"tool": "scripts/ci/source_audit_inhtax8.py", "article": "相続税法 第八条",
           "provision": "per-provision formalization (debt forgiveness / supporter payment deemed-gift exception)",
           "units_found": len(records), "records": records, "checks": checks,
           "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest()
                             for p in [mod + ".lean", mod + "Spec.lean", mod + "Tests.lean"]}}
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
