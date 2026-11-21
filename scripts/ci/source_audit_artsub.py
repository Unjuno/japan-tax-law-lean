#!/usr/bin/env python3
"""Independent source-to-spec audit for the 4025 article sub-item label units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_artsub.json"
FILES = ["JapanTaxLaw/ArticleSubItems.lean",
         "JapanTaxLaw/ArticleSubItemsSpec.lean",
         "JapanTaxLaw/ArticleSubItemsTests.lean"]
KANJI = "一二三四五六七八九十百千"


def is_sub(f):
    if not f or len(f) > 14 or not ("の二" in f or "の三" in f):
        return False
    base = f.split("の")[0]
    core = base[1:-1] if base.startswith("第") and base.endswith("条") else base
    return bool(core) and all(ch in KANJI for ch in core)


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def main():
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    selected = [t for t in q["tasks"] if t.get("status") == "NOT_STARTED"
                and is_sub((t.get("norm_fragment") or "").strip())]
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
                        "text": frag, "source_path": t.get("source_path", ""),
                        "revision": t.get("revision", ""), "raw_sha256": sha})
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    checks = {
        "all_units_verbatim": bool(records) and all(r["verbatim"] for r in records),
        "expected_count_4025": len(records) == 4025,
        "variant_count_2138": len(set(r["text"] for r in records)) == 2138,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.ArticleSubItems\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_artsub.py",
        "units_found": len(records), "variant_count": len(set(r["text"] for r in records)),
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
