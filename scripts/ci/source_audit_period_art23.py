#!/usr/bin/env python3
"""Independent source-to-spec audit for 325AC0000000073 art.23 period band."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "325AC0000000073_20260401_506AC0000000008"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_period_art23.json"
UNIT = "NORM|debfc248b22ee3e700e03035ae835d23c48ca62532be58e7d0ea1a7cec8ebe88"
EXPECTED = "残存期間が十年を超え十五年以下のもの"
LITERALS = ["残存期間", "十年を超え", "十五年以下"]
FILES = ["JapanTaxLaw/RemainingPeriodBand.lean",
         "JapanTaxLaw/RemainingPeriodBandSpec.lean",
         "JapanTaxLaw/RemainingPeriodBandTests.lean"]

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
                  "import JapanTaxLaw.RemainingPeriodBand\n" not in
                  (REPO / FILES[1]).read_text(encoding="utf-8")}
    rec = {"tool": "scripts/ci/source_audit_period_art23.py",
           "normative_id": UNIT, "revision": REV,
           "source_path": "LawBody[3]/MainProvision/MainProvision[2]/Article:23/Article#23/Paragraph#1/List/ListSentence/Column#1/Sentence#1",
           "raw_sha256": hashlib.sha256(raw).hexdigest(),
           "original_text": text, "independent_literals": LITERALS,
           "checks": checks,
           "module_sha256": {p: sha(REPO / p) for p in FILES}}
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1

if __name__ == "__main__":
    raise SystemExit(main())
