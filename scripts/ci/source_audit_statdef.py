#!/usr/bin/env python3
"""Independent source-to-spec audit for the 503 statutory delegation/definition units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_statdef.json"
FILES = ["JapanTaxLaw/StatutoryDelegationAndDefinitions.lean",
         "JapanTaxLaw/StatutoryDelegationAndDefinitionsSpec.lean",
         "JapanTaxLaw/StatutoryDelegationAndDefinitionsTests.lean"]
PHRASES = {
    "def_law": "この法律において、次の各号に掲げる用語の意義は、当該各号に定めるところによる。",
    "def_article": "この条において、次の各号に掲げる用語の意義は、当該各号に定めるところによる。",
    "heading": "（その他の経過措置の政令への委任）",
    "technical": "この場合において、必要な技術的読替えは、政令で定める。",
}


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def main():
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    selected = [t for t in q["tasks"]
                if t.get("status") == "NOT_STARTED"
                and not t.get("dependencies") and not t.get("unhandled_conditions")
                and (t.get("norm_fragment") or "").strip() in PHRASES.values()]
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
                        "variant": next((k for k, v in PHRASES.items() if v == frag), ""),
                        "source_path": t.get("source_path", ""),
                        "revision": t.get("revision", ""), "raw_sha256": sha})
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    counts = {}
    for r in records:
        counts[r["variant"]] = counts.get(r["variant"], 0) + 1
    checks = {
        "all_units_verbatim": bool(records) and all(r["verbatim"] for r in records),
        "expected_count_503": len(records) == 503,
        "four_variants_present": len(counts) == 4,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.StatutoryDelegationAndDefinitions\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_statdef.py",
        "units_found": len(records), "variant_counts": counts,
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
