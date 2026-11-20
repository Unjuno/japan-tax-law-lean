#!/usr/bin/env python3
"""Independent source-to-spec audit for art.11 C (4) and E (5) index bands."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "337M50000008017_20260724_508M60000008092"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_local_grant_index.json"
GROUPS = {
    "C": {
        "ids": [
            "7b9430e42aa5a1d64e7dc6ce862a5e029bab1efac685994bafef93d9f6806187",
            "a67969e166037ea7613758c7b0e322c8f6d3b9a17c43c06e30105e52c139c431",
            "6dd5ac032c1b20b723f79e1c0bee07eb85c692952637a3696a35892be520ceb7",
            "f48107230da364c2d029b9ed33ec3632c38e713e1625feccdcb38d3b7748bbf7",
        ],
        "texts": ["１００未満", "１００以上２００未満", "２００以上３００未満", "３００以上"],
        "path": ("LawBody[4]/MainProvision/MainProvision[1]/Article:11/Article#11/"
                 "Paragraph#1/Item#1/Subitem1#1/Subitem2#3/TableStruct/Table/"
                 "TableRow/TableColumn/Sentence#1"),
    },
    "E": {
        "ids": [
            "3664fff4671d19fb58198c2f3bd960e6abc08d9111550c8b32aaf7c824094137",
            "98df7397bd4e0fdcd06d94e7ce98532f6838c93e0263033eef17d960052e3c58",
            "09f22cf76504d0ef9d5bc9c7fb838521cb96ef18e4394ef149e0d8e50bea55a5",
            "92f0b0ef5f0186cf6bdeeaf48b13d122012b13e9f64d248957610f659d43cd8d",
            "6039062bb67f9dbead2c089235d2d341f19371a2dfbd7ad6374456d58ed34ec0",
        ],
        "texts": ["１０未満", "１０以上１１０未満", "１１０以上２２０未満",
                  "２２０以上３３０未満", "３３０以上"],
        "path": ("LawBody[4]/MainProvision/MainProvision[1]/Article:11/Article#11/"
                 "Paragraph#1/Item#1/Subitem1#2/Subitem2#4/TableStruct/Table/"
                 "TableRow/TableColumn/Sentence#1"),
    },
}
FILES = ["JapanTaxLaw/LocalGrantIndexBands.lean",
         "JapanTaxLaw/LocalGrantIndexBandsSpec.lean",
         "JapanTaxLaw/LocalGrantIndexBandsTests.lean"]
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
        "all_nine_originals_verbatim": all(found.get(t, False) for t in ALL_TEXTS),
        "nine_distinct_sentences": len(set(ALL_TEXTS)) == 9,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.LocalGrantIndexBands\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_local_grant_index.py",
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
