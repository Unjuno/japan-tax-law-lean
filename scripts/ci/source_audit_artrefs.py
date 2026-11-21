#!/usr/bin/env python3
"""Independent source-to-spec audit for the 2571 article-ref/ordinal-pair units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_artrefs.json"
FILES = ["JapanTaxLaw/ArticleRefsAndOrdinalPairs.lean",
         "JapanTaxLaw/ArticleRefsAndOrdinalPairsSpec.lean",
         "JapanTaxLaw/ArticleRefsAndOrdinalPairsTests.lean"]
KANJI = "一二三四五六七八九十百"
FW = "ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ"
SHORT_REFS = {"同項", "同条", "同号", "前項", "前条", "前号", "この項"}


def classify(f):
    if not f:
        return None
    if (f.startswith("第") and f.endswith(("項", "条", "号")) and len(f) <= 6
            and all(ch in KANJI for ch in f[1:-1])) or f in SHORT_REFS:
        return "article_ref"
    if f.startswith("令和") and len(f) <= 7:
        core = f[2:].replace("年度", "").replace("年", "")
        if core and all(ch in KANJI for ch in core):
            return "reiwa_fiscal"
    if len(f) == 2 and all(ch in FW for ch in f):
        return "latin_pair"
    if all(ch in "イロハニホヘト及びからまで、" for ch in f) and any(x in f for x in ("及び", "から", "、")):
        return "kana_range"
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
        "expected_count_2571": len(records) == 2571,
        "four_families_present": len(counts) == 4,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.ArticleRefsAndOrdinalPairs\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_artrefs.py",
        "units_found": len(records), "family_counts": counts,
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
