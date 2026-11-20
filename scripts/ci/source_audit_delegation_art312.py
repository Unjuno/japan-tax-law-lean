#!/usr/bin/env python3
"""Independent source-to-spec audit for 325AC0000000226 art.312 delegation."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "325AC0000000226_20261101_508AC0000000002"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_delegation_art312.json"
UNIT = "NORM|29d04706ea24185c86b2152ccc2a22513fd3733bb63bfaecfc4e260e1283c879"
EXPECTED = "第一項の収益事業の範囲は、政令で定める。"
LITERALS = ["収益事業の範囲", "政令で定める"]
FILES = ["JapanTaxLaw/ProfitBusinessDelegation.lean",
         "JapanTaxLaw/ProfitBusinessDelegationSpec.lean",
         "JapanTaxLaw/ProfitBusinessDelegationTests.lean"]

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
                  "import JapanTaxLaw.ProfitBusinessDelegation\n" not in
                  (REPO / FILES[1]).read_text(encoding="utf-8")}
    rec = {"tool": "scripts/ci/source_audit_delegation_art312.py",
           "normative_id": UNIT, "revision": REV,
           "source_path": "LawBody[2]/MainProvision/MainProvision[2]/Article:312/Article#312/Paragraph#8/ParagraphSentence/Sentence#1",
           "raw_sha256": hashlib.sha256(raw).hexdigest(),
           "original_text": text, "independent_literals": LITERALS,
           "checks": checks,
           "module_sha256": {p: sha(REPO / p) for p in FILES}}
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1

if __name__ == "__main__":
    raise SystemExit(main())
