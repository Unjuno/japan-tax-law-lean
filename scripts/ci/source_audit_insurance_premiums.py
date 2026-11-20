#!/usr/bin/env python3
"""Independent source-to-spec audit for art.34/314-2 insurance-premium exceptions."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "325AC0000000226_20261101_508AC0000000002"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_insurance_premiums.json"
PREFIXES = ["8b3f454c", "7da52ff0", "81429a90", "8e6b66d0",
            "9946d9cd", "dd4c6c5b", "ade9b9a4", "109c0429"]
FILES = ["JapanTaxLaw/InsurancePremiumExceptions.lean",
         "JapanTaxLaw/InsurancePremiumExceptionsSpec.lean",
         "JapanTaxLaw/InsurancePremiumExceptionsTests.lean"]


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
                            "text": frag, "source_path": t.get("source_path", ""),
                            "article": t.get("article", "")})
        else:
            records.append({"prefix": p, "normative_id": "", "verbatim": False,
                            "text": "", "source_path": "", "article": ""})
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    checks = {
        "all_eight_originals_verbatim": all(r["verbatim"] for r in records),
        "eight_distinct_ids": len(set(r["normative_id"] for r in records)) == 8,
        "two_article_groups": len(set(r["article"] for r in records)) == 2,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.InsurancePremiumExceptions\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_insurance_premiums.py",
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
