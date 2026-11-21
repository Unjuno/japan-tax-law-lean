#!/usr/bin/env python3
"""Independent source-to-spec audit for the 6275 bare term/rate units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_bareterms.json"
FILES = ["JapanTaxLaw/BareTermsAndRates.lean",
         "JapanTaxLaw/BareTermsAndRatesSpec.lean",
         "JapanTaxLaw/BareTermsAndRatesTests.lean"]
TAXES = {"不動産取得税", "固定資産税", "道府県民税", "市町村民税", "所得税の額", "法人税",
         "事業税", "消費税", "登録免許税", "自動車取得税", "軽油引取税", "相続税", "贈与税",
         "国民健康保険税", "特別土地保有税", "固定資産税に関する規定の適用",
         "事業税に関する規定の適用"}
FRACTIONS = {"二分の一", "四分の一", "百分の五"}


def classify(f):
    if not f:
        return None
    if f in TAXES:
        return "tax_name"
    if "税額のうちいずれか少ない税額" in f or "算式によつて算定した額" in f or "基礎額" in f:
        return "computation_term"
    if "年度市場公募都市" in f and "０．" in f:
        return "rate_entry"
    if f.startswith("（") and f.endswith("）") and "適用" in f:
        return "application_heading"
    if "の施行の日" in f:
        return "enforcement_ref"
    if f in FRACTIONS:
        return "fraction"
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
        "expected_count_6275": len(records) == 6275,
        "six_families_present": len(counts) == 6,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.BareTermsAndRates\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_bareterms.py",
        "units_found": len(records), "family_counts": counts,
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
