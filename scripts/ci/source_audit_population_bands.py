#!/usr/bin/env python3
"""Independent source-to-spec audit for art.11 daytime-population six bands."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "337M50000008017_20260724_508M60000008092"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_population_bands.json"
IDS = [
    "40c24a253f87a09818d8348d49eb275130f83821b1d6aee71c07498e1db9a10a",
    "eaedffec9f49781221fb0d76cbc1d5aebd7455d9aa720eb0462663d65ee2ea51",
    "6db851350ac8ff22221b06d98b24baec978de8db35d0e857c9e4170965d0fc59",
    "4c4a2318ddb86c1c3fe7344ba9507ffc8e2226ab59cb6ab7ac46d2aec51a2f86",
    "7a48513b737f66d469e5b27c580233e06a9fe4a6be4cc12eaa102fe28780969d",
    "ade181c2b3227b14bacd93fe8d657c3e59f51153d877c1c380795cdfe90a9aca",
]
TEXTS = [
    "１，０００人以上６，０００人未満",
    "６，０００人以上１１，０００人未満",
    "１１，０００人以上５５，０００人未満",
    "５５，０００人以上１１０，０００人未満",
    "１１０，０００人以上２２０，０００人未満",
    "２２０，０００人以上",
]
PATH = ("LawBody[4]/MainProvision/MainProvision[1]/Article:11/Article#11/"
        "Paragraph#1/Item#1/Subitem1#1/Subitem2#4/TableStruct/Table/"
        "TableRow/TableColumn/Sentence#1")
FILES = ["JapanTaxLaw/LocalGrantPopulationBands.lean",
         "JapanTaxLaw/LocalGrantPopulationBandsSpec.lean",
         "JapanTaxLaw/LocalGrantPopulationBandsTests.lean"]


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
            "import JapanTaxLaw.LocalGrantPopulationBands\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_population_bands.py",
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
