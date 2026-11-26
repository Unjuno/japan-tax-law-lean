#!/usr/bin/env python3
"""Independent original-text audit for 租税特別措置法施行令 art.42の3(2)一."""
from __future__ import annotations
import hashlib, json, re
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
SNAPSHOT = Path("data/raw/332CO0000000043_20261101_507CO0000000127.law.json")
LAW_ID = "332CO0000000043"
NEEDLE = ("当該土地に関する権利の持分の割合から当該旧権利の持分の割合を控除した割合を"
          "当該土地に関する権利の持分の割合で除して計算した割合（当該旧権利がその者が"
          "単独で有する所有権若しくは借地権である場合又は当該控除した割合が零を下回る"
          "場合には、零）")


def flat(n):
    if isinstance(n, str): return n
    if isinstance(n, dict): return "".join(flat(c) for c in n.get("children", []))
    if isinstance(n, list): return "".join(flat(c) for c in n)
    return ""


def norm(t): return re.sub(r"[\s\u3000]+", "", t or "")


def main():
    raw = (REPO / SNAPSHOT).read_bytes()
    digest = hashlib.sha256(raw).hexdigest().upper()
    inv = json.loads((REPO / "data/INVENTORY.json").read_text(encoding="utf-8"))
    rec = next(l for l in inv["laws"] if l["law_id"] == LAW_ID)
    pinned = str((rec.get("raw_snapshot") or {}).get("source_sha256", "")).upper()
    doc = json.loads(raw)
    hits = []

    def walk(n, in_main=False):
        if isinstance(n, dict):
            if n.get("tag") == "MainProvision": in_main = True
            if in_main and n.get("tag") == "Article":
                titles = "".join(norm(flat(c)) for c in n.get("children", [])
                                 if isinstance(c, dict) and c.get("tag") == "ArticleTitle")
                if titles == "第四十二条の三":
                    hits.append(flat(n)); return
            for c in n.get("children", []): walk(c, in_main)
        elif isinstance(n, list):
            for c in n: walk(c, in_main)

    walk(doc.get("law_full_text", doc))
    ok = digest == pinned and len(hits) == 1 and norm(NEEDLE) in norm(hits[0])
    finding = {
        "rule": "SRC-RSR-1", "must": True,
        "H": "The share-ratio clause with zero cases occurs in the pinned main article 42-3.",
        "T": "sha256 pin recheck + MainProvision ArticleTitle scan + normalized needle containment",
        "D": "CONFIRMED" if ok else "REFUTED",
        "C": "a supplementary provision could reuse the clause; only MainProvision/第四十二条の三 counts",
        "U": "fidelity only; eligibility and legal review remain open",
    }
    print(json.dumps({"law_id": LAW_ID, "article": "42_3", "sha256": digest,
                      "sha256_pin_ok": digest == pinned, "article_hits": len(hits),
                      "needle_in_article": bool(hits) and norm(NEEDLE) in norm(hits[0]),
                      "finding": finding, "completion_status_promoted": False},
                     ensure_ascii=False, indent=2))
    return 0 if ok else 1

if __name__ == "__main__":
    raise SystemExit(main())
