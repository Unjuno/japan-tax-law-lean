#!/usr/bin/env python3
"""Independent source-to-spec audit for 340CO0000000096 art.14 presumption."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "340CO0000000096_20260522_508CO0000000093"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_domicile_art14.json"
UNIT = "NORM|1d310b3fc3fbdb5179921191135141b643f44a1685bff314ace7ed21aee111ba"
EXPECTED = "国内に居住することとなつた個人が次の各号のいずれかに該当する場合には、その者は、国内に住所を有する者と推定する。"
LITERALS = ["国内に居住することとなつた個人", "各号のいずれかに該当する場合", "国内に住所を有する者と推定する"]
FILES = ["JapanTaxLaw/DomicilePresumptionArt14.lean",
         "JapanTaxLaw/DomicilePresumptionArt14Spec.lean",
         "JapanTaxLaw/DomicilePresumptionArt14Tests.lean"]

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
                  "import JapanTaxLaw.DomicilePresumptionArt14\n" not in
                  (REPO / FILES[1]).read_text(encoding="utf-8")}
    rec = {"tool": "scripts/ci/source_audit_domicile_art14.py",
           "normative_id": UNIT, "revision": REV,
           "source_path": "LawBody[3]/MainProvision/MainProvision[0]/Article:14/Article#14/Paragraph#1/ParagraphSentence/Sentence#1",
           "raw_sha256": hashlib.sha256(raw).hexdigest(),
           "original_text": text, "independent_literals": LITERALS,
           "checks": checks,
           "module_sha256": {p: sha(REPO / p) for p in FILES}}
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1

if __name__ == "__main__":
    raise SystemExit(main())
