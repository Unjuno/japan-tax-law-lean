#!/usr/bin/env python3
"""Independent original-text audit for 所得税法 art.84の2.

Verifies the SHA-256 pin, locates the exact article in MainProvision, and checks
the pinned needles. Promotes no completion status by itself.
"""
from __future__ import annotations
import hashlib, json, re
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
SNAPSHOT = Path("data/raw/340AC0000000033_20261001_507AC0000000070.law.json")
LAW_ID = "340AC0000000033"
NEEDLES = [
    "六十三万円からその特定親族の合計所得金額のうち八十四万一円を超える部分の金額に二を乗じた金額",
    "十万円の整数倍の金額から八万円を控除した金額",
    "百十五万円を超え百二十万円以下である特定親族",
]


def flat(n):
    if isinstance(n, str):
        return n
    if isinstance(n, dict):
        return "".join(flat(c) for c in n.get("children", []))
    if isinstance(n, list):
        return "".join(flat(c) for c in n)
    return ""


def norm(t):
    return re.sub(r"[\s\u3000]+", "", t or "")


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
            if n.get("tag") == "MainProvision":
                in_main = True
            if in_main and n.get("tag") == "Article":
                titles = "".join(norm(flat(c)) for c in n.get("children", [])
                                 if isinstance(c, dict) and c.get("tag") == "ArticleTitle")
                if titles == "第八十四条の二":
                    hits.append(flat(n))
                    return
            for c in n.get("children", []):
                walk(c, in_main)
        elif isinstance(n, list):
            for c in n:
                walk(c, in_main)

    walk(doc.get("law_full_text", doc))
    text = norm(hits[0]) if len(hits) == 1 else ""
    needle_hits = [n for n in NEEDLES if norm(n) in text]
    ok = digest == pinned and len(hits) == 1 and len(needle_hits) == len(NEEDLES)
    finding = {
        "rule": "SRC-SRS-1", "must": True,
        "H": "The four-bracket deduction and rounding literal occur in the pinned main article 84-2.",
        "T": "sha256 pin recheck + MainProvision ArticleTitle scan + normalized needle containment",
        "D": "CONFIRMED" if ok else "REFUTED",
        "C": "a same-numbered supplementary provision could reuse the literal; only MainProvision/第八十四条の二 counts",
        "U": "fidelity only; eligibility and legal review remain open",
    }
    print(json.dumps({
        "law_id": LAW_ID, "article": "84_2", "sha256": digest,
        "sha256_pin_ok": digest == pinned, "article_hits": len(hits),
        "needle_hits": len(needle_hits), "finding": finding,
        "completion_status_promoted": False,
    }, ensure_ascii=False, indent=2))
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
