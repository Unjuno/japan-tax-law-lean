#!/usr/bin/env python3
"""Article-scoped fidelity diagnostic with exact source positions.

A numeric match anywhere in the whole pinned text is NOT article-level
verification (Directive §1.4).  This diagnostic records, per transcription
check, the article/paragraph/item/appendix cell that contains each needle and
its character offsets in the pinned source.  Each finding carries the H/T/D/C/U
evidence tuple required by Objective §5.  D=PASS means only "needle located in
the stated article" — never a proof or legal-correctness claim.
"""
from __future__ import annotations

import importlib.util
import json
import re
import sys
from pathlib import Path

# normative_core lives in scripts/ci; this script runs from the repository root
# as `python scripts/law_audit/phase_e/article_scope.py`, so add that directory.
sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "ci"))
from normative_core import REPO, flat, norm  # noqa: E402

INVENTORY = REPO / "data" / "INVENTORY.json"
AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"
OUT = REPO / "docs" / "ARTICLE_SCOPE.md"
OUT_JSON = REPO / "data" / "ARTICLE_SCOPE_POSITIONS.json"


def iter_units(node, path=()):
    if isinstance(node, dict):
        tag = node.get("tag")
        if tag in ("MainProvision", "SupplProvision", "AppdxTable"):
            path = path + (tag,)
        if tag in ("Article", "AppdxTable", "TableRow", "Paragraph", "Item"):
            yield path + (tag, str((node.get("attr") or {}).get("Num", ""))), node
        for c in node.get("children", []):
            yield from iter_units(c, path)
    elif isinstance(node, list):
        for c in node:
            yield from iter_units(c, path)


def offsets(raw: str, needle: str) -> list[int]:
    """Raw offsets of a whitespace-normalised needle."""
    target = norm(needle)
    mapping: dict[int, int] = {}
    j = 0
    pending = False
    for i, ch in enumerate(raw):
        if ch.isspace() or ch == "\u3000":
            if not pending:
                mapping[j] = i
                pending = True
            continue
        pending = False
        mapping[j] = i
        j += 1
    result = []
    start = 0
    while True:
        # find normalised needle inside the normalised raw text
        k = norm(raw).find(target, start)
        if k < 0:
            break
        if k in mapping:
            result.append(mapping[k])
        start = k + 1
    return result


def article_title_to_num(doc: dict) -> dict[str, str]:
    """Map ArticleTitle text (漢数字 e.g. 第二十一条の五) to the e-Gov Num (21_5).

    The scope ledger stores structural paths with the e-Gov Num, while
    transcription_audit pins use the kanji ArticleTitle. Comparing them
    directly makes every D decision false (160/160 FAIL) even when the needle
    is correctly scoped. This mapping is the independent bridge.
    """
    out: dict[str, str] = {}

    def walk(n):
        if isinstance(n, dict):
            if n.get("tag") == "Article":
                num = str((n.get("attr") or {}).get("Num", ""))
                for c in n.get("children", []):
                    if isinstance(c, dict) and c.get("tag") == "ArticleTitle":
                        out[norm(flat(c))] = num
            for c in n.get("children", []):
                walk(c)
        elif isinstance(n, list):
            for c in n:
                walk(c)

    walk(doc.get("law_full_text", doc))
    return out


def scope_decision(art: str | None, num_map: dict[str, str], hits: list[dict]) -> tuple[bool, list[str]]:
    """Pure D/C decision for one check.

    Returns (article_scoped, competing_locations). Kanji ArticleTitle pins are
    resolved through `num_map` to the e-Gov Num used in structural paths.
    """
    if art:
        targets = {num for title, num in num_map.items() if title == norm(art)}
        stated = any(any(f"Article/{n}" in h["unit"] for n in targets) for h in hits)
        competing = [
            h["unit"] for h in hits
            if not any(f"Article/{n}" in h["unit"] for n in targets)
        ]
    else:
        stated = bool(hits)
        competing = []
    return stated, competing


def main() -> int:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = {l["law_id"]: l for l in inv.get("laws", [])}
    spec = importlib.util.spec_from_file_location("as_audit", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)

    docs, num_maps, rows = {}, {}, []
    scoped = whole_only = 0
    for name, law_id, kind, art, needles in mod.checks():
        if law_id not in docs:
            sf = (laws.get(law_id, {}).get("raw_snapshot") or {}).get("source_file")
            p = REPO / sf if sf else None
            docs[law_id] = json.loads(p.read_text(encoding="utf-8")) if p and p.exists() else {}
            num_maps[law_id] = article_title_to_num(docs[law_id])
        hits, positions = [], []
        for upath, unode in iter_units(docs[law_id].get("law_full_text", docs[law_id])):
            raw = flat(unode)
            if not norm(raw):
                continue
            n = sum(1 for needle in needles if norm(needle) in norm(raw))
            if n:
                hits.append({"unit": "/".join(upath), "needles_matched": n})
                for needle in needles:
                    offs = offsets(raw, needle)
                    if offs:
                        positions.append({"unit": "/".join(upath), "needle": needle, "raw_offsets": offs})
        stated, competing = scope_decision(art, num_maps.get(law_id, {}), hits)
        if hits:
            scoped += 1
        else:
            whole_only += 1
        rows.append({
            "check": name,
            "law_id": law_id,
            "stated_article": art or "(file-level)",
            "needles": needles,
            "unit_hits": hits,
            "positions": positions,
            "article_scoped": stated,
            "whole_text_only": not bool(hits),
            "competing_locations": competing,
            "H": "needle occurs in the stated article of the pinned source",
            "T": "whitespace-normalised substring search in the pinned JSON",
            "D": "PASS" if stated else "FAIL",
            "C": ("needle reused in: " + ", ".join(competing)) if art
                 else "whole-text numeric coincidence is a competing, weaker interpretation",
            "U": "fidelity only; no semantic or legal conclusion",
            "sufficient_for_completion": False,
        })

    lines = [
        "# Article-scoped fidelity diagnostic (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `scripts/law_audit/phase_e/article_scope.py`.",
        "",
        "A whole-text numeric match is NOT article-level verification. This is a",
        "source-fidelity diagnostic (D=PASS means needle in stated article only),",
        "never a completion gate or a semantic/legal claim.",
        "",
        f"- checks with article/table-cell scoped needles: {scoped}",
        f"- checks with no scoped unit: {whole_only}",
        "",
        "| law_id | stated article | needle hits | scoped positions | D |",
        "|---|---|---:|---:|---|",
    ]
    for r in rows:
        lines.append(
            f"| `{r['law_id']}` | {r['stated_article']} | {len(r['unit_hits'])} | "
            f"{len(r['positions'])} | {r['D']} |"
        )
    lines.append("")
    OUT.write_text("\n".join(lines), encoding="utf-8")
    OUT_JSON.write_text(
        json.dumps({"scoped": scoped, "whole_text_only": whole_only, "checks": rows},
                   ensure_ascii=False, separators=(",", ":")) + "\n",
        encoding="utf-8",
    )
    print(f"article-scope diagnostic: {scoped} scoped / {whole_only} whole-text across {len(rows)} checks")
    return 0


if __name__ == "__main__":
    sys.exit(main())
