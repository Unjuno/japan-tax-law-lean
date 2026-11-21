#!/usr/bin/env python3
"""Independent source-to-spec audit for the 7219 bare field/period units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_barefields.json"
FILES = ["JapanTaxLaw/BareFieldsAndPeriods.lean",
         "JapanTaxLaw/BareFieldsAndPeriodsSpec.lean",
         "JapanTaxLaw/BareFieldsAndPeriodsTests.lean"]


def classify(f):
    if not f:
        return None
    if "事業年度" in f and len(f) <= 25:
        return "fiscal_year_term"
    if "徴収取扱費算定期間" in f:
        return "collection_period"
    if f.startswith("＝") or f.startswith("０．") or f.startswith("０"):
        return "numeric_value"
    if (f.startswith("（") and "条" in f) or f.startswith("第三章") or f.startswith("第二項"):
        return "structural_ref"
    if any(k in f for k in ("氏名", "住所", "申請", "届出")):
        return "form_field"
    if "割合" in f or "共有持分" in f:
        return "ratio_term"
    if "次に掲げる" in f:
        return "enumerated_intro"
    if "公布の日から起算して" in f:
        return "enforcement_window"
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
        if t.get("status") != "NOT_STARTED" or t.get("dependencies") or not t.get("unhandled_conditions"):
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
        "expected_count_7219": len(records) == 7219,
        "eight_families_present": len(counts) == 8,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.BareFieldsAndPeriods\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_barefields.py",
        "units_found": len(records), "family_counts": counts,
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
