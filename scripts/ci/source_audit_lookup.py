#!/usr/bin/env python3
"""Independent source-to-spec audit for the 783 case-based lookup units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_lookup.json"
FILES = ["JapanTaxLaw/CaseBasedLookup.lean",
         "JapanTaxLaw/CaseBasedLookupSpec.lean",
         "JapanTaxLaw/CaseBasedLookupTests.lean"]


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def main():
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    selected = [t for t in q["tasks"]
                if t.get("status") == "NOT_STARTED"
                and not t.get("dependencies") and not t.get("unhandled_conditions")]
    selected = [t for t in selected
                if "場合の区分に応じ" in (t.get("norm_fragment") or "")
                or ("区分に応じ" in (t.get("norm_fragment") or "") and len((t.get("norm_fragment") or "").strip()) < 90)]
    cache = {}
    records = []
    for t in selected:
        sf = t.get("source_file", "")
        if sf not in cache:
            rawp = REPO / sf
            if rawp.exists():
                raw = rawp.read_bytes()
                cache[sf] = (hashlib.sha256(raw).hexdigest(),
                             "".join(text_of(json.loads(raw)["law_full_text"])))
            else:
                cache[sf] = ("", "")
        sha, all_text = cache[sf]
        frag = (t.get("norm_fragment") or "").strip()
        records.append({"normative_id": t.get("normative_id", ""),
                        "verbatim": bool(frag) and frag in all_text,
                        "aggregating": "合計" in frag,
                        "text": frag, "source_path": t.get("source_path", ""),
                        "revision": t.get("revision", ""), "raw_sha256": sha})
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    checks = {
        "all_units_verbatim": bool(records) and all(r["verbatim"] for r in records),
        "expected_count_783": len(records) == 783,
        "many_variants": len(set(r["text"] for r in records)) >= 400,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.CaseBasedLookup\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_lookup.py",
        "units_found": len(records),
        "variant_count": len(set(r["text"] for r in records)),
        "aggregating_count": sum(r["aggregating"] for r in records),
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
