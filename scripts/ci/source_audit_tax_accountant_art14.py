#!/usr/bin/env python3
"""Independent source-to-spec audit for 326AC1000000145 art.14."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "326AC1000000145_20211122_503AC0000000046"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_tax_accountant_art14.json"
UNIT = "NORM|91349ec2d835e0fe4fdd63ea17f15c1ce9a98c22d91c36f03bea07410596f64e"
EXPECTED = "次の各号のいずれかに該当する者は、十万円以下の過料に処する。"
LITERALS = ["各号", "該当する者", "十万円以下", "過料", "処する"]
FILES = ["JapanTaxLaw/TaxAccountantFine.lean",
         "JapanTaxLaw/TaxAccountantFineSpec.lean",
         "JapanTaxLaw/TaxAccountantFineTests.lean"]

def find_article(node):
    if isinstance(node, dict):
        if node.get("tag") == "Article" and str((node.get("attr") or {}).get("Num","")) == "14":
            return node
        for c in node.get("children", []):
            got = find_article(c)
            if got is not None: return got
    elif isinstance(node, list):
        for c in node:
            got = find_article(c)
            if got is not None: return got
    return None

def first_sentence(node):
    if isinstance(node, dict):
        if node.get("tag") == "Sentence":
            return "".join(node.get("children", []))
        for c in node.get("children", []):
            got = first_sentence(c)
            if got: return got
    elif isinstance(node, list):
        for c in node:
            got = first_sentence(c)
            if got: return got
    return None

def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()

def main():
    raw = RAW.read_bytes()
    text = first_sentence(find_article(json.loads(raw)["law_full_text"]))
    checks = {"verbatim_text_match": text == EXPECTED,
              "all_literals_in_original": all(x in text for x in LITERALS),
              "spec_does_not_import_implementation":
                  "import JapanTaxLaw.TaxAccountantFine\n" not in
                  (REPO / FILES[1]).read_text(encoding="utf-8")}
    rec = {"tool": "scripts/ci/source_audit_tax_accountant_art14.py",
           "normative_id": UNIT, "revision": REV,
           "source_path": "LawBody[1]/MainProvision/MainProvision[14]/Article:14/Article#14/Paragraph#1/ParagraphSentence/Sentence#1",
           "raw_sha256": hashlib.sha256(raw).hexdigest(),
           "original_text": text, "independent_literals": LITERALS,
           "checks": checks,
           "module_sha256": {p: sha(REPO / p) for p in FILES}}
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "original": text}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1

if __name__ == "__main__":
    raise SystemExit(main())
