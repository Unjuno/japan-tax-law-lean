#!/usr/bin/env python3
"""Article obligations ledger — completion is evidence-based (Directive §4).

The legacy COMPLETE label (needle found + three files present + no `sorry` +
`agree*` identifier) is reported as PRESENCE FACTS only.  Authoritative status
is derived by normative_core.derive_status from recorded evidence, scoped source
positions, decomposition coverage and unhandled conditions.  Human legal review
is a separate out-of-repo axis and never auto-satisfied.

Regenerate with ``python scripts/ci/article_obligations.py``.
"""
from __future__ import annotations

import importlib.util
import json
import re
import sys
from pathlib import Path

from normative_core import (
    REPO, EVIDENCE_AXES, LEGAL_REVIEW_PENDING, STATUS_VALUES,
    derive_status, flat, norm,
)

INVENTORY = REPO / "data" / "INVENTORY.json"
AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"
REVIEW = REPO / "docs" / "ADVERSARIAL_REVIEW.md"
QUEUE = REPO / "build" / "task_queue.json"
STATE = REPO / "data" / "task_state.json"
OUT = REPO / "docs" / "ARTICLE_OBLIGATIONS.md"
OUT_JSON = REPO / "data" / "NORMATIVE_OBLIGATIONS.json"
FORBIDDEN = re.compile(r"\b(sorry|admit|axiom|Classical\.choice)\b")


def strip_comments(text: str) -> str:
    return re.sub(r"--[^\n]*", "", re.sub(r"/-.*?-/", "", text, flags=re.S))


def checks():
    spec = importlib.util.spec_from_file_location("ao_audit", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return list(mod.checks())


def scoped_article_text(doc: dict, article: str | None) -> str | None:
    def walk(n):
        if isinstance(n, dict):
            if n.get("tag") == "Article" and article and str((n.get("attr") or {}).get("Num", "")) == article:
                return flat(n)
            for c in n.get("children", []):
                r = walk(c)
                if r is not None:
                    return r
        return None
    return walk(doc.get("law_full_text", doc))


def main() -> int:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = {l["law_id"]: l for l in inv.get("laws", [])}
    review = REVIEW.read_text(encoding="utf-8") if REVIEW.exists() else ""
    state = json.loads(STATE.read_text(encoding="utf-8")) if STATE.exists() else {"units": {}}
    queue = json.loads(QUEUE.read_text(encoding="utf-8")) if QUEUE.exists() else {"tasks": []}
    by_article = {(t.get("law_id"), t.get("article")): t for t in queue.get("tasks", [])}

    docs: dict[str, dict] = {}
    rows, counts = [], {s: 0 for s in STATUS_VALUES}
    presence_complete = 0
    for name, law_id, kind, art, needles in checks():
        if not art:
            continue
        mods = re.findall(r"(\w+)\.lean", name)
        base = mods[0] if mods else ""
        if law_id not in docs:
            sf = (laws.get(law_id, {}).get("raw_snapshot") or {}).get("source_file")
            p = REPO / sf if sf else None
            docs[law_id] = json.loads(p.read_text(encoding="utf-8")) if p and p.exists() else {}
        whole = norm(flat(docs[law_id]))
        scoped = scoped_article_text(docs[law_id], art) or ""
        needle_ok = bool(needles) and all(norm(n) in whole for n in needles)
        scoped_ok = bool(needles) and all(norm(n) in norm(scoped) for n in needles)
        paths = {
            "spec": REPO / "JapanTaxLaw" / f"{base}Spec.lean",
            "impl": REPO / "JapanTaxLaw" / f"{base}.lean",
            "tests": REPO / "JapanTaxLaw" / f"{base}Tests.lean",
        }
        exists = {k: v.exists() for k, v in paths.items()}
        contents = "".join(v.read_text(encoding="utf-8") for v in paths.values() if v.exists())
        clean = not FORBIDDEN.search(strip_comments(contents))
        # Deliberately NO agree*/theorem-name regex here.  A theorem name is a
        # string, not a kernel proof; only recorded evidence (kernel_proof,
        # source_correspondence_audit, ...) can advance status via derive_status.
        presence = all([needle_ok, exists["impl"], exists["spec"], exists["tests"], clean])
        presence_complete += int(presence)

        unit = by_article.get((law_id, art), {})
        uid = unit.get("id", "")
        rec = state.get("units", {}).get(uid, {})
        evidence = dict(rec.get("evidence", {}))
        evidence.setdefault("source_location", scoped_ok)
        evidence.setdefault("decomposition_audit", unit.get("coverage", {}).get("status") == "COVERED")
        evidence.setdefault("independent_spec", exists["spec"])
        evidence.setdefault("implementation", exists["impl"])
        evidence.setdefault("tests", exists["tests"])
        evidence.setdefault("source_correspondence_audit", scoped_ok and unit.get("coverage", {}).get("status") == "COVERED")
        status, errors = derive_status(
            {
                "blockers": rec.get("blockers", []),
                "status": rec.get("status", "NOT_STARTED"),
                "unhandled_conditions": rec.get("unhandled_conditions", []),
            },
            evidence,
        )
        counts[status] += 1
        reviewed = f"{base}.lean" in review
        rows.append({
            "law_id": law_id,
            "law": (laws.get(law_id) or {}).get("official_title", ""),
            "article": art,
            "module": base,
            "presence_facts": presence,
            "scoped": scoped_ok,
            "adversarial_review": reviewed,
            "status": status,
            "errors": errors,
            "legal_review": LEGAL_REVIEW_PENDING,
        })

    total = len(rows)
    lines = [
        "# Article verification obligations (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/article_obligations.py`.",
        "",
        "PRESENCE facts (needle / impl / spec / tests / clean / agree*) are NOT",
        "completion. Authoritative status comes from recorded evidence and scoped",
        "source positions. Human legal review is a separate axis and is pending.",
        "",
        f"- articles with explicit pin: {total}",
        f"- presence-facts-only complete: {presence_complete}",
    ]
    for s in STATUS_VALUES:
        lines.append(f"- {s}: {counts[s]}")
    lines += [
        f"- human legal review completed: 0 ({LEGAL_REVIEW_PENDING})",
        "",
        "| law_id | article | module | presence | scoped | review | authoritative status |",
        "|---|---|---|---|---|---|---|",
    ]
    for r in rows:
        lines.append(
            f"| `{r['law_id']}` | {r['article']} | {r['module'] or '-'} | "
            f"{'YES' if r['presence_facts'] else 'NO'} | {'YES' if r['scoped'] else 'NO'} | "
            f"{'YES' if r['adversarial_review'] else 'NO'} | {r['status']} |"
        )
    lines.append("")
    OUT.write_text("\n".join(lines), encoding="utf-8")
    OUT_JSON.write_text(
        json.dumps({"totals": counts, "rows": rows}, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print("article obligations: " + ", ".join(f"{k}={v}" for k, v in counts.items()))
    return 0


if __name__ == "__main__":
    sys.exit(main())
