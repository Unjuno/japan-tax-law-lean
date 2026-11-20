#!/usr/bin/env python3
"""Independent source-to-spec audit for the art.154 ten-band displacement partition."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "325AC0000000226_20261101_508AC0000000002"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_vehicle_bands.json"
IDS = [
    "e742f1b17920480cba923e759b5ce05125a72c6883fd8dfca55c17e337e74e7c",
    "bfbe2363d04af0b59b2f56c55cbbc6202e6f1968586aba05aa536ae92fb7258a",
    "fbaae7be4e7e0918d0af1091dede11f8dc3bdbea10cf82e888b69ed4cf8f0f79",
    "9dd7250fc11cd5b9a259f8af85d0a1cbfe494d64d02fff5d5a191dc9f63b56a7",
    "549b313a5f16d8e459fef4ff0999e863ea6a33a20b88cf755ac2c9e506558ce4",
    "bcf1ebb66cdf227f0a41af25535426f0e538653da7851df446b504290504c148",
    "9eef220ed32fe86ee214d8c286fbad24fc6673fe55335374a61f0001e4dfc8fc",
    "1b70bd69ba2ea7e88d5f16d020ca5377221d7811d3bba2254a761a1a9cb17587",
    "8c20a3060c379641f3bc8337526c392661953170bcd00df74ff4b50689b1210a",
    "01d4d7b447399c3a29c8b45e6671e7eaec473d25acd4b773304c174dcdc954aa",
]
BODIES = [
    "総排気量が一リットル以下のもの",
    "総排気量が一リットルを超え、一・五リットル以下のもの",
    "総排気量が一・五リットルを超え、二リットル以下のもの",
    "総排気量が二リットルを超え、二・五リットル以下のもの",
    "総排気量が二・五リットルを超え、三リットル以下のもの",
    "総排気量が三リットルを超え、三・五リットル以下のもの",
    "総排気量が三・五リットルを超え、四リットル以下のもの",
    "総排気量が四リットルを超え、四・五リットル以下のもの",
    "総排気量が四・五リットルを超え、六リットル以下のもの",
    "総排気量が六リットルを超えるもの",
]
FW = "０１２３４５６７８９"
LABELS = [FW[n] if n <= 9 else "１０" for n in range(1, 11)]
TEXTS = ["（%s）　%s" % (LABELS[i], b) for i, b in enumerate(BODIES)]
FILES = ["JapanTaxLaw/VehicleDisplacementBands.lean",
         "JapanTaxLaw/VehicleDisplacementBandsSpec.lean",
         "JapanTaxLaw/VehicleDisplacementBandsTests.lean"]


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
        "all_ten_originals_verbatim": all(found.get(t, False) for t in TEXTS),
        "ten_distinct_sentences": len(set(TEXTS)) == 10,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.VehicleDisplacementBands\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_vehicle_bands.py",
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
