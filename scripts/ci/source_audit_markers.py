#!/usr/bin/env python3
"""Independent source-to-spec audit for the 10817 legal structural marker units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_markers.json"
FILES = ["JapanTaxLaw/LegalStructuralMarkers.lean",
         "JapanTaxLaw/LegalStructuralMarkersSpec.lean",
         "JapanTaxLaw/LegalStructuralMarkersTests.lean"]
FW = "ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ"
MARKERS = {"略", "削除", "算式", "算式の符号", "公布の日", "ヽ",
           "次に掲げる規定", "次に掲げる書類", "次に掲げる事項",
           "その他参考となるべき事項", "第一項", "その他政令で定める要件",
           "その他政令で定める事項"}
ENFORCEMENT = {"この政令は、公布の日から施行する。", "この省令は、公布の日から施行する。",
               "この法律は、公布の日の翌日から施行する。"}


def classify(f):
    if not f:
        return None
    if len(f) == 1 and f in FW:
        return "latin_label"
    if f.startswith("令") and len(f) <= 3 and (f[1:].isdigit() or f[1:] == "元"):
        return "era_year"
    if f in MARKERS:
        return "structural_marker"
    if f in ENFORCEMENT:
        return "enforcement_clause"
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
        if t.get("status") != "NOT_STARTED" or t.get("dependencies") or not t.get("unhandled_conditions"):
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
        "expected_count_10817": len(records) == 10817,
        "four_families_present": len(counts) == 4,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.LegalStructuralMarkers\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_markers.py",
        "units_found": len(records), "family_counts": counts,
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
