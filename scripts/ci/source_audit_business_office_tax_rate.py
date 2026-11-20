#!/usr/bin/env python3
"""Independent original-text audit for 地方税法 art. 701の42 (BusinessOfficeTaxRate).

Independent of the Lean kernel proof: reads the pinned e-Gov JSON, verifies the
hash pin, locates the verbatim literal in the stated article, and records the
finding as H/T/D/C/U. Promotes no completion status by itself.
"""
from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
SNAPSHOT = Path("data/raw/325AC0000000226_20261101_508AC0000000002.law.json")
LAW_ID = "325AC0000000226"
ART_TITLE = "第七百一条の四十二"
NEEDLES = [
    "事業所税の税率は、資産割にあつては一平方メートルにつき六百円、従業者割にあつては百分の〇・二五とする。",
    "一平方メートルにつき六百円",
    "百分の〇・二五",
]


def flat(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat(c) for c in node.get("children", []))
    if isinstance(node, list):
        return "".join(flat(c) for c in node)
    return ""


def norm(t: str) -> str:
    return re.sub(r"[\s\u3000]+", "", t or "")


def main() -> int:
    raw = (REPO / SNAPSHOT).read_bytes()
    digest = hashlib.sha256(raw).hexdigest().upper()
    inv = json.loads((REPO / "data" / "INVENTORY.json").read_text(encoding="utf-8"))
    rec = next((l for l in inv.get("laws", []) if l.get("law_id") == LAW_ID), {})
    pinned = str((rec.get("raw_snapshot") or {}).get("source_sha256", "")).upper()
    doc = json.loads(raw)
    full = norm(flat(doc.get("law_full_text")))
    article_hits = []
    for node in (doc.get("law_full_text"),):
        def walk(n, in_main=False):
            if isinstance(n, dict):
                tag = n.get("tag")
                if tag == "MainProvision":
                    in_main = True
                if in_main and tag == "Article":
                    title = "".join(norm(flat(c)) for c in n.get("children", [])
                                    if isinstance(c, dict) and c.get("tag") == "ArticleTitle")
                    if title == ART_TITLE:
                        article_hits.append(flat(n))
                for c in n.get("children", []):
                    walk(c, in_main)
            elif isinstance(n, list):
                for c in n:
                    walk(c, in_main)
        walk(node)
    scoped = norm("".join(article_hits))
    needles_ok = all(norm(n) in scoped for n in NEEDLES) and bool(article_hits)
    unique = sum(1 for t in article_hits if norm(NEEDLES[0]) in norm(t))
    finding = {
        "rule": "SRC-BOTR-1",
        "must": True,
        "H": "The pinned literal occurs exactly once in the stated main article of 地方税法 art. 701の42.",
        "T": "sha256 pin check + MainProvision ArticleTitle scan of the pinned e-Gov JSON",
        "D": "CONFIRMED" if needles_ok and unique == 1 and digest == pinned else "REFUTED",
        "C": "The same literal could occur in a supplementary provision or an unrelated article; only MainProvision/第七百一条の四十二 counts.",
        "U": "Fidelity only; assessment of floor area and salary, rounding interpretation and legal review remain open.",
    }
    result = {
        "law_id": LAW_ID,
        "article": ART_TITLE,
        "snapshot": str(SNAPSHOT),
        "sha256": digest,
        "sha256_pin_ok": digest == pinned,
        "needles_in_stated_article": needles_ok,
        "article_occurrences": len(article_hits),
        "primary_needle_unique": unique == 1,
        "finding": finding,
        "completion_status_promoted": False,
    }
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return 0 if finding["D"] == "CONFIRMED" else 1


if __name__ == "__main__":
    raise SystemExit(main())
