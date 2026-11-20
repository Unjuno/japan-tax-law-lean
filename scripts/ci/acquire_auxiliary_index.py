#!/usr/bin/env python3
"""Acquire and pin an *index page* for an auxiliary source layer (Objective §2).

This is deliberately limited: it pins the index page bytes and records its
SHA-256. It does NOT claim acquisition of the underlying sources (circulars,
treaties, ordinances, case law). Those remain separate denominators.

Current source: L4_CIRCULAR — National Tax Agency circular index.

Run manually (network required); generated metadata is committed and consumed
by scripts/ci/source_layers.py.
"""
from __future__ import annotations

import hashlib
import json
import re
import ssl
import urllib.request
from datetime import date
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
SOURCE = "https://www.nta.go.jp/law/tsutatsu/menu.htm"
ERROR_MARKER = "指定されたページを表示できませんでした"
RAW_DIR = REPO / "data" / "raw_circulars"
OUT = RAW_DIR / "nta_tsutatsu_index.meta.json"
LAYER = "L4_CIRCULAR"


def tls_context():
    try:
        import certifi
        return ssl.create_default_context(cafile=certifi.where())
    except Exception:
        return ssl.create_default_context()


def main() -> int:
    req = urllib.request.Request(SOURCE, headers={"User-Agent": "japan-tax-law-lean/1.0 (source index pinning)"})
    with urllib.request.urlopen(req, timeout=30, context=tls_context()) as resp:
        body = resp.read()
        final_url = resp.geturl()
    RAW_DIR.mkdir(parents=True, exist_ok=True)
    raw_path = RAW_DIR / "nta_tsutatsu_menu.html"
    digest = hashlib.sha256(body).hexdigest()
    text = body.decode("shift_jis", errors="replace")
    # A 200 response can still be a "page not found" template; never pin that.
    if ERROR_MARKER in text or len(body) < 5000:
        raise RuntimeError(
            "refusing to pin a non-content error page: "
            + (re.search(r"<title>(.*?)</title>", text, re.S).group(1).strip()
               if re.search(r"<title>(.*?)</title>", text, re.S) else "unknown title"))
    raw_path.write_bytes(body)
    # Count links as a coarse index-size measurement (not an acquisition count).
    hrefs = re.findall(r'href="([^"]+)"', text, flags=re.IGNORECASE)
    meta = {
        "tool": "scripts/ci/acquire_auxiliary_index.py",
        "layer_id": LAYER,
        "claim": "index page pinned only; underlying circular texts NOT acquired",
        "source_url": SOURCE,
        "final_url": final_url,
        "fetched_date": date.today().isoformat(),
        "raw_file": "data/raw_circulars/nta_tsutatsu_menu.html",
        "raw_sha256": digest,
        "raw_bytes": len(body),
        "index_href_count": len(hrefs),
        "content_acquired": False,
        "error_page_rejected": True,
        "retracted_source": "https://www.nta.go.jp/law/tsutatsu/kobetsu/index.htm "
                            "(returned an HTML 404 template with HTTP 200; not acquired)",
    }
    OUT.write_text(json.dumps(meta, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({k: meta[k] for k in ("layer_id", "raw_sha256", "raw_bytes",
                                           "index_href_count", "content_acquired")},
                     ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
