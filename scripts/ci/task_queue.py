#!/usr/bin/env python3
"""Persistent task queue (Sponsor Directive §3).

Generates one machine-readable work unit per pinned legal provision from the
authoritative inventory. Each unit records:

  * law_id / revision / enforcement date / pinned source file
  * article / paragraph / item / appendix-table-cell paths
  * normative text fragment (from pinned bytes)
  * verification obligations (Directive §2 — tracked SEPARATELY)
  * dependencies (references extracted from the provision)
  * status with independent axes (Directive §6):
      source_fixed, structure_identified, norm_decomposed,
      formalized, proved, boundary_checked, independent_audit,
      legal_review  (LEGAL_REVIEW_PENDING — never auto-satisfied)
  * scope: FULL_ARTICLE vs COMPUTABLE_SLICE_ONLY (Directive §2)

The Coordinator selects unfinished tasks from this queue and assigns them to
subagents. Human legal review is NOT a precondition for formalization.

Regenerate with `python scripts/ci/task_queue.py`; deterministic gate.
"""
from __future__ import annotations

import hashlib
import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
INVENTORY = REPO / "data" / "INVENTORY.json"
SWEEP = REPO / "build" / "audit_sweep.json"
AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"
OUT_JSON = REPO / "build" / "task_queue.json"
OUT_MD = REPO / "docs" / "TASK_QUEUE.md"

OBLIGATIONS = [
    "source_fixed",
    "structure_identified",
    "norm_decomposed",
    "formalized",
    "proved",
    "boundary_checked",
    "independent_audit",
    "legal_review",
]


def flat(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat(c) for c in node.get("children", []))
    return ""


