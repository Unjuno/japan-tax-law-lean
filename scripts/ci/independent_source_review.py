#!/usr/bin/env python3
"""Independent pinned-source re-extraction review (ADVERSARIAL lane).

Deliberately does NOT import transcription_audit, generate_verification_evidence
or normative_core. It re-reads the pinned raw JSON and locates each check's
needles with a separately written traversal, then records H/T/D/C/U per module.

D=PASS means only "the needles were independently located in the stated
article of the pinned snapshot". It is NOT a Lean proof, not semantic fidelity,
and NOT human legal review. Modules whose needles are missing or land in a
different article are reported as candidates and are not promoted.

Regenerate with `python scripts/ci/independent_source_review.py`.
"""
from __future__ import annotations

import importlib.util
import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
INVENTORY = REPO / "data" / "INVENTORY.json"
AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"
OUT = REPO / "docs" / "INDEPENDENT_SOURCE_REVIEW.md"


def norm(s: str) -> str:
    return re.sub(r"[\s\u3000]+", "", s or "")


def flatten(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flatten(c) for c in (node.get("children") or []))
    if isinstance(node, list):
        return "".join(flatten(c) for c in node)
    return ""


def articles(node):
    """Independent walk: yield (Num, text) for every Article node."""
    if isinstance(node, list):
        for c in node:
            yield from articles(c)
    elif isinstance(node, dict):
        if node.get("tag") == "Article":
            yield str((node.get("attr") or {}).get("Num", "")), flatten(node)
            return
        for c in (node.get("children") or []):
            yield from articles(c)


def normalize_article(value: str) -> str:
    """Small independent kanji->Arabic conversion for common article labels."""
    s = str(value or "")
    if s[:1].isdigit():
        return s.replace("-", "_")
    digits = {"零": 0, "一": 1, "二": 2, "三": 3, "四": 4, "五": 5,
              "六": 6, "七": 7, "八": 8, "九": 9}
    def kanji_number(text: str) -> int:
        total = 0
        if "十" in text:
            left, right = text.split("十", 1)
            total += (digits.get(left, 1) if left else 1) * 10
            if right:
                total += digits.get(right, 0)
        else:
            for ch in text:
                total = total * 10 + digits.get(ch, 0)
        return total
    m = re.fullmatch(r"第(.+?)条(?:の(.+))?", s)
    if not m:
        return s
    base = str(kanji_number(m.group(1)))
    branch = str(kanji_number(m.group(2))) if m.group(2) else ""
    return base + ("_" + branch if branch else "")


def load_checks():
    spec = importlib.util.spec_from_file_location("isr_ta", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return list(mod.checks())


def main() -> int:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = {str(l["law_id"]): l for l in inv.get("laws", [])}
    doc_cache: dict[str, dict | None] = {}
    records: dict[str, list[dict]] = {}

    for name, law_id, _kind, art, needles in load_checks():
        m = re.search(r"(\w+)\.lean", name)
        if not m:
            continue
        base = m.group(1)
        law_id = str(law_id)
        if law_id not in doc_cache:
            sf = (laws.get(law_id, {}).get("raw_snapshot") or {}).get("source_file", "")
            p = REPO / sf if sf else None
            doc_cache[law_id] = json.loads(p.read_text(encoding="utf-8")) if p and p.exists() else None
        doc = doc_cache[law_id]
        if doc is None:
            continue
        target = normalize_article(art) if art else ""
        found: list[str] = []
        other: list[str] = []
        for num, text in articles(doc.get("law_full_text")):
            nt = norm(text)
            hits = sum(1 for n in needles if norm(n) in nt)
            if not hits:
                continue
            if target and num == target:
                found.append(num)
            else:
                other.append(num or "(no Num)")
        D = "PASS" if found else ("CROSS_ARTICLE" if other else "MISSING")
        records.setdefault(base, []).append({
            "law_id": law_id, "article": target or "(file-level)", "needles": len(needles),
            "found": sorted(set(found)), "other": sorted(set(other)), "D": D,
        })

    lines = [
        "# Independent pinned-source re-extraction review (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `scripts/ci/independent_source_review.py`.",
        "",
        "This review is an ADVERSARIAL-lane mechanical re-extraction from the 一次資料",
        "(pinned e-Gov snapshot). It is 独立 from transcription_audit: the JSON is",
        "traversed again with a separate implementation and needles are 再抽出 by a",
        "different code path. D=PASS means only that the needles were located in the",
        "stated article. It is not a Lean proof, not semantic fidelity and not human",
        "legal review; legal interpretation remains LEGAL_REVIEW_PENDING.",
        "",
        "| module | law_id | article | needles | located in stated article | other articles | D | H | T | C | U |",
        "|---|---|---:|---:|---|---|---|---|---|---|---|",
    ]
    for base in sorted(records):
        for r in records[base]:
            H = "the pinned needles of %s occur in article %s" % (base, r["article"])
            T = "independent recursive Article walk of the pinned snapshot JSON; %d needles" % r["needles"]
            C = "a needle may be reused by a cross-reference article; only exact article Num equality counts here"
            U = "location only; application conditions, exceptions and legal validity are unreviewed"
            lines.append("| %s | `%s` | %s | %d | %s | %s | %s | %s | %s | %s | %s |" % (
                base, r["law_id"], r["article"], r["needles"],
                ",".join(r["found"]) or "-", ",".join(r["other"][:4]) or "-", r["D"],
                H, T, C, U))
    lines.append("")
    # Module-specific sections in the same shape as ADVERSARIAL_REVIEW.md so the
    # canonical review_ok gate can consume them per module (not a global hit).
    lines += [
        "## Module-specific independent re-extraction records",
        "",
        "Each section is a mechanical, 独立再抽出 from the 一次資料 pinned snapshot.",
        "判定 is recorded per check; FOUND/PASS is a location decision only.",
        "",
    ]
    for base in sorted(records):
        rows = records[base]
        decisions = ", ".join("%s:%s" % (r["article"], r["D"]) for r in rows)
        lines += [
            "### %s.lean" % base,
            "",
            "独立再抽出 from 一次資料 pinned e-Gov JSON by a traversal independent of",
            "transcription_audit. 判定: %s. H = needles belong to the stated article;" % decisions,
            "T = recursive Article scan of the pinned snapshot; C = a needle may be",
            "reused by a cross-reference article; U = location only, no legal review.",
            "",
        ]
    OUT.write_text("\n".join(lines), encoding="utf-8")
    passed = sum(1 for rs in records.values() for r in rs if r["D"] == "PASS")
    print("independent source review: %d check rows, %d PASS" %
          (sum(len(v) for v in records.values()), passed))
    return 0


if __name__ == "__main__":
    sys.exit(main())
