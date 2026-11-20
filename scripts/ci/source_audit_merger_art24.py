#!/usr/bin/env python3
"""Independent source-to-spec audit for 340AC0000000034 art.24 exception."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "340AC0000000034_20261001_508AC0000000012"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_merger_art24.json"
UNIT = "NORM|c95fe5b099a7bac3397cf63b6b2db5bce1e182c2201fe7c7830ca9aeeff4b423"
EXPECTED = "合併（適格合併を除く。）"
LITERALS = ["合併", "適格合併", "除く"]
FILES = ["JapanTaxLaw/MergerExceptionArt24.lean",
         "JapanTaxLaw/MergerExceptionArt24Spec.lean",
         "JapanTaxLaw/MergerExceptionArt24Tests.lean"]

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
                  "import JapanTaxLaw.MergerExceptionArt24\n" not in
                  (REPO / FILES[1]).read_text(encoding="utf-8")}
    rec = {"tool": "scripts/ci/source_audit_merger_art24.py",
           "normative_id": UNIT, "revision": REV,
           "source_path": "LawBody[3]/MainProvision/MainProvision[1]/Article:24/Article#24/Paragraph#1/Item#1/ItemSentence/Sentence#1",
           "raw_sha256": hashlib.sha256(raw).hexdigest(),
           "original_text": text, "independent_literals": LITERALS,
           "checks": checks,
           "module_sha256": {p: sha(REPO / p) for p in FILES}}
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1

if __name__ == "__main__":
    raise SystemExit(main())
