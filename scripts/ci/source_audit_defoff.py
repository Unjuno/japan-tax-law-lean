#!/usr/bin/env python3
"""Independent source-to-spec audit for the 506 definition/offence units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_defoff.json"
FILES = ["JapanTaxLaw/DefinitionsAndOffences.lean",
         "JapanTaxLaw/DefinitionsAndOffencesSpec.lean",
         "JapanTaxLaw/DefinitionsAndOffencesTests.lean"]
NEEDLES = [
    ("definition", ["次の各号に掲げる用語の意義は、当該各号に定めるところによる",
                    "前項において、次の各号に掲げる用語の意義は"]),
    ("ministry_matter", ["前二号に掲げる金額の計算の基礎その他財務省令で定める事項",
                         "その他財務省令で定める事項"]),
    ("age_threshold", ["収入金額の合計額のうちに占める次に掲げる金額の合計額の割合が百分の九十五を超えていること",
                       "六十五歳以上人口"]),
    ("question_offence", ["徴税吏員の質問に対し答弁をしないとき", "虚偽の答弁をしたとき"]),
    ("tax_manager_false", ["申告すべき納税管理人について虚偽の申告"]),
    ("corp_offence", ["法人の代表者又は法人若しくは人の代理人、使用人その他の従業者が"]),
    ("penalty_cap", ["三十万円以下の罰金に処する", "五十万円以下の罰金に処する", "一百万円以下の罰金に処する"]),
    ("loan_category", ["次のいずれかに該当する金銭の貸付け"]),
    ("land_acquire", ["当該土地等の買取りをする者が地方公共団体である場合"]),
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
        "expected_count_506": len(records) == 506,
        "nine_families_present": len(counts) == 9,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.DefinitionsAndOffences\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_defoff.py",
        "units_found": len(records), "family_counts": counts,
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
