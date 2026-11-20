#!/usr/bin/env python3
"""Independent source-to-spec audit for 332AC0000000026 documentation presumptions."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "332AC0000000026_20261101_507AC0000000013"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_presumptions.json"
PREFIXES = [
    "aa4f3f14", "39e09f50", "51740834", "aef0e00c",
    "3c957560", "5e3d0d91", "302bd406", "bb3befbc",
    "7b6094e3", "0d6f011e", "8f17bbb8", "44d24c4e",
    "6f65a055", "4b9960fa", "ebdd91b3", "97bb7057",
]
FILES = ["JapanTaxLaw/DocumentationPresumptions.lean",
         "JapanTaxLaw/DocumentationPresumptionsSpec.lean",
         "JapanTaxLaw/DocumentationPresumptionsTests.lean"]


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
        "all_sixteen_originals_verbatim": all(r["verbatim"] for r in records),
        "sixteen_distinct_ids": len(set(r["normative_id"] for r in records)) == 16,
        "four_article_groups": len(set(r["article"] for r in records)) == 4,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.DocumentationPresumptions\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_presumptions.py",
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
