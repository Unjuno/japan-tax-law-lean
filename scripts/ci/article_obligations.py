#!/usr/bin/env python3
"""Article verification obligations ledger (Directive §1.4 / Objective §4).

Pinned needle matches, file existence, absence of forbidden proof tokens and
`agree*` theorem-name strings are recorded as WEAK HINTS with
`sufficient_for_completion = false`.  Verification status comes only from the
durable normative-unit evidence ledger.  Human legal review and independent
adversarial review are reported on separate axes.

Regenerate with `python scripts/ci/article_obligations.py` (deterministic).
"""
from __future__ import annotations

import importlib.util
import json
import re
from pathlib import Path

from normative_core import (
    REPO, STATUSES, LEGAL_REVIEW_PENDING, clean_proof, derive_status,
    load_evidence, load_state, norm_text,
)

AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"
REVIEW = REPO / "docs" / "ADVERSARIAL_REVIEW.md"
OUT = REPO / "docs" / "ARTICLE_OBLIGATIONS.md"

KANJI = {"〇": 0, "零": 0, "一": 1, "二": 2, "三": 3, "四": 4, "五": 5,
         "六": 6, "七": 7, "八": 8, "九": 9}


def kanji_int(value: str):
    """Convert a Japanese article number (第六十六条) to int, or None."""
    text = (value or "").strip()
    text = re.sub(r"^第", "", text).split("の")[0].replace("条", "")
    if not text:
        return None
    if text.isdigit():
        return int(text)
    total, number = 0, 0
    for ch in text:
        if ch in KANJI:
            number = KANJI[ch]
        elif ch in ("十", "百", "千"):
            total += (number or 1) * {"十": 10, "百": 100, "千": 1000}[ch]
            number = 0
        else:
            return None
    return total + number


