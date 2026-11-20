#!/usr/bin/env python3
"""Independent source-to-spec audit for two boundary-distinct range conditions."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]

REV_A = "347CO0000000151_20251231_507CO0000000426"
REV_B = "325AC0000000073_20260401_506AC0000000008"
UNIT_A = "NORM|1c103b22b685919f9c3f53da73b614b086b10560aaf307a876b47d609bd63573"
UNIT_B = "NORM|21bdc2f2f48a4f6a8b27e5ac0c46bb64c25a7cd885f43e3c416ee231b18b7e6e"
TEXT_A = "二百万円以上五百万円未満の金額"
TEXT_B = "残存期間が二十年を超え二十五年以下のもの"
LITERALS_A = ("二百万円", "五百万円", "以上", "未満")
LITERALS_B = ("二十年", "二十五年", "超え", "以下")
FILES = ["JapanTaxLaw/TaxBandBoundaries.lean",
         "JapanTaxLaw/TaxBandBoundariesSpec.lean",
         "JapanTaxLaw/TaxBandBoundariesTests.lean"]


def text_of(node):
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list):
        return "".join(text_of(c) for c in node)
    return ""


def collect(node, found):
    if isinstance(node, dict):
        if node.get("tag") == "Sentence":
            t = text_of(node)
            if t in (TEXT_A, TEXT_B):
                found[t] = True
        for c in node.get("children", []):
            collect(c, found)
    elif isinstance(node, list):
        for c in node:
            collect(c, found)


def sha(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()


def raw_text(rev):
    p = REPO / "data" / "raw" / f"{rev}.law.json"
    return p.read_bytes(), p


def main():
    found = {}
    hashes = {}
    for rev in (REV_A, REV_B):
        raw, path = raw_text(rev)
        hashes[rev] = hashlib.sha256(raw).hexdigest()
        collect(json.loads(raw)["law_full_text"], found)
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    checks = {
        "unit_a_verbatim": found.get(TEXT_A, False),
        "unit_b_verbatim": found.get(TEXT_B, False),
        "all_literals_a_in_original": all(x in TEXT_A for x in LITERALS_A),
        "all_literals_b_in_original": all(x in TEXT_B for x in LITERALS_B),
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.TaxBandBoundaries\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_tax_bands.py",
        "normative_ids": [UNIT_A, UNIT_B],
        "revisions": [REV_A, REV_B],
        "raw_sha256": hashes,
        "original_texts": {"unit_a": TEXT_A, "unit_b": TEXT_B},
        "checks": checks,
        "module_sha256": {p: sha(REPO / p) for p in FILES},
    }
    out = REPO / "data" / "source_correspondence_tax_bands.json"
    out.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
