#!/usr/bin/env python3
"""Independent source-to-spec audit for 325AC0000000073 art.39/42 deemed dates."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "325AC0000000073_20260401_506AC0000000008"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_deemed_dates.json"
PREFIXES = [
    "5336c555", "f37de1f3", "fa376921",
    "7e775794", "4b7f57cf", "f8c24193",
]
FILES = ["JapanTaxLaw/DeemedFilingDates.lean",
         "JapanTaxLaw/DeemedFilingDatesSpec.lean",
         "JapanTaxLaw/DeemedFilingDatesTests.lean"]


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
        rec = {"prefix": p, "normative_id": "", "verbatim": False, "text": "", "source_path": ""}
        for t in q["tasks"]:
            nid = t.get("normative_id", "").replace("NORM|", "")
            if nid.startswith(p):
                frag = t.get("norm_fragment", "")
                rec = {"prefix": p, "normative_id": "NORM|" + nid,
                       "verbatim": bool(frag) and frag in all_text,
                       "text": frag, "source_path": t.get("source_path", "")}
                break
        records.append(rec)
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    checks = {
        "all_six_originals_verbatim": all(r["verbatim"] for r in records),
        "six_distinct_ids": len(set(r["normative_id"] for r in records)) == 6,
        "three_patterns_present":
            sum("提出する日" in r["text"] for r in records) >= 2 and
            sum("訂正又は提出" in r["text"] for r in records) >= 2 and
            sum("措置をとる日" in r["text"] for r in records) >= 1,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.DeemedFilingDates\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_deemed_dates.py",
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
