#!/usr/bin/env python3
"""Audit for definitional-equivalence (をいう) and same-as (同じ) families."""
from __future__ import annotations
import hashlib, json, sys
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


FAMS = {
 "defeq": ("をいう。", "JapanTaxLaw/DefinitionalEquivalenceNorms", 718),
 "sameas": ("同じ", "JapanTaxLaw/SameAsNorms", 390),
}


def main():
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    s = [t for t in q["tasks"] if t.get("status") == "NOT_STARTED"]
    cache = {}
    for fam, (marker, mod, expected) in FAMS.items():
        if fam == "sameas":
            sel = [t for t in s if (t.get("norm_fragment") or "").strip().endswith(("同じ。", "同じ。）"))]
        else:
            sel = [t for t in s if (t.get("norm_fragment") or "").strip().endswith(marker)]
        records = []
        for t in sel:
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
        checks = {"all_units_verbatim": bool(records) and all(r["verbatim"] for r in records),
                  "expected_count": len(records) == expected,
                  "all_units_no_unhandled": all(not t.get("unhandled_conditions") for t in sel)}
        out = {"tool": "scripts/ci/source_audit_defeq.py", "family": fam,
               "units_found": len(records), "records": records, "checks": checks,
               "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest()
                                 for p in [mod + ".lean", mod + "Spec.lean", mod + "Tests.lean"]}}
        (REPO / "data" / ("source_correspondence_" + fam + ".json")).write_text(
            json.dumps(out, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        print(fam, len(records), expected, checks)


if __name__ == "__main__":
    main()
