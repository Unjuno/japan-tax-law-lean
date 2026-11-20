#!/usr/bin/env python3
"""Independent source-to-spec audit for art.11 A (5) and B (2) band tables."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "337M50000008017_20260724_508M60000008092"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_remaining_bands.json"
GROUPS = {
    "A": {
        "ids": [
            "9d68bfc6b6112f642db9ca544e4e971c3db40d72b3fd09dc7187ac5f30826c92",
            "da72ca210d0e6be3e98b32389cd440a64eeed5072682dcfa9db198022a4b59fd",
            "7879e9d627e595cbb5067a3f3c88543f8efc62bca87daac971aadff0e9ccc05c",
            "af0d7db1923ae6a67032c68846a0104fcd25f8eb79768ddde6b115a851b47855",
            "92ee405dbebdf0892184d8cb4a5bbb550eec887e147299f1cd7255c7353e27c0",
        ],
        "texts": ["２００点以上３５０点未満", "３５０点以上６５０点未満",
                  "６５０点以上９５０点未満", "９５０点以上９９０点未満", "９９０点以上"],
        "path": ("LawBody[4]/MainProvision/MainProvision[1]/Article:11/Article#11/"
                 "Paragraph#1/Item#1/Subitem1#2/Subitem2#1/TableStruct/Table/"
                 "TableRow/TableColumn/Sentence#1"),
    },
    "B": {
        "ids": [
            "e664b371aaf8b6dba27d44fbaea280fdf4f5d4a27e4560f860f38ac6b6e15fd8",
            "8e1a5487fadf0d8082bf10c5c854d52f16ac026577fb0c7ea282ac9bff1ad76f",
        ],
        "texts": ["９６未満", "９６以上"],
        "path": ("LawBody[4]/MainProvision/MainProvision[1]/Article:11/Article#11/"
                 "Paragraph#1/Item#1/Subitem1#1/Subitem2#2/TableStruct/Table/"
                 "TableRow/TableColumn/Sentence#1"),
    },
}
FILES = ["JapanTaxLaw/LocalGrantRemainingBands.lean",
         "JapanTaxLaw/LocalGrantRemainingBandsSpec.lean",
         "JapanTaxLaw/LocalGrantRemainingBandsTests.lean"]
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
        "all_seven_originals_verbatim": all(found.get(t, False) for t in ALL_TEXTS),
        "seven_distinct_sentences": len(set(ALL_TEXTS)) == 7,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.LocalGrantRemainingBands\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_remaining_bands.py",
        "revision": REV,
        "raw_sha256": hashlib.sha256(raw).hexdigest(),
        "groups": {
            name: {"normative_ids": ["NORM|" + i for i in g["ids"]],
                   "texts": g["texts"], "source_path": g["path"],
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
