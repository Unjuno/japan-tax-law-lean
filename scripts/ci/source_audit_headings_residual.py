#!/usr/bin/env python3
"""Audit for residual parenthesized headings (no unhandled_conditions flag).

These bare headings are structurally proven by the existing HeadingFragments
module but carry no substantive norm; evidence deliberately omits boundary and
cross-law proof axes so derive_status yields PROVED_SCOPE, never FULLY_VERIFIED.
"""
from __future__ import annotations
import hashlib, json, sys
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_headings_residual.json"
EXPECTED = int(sys.argv[1]) if len(sys.argv) > 1 else 0


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def main():
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    selected = [t for t in q["tasks"]
                if t.get("status") == "NOT_STARTED"
                and not t.get("unhandled_conditions")
                and (t.get("norm_fragment") or "").strip().startswith("（")
                and (t.get("norm_fragment") or "").strip().endswith("）")
                and len((t.get("norm_fragment") or "").strip()) <= 60
                and not any(op in (t.get("norm_fragment") or "") for op in ["×", "／", "＋", "－", "｛", "｝"])]
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
                        "family": "heading_residual", "text": frag,
                        "source_path": t.get("source_path", ""),
                        "revision": t.get("revision", ""), "raw_sha256": sha})
    checks = {
        "all_units_verbatim": bool(records) and all(r["verbatim"] for r in records),
        "expected_count": len(records) == EXPECTED,
        "all_units_unflagged": all(not t.get("unhandled_conditions") for t in selected),
    }
    rec = {"tool": "scripts/ci/source_audit_headings_residual.py",
           "units_found": len(records), "records": records, "checks": checks,
           "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest()
                             for p in ["JapanTaxLaw/HeadingFragments.lean",
                                       "JapanTaxLaw/HeadingFragmentsSpec.lean",
                                       "JapanTaxLaw/HeadingFragmentsTests.lean"]}}
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
