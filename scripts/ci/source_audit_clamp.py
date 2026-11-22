#!/usr/bin/env python3
"""Independent source-to-spec audit for the 52 clamp/boundary operator units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_clamp.json"
FILES = ["JapanTaxLaw/ClampOperators.lean",
         "JapanTaxLaw/ClampOperatorsSpec.lean",
         "JapanTaxLaw/ClampOperatorsTests.lean"]


def classify(f):
    if not f:
        return None
    for needle in ["負数となるときは、０とする", "負数となるときは、零とする", "負となった場合"]:
        if needle in f:
            return "neg_to_zero"
    for needle in ["を下回る場合は", "を下回るときは", "未満の場合は"]:
        if needle in f:
            return "below_floor"
    for needle in ["を上回る場合は", "を上回るときは", "を超える場合は"]:
        if needle in f:
            return "above_cap"
    return None


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def main():
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    selected = []
    for t in q["tasks"]:
        if t.get("status") != "NOT_STARTED":
            continue
        fam = classify((t.get("norm_fragment") or "").strip())
        if fam:
            selected.append((t, fam))
    cache = {}
    records = []
    for t, fam in selected:
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
                        "family": fam, "text": frag,
                        "source_path": t.get("source_path", ""),
                        "revision": t.get("revision", ""), "raw_sha256": sha})
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    checks = {
        "all_units_verbatim": bool(records) and all(r["verbatim"] for r in records),
        "expected_count_52": len(records) == 52,
        "three_families_present": len({r["family"] for r in records}) == 3,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.ClampOperators\n" not in spec,
    }
    rec = {"tool": "scripts/ci/source_audit_clamp.py",
           "units_found": len(records), "records": records, "checks": checks,
           "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES}}
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
