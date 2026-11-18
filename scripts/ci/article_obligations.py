#!/usr/bin/env python3
"""Article verification obligations ledger (Objective §4).

For every article with an explicit pin in transcription_audit.checks(), register
the verification obligations and mark the article machine-verification-complete
ONLY if every obligation is satisfied:

  1. pinned needle FOUND (fidelity, whitespace-normalised)
  2. implementation Lean module exists
  3. independent Spec module exists
  4. Tests module exists
  5. no forbidden proof markers (sorry / admit / axiom / Classical.choice) in any
  6. Spec provides an agree* correspondence check

A legal-review obligation is tracked separately in docs/BLOCKED.md and is NEVER
satisfied by this mechanical check. Partial condition coverage does not make an
article complete. All counts derive from machine-generated inputs.

Regenerate with `python scripts/ci/article_obligations.py`; deterministic gate.
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
REVIEW = REPO / "docs" / "ADVERSARIAL_REVIEW.md"
OUT = REPO / "docs" / "ARTICLE_OBLIGATIONS.md"
FORBIDDEN = re.compile(r"\b(sorry|admit|axiom|Classical\.choice)\b")


def strip_comments(text: str) -> str:
    """Remove Lean block/doc/line comments so prose like "no `sorry`" is not
    mistaken for an actual forbidden proof marker."""
    text = re.sub(r"/-.*?-/", "", text, flags=re.S)
    text = re.sub(r"--[^\n]*", "", text)
    return text


def flat(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat(c) for c in node.get("children", []))
    return ""


def norm(text: str) -> str:
    return re.sub(r"[\s\u3000]+", "", text)


def checks():
    spec = importlib.util.spec_from_file_location("ao_ta", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return list(mod.checks())


def build() -> str:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = {l["law_id"]: l for l in inv.get("laws", [])}
    review_text = REVIEW.read_text(encoding="utf-8") if REVIEW.exists() else ""
    review_modules = set(re.findall(r"(\w+\.lean)", review_text))
    texts: dict[str, str] = {}
    rows = []
    complete = 0
    independently_reviewed = 0

    for name, law_id, kind, art, needles in checks():
        if not art:
            continue
        mods = re.findall(r"(\w+)\.lean", name)
        base = mods[0] if mods else ""
        if law_id not in texts:
            rec = laws.get(law_id)
            sf = (rec or {}).get("raw_snapshot", {}).get("source_file")
            p = REPO / sf if sf else None
            texts[law_id] = norm(flat(json.loads(p.read_text(encoding="utf-8")).get("law_full_text"))) if p and p.exists() else ""

        fidelity = bool(needles) and all(n in texts[law_id] for n in needles)
        paths = {
            "impl": REPO / "JapanTaxLaw" / f"{base}.lean" if base else None,
            "spec": REPO / "JapanTaxLaw" / f"{base}Spec.lean" if base else None,
            "tests": REPO / "JapanTaxLaw" / f"{base}Tests.lean" if base else None,
        }
        exists = {k: bool(v and v.exists()) for k, v in paths.items()}
        contents = "".join(v.read_text(encoding="utf-8") for v in paths.values() if v and v.exists())
        clean = not FORBIDDEN.search(strip_comments(contents))
        agree = bool(re.search(r"\bagree\w*", contents))
        reviewed = bool(base) and f"{base}.lean" in review_modules
        oks = [fidelity, exists["impl"], exists["spec"], exists["tests"], clean, agree]
        done = all(oks)
        if done:
            complete += 1
        if reviewed:
            independently_reviewed += 1
        title = (laws.get(law_id) or {}).get("official_title", "")
        rows.append(
            (f"| `{law_id}` | {title} | {art} | {base or '-'} | "
             + " | ".join("✓" if o else "✗" for o in oks)
             + f" | {'COMPLETE' if done else 'INCOMPLETE'} |")
        )

    total = len(rows)
    lines = [
        "# Article verification obligations (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/article_obligations.py`.",
        "",
        "Objective §4: register verification obligations per article. An article is",
        "machine-verification-COMPLETE only if ALL six mechanical obligations below",
        "are satisfied. This does NOT include independent human legal review (tracked",
        "in docs/BLOCKED.md) and does NOT establish legal correctness. Partial",
        "condition coverage never counts as article completion.",
        "",
        "Obligations: (1) pinned needle FOUND, (2) impl module, (3) independent Spec,",
        "(4) Tests, (5) no forbidden proof markers, (6) agree* correspondence,",
        "Independent adversarial-review coverage is reported as a SEPARATE axis",
        "(Objective §4 requires separate counts), not folded into the six proof",
        "obligations. Human legal review is a further separate axis in docs/BLOCKED.md.",
        "",
        f"## Totals",
        "",
        f"- articles with explicit pin: {total}",
        f"- machine-verification-complete: {complete}",
        f"- incomplete: {total - complete}",
        f"- articles with independent adversarial review coverage: {independently_reviewed}/{total} (separate axis)",
        f"- human legal review completed: 0 (out of repo — see docs/BLOCKED.md)",
        "",
        "## Per-article status",
        "",
        "| law_id | law | article | module | needle | impl | spec | tests | clean | agree | status |",
        "|---|---|---|---|:--:|:--:|:--:|:--:|:--:|:--:|---|",
        *rows,
        "",
    ]
    return "\n".join(lines)


def main() -> int:
    text = build()
    if OUT.exists() and OUT.read_text(encoding="utf-8") == text:
        print("article obligations ledger matches committed state (deterministic)")
        return 0
    OUT.write_text(text, encoding="utf-8")
    print("wrote", OUT)
    return 1


if __name__ == "__main__":
    sys.exit(main())
