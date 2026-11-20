#!/usr/bin/env python3
"""Independent original-text audit for the disaster-income-threshold unit.

Checks the pinned snapshot, verifies the verbatim fragment and records whether
the fragment alone could identify the article (it cannot be assumed to).
"""
from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
SNAPSHOT = REPO / "data/raw/322AC0000000175_20220101_503AC0000000011.law.json"
EXPECTED_SHA = "C3BB5B0BDFFBDEF D2EE5F358D90AD9E0922D4C887ECB2B133AA7D613F5F4E7EF".replace(" ", "")
NEEDLE = "合計所得金額が五百万円以下であるとき"


def flat(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat(c) for c in node.get("children", []))
    return ""


def norm(t: str) -> str:
    return re.sub(r"[\s\u3000]+", "", t or "")


def main() -> int:
    raw = SNAPSHOT.read_bytes()
    digest = hashlib.sha256(raw).hexdigest().upper()
    doc = json.loads(raw)
    target = norm(NEEDLE)
    hits = []

    def walk(n):
        if isinstance(n, dict):
            if n.get("tag") == "Article" and target in norm(flat(n)):
                hits.append(str((n.get("attr") or {}).get("Num", "")))
            for c in n.get("children", []):
                walk(c)
        elif isinstance(n, list):
            for c in n:
                walk(c)

    walk(doc.get("law_full_text"))
    finding = {
        "rule": "SRC-DIT-1",
        "must": True,
        "H": "The verbatim threshold fragment occurs only in art. 2(1) of this law.",
        "T": "searched every Article node of the pinned snapshot for the normalized needle",
        "D": "CONFIRMED" if hits == ["2"] else "REFUTED",
        "C": "the fragment occurs in articles " + ", ".join(hits) if hits else "no article contains the fragment",
        "U": "requires independent legal review of scope outside the pinned revision",
    }
    print(json.dumps({
        "snapshot": str(SNAPSHOT.relative_to(REPO)),
        "sha256": digest, "sha256_pin_ok": digest == EXPECTED_SHA,
        "needle": NEEDLE, "articles_containing_needle": sorted(set(hits)),
        "finding": finding, "completion_status_promoted": False,
    }, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
