#!/usr/bin/env python3
"""Independent source-to-spec audit for art.27_12_5 complementary 6-month conditions."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "332CO0000000043_20261101_507CO0000000127"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_fiscal_split.json"
UNIT_A = "NORM|ceaa310499e6aeb291c47fe5f84450e17ebf70b5d4e9ae154ce11794a834144e"
UNIT_B = "NORM|7176dc3cb4da9ce0a92f0b4cddd094cfaefb5fa95123009cacdad1501e5cc607"
TEXT_A = "当該前事業年度が六月に満たない場合"
TEXT_B = "当該前事業年度が六月以上である場合"
LITERALS = ("六月", "前事業年度", "満たない", "以上")
FILES = ["JapanTaxLaw/FiscalPeriodSixMonthSplit.lean",
         "JapanTaxLaw/FiscalPeriodSixMonthSplitSpec.lean",
         "JapanTaxLaw/FiscalPeriodSixMonthSplitTests.lean"]

def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""

def collect(node, found):
    if isinstance(node, dict):
        if node.get("tag") == "Sentence":
            t = text_of(node)
            if t in (TEXT_A, TEXT_B):
                found[t] = True
        for c in node.get("children", []): collect(c, found)
    elif isinstance(node, list):
        for c in node: collect(c, found)

def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()

def main():
    raw = RAW.read_bytes()
    found = {}
    collect(json.loads(raw)["law_full_text"], found)
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    checks = {
        "unit_a_verbatim": found.get(TEXT_A, False),
        "unit_b_verbatim": found.get(TEXT_B, False),
        "all_literals_in_original": all(x in TEXT_A + TEXT_B for x in LITERALS),
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.FiscalPeriodSixMonthSplit\n" not in spec,
    }
    rec = {"tool": "scripts/ci/source_audit_fiscal_split.py",
           "normative_ids": [UNIT_A, UNIT_B], "revision": REV,
           "raw_sha256": hashlib.sha256(raw).hexdigest(),
           "original_texts": {"unit_a": TEXT_A, "unit_b": TEXT_B},
           "checks": checks,
           "module_sha256": {p: sha(REPO / p) for p in FILES}}
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1

if __name__ == "__main__":
    raise SystemExit(main())
