"""Pin revisions JSONs next to the raw law snapshots.

For every inventory entry whose raw_snapshot was fetched (or reused from the
cache), copies the corresponding e-Gov revisions JSON from the on-disk cache
into data/raw/<law_id>.revisions.json and verifies that the SHA-256 matches
the value recorded in data/INVENTORY.json.  Fails loudly on any mismatch.
"""
from __future__ import annotations

import hashlib
import json
import shutil
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
CACHE_DIR = REPO_ROOT / "build" / "inventory_cache"
RAW_DIR = REPO_ROOT / "data" / "raw"
INVENTORY = REPO_ROOT / "data" / "INVENTORY.json"
REVISIONS_URL = "https://laws.e-gov.go.jp/api/2/law_revisions/{law_id}"


def main() -> int:
    sys.stdout.reconfigure(encoding="utf-8")
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    copied = 0
    skipped = 0
    errors: list[str] = []
    for rec in inv["laws"]:
        if not rec.get("raw_snapshot"):
            skipped += 1
            continue
        law_id = rec["law_id"]
        url = REVISIONS_URL.format(law_id=law_id)
        key = hashlib.sha256(url.encode("utf-8")).hexdigest()
        src = CACHE_DIR / f"{key}.json"
        dest = RAW_DIR / f"{law_id}.revisions.json"
        if not src.exists():
            errors.append(f"{law_id}: cache miss for {url}")
            continue
        if not dest.exists():
            RAW_DIR.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(src, dest)
        actual = hashlib.sha256(dest.read_bytes()).hexdigest().upper()
        recorded = rec.get("revisions_sha256")
        if actual != recorded:
            errors.append(f"{law_id}: SHA-256 mismatch file={actual} manifest={recorded}")
            continue
        copied += 1
    print(f"pinned&verified: {copied}  skipped(no raw): {skipped}  errors: {len(errors)}")
    for e in errors:
        print("ERROR:", e)
    return 1 if errors else 0


if __name__ == "__main__":
    raise SystemExit(main())
