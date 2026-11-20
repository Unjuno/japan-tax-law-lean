#!/usr/bin/env python3
"""Explicit per-unit spec/proof scope mapping (Directive §1.5, §3, §5).

Literal containment alone cannot establish that a formal spec models a
particular clause: an empty numeral set accepts every clause, and a numeral
can appear in an unmodelled paragraph. This module replaces that shortcut
with an explicit, auditable declaration:

  Each attested Lean Spec module declares, in its leading doc-comment, the
  statutory articles it restates (e.g. "art. 21-7", "第26条", "Art. 89(1)").
  A unit is in scope only if its law id matches the pinned source declared in
  the spec and its article key is one of those declared articles. Every
  rejected unit is recorded with H/T/D/C/U so the decision is reviewable.

The map is generated from committed spec sources, not from the evidence
ledger it gates.
"""
from __future__ import annotations

import json
import re
from pathlib import Path

HERE = Path(__file__).resolve().parent
if str(HERE) not in __import__("sys").path:
    __import__("sys").path.insert(0, str(HERE))

import normative_core as core  # noqa: E402

REPO = HERE.parents[1]
SPEC_DIR = REPO / "JapanTaxLaw"
OUT = REPO / "data" / "SPEC_SCOPE_MAP.json"

# "art. 21-7", "Art. 89(1)", "第26条", "art. 4の5"
ARTICLE_DECL = re.compile(
    # Japanese statutes branch repeatedly: 72の49の14, 21の3の二, 9の3の2の1.
    # Truncating at the first branch wrongly rejected units that a spec really
    # does model (e.g. BusinessOwnerDeduction art. 72の49の14 became 72_49).
    r"\b(?:art\.?|article)\s*([0-9０-９]+(?:[-の][0-9０-９]+)*)"
    r"|第\s*([0-9０-９一二三四五六七八九十百千〇零]+)\s*条"
    r"((?:の\s*[0-9０-９一二三四五六七八九十百千〇零]+)*)",
    re.IGNORECASE,
)
LAW_ID_DECL = re.compile(r"\b([0-9]{3}[A-Z]{2}[0-9]{10})\b")
REVISION_DECL = re.compile(r"\b([0-9]{3}[A-Z]{2}[0-9]{10}_\d{8}_[0-9]{3}[A-Z]{2}[0-9]{10})\b")


def article_key(label: str) -> str:
    """Canonical key used by the queue: 21-7 / 21の7 -> 21_7."""
    s = str(label).translate(str.maketrans("０１２３４５６７８９", "0123456789"))
    if s.isdigit():
        return s
    parts = re.split(r"[-の]", s)
    if len(parts) > 1 and all(p.isdigit() for p in parts):
        return "_".join(str(int(p)) for p in parts)
    return core.article_key(s)


def leading_comment(source: str) -> str:
    """Return the first doc-comment block (the spec's source/scope header)."""
    m = re.search(r"/-!([\s\S]*?)-/", source)
    return m.group(1) if m else ""


def declared_scope(spec_source: str) -> dict:
    header = leading_comment(spec_source)
    articles: set[str] = set()
    for m in ARTICLE_DECL.finditer(header):
        if m.group(1):
            raw = m.group(1)
        else:
            branches = re.findall(r"の\s*([0-9０-９一二三四五六七八九十百千〇零]+)", m.group(3) or "")
            raw = m.group(2) + "".join("の" + b for b in branches)
        articles.add(article_key(raw))
    rev_ids = REVISION_DECL.findall(header)
    law_ids = set(LAW_ID_DECL.findall(header))
    for rid in rev_ids:
        law_ids.add(rid.split("_")[0])
    return {
        "articles": sorted(articles),
        "law_ids": sorted(law_ids),
        "revisions": sorted(set(rev_ids)),
        "header_chars": len(header),
    }


def in_scope(unit: dict, scope: dict) -> tuple[bool, str]:
    """Decide whether a unit is explicitly in a module's declared scope."""
    if not scope.get("articles"):
        return False, "NO_ARTICLE_DECLARATION_IN_SPEC_HEADER"
    law_id = str(unit.get("law_id", ""))
    if scope.get("law_ids") and law_id not in scope["law_ids"]:
        return False, "LAW_ID_NOT_DECLARED_IN_SPEC_HEADER"
    key = article_key(unit.get("article", ""))
    if key not in scope["articles"]:
        return False, f"ARTICLE_NOT_DECLARED:{key}"
    if unit.get("unhandled_conditions"):
        return False, "UNIT_HAS_UNRESOLVED_CONDITIONS"
    return True, "EXPLICIT_SCOPE_MATCH"


def finding(code: str, H: str, T: str, D: str, C: str, U: str) -> dict[str, str]:
    return {"code": code, "H": H, "T": T, "D": D, "C": C, "U": U}


def build(modules: list[str], units_by_module: dict[str, list[dict]]) -> dict:
    out: dict[str, dict] = {}
    decisions: dict[str, list[dict]] = {}
    for base in sorted(set(modules)):
        path = SPEC_DIR / f"{base}Spec.lean"
        source = path.read_text(encoding="utf-8") if path.exists() else ""
        scope = declared_scope(source)
        scope["spec_file"] = f"JapanTaxLaw/{base}Spec.lean"
        out[base] = scope
        rows = []
        for unit in units_by_module.get(base, []):
            ok, reason = in_scope(unit, scope)
            rows.append({
                "normative_id": unit.get("normative_id", ""),
                "law_id": unit.get("law_id", ""),
                "article": unit.get("article", ""),
                "kind": unit.get("kind", ""),
                "in_scope": ok,
                "reason": reason,
            })
        decisions[base] = rows
    return {
        "tool": "scripts/ci/spec_scope_map.py",
        "schema": 1,
        "rule": "unit verified only if law+article are declared in the spec doc-comment",
        "modules": out,
        "decisions": decisions,
        "findings": [
            finding("S1", "literal containment can verify unmodelled clauses",
                    "parse spec doc-comment article declarations; require explicit match",
                    "ENFORCED", "the spec body might model more than its header says",
                    "header declarations are agent-written, not machine-proved"),
            finding("S2", "empty numeral set makes matching vacuous",
                    "generator requires non-empty kanji set (separate gate)",
                    "ENFORCED", "a purely boolean spec may still be correct",
                    "literal-based attestation cannot cover boolean-only models"),
        ],
    }


def main() -> int:
    # Lazy import to avoid a cycle: the evidence generator imports this module,
    # but we only need its module list when run standalone.
    import importlib.util
    spec = importlib.util.spec_from_file_location("ve", HERE / "generate_verification_evidence.py")
    ve = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(ve)
    modules = ve.checks_by_module()
    inv = json.loads((REPO / "data" / "INVENTORY.json").read_text(encoding="utf-8"))
    sub = dict(inv)
    sub["laws"] = [l for l in inv.get("laws", []) if l.get("law_id") in {v["law_id"] for v in modules.values()}]
    import task_queue as tq
    tasks = tq.build_tasks(sub)
    units_by_module: dict[str, list[dict]] = {}
    for base, info in modules.items():
        for t in tasks:
            if t.get("law_id") == info["law_id"] and t.get("article") == info["article"]:
                units_by_module.setdefault(base, []).append(t)
    payload = build(list(modules), units_by_module)
    OUT.write_text(json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    in_scope = sum(1 for rows in payload["decisions"].values() for r in rows if r["in_scope"])
    total = sum(len(rows) for rows in payload["decisions"].values())
    print(f"spec scope map: {len(modules)} modules, {in_scope}/{total} units explicitly in scope")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
