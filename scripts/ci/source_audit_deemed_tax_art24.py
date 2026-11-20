#!/usr/bin/env python3
"""Independent source-to-spec audit for 332AC0000000026 art.66_9_4 deeming cell."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "332AC0000000026_20261101_507AC0000000013"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_deemed_tax_art24.json"
UNIT = "NORM|87699445d5c1be70655ac88a59210fe09dcd5575c3f875be2dc166d9f13ce29e"
EXPECTED = "課税済金額とみなす"
LITERALS = ["課税済", "金額", "みなす"]
FILES = ["JapanTaxLaw/DeemedTaxedAmount.lean",
         "JapanTaxLaw/DeemedTaxedAmountSpec.lean",
         "JapanTaxLaw/DeemedTaxedAmountTests.lean"]

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
                  "import JapanTaxLaw.DeemedTaxedAmount\n" not in
                  (REPO / FILES[1]).read_text(encoding="utf-8")}
    rec = {"tool": "scripts/ci/source_audit_deemed_tax_art24.py",
           "normative_id": UNIT, "revision": REV,
           "source_path": "LawBody[3]/MainProvision/MainProvision[2]/Article:66_9_4/Article#66_9_4/Paragraph#5/TableStruct/Table/TableRow/TableColumn/Sentence#1",
           "raw_sha256": hashlib.sha256(raw).hexdigest(),
           "original_text": text, "independent_literals": LITERALS,
           "checks": checks,
           "module_sha256": {p: sha(REPO / p) for p in FILES}}
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1

if __name__ == "__main__":
    raise SystemExit(main())
