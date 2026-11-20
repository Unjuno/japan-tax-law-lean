#!/usr/bin/env python3
"""Independent source-to-spec audit for the 1175 enum-ref/operator units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_enumrefs.json"
FILES = ["JapanTaxLaw/EnumRefsAndOperators.lean",
         "JapanTaxLaw/EnumRefsAndOperatorsSpec.lean",
         "JapanTaxLaw/EnumRefsAndOperatorsTests.lean"]
KANJI = set("一二三四五六七八九十百千零〇")


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def main():
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    selected = []
    for t in q["tasks"]:
        if t.get("status") != "NOT_STARTED" or t.get("dependencies") or t.get("unhandled_conditions"):
            continue
        f = (t.get("norm_fragment") or "").strip()
        if not f:
            continue
        if all(ch in KANJI or ch in "からまで及び、及びの" for ch in f) and any(x in f for x in ("から", "まで", "及び", "、")):
            fam = "range_enum"
        elif f.startswith("同") and len(f) <= 12 and ("条" in f or "項" in f or "号" in f or "法" in f):
            fam = "short_xref"
        elif f == "次の各号によつて算定した額の合算額とする。":
            fam = "sum_calc"
        elif "百円未満の端数" in f and "切り捨てる" in f:
            fam = "round_down_100"
        else:
            continue
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
        "expected_count_1175": len(records) == 1175,
        "four_families_present": len(counts) == 4,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.EnumRefsAndOperators\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_enumrefs.py",
        "units_found": len(records), "family_counts": counts,
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
