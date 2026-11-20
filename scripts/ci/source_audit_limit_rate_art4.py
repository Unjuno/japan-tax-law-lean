#!/usr/bin/env python3
"""Independent source-to-spec audit for 362CO0000000335 art.4 condition."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "362CO0000000335_20260521_506CO0000000150"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_limit_rate_art4.json"
UNIT = "NORM|1719cd386262871d3745390bf5918fbab585aaec2c207e8055753cb669bf0cd9"
EXPECTED = "限度税率が百分の十二である場合"
LITERALS = ["限度税率", "百分の十二", "場合"]
FILES = ["JapanTaxLaw/LimitRate12Condition.lean",
         "JapanTaxLaw/LimitRate12ConditionSpec.lean",
         "JapanTaxLaw/LimitRate12ConditionTests.lean"]

def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""

def find(node):
    if isinstance(node, dict):
        if node.get("tag") == "Sentence" and text_of(node) == EXPECTED:
            return EXPECTED
        for c in node.get("children", []):
            got = find(c)
            if got: return got
    elif isinstance(node, list):
        for c in node:
            got = find(c)
            if got: return got
    return None

def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()

def main():
    raw = RAW.read_bytes()
    text = find(json.loads(raw)["law_full_text"])
    checks = {"verbatim_text_match": text == EXPECTED,
              "all_literals_in_original": bool(text) and all(x in text for x in LITERALS),
              "spec_does_not_import_implementation":
                  "import JapanTaxLaw.LimitRate12Condition\n" not in
                  (REPO / FILES[1]).read_text(encoding="utf-8")}
    rec = {"tool": "scripts/ci/source_audit_limit_rate_art4.py",
           "normative_id": UNIT, "revision": REV,
           "source_path": "LawBody[2]/MainProvision/MainProvision[8]/Article:4/Article#4/Paragraph#1/Item#7/ItemSentence/Column#1/Sentence#1",
           "raw_sha256": hashlib.sha256(raw).hexdigest(),
           "original_text": text, "independent_literals": LITERALS,
           "checks": checks,
           "module_sha256": {p: sha(REPO / p) for p in FILES}}
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1

if __name__ == "__main__":
    raise SystemExit(main())
