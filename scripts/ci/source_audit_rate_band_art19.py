#!/usr/bin/env python3
"""Independent source-to-spec audit for 347CO0000000151 art.19 table band."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "347CO0000000151_20251231_507CO0000000426"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_rate_band_art19.json"
UNIT = "NORM|19ad3c0f39ad4ec9480de4e7e90ab21b00a4f7dcf2ff45b75927e9e3c81f691e"
EXPECTED = "千万円以上千五百万円未満の金額"
LITERALS = ["千万円以上", "千五百万円未満", "金額"]
FILES = ["JapanTaxLaw/RateBandArt19.lean",
         "JapanTaxLaw/RateBandArt19Spec.lean",
         "JapanTaxLaw/RateBandArt19Tests.lean"]

def text_of(node):
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list):
        return "".join(text_of(c) for c in node)
    return ""

def find_sentence(node):
    if isinstance(node, dict):
        if node.get("tag") == "Sentence" and text_of(node) == EXPECTED:
            return EXPECTED
        for c in node.get("children", []):
            got = find_sentence(c)
            if got: return got
    elif isinstance(node, list):
        for c in node:
            got = find_sentence(c)
            if got: return got
    return None

def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()

def main():
    raw = RAW.read_bytes()
    text = find_sentence(json.loads(raw)["law_full_text"])
    checks = {"verbatim_text_match": text == EXPECTED,
              "all_literals_in_original": bool(text) and all(x in text for x in LITERALS),
              "spec_does_not_import_implementation":
                  "import JapanTaxLaw.RateBandArt19\n" not in
                  (REPO / FILES[1]).read_text(encoding="utf-8")}
    rec = {"tool": "scripts/ci/source_audit_rate_band_art19.py",
           "normative_id": UNIT, "revision": REV,
           "source_path": "LawBody[3]/MainProvision/MainProvision[1]/Article:19/Article#19/Paragraph#1/Item#3/TableStruct/Table/TableRow/TableColumn/Sentence#1",
           "raw_sha256": hashlib.sha256(raw).hexdigest(),
           "original_text": text, "independent_literals": LITERALS,
           "checks": checks,
           "module_sha256": {p: sha(REPO / p) for p in FILES}}
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1

if __name__ == "__main__":
    raise SystemExit(main())
