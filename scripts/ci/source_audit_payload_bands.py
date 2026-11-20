#!/usr/bin/env python3
"""Independent source-to-spec audit for 325AC0000000226 art.154 payload bands."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "325AC0000000226_20261101_508AC0000000002"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_payload_bands.json"
PREFIXES = ["9cf93318", "692c5b69", "293353f2", "91af3e06", "ff858937",
            "fdfc8470", "80f61c42", "7930e068", "cb4adfc0"]
FILES = ["JapanTaxLaw/PayloadCapacityBands.lean",
         "JapanTaxLaw/PayloadCapacityBandsSpec.lean",
         "JapanTaxLaw/PayloadCapacityBandsTests.lean"]


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def main():
    raw = RAW.read_bytes()
    all_text = "".join(text_of(json.loads(raw)["law_full_text"]))
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    tasks = {t.get("normative_id", "").replace("NORM|", "")[:8]: t for t in q["tasks"]}
    records = []
    for p in PREFIXES:
        t = tasks.get(p)
        if t:
            frag = t.get("norm_fragment", "")
            records.append({"prefix": p,
                            "normative_id": "NORM|" + t.get("normative_id", "").replace("NORM|", ""),
                            "verbatim": bool(frag) and frag in all_text,
                            "text": frag, "source_path": t.get("source_path", "")})
        else:
            records.append({"prefix": p, "normative_id": "", "verbatim": False,
                            "text": "", "source_path": ""})
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    checks = {
        "all_nine_originals_verbatim": all(r["verbatim"] for r in records),
        "nine_distinct_ids": len(set(r["normative_id"] for r in records)) == 9,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.PayloadCapacityBands\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_payload_bands.py",
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
