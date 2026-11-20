#!/usr/bin/env python3
"""Independent source-to-spec audit for art.37 / art.314-6 delegated categories."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "325AC0000000226_20261101_508AC0000000002"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_delegated_categories.json"
GROUPS = {
    "D_art37": {
        "ids": [
            "0620dc02fdeb79da6b46bebef11f59e4c344ed4440ae33d5e763a7833e79d963",
            "a76247cca778f5f3f06a9b5093b42592e8dff24594d43567a606ebfe86133e4c",
        ],
        "texts": [
            "（３）　寡婦又はひとり親で政令で定めるものである所得割の納税義務者",
            "（４）　ひとり親で政令で定めるものである所得割の納税義務者",
        ],
        "path": ("LawBody[2]/MainProvision/MainProvision[1]/Article:37/Article#37/"
                 "Paragraph#1/Item#1/Subitem1#1/TableStruct/Table/TableRow/"
                 "TableColumn/Sentence#1"),
    },
    "C_art314_6": {
        "ids": [
            "44ed564144dcbfb0666f5bd97f6f4efc7bc472d685f6b97e26092c6995dba5d4",
            "f01303c423d7afa683635dc5773769296bd02a20030c3ae4cd547cdb0b805d41",
        ],
        "texts": [
            "（３）　寡婦又はひとり親で政令で定めるものである所得割の納税義務者",
            "（４）　ひとり親で政令で定めるものである所得割の納税義務者",
        ],
        "path": ("LawBody[2]/MainProvision/MainProvision[2]/Article:314_6/"
                 "Article#314_6/Paragraph#1/Item#1/Subitem1#1/TableStruct/Table/"
                 "TableRow/TableColumn/Sentence#1"),
    },
}
FILES = ["JapanTaxLaw/DelegatedTaxpayerCategories.lean",
         "JapanTaxLaw/DelegatedTaxpayerCategoriesSpec.lean",
         "JapanTaxLaw/DelegatedTaxpayerCategoriesTests.lean"]
ALL_TEXTS = list({t for g in GROUPS.values() for t in g["texts"]})


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
        "two_distinct_originals_verbatim": all(found.get(t, False) for t in ALL_TEXTS),
        "two_distinct_sentences": len(ALL_TEXTS) == 2,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.DelegatedTaxpayerCategories\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_delegated_categories.py",
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
    print(json.dumps({"checks": checks, "distinct_hits": sum(found.get(t, False) for t in ALL_TEXTS)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
