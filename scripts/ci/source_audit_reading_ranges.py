#!/usr/bin/env python3
"""Independent source-to-spec audit for tobacco-tax mutatis-mutandis range units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_reading_ranges.json"
PREFIXES = [
    "d21017d5", "2800a9c2", "cb2e10c5",        # art.12 [4,8] prefectural
    "18ec913b", "4e7c68a2", "e1860be7",        # art.20 [4,8] municipal
    "2f965c8c", "65d300a9", "3aef20d2",        # art.52 [2,7]
    "520b1979", "1a654d57",                    # art.51 [2,8]
]
FILES = ["JapanTaxLaw/TobaccoTaxReadingRanges.lean",
         "JapanTaxLaw/TobaccoTaxReadingRangesSpec.lean",
         "JapanTaxLaw/TobaccoTaxReadingRangesTests.lean"]


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def main():
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    tasks = {t.get("normative_id", "").replace("NORM|", "")[:8]: t for t in q["tasks"]}
    cache = {}
    records = []
    for p in PREFIXES:
        t = tasks.get(p)
        rec = {"prefix": p, "normative_id": "", "verbatim": False, "text": "",
               "source_path": "", "revision": "", "raw_sha256": ""}
        if t:
            sf = t.get("source_file", "")
            raw_path = REPO / sf
            if sf not in cache and raw_path.exists():
                cache[sf] = "".join(text_of(json.loads(raw_path.read_bytes())["law_full_text"]))
            frag = t.get("norm_fragment", "")
            rec = {"prefix": p, "normative_id": "NORM|" + t.get("normative_id", "").replace("NORM|", ""),
                   "verbatim": bool(frag) and frag in cache.get(sf, ""),
                   "text": frag, "source_path": t.get("source_path", ""),
                   "revision": t.get("revision", ""),
                   "raw_sha256": hashlib.sha256(raw_path.read_bytes()).hexdigest() if raw_path.exists() else ""}
        records.append(rec)
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    checks = {
        "all_eleven_originals_verbatim": all(r["verbatim"] for r in records),
        "eleven_distinct_ids": len(set(r["normative_id"] for r in records)) == 11,
        "four_range_patterns":
            sum("道府県たばこ税" in r["text"] for r in records) == 3 and
            sum("市町村たばこ税" in r["text"] for r in records) == 3 and
            sum("第二項から第七項まで" in r["text"] for r in records) == 3 and
            sum("第二項から第八項まで" in r["text"] for r in records) == 2,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.TobaccoTaxReadingRanges\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_reading_ranges.py",
        "records": records,
        "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
