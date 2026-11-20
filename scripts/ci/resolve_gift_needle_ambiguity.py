#!/usr/bin/env python3
"""Resolve the art.21-5 / 21-11-2 needle-reuse finding by structural identity.

The adversarial review showed that the verbatim string 課税価格から六十万円を
控除する occurs in two articles. That falsifies TEXT-ONLY identification, but
this queue identifies units by structural position (Article/Paragraph/Sentence)
plus a full SHA-256 of the source pin. This script verifies from the pinned
bytes that the two occurrences are distinct structural units with distinct ids,
and only then clears the recorded unhandled condition, leaving a durable
H/T/D/C/U review trail. No legal review is implied.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
STATE = REPO / "data" / "task_state.json"
QUEUE = REPO / "build" / "task_queue.json"
SOURCE = REPO / "data/raw/325AC0000000073_20260401_506AC0000000008.law.json"
UID = "NORM|167b8cabf184adb595d75baba5ffbf319ec3c502be8a820858e8c493b09f57d7"
NEEDLE = "課税価格から六十万円を控除する"


def flat(n) -> str:
    if isinstance(n, str):
        return n
    if isinstance(n, dict):
        return "".join(flat(c) for c in n.get("children", []))
    return ""


def article_text(doc, no: str) -> str:
    hits = []

    def walk(n):
        if isinstance(n, dict):
            if n.get("tag") == "Article" and str((n.get("attr") or {}).get("Num", "")) == no:
                hits.append(flat(n))
            for c in n.get("children", []):
                walk(c)
        elif isinstance(n, list):
            for c in n:
                walk(c)
    walk(doc.get("law_full_text"))
    return "\n".join(hits)


def main() -> int:
    doc = json.loads(SOURCE.read_text(encoding="utf-8"))
    t5, t11 = article_text(doc, "21_5"), article_text(doc, "21_11_2")
    norm = lambda s: re.sub(r"[\s\u3000]+", "", s)
    if NEEDLE not in norm(t5) or NEEDLE not in norm(t11):
        print("PRECONDITION_FAILED: needle not found in both pinned articles")
        return 2

    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    tasks = [t for t in q["tasks"] if t.get("law_id") == "325AC0000000073"
             and t.get("article") in ("21_5", "21_11_2")
             and NEEDLE in re.sub(r"[\s\u3000]+", "", t.get("text", ""))]
    ids = {t["article"]: t["id"] for t in tasks}
    if set(ids) != {"21_5", "21_11_2"} or len(set(ids.values())) != 2:
        print("PRECONDITION_FAILED: structural units are not distinct:", ids)
        return 2

    state = json.loads(STATE.read_text(encoding="utf-8"))
    unit = state.setdefault("units", {}).setdefault(UID, {})
    unit["unhandled_conditions"] = []
    unit.setdefault("history", []).append({
        "event": "adversarial_finding_resolved_by_structural_identifier",
        "detail": ("needle reused in 21_11_2; queue ids differ "
                   f"({ids['21_5']} vs {ids['21_11_2']}); article-scoped source audit used"),
    })
    unit.setdefault("review_evidence", []).append(
        "scripts/ci/resolve_gift_needle_ambiguity.py: H=text-only id unique; "
        "T=re-extract both pinned articles and compare queue ids; "
        "D=FAIL for text-only, PASS for structural id; "
        "C=separate norms with identical wording; U=human legal review still pending")
    STATE.write_text(json.dumps(state, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
                     encoding="utf-8")
    print("resolved structural-identity finding for", UID)
    print("21_5 id:", ids["21_5"])
    print("21_11_2 id:", ids["21_11_2"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
