#!/usr/bin/env python3
"""Independent source-to-spec audit for 337M50000008017 supplementary art.14-9(3)."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "337M50000008017_20260724_508M60000008092"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_progressive_points.json"
IDS = [
    "f9c00cec27d0c08d49163cf13bf585efda1fdda2b0b61f0bf22d66adffdc9add",
    "a1870a9b8f56952699a60883617912f7f9a8185280ee0360323746e7f99a61e6",
    "f083f7ca3a271061080494d5c75a71be09a0f527f28972cf34ae3aa835878f21",
]
TEXTS = [
    "ｍ１≦２，０００のとき　ｍ１×０．０３",
    "２，０００＜ｍ１≦７，０００のとき　（ｍ１－２，０００）×０．０８＋６０",
    "７，０００＜ｍ１のとき　（ｍ１－７，０００）×０．１＋４６０",
]
PATH = ("LawBody[5]/SupplProvision/SupplProvision[29]/Article:14_9/Article#14_9/"
        "Paragraph#3/List/ListSentence/Sentence#1/ArithFormula")
FILES = ["JapanTaxLaw/ProgressiveAgriculturalPoints.lean",
         "JapanTaxLaw/ProgressiveAgriculturalPointsSpec.lean",
         "JapanTaxLaw/ProgressiveAgriculturalPointsTests.lean"]


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def collect(node, found):
    if isinstance(node, dict):
        t = text_of(node)
        for expected in TEXTS:
            if t == expected:
                found[expected] = True
        for c in node.get("children", []): collect(c, found)
    elif isinstance(node, list):
        for c in node: collect(c, found)


def main():
    raw = RAW.read_bytes()
    found = {}
    collect(json.loads(raw)["law_full_text"], found)
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    checks = {
        "all_three_formulas_verbatim": all(found.get(t, False) for t in TEXTS),
        "three_distinct_formulas": len(set(TEXTS)) == 3,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.ProgressiveAgriculturalPoints\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_progressive_points.py",
        "normative_ids": ["NORM|" + i for i in IDS],
        "revision": REV,
        "raw_sha256": hashlib.sha256(raw).hexdigest(),
        "source_path": PATH,
        "original_texts": TEXTS,
        "verbatim_hits": {t: found.get(t, False) for t in TEXTS},
        "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(found.get(t, False) for t in TEXTS)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