def jnum(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(jnum(c) for c in node.get("children", []))
    return ""


def iter_articles(node, path=()):
    """Yield (path, article_node) for every Article under MainProvision or SupplProvision."""
    if isinstance(node, dict):
        tag = node.get("tag")
        if tag == "MainProvision":
            path = path + ("Main",)
        elif tag == "SupplProvision":
            path = path + ("Supplementary",)
        elif tag == "AppdxTable":
            path = path + ("AppdxTable",)
        elif tag == "Article":
            yield path + (tag,), node
            # do not descend into nested Article for paths
            return
        for c in node.get("children", []):
            yield from iter_articles(c, path)
    elif isinstance(node, list):
        for c in node:
            yield from iter_articles(c, path)


def paths_of(node):
    """Return (article_no, title, [(para_no, [item_no...])], table_rows)."""
    article_no = ""
    title = ""
    paras = []
    table_rows = 0
    # Article/Paragraph/Item numbers are carried in attr.Num (Arabic), not in
    # a separate *Num child in the pinned e-Gov JSON.
    article_no = norm(str((node.get("attr") or {}).get("Num", "")))
    for c in node.get("children", []):
        if not isinstance(c, dict):
            continue
        if c.get("tag") == "ArticleTitle":
            title = norm(jnum(c))
        elif c.get("tag") == "Paragraph":
            pno = norm(str((c.get("attr") or {}).get("Num", "")))
            items = []
            for d in c.get("children", []):
                if isinstance(d, dict) and d.get("tag") == "Item":
                    items.append(norm(str((d.get("attr") or {}).get("Num", ""))))
            paras.append((pno, items))
        elif c.get("tag") == "TableRow":
            table_rows += 1
    return article_no, title, paras, table_rows


def norm(t: str) -> str:
    return re.sub(r"[\s\u3000]+", "", t).strip()


def refs_of(text: str) -> list[str]:
    ids = set(re.findall(r"\d{15}", text))
    return sorted(ids)


def main() -> int:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = inv.get("laws", [])
    sweep = json.loads(SWEEP.read_text(encoding="utf-8")) if SWEEP.exists() else {}
    sw_status = {lid: v for lid, v in (sweep.get("laws") or {}).items()} if isinstance(sweep.get("laws"), dict) else {}

    # article pins already covered by the audit
    import importlib.util
    spec = importlib.util.spec_from_file_location("tq_ta", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    # Map each law's pinned audit needles to the articles that actually contain
    # them. This handles both explicit article pins (kanji numerals) and
    # file-level checks whose needles span one or more articles.
    pin_needles = {}
    for name, law_id, kind, art, needles in mod.checks():
        pin_needles.setdefault(law_id, []).extend(needles)

    tasks = []
    for law in laws:
        lid = law["law_id"]
        rev = (law.get("current_revision") or {}).get("law_revision_id", "")
        sf = (law.get("raw_snapshot") or {}).get("source_file")
        if not sf:
            continue
        p = REPO / sf
        if not p.exists():
            continue
        doc = json.loads(p.read_text(encoding="utf-8"))
        full = norm(flat(doc.get("law_full_text")))
        covered_articles = set()
        for needle in pin_needles.get(lid, []):
            n = norm(needle)
            for apath, anode in iter_articles(doc.get("law_full_text")):
                an, _, _, _ = paths_of(anode)
                if an and n in norm(flat(anode)):
                    covered_articles.add(an)
        for path, node in iter_articles(doc.get("law_full_text")):
            anum, title, paras, rows = paths_of(node)
            if not anum:
                continue
            text = norm(flat(node))
            key = f"{lid}|{rev}|{'/'.join(path)}|{anum}"
            task_id = hashlib.sha256(key.encode("utf-8")).hexdigest()[:16]
            covered = anum in covered_articles
            tasks.append({
                "task_id": task_id,
                "law_id": lid,
                "law_title": law.get("official_title", ""),
                "revision": rev,
                "enforcement_date": (law.get("current_revision") or {}).get("enforcement_date", ""),
                "source_file": sf,
                "path": "/".join(path),
                "article": anum,
                "article_title": title,
                "paragraphs": [{"no": n, "items": its} for n, its in paras],
                "table_rows": rows,
                "norm_fragment": text[:240],
                "reference_ids": refs_of(text),
                "obligations": OBLIGATIONS,
                "status": {
                    "source_fixed": True,
                    "structure_identified": True,
                    "norm_decomposed": False,
                    "formalized": "COMPLETE_SCOPE" if covered else "NOT_STARTED",
                    "proved": False,
                    "boundary_checked": False,
                    "independent_audit": False,
                    "legal_review": "LEGAL_REVIEW_PENDING",
                },
                "scope": "FULL_ARTICLE",
                "priority": 1 if covered else 2,
            })

    payload = {
        "tool": "scripts/ci/task_queue.py",
        "inventory_snapshot_date": inv.get("snapshot_date", ""),
        "laws_total": len(laws),
        "units_total": len(tasks),
        "obligations": OBLIGATIONS,
        "tasks": tasks,
    }
    OUT_JSON.parent.mkdir(parents=True, exist_ok=True)
    OUT_JSON.write_text(json.dumps(payload, ensure_ascii=False, separators=(",", ":")), encoding="utf-8")

    not_started = sum(1 for t in tasks if t["status"]["formalized"] == "NOT_STARTED")
    lines = [
        "# Persistent task queue (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/task_queue.py`.",
        "",
        "Sponsor Directive §3: every pinned legal provision is a durable work unit.",
        "Human legal review (`LEGAL_REVIEW_PENDING`) is NOT a precondition for",
        "formalization and is tracked as an independent axis (Directive §6).",
        "",
        f"- laws in inventory: {len(laws)}",
        f"- work units generated: {len(tasks)}",
        f"- units with a pinned literal check: {len(tasks) - not_started}",
        f"- units NOT_STARTED: {not_started}",
        "",
        "## Status axes (independent — Directive §6)",
        "",
        "| axis | values |",
        "|---|---|",
        "| source_fixed / structure_identified | True for all pinned units |",
        "| norm_decomposed | False unless explicitly recorded |",
        "| formalized | NOT_STARTED / COMPLETE_SCOPE / COMPLETE_FULL |",
        "| proved / boundary_checked / independent_audit | False until verified |",
        "| legal_review | LEGAL_REVIEW_PENDING (never auto-satisfied) |",
        "",
        "The full machine-readable queue is `build/task_queue.json` (git-ignored,",
        "regenerated from INVENTORY.json + pinned snapshots). The regeneration gate",
        "verifies determinism. Coordinator selects unfinished units from the queue.",
        "",
        "## Sample NOT_STARTED units (first 20)",
        "",
        "| law_id | article | title | paragraphs | refs |",
        "|---|---|---|---:|---:|",
    ]
    for t in [x for x in tasks if x["status"]["formalized"] == "NOT_STARTED"][:20]:
        lines.append(f"| `{t['law_id']}` | {t['article']} | {t['article_title'][:40]} | {len(t['paragraphs'])} | {len(t['reference_ids'])} |")
    lines.append("")
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print(f"task queue: {len(tasks)} units across {len(laws)} laws; NOT_STARTED={not_started}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
