#!/usr/bin/env python3
"""Independent source-to-spec audit for dual-sanction and remaining delegation units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_dual.json"
FILES = ["JapanTaxLaw/DualSanctionsAndDelegation.lean",
         "JapanTaxLaw/DualSanctionsAndDelegationSpec.lean",
         "JapanTaxLaw/DualSanctionsAndDelegationTests.lean"]
PHRASES = {
    "dual": "法人の代表者又は法人若しくは人の代理人、使用人その他の従業者がその法人又は人の業務又は財産に関して前項の違反行為をした場合には、その行為者を罰するほか、その法人又は人に対し、同項の罰金刑を科する。",
    "deleg_penalty": "この附則に定めるもののほか、この法律の施行に関し必要な経過措置（罰則に関する経過措置を含む。）は、政令で定める。",
    "deleg_penalty2": "この附則に規定するもののほか、この法律の施行に関し必要な経過措置（罰則に関する経過措置を含む。）は、政令で定める。",
    "deleg_matter": "前項の規定の適用に関し必要な事項は、政令で定める。",
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
                        "text": frag, "source_path": t.get("source_path", ""),
                        "revision": t.get("revision", ""), "raw_sha256": sha})
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    counts = {}
    for r in records:
        counts[r["variant"]] = counts.get(r["variant"], 0) + 1
    checks = {
        "all_units_verbatim": bool(records) and all(r["verbatim"] for r in records),
        "expected_count_146": len(records) == 146,
        "dual_and_delegation_present": counts.get("dual", 0) > 0 and len(counts) == 4,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.DualSanctionsAndDelegation\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_dual.py",
        "units_found": len(records), "variant_counts": counts,
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