def load_checks() -> list[tuple]:
    if not AUDIT.exists():
        return []
    spec = importlib.util.spec_from_file_location("ao_audit", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return list(mod.checks())


def weak_signals(law_id: str, art: str, needles) -> dict:
    """Legacy syntactic signals — recorded as hints, never as completion."""
    review_text = REVIEW.read_text(encoding="utf-8") if REVIEW.exists() else ""
    review_modules = set(re.findall(r"(\w+)\.lean", review_text))
    mods = re.findall(r"(\w+)\.lean", art or "")
    base = mods[0] if mods else ""
    paths = {
        "impl": REPO / "JapanTaxLaw" / f"{base}.lean" if base else None,
        "spec": REPO / "JapanTaxLaw" / f"{base}Spec.lean" if base else None,
        "tests": REPO / "JapanTaxLaw" / f"{base}Tests.lean" if base else None,
    }
    exists = {k: bool(v and v.exists()) for k, v in paths.items()}
    contents = "".join(v.read_text(encoding="utf-8")
                       for v in paths.values() if v and v.exists())
    return {
        "pinned_needles_nonempty": bool(needles),
        "module_files_exist": exists,
        "no_forbidden_proof_tokens": clean_proof(contents) if contents else None,
        "agree_name_present": bool(re.search(r"\bagree\w*", contents)),
        "adversarial_review_mentions_module": bool(base) and f"{base}.lean" in review_modules,
        "sufficient_for_completion": False,
        "note": "syntactic hints only (§1.4); never a COMPLETE signal",
    }


def build_index(tasks: list[dict]):
    """Index tasks once by law id and (kanji) article number."""
    by_law = {}
    for task in tasks:
        by_law.setdefault(task.get("law_id", ""), []).append(task)
    by_article = {}
    for law_id, rows in by_law.items():
        grouped = {}
        for task in rows:
            number = kanji_int(task.get("article", ""))
            grouped.setdefault(number, []).append(task)
        by_article[law_id] = grouped
    return by_law, by_article


def match_units(law_id: str, art: str, needles, index) -> list[str]:
    """Link a pinned check to ledger units.  A link is not a completion claim."""
    by_law, by_article = index
    want = kanji_int(art)
    needle_texts = [norm_text(n) for n in needles]
    matched = []
    for task in by_law.get(law_id, []):
        number = kanji_int(task.get("article", ""))
        hit = want is not None and number == want
        if not hit and needle_texts:
            fragment = norm_text(task.get("norm_text", ""))
            hit = any(n[:24] in fragment for n in needle_texts if len(n) >= 8)
        if hit:
            matched.append(task["norm_id"])
    return matched


def build() -> str:
    state = load_state()
    evidence = load_evidence()
    queue_path = REPO / "build" / "task_queue.json"
    queue = json.loads(queue_path.read_text(encoding="utf-8")) if queue_path.exists() else {"tasks": []}
    tasks = queue.get("tasks", [])
    checks = load_checks()
    index = build_index(tasks)
    titles = {task.get("law_id", ""): task.get("law_title", "") for task in tasks}
    by_id = {task["norm_id"]: task for task in tasks}

    counts = {s: 0 for s in STATUSES}
    linked = weak_only = 0
    rows = []
    for _name, law_id, _kind, art, needles in checks:
        hints = weak_signals(law_id, art, needles)
        ids = match_units(law_id, art, needles, index)
        linked += bool(ids)
        weak_only += not bool(ids)
        states = []
        for ident in ids:
            task = by_id.get(ident)
            states.append(derive_status(task, state, evidence)["status"]
                          if task else "NOT_STARTED")
        for status in states:
            counts[status] = counts.get(status, 0) + 1
        title = titles.get(law_id, "")
        rows.append(
            f"| `{law_id}` | {title} | {art or '-'} | {len(ids)} | "
            f"{' / '.join(states) if states else '(none)'} | "
            f"{','.join(sorted(k for k, v in hints['module_files_exist'].items() if v)) or '-'} | "
            f"{'Y' if hints['adversarial_review_mentions_module'] else 'N'} |"
        )

    lines = [
        "# Article verification obligations (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/article_obligations.py`.",
        "",
        "Directive §1.4 / Objective §4: pinned needles, file existence, forbidden",
        "token absence and `agree*` name matches are WEAK HINTS with",
        "`sufficient_for_completion = false`. They can never produce COMPLETE.",
        "Status comes from the durable evidence ledger. Human legal review and",
        "independent adversarial review are SEPARATE axes.",
        "",
        "## Totals",
        "",
        f"- pinned checks: {len(checks)}",
        f"- checks linked to ledger units: {linked}",
        f"- checks with no ledger link (unresolved): {weak_only}",
    ]
    for status in STATUSES:
        lines.append(f"- {status}: {counts[status]}")
    lines += [
        f"- human legal review completed: 0 (out of repo; separate axis, default {LEGAL_REVIEW_PENDING})",
        "",
        "## Per-check status",
        "",
        "| law_id | law | article | linked units | status | weak file hints | adversarial |",
        "|---|---|---:|---:|---|---|---|",
        *rows,
        "",
        "## Why the old completion rule was removed",
        "",
        "| old signal | new treatment |",
        "|---|---|",
        "| pinned needle found | weak hint, `sufficient_for_completion=false` |",
        "| impl/spec/tests files exist | weak hint, not evidence of correspondence |",
        "| no `sorry`/`admit`/`axiom` token | necessary but insufficient evidence item |",
        "| `agree*` name present | weak hint (string match), not a proof |",
        "| all four above | no longer equivalent to COMPLETE |",
        "",
    ]
    return "\n".join(lines)


def main() -> int:
    text = build()
    changed = False
    if not OUT.exists() or OUT.read_text(encoding="utf-8") != text:
        OUT.write_text(text, encoding="utf-8")
        changed = True
    print("article obligations ledger: "
          + ("wrote docs/ARTICLE_OBLIGATIONS.md" if changed else "unchanged"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
