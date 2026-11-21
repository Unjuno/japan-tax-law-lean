#!/usr/bin/env python3
"""Independent source-to-spec audit for the 1421 provision/threshold units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_provthresh.json"
FILES = ["JapanTaxLaw/ProvisionsAndThresholds.lean",
         "JapanTaxLaw/ProvisionsAndThresholdsSpec.lean",
         "JapanTaxLaw/ProvisionsAndThresholdsTests.lean"]
NEEDLES = [
    ("reading_substitution", ["とあるのは、「", "読み替えるものとする", "に準用する", "ただし書の規定を準用する"]),
    ("ratio_threshold", ["四分の一以上二分の一未満", "百分の五十", "百分の四十"]),
    ("following_provisions", ["次に定めるところによる", "第一項の規定の適用がある場合には"]),
    ("enforcement_reference", ["の施行の日から施行する", "公布の日の翌日から施行する", "公布の日から施行し"]),
    ("mutual_application", ["納税管理人を変更し", "納税者の財産を占有する第三者"]),
    ("weight_half_ton", ["車両重量が〇・五トン以下のもの", "車両重量が〇・五トンを超えるもの"]),
    ("transitional_delegation", ["公社法及びこの法律の施行に関し必要な経過措置", "この法律に規定するもののほか"]),
    ("jurisdiction", ["道府県の区域外においても行うことができる"]),
]


def classify(f):
    for fam, needles in NEEDLES:
        if any(n in f for n in needles):
            return fam
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
        "expected_count_1421": len(records) == 1421,
        "eight_families_present": len(counts) == 8,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.ProvisionsAndThresholds\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_provthresh.py",
        "units_found": len(records), "family_counts": counts,
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
