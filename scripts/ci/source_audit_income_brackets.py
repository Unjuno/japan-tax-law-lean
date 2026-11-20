#!/usr/bin/env python3
"""Independent source-to-spec audit for 329M50000002023 supplementary art.4 brackets."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "329M50000002023_20261101_508M60000008045"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_income_brackets.json"
GROUPS = {
    "T350": {
        "ids": [
            "c8d9f6f7319a50729e1de85ce41a2c51e37f8a03b6cf39647b6bb44bfe202fb1",
            "0a52a8975d92d2968ed4d24f279f8b5e8e432b8486f46e012d95bd6d5f5186de",
            "404d8c3d22895074ec7ca2d9c67883413f66bf52e01ceb8c2effd38e3886c1c4",
        ],
        "texts": [
            "年３５０万円以下の金額　（（２１））",
            "年３５０万円を超え年７００万円以下の金額　（（２２））",
            "年７００万円を超える金額　（（２３））",
        ],
    },
    "T300": {
        "ids": [
            "7eb3d697fa3b3e936f380f948b618fd4fa288ea4d2592d52c41ebdab310795e8",
            "599ebad0e1870f85c3661a521559753d3344599e34a2c8c442a04d173eec917d",
            "91b09e78e093f27b4757aadab2674e987a70118492ccce5d752fbcd0ebb7a4ab",
        ],
        "texts": [
            "年３００万円以下の金額　（（２１））",
            "年３００万円を超え年６００万円以下の金額　（（２２））",
            "年６００万円を超える金額　（（２３））",
        ],
    },
}
PATH = ("LawBody[79]/SupplProvision/SupplProvision[4]/Article:4/Article#4/"
        "Paragraph#2/ParagraphSentence/Sentence#1/QuoteStruct/TableStruct/Table/"
        "TableRow/TableColumn/Sentence#1")
FILES = ["JapanTaxLaw/TransitionalIncomeBrackets.lean",
         "JapanTaxLaw/TransitionalIncomeBracketsSpec.lean",
         "JapanTaxLaw/TransitionalIncomeBracketsTests.lean"]
ALL_TEXTS = [t for g in GROUPS.values() for t in g["texts"]]


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def collect(node, found):
    if isinstance(node, dict):
        if node.get("tag") == "Sentence":
            t = text_of(node)
            if t in ALL_TEXTS: found[t] = True
        for c in node.get("children", []): collect(c, found)
    elif isinstance(node, list):
        for c in node: collect(c, found)


def main():
    raw = RAW.read_bytes()
    found = {}
    collect(json.loads(raw)["law_full_text"], found)
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    checks = {
        "all_six_originals_verbatim": all(found.get(t, False) for t in ALL_TEXTS),
        "six_distinct_sentences": len(set(ALL_TEXTS)) == 6,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.TransitionalIncomeBrackets\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_income_brackets.py",
        "revision": REV,
        "raw_sha256": hashlib.sha256(raw).hexdigest(),
        "source_path": PATH,
        "groups": {
            name: {"normative_ids": ["NORM|" + i for i in g["ids"]],
                   "texts": g["texts"],
                   "verbatim_hits": {t: found.get(t, False) for t in g["texts"]}}
            for name, g in GROUPS.items()
        },
        "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(found.get(t, False) for t in ALL_TEXTS)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
