#!/usr/bin/env python3
"""Article-scoped fidelity diagnostic (Directive §1).

A numeric match anywhere in the whole pinned text is NOT article-level
verification.  For every transcription check this report records the exact
structural path and character span of the containing provision, the normative
unit kinds present, any UNRESOLVED units and the mechanical coverage result.
It remains a DIAGNOSTIC, not a completion gate (deterministic).
"""
from __future__ import annotations

import hashlib
import json
import sys
from pathlib import Path

CI = Path(__file__).resolve().parents[2] / "ci"
sys.path.insert(0, str(CI))
from normative_core import (  # noqa: E402
    INVENTORY, REPO, audit_coverage, decompose, flat, norm_text, walk_provisions,
)

OUT = REPO / "docs" / "ARTICLE_SCOPE.md"
AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"


def _checks():
    spec = importlib.util.spec_from_file_location("as_audit", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return list(mod.checks())


import importlib.util  # noqa: E402


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = {law["law_id"]: law for law in inv.get("laws", [])}
    doc_cache = {}
    rows = []
    scoped = whole_only = unresolved_total = 0

    for _name, law_id, _kind, art, needles in _checks():
        record = laws.get(law_id, {})
        source_file = record.get("raw_snapshot", {}).get("source_file", "")
        if law_id not in doc_cache:
            path = REPO / source_file if source_file else None
            doc_cache[law_id] = (json.loads(path.read_text(encoding="utf-8"))
                                 if path and path.exists() else None)
        doc = doc_cache[law_id]
        if doc is None:
            continue
        source_sha = digest(REPO / source_file) if source_file else ""
        root = doc.get("law_full_text", doc)
        located = []
        unresolved = 0
        for structural_path, node in walk_provisions(root):
            tag = structural_path[-1].split(":", 1)[0] if structural_path else ""
            if tag not in ("Article", "Paragraph", "Item", "SubItem",
                           "Subitem", "TableRow", "TableCell"):
                continue
            text = norm_text(flat(node))
            if not text:
                continue
            hits = sum(1 for needle in needles if norm_text(needle) in text)
            if not hits:
                continue
            units = decompose(text)
            coverage = audit_coverage(text, units)
            unresolved += coverage["unresolved_count"]
            kinds = sorted({unit["norm_kind"] for unit in units})
            located.append(("/".join(structural_path), hits, kinds,
                            coverage["unresolved_count"]))
        unresolved_total += unresolved
        if located:
            scoped += 1
            location = "; ".join(
                f"{p}×{h} [{','.join(k)}] unresolved={u}"
                for p, h, k, u in located[:3]
            )
        else:
            whole_only += 1
            location = "(no scoped unit contains all needle text)"
        rows.append((law_id, art or "(file-level)", len(needles), location, unresolved))

    lines = [
        "# Article-scoped fidelity diagnostic (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `scripts/law_audit/phase_e/article_scope.py`.",
        "",
        "Directive §1: a numeric match anywhere in the whole pinned text is NOT",
        "article-level verification. This report records the exact structural path",
        "and the normative-unit kinds per check, with UNRESOLVED counts. Mechanical",
        "coverage is PENDING independent audit; this is a diagnostic, not a gate.",
        "",
        f"- checks with scoped needles: {scoped}",
        f"- checks with no scoped unit (whole-text/cross-article): {whole_only}",
        f"- UNRESOLVED units detected in scoped text: {unresolved_total}",
        "",
        "| law_id | stated article | needles | containing path / kinds | unresolved |",
        "|---|---|---:|---|---:|",
    ]
    for law_id, art, needle_count, location, unresolved in rows:
        lines.append(f"| `{law_id}` | {art} | {needle_count} | {location} | {unresolved} |")
    lines.append("")
    OUT.write_text("\n".join(lines), encoding="utf-8")
    print(f"article-scope diagnostic: {scoped} scoped / {whole_only} whole-text "
          f"across {len(rows)} checks; unresolved={unresolved_total}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
