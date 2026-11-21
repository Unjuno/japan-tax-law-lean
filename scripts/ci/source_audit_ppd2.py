#!/usr/bin/env python3
"""Independent source-to-spec audit for the 1083 prior-penalty/delegation units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_ppd2.json"
FILES = ["JapanTaxLaw/PriorPenaltyAndDelegation2.lean",
         "JapanTaxLaw/PriorPenaltyAndDelegation2Spec.lean",
         "JapanTaxLaw/PriorPenaltyAndDelegation2Tests.lean"]
KANJI = "一二三四五六七八九十百千"
MISC = {"零", "金額", "同年四月及び五月", "施行日前", "免除の規定", "追徴の規定",
        "地方団体の種類", "の規定"}


def classify(f):
    if not f:
        return None
    if "の施行前にした行為" in f and "罰則の適用については、なお従前の例による" in f:
        return "prior_penalty"
    if f.startswith("附則") and "施行に関し必要な経過措置は、政令で定める" in f:
        return "suppl_deleg"
    parts = f.split("の二")
    if len(f) <= 7 and len(parts) == 2 and parts[0] and all(ch in KANJI for ch in parts[0]):
        return "subitem_label"
    if f in MISC:
        return "misc_term"
    return None


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def main():
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    selected = []
    for t in q["tasks"]:
        if t.get("status") != "NOT_STARTED":
            continue
        fam = classify((t.get("norm_fragment") or "").strip())
        if fam:
            selected.append((t, fam))
    cache = {}
    records = []
    for t, fam in selected:
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
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    counts = {}
    for r in records:
        counts[r["family"]] = counts.get(r["family"], 0) + 1
    checks = {
        "all_units_verbatim": bool(records) and all(r["verbatim"] for r in records),
        "expected_count_1083": len(records) == 1083,
        "four_families_present": len(counts) == 4,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.PriorPenaltyAndDelegation2\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_ppd2.py",
        "units_found": len(records), "family_counts": counts,
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
