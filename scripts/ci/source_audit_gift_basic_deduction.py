#!/usr/bin/env python3
"""Independent original-text audit for the art. 21-5 basic-deduction unit.

This is independent of the Lean kernel proof: it reads the pinned e-Gov JSON,
verifies the SHA-256 pin, locates the verbatim fragment in the article tree and
records the article ambiguity as an H/T/D/C/U finding.  No completion status is
promoted by this script.
"""
from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
SNAPSHOT = REPO / "data/raw/325AC0000000073_20260401_506AC0000000008.law.json"
EXPECTED_SHA = "C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7"
NEEDLE = "課税価格から六十万円を控除する"


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
    full = norm(flat(doc.get("law_full_text")))
    hits = []
    for node in [doc.get("law_full_text")]:
        def walk(n):
            if isinstance(n, dict):
                if n.get("tag") == "Article" and target in norm(flat(n)):
                    hits.append(str((n.get("attr") or {}).get("Num", "")))
                for c in n.get("children", []):
                    walk(c)
            elif isinstance(n, list):
                for c in n:
                    walk(c)
        walk(node)
    finding = {
        "rule": "SRC-GBD-1", "must": True,
        "H": "The verbatim fragment alone uniquely identifies art. 21-5.",
        "T": "searched all Article nodes in the pinned snapshot",
        "D": "REFUTED" if len(hits) > 1 else "CONFIRMED",
        "C": "the same fragment also occurs in " + ", ".join(hits),
        "U": "requires independent legal review of scope",
    }
    print(json.dumps({
        "snapshot": str(SNAPSHOT.relative_to(REPO)),
        "sha256": digest, "sha256_pin_ok": digest == EXPECTED_SHA,
        "needle": NEEDLE, "needle_in_full_text": target in full,
        "articles_containing_needle": sorted(set(hits)), "finding": finding,
        "completion_status_promoted": False,
    }, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
