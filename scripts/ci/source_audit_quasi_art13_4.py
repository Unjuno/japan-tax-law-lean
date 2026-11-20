#!/usr/bin/env python3
"""Independent source-to-spec audit for 329M50000002023 art.13_4 quasi-application."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "329M50000002023_20261101_508M60000008045"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_quasi_art13_4.json"
UNIT = "NORM|64b83716c4c799383c697121bca0ad46831d0951b2f1f9d8622f56cbdfe3a10c"
EXPECTED = "第一項の規定は、個人の市町村民税について準用する。"
LITERALS = ["第一項の規定", "個人の市町村民税", "準用する"]
FILES = ["JapanTaxLaw/MunicipalTaxQuasiApply.lean",
         "JapanTaxLaw/MunicipalTaxQuasiApplySpec.lean",
         "JapanTaxLaw/MunicipalTaxQuasiApplyTests.lean"]

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
                  "import JapanTaxLaw.MunicipalTaxQuasiApply\n" not in
                  (REPO / FILES[1]).read_text(encoding="utf-8")}
    rec = {"tool": "scripts/ci/source_audit_quasi_art13_4.py",
           "normative_id": UNIT, "revision": REV,
           "source_path": "LawBody[3]/SupplProvision/SupplProvision[87]/Article:13_4/Article#13_4/Paragraph#3/ParagraphSentence/Sentence#1",
           "raw_sha256": hashlib.sha256(raw).hexdigest(),
           "original_text": text, "independent_literals": LITERALS,
           "checks": checks,
           "module_sha256": {p: sha(REPO / p) for p in FILES}}
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1

if __name__ == "__main__":
    raise SystemExit(main())
