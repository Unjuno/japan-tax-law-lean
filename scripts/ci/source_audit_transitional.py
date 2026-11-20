#!/usr/bin/env python3
"""Independent source-to-spec audit for transitional-delegation and prior-penalty units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_transitional.json"
FILES = ["JapanTaxLaw/TransitionalDelegationAndPriorPenalty.lean",
         "JapanTaxLaw/TransitionalDelegationAndPriorPenaltySpec.lean",
         "JapanTaxLaw/TransitionalDelegationAndPriorPenaltyTests.lean"]
PHRASES = {
    "deleg_1": "この附則に規定するもののほか、この法律の施行に関し必要な経過措置は、政令で定める。",
    "deleg_2": "この附則に規定するもののほか、この法律の施行に伴い必要な経過措置は、政令で定める。",
    "deleg_3": "この附則に定めるもののほか、この法律の施行に伴い必要な経過措置は、政令で定める。",
    "deleg_4": "この附則に定めるもののほか、この法律の施行に関し必要な経過措置は、政令で定める。",
    "prior_penalty": "この法律の施行前にした行為に対する罰則の適用については、なお従前の例による。",
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
        "expected_count_694": len(records) == 694,
        "five_variants_present": len(counts) == 5,
        "delegate_and_penalty_both": sum(v for k, v in counts.items() if k.startswith("deleg")) > 0
                                     and counts.get("prior_penalty", 0) > 0,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.TransitionalDelegationAndPriorPenalty\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_transitional.py",
        "units_found": len(records), "variant_counts": counts,
        "revision_count": len(set(r["revision"] for r in records)),
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
