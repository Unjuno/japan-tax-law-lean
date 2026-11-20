#!/usr/bin/env python3
"""Independent source-to-spec audit for the 406 provisional-norm/label units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_prov.json"
FILES = ["JapanTaxLaw/ProvisionalNormsAndLabels.lean",
         "JapanTaxLaw/ProvisionalNormsAndLabelsSpec.lean",
         "JapanTaxLaw/ProvisionalNormsAndLabelsTests.lean"]
PHRASES = {
    "formula": {"次の算式によつて算定した額とする。"},
    "quote_close": {"」とする。"},
    "prior_penalty": {"この法律の施行前にした行為及びこの附則の規定によりなお従前の例によることとされる場合におけるこの法律の施行後にした行為に対する罰則の適用については、なお従前の例による。"},
    "exempt": {"ただし、情状により、その刑を免除することができる。"},
    "definitions": {"前項及びこの項において、次の各号に掲げる用語の意義は、当該各号に定めるところによる。"},
    "yomikae_label": {"読み替える字句", "読み替えられる字句"},
    "prev_ref": {"前条第一項"},
    "weight": {"車両総重量が一トン以下のもの", "車両総重量が一トンを超えるもの"},
    "amount_bracket": {"五十万円以下の部分に相当する金額", "五十万円を超え三百万円以下の部分に相当する金額", "三百万円を超える部分に相当する金額"},
}


def classify(f):
    for fam, phrases in PHRASES.items():
        if f in phrases:
            return fam
    if f and "の二" in f and len(f) <= 4:
        return "subitem"
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
        if t.get("status") != "NOT_STARTED" or t.get("dependencies") or t.get("unhandled_conditions"):
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
        "expected_count_425": len(records) == 425,
        "all_ten_families_present": len(counts) == 10,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.ProvisionalNormsAndLabels\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_prov.py",
        "units_found": len(records), "family_counts": counts,
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
