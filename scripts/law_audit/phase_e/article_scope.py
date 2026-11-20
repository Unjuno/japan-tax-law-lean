#!/usr/bin/env python3
"""Article-scoped fidelity diagnostic (Sponsor Directive §4).

For each transcription_audit check, determine which article(s)/appendix cells
of the pinned raw snapshot actually contain its needles. A needle that matches
only an unrelated article is reported as a candidate mis-pin requiring review.

This is a DIAGNOSTIC, not a completion gate: it reports article/paragraph scope
per check so a whole-text numeric match is never mistaken for article-level
verification. Deterministic; regenerate with this script.
"""
from __future__ import annotations

import importlib.util
import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
INVENTORY = REPO / "data" / "INVENTORY.json"
AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"
OUT = REPO / "docs" / "ARTICLE_SCOPE.md"
sys.path.insert(0, str(REPO / "scripts" / "ci"))
import norm_decomposer as nd  # noqa: E402


def flat(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat(c) for c in node.get("children", []))
    return ""


def norm(t: str) -> str:
    return re.sub(r"[\s\u3000]+", "", t)


def iter_units(node, path=()):
    if isinstance(node, dict):
        tag = node.get("tag")
        if tag in ("MainProvision", "SupplProvision", "AppdxTable"):
            path = path + (tag,)
        if tag in ("Article", "AppdxTable", "TableRow"):
            yield path + (tag, str((node.get("attr") or {}).get("Num", ""))), node
        for c in node.get("children", []):
            yield from iter_units(c, path)
    elif isinstance(node, list):
        for c in node:
            yield from iter_units(c, path)


def main() -> int:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = {l["law_id"]: l for l in inv.get("laws", [])}
    spec = importlib.util.spec_from_file_location("as_ta", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)

    docs_cache = {}
    rows = []
    scoped = 0
    whole_only = 0
    coverage_total = 0
    coverage_ok = 0
    unresolved_total = 0
    for name, law_id, kind, art, needles in mod.checks():
        rec = laws.get(law_id)
        sf = (rec or {}).get("raw_snapshot", {}).get("source_file")
        if law_id not in docs_cache:
            p = REPO / sf if sf else None
            docs_cache[law_id] = json.loads(p.read_text(encoding="utf-8")) if p and p.exists() else None
        doc = docs_cache[law_id]
        if doc is None:
            continue
        units = []
        for upath, unode in iter_units(doc.get("law_full_text")):
            ut = norm(flat(unode))
            if not ut:
                continue
            hits = sum(1 for n in needles if norm(n) in ut)
            if hits:
                units.append(("/".join(upath), hits))
        if units:
            scoped += 1
            loc = "; ".join(f"{p}×{h}" for p, h in units[:3])
            # Mechanical decomposition check for the scoped text only. This is
            # a diagnostic: reconstruction is necessary but never a fidelity
            # proof, and unresolved fragments stay unresolved.
            for upath, unode in iter_units(doc.get("law_full_text")):
                if "/".join(upath) not in {p for p, _ in units[:3]}:
                    continue
                text = norm(flat(unode))
                if not text:
                    continue
                cov = nd.audit_coverage(text, nd.decompose(text, "/".join(upath)))
                coverage_total += 1
                coverage_ok += 1 if cov["ok"] else 0
                unresolved_total += cov["unresolved_count"]
        else:
            whole_only += 1
            loc = "(no article/table-cell unit contains all needle text)"
        rows.append((law_id, art or "(file-level)", len(needles), loc, name.split("↔")[0].strip()[:60]))

    lines = [
        "# Article-scoped fidelity diagnostic (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `scripts/law_audit/phase_e/article_scope.py`.",
        "",
        "Sponsor Directive §4: a numeric match anywhere in the whole pinned text is",
        "NOT article-level verification. This report records, per transcription",
        "check, which article / appendix table cell actually contains the needles.",
        "It is a DIAGNOSTIC for the independent-audit axis, not a completion gate.",
        "",
        f"- checks with article/table-cell scoped needles: {scoped}",
        f"- checks with no scoped unit (whole-text or cross-article needles): {whole_only}",
        f"- scoped units with exact mechanical reconstruction: {coverage_ok}/{coverage_total}",
        f"- unresolved normative fragments recorded (not judged): {unresolved_total}",
        "",
        "Coverage figures above are mechanical character reconstruction only.",
        "They are NOT a fidelity proof and NOT a completion gate.",
        "",
        "| law_id | stated article | needles | containing unit(s) | check |",
        "|---|---|---:|---|---|",
    ]
    for lid, art, n, loc, nm in rows:
        lines.append(f"| `{lid}` | {art} | {n} | {loc} | {nm} |")
    lines.append("")
    OUT.write_text("\n".join(lines), encoding="utf-8")
    print(f"article-scope diagnostic: {scoped} scoped / {whole_only} whole-text across {len(rows)} checks")
    return 0


if __name__ == "__main__":
    sys.exit(main())
