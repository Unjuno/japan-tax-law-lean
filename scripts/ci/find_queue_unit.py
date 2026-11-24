#!/usr/bin/env python3
"""Find queue units whose text contains a needle (deterministic, read-only).

Usage: python scripts/ci/find_queue_unit.py <needle> [limit]
Writes matching units as compact JSON to build/queue_unit_hits.json and prints
a summary. The needle must be checked against the pinned raw clause before it
is used as a formalization source.
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
needle = sys.argv[1] if len(sys.argv) > 1 else ""
limit = int(sys.argv[2]) if len(sys.argv) > 2 else 20
q = json.loads((REPO / "build/task_queue.json").read_text(encoding="utf-8"))
tasks = q.get("tasks", [])
hits = []
for t in tasks:
    text = str(t.get("text") or t.get("norm_fragment") or "")
    if needle and needle in text:
        hits.append({
            "id": t.get("id", ""),
            "law_id": t.get("law_id", ""),
            "revision": t.get("revision", ""),
            "article": t.get("article", ""),
            "kind": t.get("kind", ""),
            "status": t.get("status", ""),
            "text": text,
            "source_path": t.get("source_path", ""),
            "source_file": t.get("source_file", ""),
        })
out = REPO / "build" / "queue_unit_hits.json"
out.parent.mkdir(exist_ok=True)
out.write_text(json.dumps(hits, ensure_ascii=False, indent=2), encoding="utf-8")
print(f"needle={needle!r} hits={len(hits)} (first {min(limit, len(hits))})")
for h in hits[:limit]:
    print(h["id"], h["article"], h["status"], "|", h["text"][:90])
