#!/usr/bin/env python3
"""Independent source-to-spec audit for the 36 population-density band units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_density_bands.json"
FILES = ["JapanTaxLaw/PopulationDensityBands.lean",
         "JapanTaxLaw/PopulationDensityBandsSpec.lean",
         "JapanTaxLaw/PopulationDensityBandsTests.lean"]


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def main():
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    selected = [t for t in q["tasks"]
                if t.get("status") == "NOT_STARTED"
                and not t.get("dependencies") and not t.get("unhandled_conditions")
                and "処理区域内人口密度が" in (t.get("norm_fragment") or "")]
    cache = {}
    records = []
    for t in selected:
        sf = t.get("source_file", "")
        rawp = REPO / sf
        if sf not in cache and rawp.exists():
            cache[sf] = (rawp.read_bytes(), "".join(text_of(json.loads(rawp.read_bytes())["law_full_text"])))
        raw_bytes, all_text = cache.get(sf, (b"", ""))
        frag = t.get("norm_fragment", "")
        records.append({"normative_id": t.get("normative_id", ""),
                        "verbatim": bool(frag) and frag in all_text,
                        "text": frag, "source_path": t.get("source_path", ""),
                        "revision": t.get("revision", ""),
                        "raw_sha256": hashlib.sha256(raw_bytes).hexdigest() if raw_bytes else ""})
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    checks = {
        "all_units_verbatim": bool(records) and all(r["verbatim"] for r in records),
        "thirty_six_distinct_ids": len(set(r["normative_id"] for r in records)) == 36,
        "three_source_laws": len(set(r["normative_id"].split("|")[1][:10] for r in records)) >= 3,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.PopulationDensityBands\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_density_bands.py",
        "units_found": len(records),
        "records": records,
        "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
