#!/usr/bin/env python3
"""Independent original-text audit for 地方税法 art.594 (SpecialLandHoldingTaxRate).

Extracts the pinned article directly, verifies the SHA-256 pin, checks that the
exact literal occurs in the stated main article, and records an H/T/D/C/U
finding. Promotes no completion status by itself.
"""
from __future__ import annotations

import hashlib, json, re
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
SNAPSHOT = Path("data/raw/325AC0000000226_20261101_508AC0000000002.law.json")
LAW_ID = "325AC0000000226"
ARTICLE = "第五百九十四条"
NEEDLE = "特別土地保有税の税率は、土地に対して課する特別土地保有税にあつては百分の一・四、土地の取得に対して課する特別土地保有税にあつては百分の三とする。"


def flat(n) -> str:
    if isinstance(n, str):
        return n
    if isinstance(n, dict):
        return "".join(flat(c) for c in n.get("children", []))
    if isinstance(n, list):
        return "".join(flat(c) for c in n)
    return ""


def norm(t: str) -> str:
    return re.sub(r"[\s\u3000]+", "", t or "")


def main() -> int:
    raw = (REPO / SNAPSHOT).read_bytes()
    digest = hashlib.sha256(raw).hexdigest().upper()
    inv = json.loads((REPO / "data" / "INVENTORY.json").read_text(encoding="utf-8"))
    rec = next(l for l in inv["laws"] if l["law_id"] == LAW_ID)
    pinned = str((rec.get("raw_snapshot") or {}).get("source_sha256", "")).upper()
    doc = json.loads(raw)
    hits = []

    def walk(n, in_main=False):
        if isinstance(n, dict):
            if n.get("tag") == "MainProvision":
                in_main = True
            if in_main and n.get("tag") == "Article":
                title = "".join(norm(flat(c)) for c in n.get("children", [])
                                if isinstance(c, dict) and c.get("tag") == "ArticleTitle")
                if title == ARTICLE:
                    hits.append(flat(n))
                    return
            for c in n.get("children", []):
                walk(c, in_main)
        elif isinstance(n, list):
            for c in n:
                walk(c, in_main)

    walk(doc.get("law_full_text", doc))
    ok = digest == pinned and len(hits) == 1 and norm(NEEDLE) in norm(hits[0])
    finding = {
        "rule": "SRC-SLHR-1",
        "must": True,
        "H": "The exact statutory rate literal occurs once in the pinned main article art.594.",
        "T": "sha256 pin recheck + MainProvision ArticleTitle scan + normalized needle containment",
        "D": "CONFIRMED" if ok else "REFUTED",
        "C": "a same-numbered supplementary provision or another law could reuse the literal; only MainProvision/第五百九十四条 counts",
        "U": "fidelity only; rate interpretation and legal review remain open",
    }
    print(json.dumps({
        "law_id": LAW_ID, "article": ARTICLE, "sha256": digest,
        "sha256_pin_ok": digest == pinned, "article_hits": len(hits),
        "needle_in_stated_article": bool(hits) and norm(NEEDLE) in norm(hits[0]),
        "finding": finding, "completion_status_promoted": False,
    }, ensure_ascii=False, indent=2))
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
