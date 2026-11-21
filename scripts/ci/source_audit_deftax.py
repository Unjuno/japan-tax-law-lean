#!/usr/bin/env python3
"""Independent source-to-spec audit for the 1013 definition/tax-base units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_deftax.json"
FILES = ["JapanTaxLaw/DefinitionAndTaxBaseNorms.lean",
         "JapanTaxLaw/DefinitionAndTaxBaseNormsSpec.lean",
         "JapanTaxLaw/DefinitionAndTaxBaseNormsTests.lean"]


def classify(f):
    if not f:
        return None
    if f.endswith("）") and ("という" in f or "以下" in f) and len(f) < 100 and "定義" in f:
        return "definition"
    if "とは、" in f and "いう" in f:
        return "definition"
    if "税率" in f and "別表" in f:
        return "rate_by_table"
    if "課税標準" in f and "とする" in f:
        return "tax_base"
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
    counts = {}
    for r in records:
        counts[r["family"]] = counts.get(r["family"], 0) + 1
    checks = {
        "all_units_verbatim": bool(records) and all(r["verbatim"] for r in records),
        "expected_count_1013": len(records) == 1013,
        "three_families_present": len(counts) == 3,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.DefinitionAndTaxBaseNorms\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_deftax.py",
        "units_found": len(records), "family_counts": counts,
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
