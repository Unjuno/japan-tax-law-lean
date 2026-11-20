#!/usr/bin/env python3
"""Independent source-to-spec audit for the 808 temporal-application units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_temporal2.json"
FILES = ["JapanTaxLaw/TemporalApplicationRules.lean",
         "JapanTaxLaw/TemporalApplicationRulesSpec.lean",
         "JapanTaxLaw/TemporalApplicationRulesTests.lean"]
# Same ordered needles as the selector. The 当初 tax-credit family is excluded.
NEEDLES = [
    ("quasi_corp_rep", "人格のない社団等について前項の規定の適用がある場合"),
    ("quasi_foundation_rep", "法人でない社団又は財団で代表者又は管理人の定めのあるものについて前項の規定"),
    ("prior_penalty", "この法律の施行前にした行為"),
    ("prior_national_penalty", "この法律の施行前に"),
    ("government_study", "政府は、国税に関する納税者の利益の保護"),
    ("limitation_follows", "前項の規定により第一項の違反行為につき法人又は人に罰金刑"),
    ("inspection_refusal", "前条の規定による帳簿書類その他の物件の検査"),
    ("object_presentation", "前条第一項の規定による物件の提示又は提出の要求"),
    ("certificate", "当該工事が国土交通大臣が財務大臣と協議して定める"),
    ("new_old_application", "別段の定めがあるものを除き、新法の規定中"),
    ("transitional_two_articles", "前二条に規定するもののほか、この法律の施行に関し必要な経過措置"),
    ("transitional_three_articles", "前三条に定めるもののほか、この法律の施行に関し必要な経過措置"),
    ("transitional_supplement", "この附則に規定するもののほか、この法律の施行に伴い必要な経過措置"),
    ("qualification_date", "その該当することとなつた日"),
    ("case_designation", "（2）（i）に掲げる場合に該当する場合"),
    ("special_depreciation_ref", "同項に規定する特別償却限度額"),
]


def classify(f):
    for fam, needle in NEEDLES:
        if needle in f:
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
        "expected_count_808": len(records) == 808,
        "eleven_plus_families_present": len(counts) >= 11,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.TemporalApplicationRules\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_temporal2.py",
        "units_found": len(records), "family_counts": counts,
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
