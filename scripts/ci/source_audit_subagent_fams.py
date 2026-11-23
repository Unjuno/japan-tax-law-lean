#!/usr/bin/env python3
"""Audit for 3 operator families found by the INSPECT subagent."""
from __future__ import annotations
import hashlib, json, re, sys
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


FAMS = {
 "date_select": (re.compile(r"いずれか(早い|遅い)日"), "JapanTaxLaw/DateSelectionNorms", 46),
 "priority": (re.compile(r"先順位とする"), "JapanTaxLaw/PriorityOrderNorms", 45),
 "identity": (re.compile(r"(同一である|異なる|に等しい)場合[。）)]?$"), "JapanTaxLaw/IdentityPredicateNorms", 30),
}


def main():
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    s = [t for t in q["tasks"] if t.get("status") == "NOT_STARTED"]
    cache = {}
    for fam, (pat, mod, expected) in FAMS.items():
        if fam == "date_select":
            sel = [t for t in s if pat.search((t.get("norm_fragment") or ""))
                   and (re.search(r"いずれか(早い|遅い)日[。.]?$", (t.get("norm_fragment") or ""))
                        or re.search(r"いずれか(早い|遅い)日とする。$", (t.get("norm_fragment") or "")))]
        elif fam == "identity":
            sel = [t for t in s if pat.search((t.get("norm_fragment") or ""))
                   and len((t.get("norm_fragment") or "").strip()) < 240]
        else:
            sel = [t for t in s if pat.search((t.get("norm_fragment") or ""))]
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
        out = {"tool": "scripts/ci/source_audit_subagent_fams.py", "family": fam,
               "units_found": len(records), "records": records, "checks": checks,
               "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest()
                                 for p in [mod + ".lean", mod + "Spec.lean", mod + "Tests.lean"]}}
        (REPO / "data" / ("source_correspondence_" + fam + ".json")).write_text(
            json.dumps(out, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        print(fam, len(records), expected, checks)


if __name__ == "__main__":
    main()
