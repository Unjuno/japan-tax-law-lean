#!/usr/bin/env python3
"""Audit bare deontic modalities (なければならない / ことができる / ことができない)."""
from __future__ import annotations
import hashlib, json, re, sys
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
MOD = "JapanTaxLaw/BareDeonticNorms"
PATS = {
    "obligation": (re.compile(r"ければならない。[。）)]*\s*$"), 413),
    "permission": (re.compile(r"ることができる。[。）)]*\s*$"), 407),
    "prohibition": (re.compile(r"ことができない。[。）)]*\s*$"), 110),
}


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def main():
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    s = [t for t in q["tasks"] if t.get("status") == "NOT_STARTED"]
    cache = {}
    allok = True
    for fam, (pat, expected) in PATS.items():
        selected = [t for t in s if pat.search((t.get("norm_fragment") or ""))]
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
                            "family": "bare_deontic_" + fam, "text": frag,
                            "source_path": t.get("source_path", ""),
                            "revision": t.get("revision", ""), "raw_sha256": sha})
        checks = {"all_units_verbatim": bool(records) and all(r["verbatim"] for r in records),
                  "expected_count": len(records) == expected,
                  "all_units_no_unhandled": all(not t.get("unhandled_conditions") for t in selected)}
        out = {"tool": "scripts/ci/source_audit_baredeontic.py", "family": fam,
               "units_found": len(records), "records": records, "checks": checks,
               "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest()
                                 for p in [MOD + ".lean", MOD + "Spec.lean", MOD + "Tests.lean"]}}
        (REPO / "data" / ("source_correspondence_baredeontic_" + fam + ".json")).write_text(
            json.dumps(out, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        print(fam, len(records), expected, checks)
        allok = allok and all(checks.values())
    return 0 if allok else 1


if __name__ == "__main__":
    raise SystemExit(main())
