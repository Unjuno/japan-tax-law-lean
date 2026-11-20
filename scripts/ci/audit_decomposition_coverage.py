#!/usr/bin/env python3
"""Independent audit of article decomposition coverage (Directive §1 item 3).

The decomposition gate in ``normative_core.audit_coverage`` is computed by the
same function that builds the units, so it cannot by itself prove that the
auto-decomposition covers the original text. This tool re-extracts each article
from the PINNED raw snapshot through a SEPARATE text walk, re-runs decomposition,
and compares the two with an INDEPENDENT normalizer that preserves every
non-whitespace character (including punctuation). Any gap is recorded as a
finding with H/T/D/C/U; nothing is silently treated as complete.

Additive by design: it never changes unit status and never marks work complete.
Exit status is 0 always unless --strict is passed (then exit 1 if gaps exist).

Usage:
  python scripts/ci/audit_decomposition_coverage.py [--limit N] [--strict]
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
import normative_core as core  # noqa: E402

INVENTORY = REPO / "data" / "INVENTORY.json"
OUT = REPO / "data" / "DECOMPOSITION_COVERAGE_AUDIT.json"

# Independent normalizer: drop only whitespace (incl. ideographic space).
# Deliberately does NOT reuse core.norm() so a bug in core.norm cannot hide a
# reconstruction gap. All other characters (punctuation, kanji, digits) survive.
_WS = re.compile(r"[\s\u3000]+")


def indep_norm(text: str) -> str:
    return _WS.sub("", text or "")


def indep_flat(node) -> str:
    """Independent text walk (not core.flat). Document-order string leaves."""
    if isinstance(node, str):
        return node
    if isinstance(node, list):
        return "".join(indep_flat(c) for c in node)
    if isinstance(node, dict):
        return "".join(indep_flat(c) for c in node.get("children", []) or [])
    return ""


def indep_articles(node, path=()):
    """Independent Article walker (not task_queue.iter_articles)."""
    if isinstance(node, dict):
        tag = node.get("tag", "")
        num = str((node.get("attr") or {}).get("Num", ""))
        if tag == "Article":
            yield path + (f"Article:{num}",), node
            return
        child_path = path + ((tag + (f"#{num}" if num else ""),) if tag in
                             ("MainProvision", "SupplProvision", "AppdxTable") else ())
        for ch in node.get("children", []) or []:
            yield from indep_articles(ch, child_path)
    elif isinstance(node, list):
        for ch in node:
            yield from indep_articles(ch, path)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--limit", type=int, default=0)
    ap.add_argument("--strict", action="store_true")
    args = ap.parse_args()

    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = inv.get("laws", [])
    law_index = core.build_law_index(laws)

    checked = 0
    exact = 0
    gaps: list[dict] = []
    for law in laws:
        if args.limit and checked >= args.limit:
            break
        lid = str(law.get("law_id", ""))
        rev = str((law.get("current_revision") or {}).get("law_revision_id", ""))
        sf = (law.get("raw_snapshot") or {}).get("source_file", "")
        src = REPO / sf
        if not sf or not src.exists():
            continue
        try:
            doc = json.loads(src.read_bytes())
        except (OSError, ValueError):
            continue
        root = doc.get("law_full_text")
        for path, article in indep_articles(root):
            anum = str((article.get("attr") or {}).get("Num", ""))
            if not anum:
                continue
            original = indep_flat(article)
            record = core.decompose_article(article, lid, rev, anum, "", law_index)
            reconstructed = "".join(u.get("text", "") for u in record["units"])
            checked += 1
            if indep_norm(original) == indep_norm(reconstructed):
                exact += 1
            else:
                gaps.append({
                    "H": "auto-decomposition dropped or altered original text",
                    "T": f"law={lid} article={anum} path={'/'.join(path)}",
                    "D": "FAIL",
                    "C": "whitespace-only differences are expected; all other chars are significant",
                    "U": "semantic adequacy of the rewrite is not checked here",
                    "original_len": len(indep_norm(original)),
                    "reconstructed_len": len(indep_norm(reconstructed)),
                })

    payload = {
        "tool": "scripts/ci/audit_decomposition_coverage.py",
        "schema": "decomposition-coverage-audit/v1",
        "auditor": "independent text walk + independent normalizer",
        "articles_checked": checked,
        "exact": exact,
        "gaps": len(gaps),
        "findings": gaps,
        "claim": "MECHANICAL_COVERAGE_ONLY_NOT_SEMANTIC_AUDIT",
    }
    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
                   encoding="utf-8")
    print(f"decomposition coverage: {exact}/{checked} exact, {len(gaps)} gaps")
    return 1 if (args.strict and gaps) else 0


if __name__ == "__main__":
    raise SystemExit(main())
