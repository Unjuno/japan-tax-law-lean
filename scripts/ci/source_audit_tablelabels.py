#!/usr/bin/env python3
"""Independent source-to-spec audit for the 2305 table-label/term units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_tablelabels.json"
FILES = ["JapanTaxLaw/TableLabelsAndTerms.lean",
         "JapanTaxLaw/TableLabelsAndTermsSpec.lean",
         "JapanTaxLaw/TableLabelsAndTermsTests.lean"]
KANJI = "一二三四五六七八九十百"
FW = "ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ"
TERMS = {"総所得金額", "課税総所得金額", "山林所得金額", "人口", "年額", "人",
         "率", "千円", "測定単位", "区分", "市町村", "法人税法", "租税特別措置法",
         "次に掲げる金額の合計額", "その他参考となるべき書類"}
FORM_PREFIXES = ("申請者の住所", "代表者の氏名", "納税者の氏名", "申請者氏名")


def classify(f):
    if not f:
        return None
    if f.startswith("第") and f.endswith("欄") and len(f) <= 5 and all(ch in KANJI for ch in f[1:-1]):
        return "column_label"
    if len(f) > 2 and f[0] in FW and f[1] == "　":
        return "table_header"
    if any(f.startswith(p) for p in FORM_PREFIXES):
        return "form_field"
    if f in TERMS:
        return "bare_term"
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
        "expected_count_2305": len(records) == 2305,
        "four_families_present": len(counts) == 4,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.TableLabelsAndTerms\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_tablelabels.py",
        "units_found": len(records), "family_counts": counts,
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
