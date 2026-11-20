#!/usr/bin/env python3
"""Independent source-to-spec audit for the 238 pure rounding-rule units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_rounding.json"
FILES = ["JapanTaxLaw/RoundingRules.lean",
         "JapanTaxLaw/RoundingRulesSpec.lean",
         "JapanTaxLaw/RoundingRulesTests.lean"]


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
                if "端数" in (t.get("norm_fragment") or "")
                and any(k in (t.get("norm_fragment") or "") for k in ("四捨五入", "切り捨て", "切捨て"))
                and len((t.get("norm_fragment") or "").strip()) <= 60]
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
        kind = "round_half_up" if "四捨五入" in frag else "floor"
        records.append({"normative_id": t.get("normative_id", ""),
                        "verbatim": bool(frag) and frag in all_text,
                        "kind": kind, "text": frag,
                        "source_path": t.get("source_path", ""),
                        "revision": t.get("revision", ""), "raw_sha256": sha})
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    checks = {
        "all_units_verbatim": bool(records) and all(r["verbatim"] for r in records),
        "expected_count_238": len(records) == 238,
        "both_rounding_kinds": len(set(r["kind"] for r in records)) == 2,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.RoundingRules\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_rounding.py",
        "units_found": len(records),
        "kind_counts": {k: sum(r["kind"] == k for r in records) for k in ("round_half_up", "floor")},
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
