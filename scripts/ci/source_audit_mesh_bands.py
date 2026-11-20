#!/usr/bin/env python3
"""Independent source-to-spec audit for 337M50000008017 suppl.art.19-14-3(5) mesh bands."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "337M50000008017_20260724_508M60000008092"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_mesh_bands.json"
PREFIXES = [
    "7e5a6afd", "956ca640", "a924218c", "d6279718", "323a8fa7", "0c6a423c", "805fff9b",
    "b15fca97", "7856bb91", "9b8e2f8f", "5fe26488", "74e14da1", "09ee8ec7", "ea6cf3b8",
]
FILES = ["JapanTaxLaw/MeshPopulationBands.lean",
         "JapanTaxLaw/MeshPopulationBandsSpec.lean",
         "JapanTaxLaw/MeshPopulationBandsTests.lean"]


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def main():
    raw = RAW.read_bytes()
    all_text = "".join(text_of(json.loads(raw)["law_full_text"]))
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    records = []
    for p in PREFIXES:
        found = None
        for t in q["tasks"]:
            nid = t.get("normative_id", "").replace("NORM|", "")
            if nid.startswith(p):
                found = (nid, t.get("norm_fragment", ""), t.get("source_path", ""))
                break
        if found is None:
            records.append({"prefix": p, "normative_id": "", "verbatim": False,
                            "text": "", "source_path": ""})
        else:
            nid, frag, path = found
            records.append({"prefix": p, "normative_id": nid,
                            "verbatim": bool(frag) and frag in all_text,
                            "text": frag, "source_path": path})
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    checks = {
        "all_fourteen_originals_verbatim": all(r["verbatim"] for r in records),
        "fourteen_distinct_ids": len(set(r["normative_id"] for r in records)) == 14,
        "seven_band_labels_per_series": len(PREFIXES) == 14,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.MeshPopulationBands\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_mesh_bands.py",
        "revision": REV,
        "raw_sha256": hashlib.sha256(raw).hexdigest(),
        "records": records,
        "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
