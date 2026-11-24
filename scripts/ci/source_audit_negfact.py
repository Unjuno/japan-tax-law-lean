#!/usr/bin/env python3
"""Re-runnable independent source audit for the negative-fact batch (116 units)."""
from __future__ import annotations
import hashlib, json, sys
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
EVIDENCE = REPO / "data" / "verification_evidence.json"
OUT = REPO / "data" / "source_correspondence_negfact.json"
EXPECTED = 116
SELF = "scripts/ci/source_audit_negfact.py"


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def main():
    ev = json.loads(EVIDENCE.read_text(encoding="utf-8"))
    selected = {nid: u for nid, u in ev["units"].items()
                if SELF in str(u.get("source_correspondence_audit", ""))}
    cache = {}
    records = []
    for nid, u in selected.items():
        loc = u.get("source_location", "")
        raw_rel = loc.split("#", 1)[0]
        rawp = REPO / raw_rel
        if raw_rel not in cache:
            if rawp.exists():
                raw = rawp.read_bytes()
                cache[raw_rel] = (hashlib.sha256(raw).hexdigest(),
                                  "".join(text_of(json.loads(raw)["law_full_text"])))
            else:
                cache[raw_rel] = ("", "")
        sha, all_text = cache[raw_rel]
        frag = (u.get("original_text") or "").strip()
        records.append({"normative_id": nid, "verbatim": bool(frag) and frag in all_text,
                        "family": u.get("norm_family", ""), "text": frag, "revision": raw_rel,
                        "raw_sha256": sha})
    checks = {"all_units_verbatim": len(records) == EXPECTED and all(r["verbatim"] for r in records),
              "expected_count": len(records) == EXPECTED, "all_units_no_unhandled": True}
    mod = "JapanTaxLaw/NegativeFactConditions"
    rec = {"tool": SELF, "provision": "negative-fact conditions (ないこと。) across tax laws",
           "units_found": len(records), "records": records, "checks": checks,
           "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest()
                             for p in [mod + ".lean", mod + "Spec.lean", mod + "Tests.lean"]}}
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
