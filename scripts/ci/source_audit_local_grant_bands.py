#!/usr/bin/env python3
"""Independent source-to-spec audit for 337M50000008017 art.11 six amount bands."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "337M50000008017_20260724_508M60000008092"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_local_grant_bands.json"
IDS = [
    "61c9a21ea21552abdd5052b338dc3a20942f32ae92a919965a7e95e4811081a6",
    "aefa93fb70c15d0bbd40088acb0767b17fc6b2b16d200c13dea8ce12bae79fbd",
    "5b0720b95cac99c5d4aef59f0432084a1c0fdc297fca45cee4973a415f401358",
    "4e4cbc3712a36cbadd4cc844bc1177446b3df1bb7746006e669ce5224b963864",
    "eafb926aa687520d5ca477831b6756d9a842b6e2ab9e8ecd7dcac587ae67e21f",
    "7747547b67eec51c21486d1f0d3135aade9f2ecc9d7fbc64ed27a06c87982475",
]
TEXTS = [
    "３，０００以上２５，０００未満",
    "２５，０００以上５０，０００未満",
    "５０，０００以上１００，０００未満",
    "１００，０００以上４００，０００未満",
    "４００，０００以上９００，０００未満",
    "９００，０００以上",
]
FILES = ["JapanTaxLaw/LocalGrantAmountBands.lean",
         "JapanTaxLaw/LocalGrantAmountBandsSpec.lean",
         "JapanTaxLaw/LocalGrantAmountBandsTests.lean"]


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def collect(node, found):
    if isinstance(node, dict):
        if node.get("tag") == "Sentence":
            t = text_of(node)
            if t in TEXTS: found[t] = True
        for c in node.get("children", []): collect(c, found)
    elif isinstance(node, list):
        for c in node: collect(c, found)


def main():
    raw = RAW.read_bytes()
    found = {}
    collect(json.loads(raw)["law_full_text"], found)
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    checks = {
        "all_six_originals_verbatim": all(found.get(t, False) for t in TEXTS),
        "six_distinct_sentences": len(set(TEXTS)) == 6,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.LocalGrantAmountBands\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_local_grant_bands.py",
        "normative_ids": ["NORM|" + i for i in IDS],
        "revision": REV,
        "raw_sha256": hashlib.sha256(raw).hexdigest(),
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
