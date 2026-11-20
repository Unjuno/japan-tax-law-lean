#!/usr/bin/env python3
"""Independent adversarial auditor for the completion gate.

This module reads source text through a separate path and checks the gate's
rules without importing the queue modules, so a circular proof inside the queue
cannot make a false COMPLETE pass here.  Every finding carries the H/T/D/C/U
tuple required by Objective §5.
"""
from __future__ import annotations

import json
import re
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
STATES = ("NOT_STARTED", "PARTIAL", "PROVED_SCOPE", "FULLY_VERIFIED", "BLOCKED", "STALE")


def strip_comments(src: str) -> str:
    """Remove docstrings/strings and comments so prose cannot satisfy a rule."""
    src = re.sub(r'"""[\s\S]*?"""', "", src)
    src = re.sub(r"'''[\s\S]*?'''", "", src)
    src = re.sub(r"#[^\n]*", "", src)
    return src


def _sources(sources) -> dict:
    return sources if isinstance(sources, dict) else {"input": str(sources)}


def finding(rule: str, must: bool, h: str, t: str, d: str, c: str, u: str) -> dict:
    return {"rule": rule, "must": must, "H": h, "T": t, "D": d, "C": c, "U": u}


def rule_no_needle_completion(sources: dict[str, str]) -> dict:
    sources = _sources(sources)
    bad = re.compile(
        r"(done|status|complete|COMPLETE)\s*=\s*.*\b(fidelity|needle|exists|agree|file)\b"
    )
    hits = [p for p, s in sources.items() if bad.search(strip_comments(s))]
    return finding(
        "no_needle_or_presence_completion", True,
        "H: needle/file/name match can drive completion",
        "T: scan stripped sources for assignment driven by presence facts",
        "FAIL" if hits else "PASS",
        "C: evidence-derived status is the alternative interpretation",
        "U: dynamic runtime inputs are not inspected",
    ) | {"hits": hits}


def rule_distinct_states(sources: dict[str, str]) -> dict:
    sources = _sources(sources)
    joined = "\n".join(strip_comments(s) for s in sources.values())
    invalid = re.search(r"status\s*=\s*bool\(", joined) is not None
    ok = all(state in joined for state in STATES) and not invalid
    return finding(
        "distinct_status_vocabulary", True,
        "H: a boolean collapses all completion states",
        "T: require every status token and reject bool() assignment",
        "PASS" if ok else "FAIL",
        "C: a facade may merely mention tokens without using them",
        "U: string presence is necessary, not sufficient",
    )


def rule_dependency_signals(sources: dict[str, str]) -> dict:
    sources = _sources(sources)
    joined = "\n".join(strip_comments(s) for s in sources.values())
    only15 = re.search(r"findall\s*\(\s*r?['\"][^'\"]*\\d\{15\}", joined)
    full = all(tok in joined for tok in ("law_name", "article", "revision", "15"))
    ok = full and not only15
    return finding(
        "dependency_beyond_15_digits", True,
        "H: a 15-digit id search is treated as dependency analysis",
        "T: require law name + article + revision signals and reject bare findall",
        "PASS" if ok else "FAIL",
        "C: an id may be one signal among several",
        "U: unresolved references are counted, not judged",
    )


def rule_skip_not_pass(sources: dict[str, str]) -> dict:
    sources = _sources(sources)
    joined = "\n".join(strip_comments(s) for s in sources.values())
    ok = "REQUIRED_GATES" in joined and re.search(r"strict\s*=\s*True", joined) is not None
    return finding(
        "skip_is_not_pass", True,
        "H: an absent mandatory gate is silently skipped",
        "T: require REQUIRED_GATES and strict mode in the runner",
        "PASS" if ok else "FAIL",
        "C: stacked branches may legitimately skip not-yet-reached phases",
        "U: gate registry completeness is reviewed separately",
    )


def rule_evidence_ledger(root: Path = REPO) -> dict:
    """Inspect the durable ledgers, not source tokens, for false completion."""
    state_p = Path(root) / "data" / "task_state.json"
    ev_p = Path(root) / "data" / "verification_evidence.json"
    problems: list[str] = []
    state = json.loads(state_p.read_text(encoding="utf-8")) if state_p.exists() else {}
    ev = json.loads(ev_p.read_text(encoding="utf-8")) if ev_p.exists() else {}
    records = ev.get("records", {})
    if not state_p.exists() or not ev_p.exists():
        problems.append("missing_durable_ledger")
    for uid, recs in records.items():
        for r in recs:
            if not r.get("evidence_ref") or not r.get("date"):
                problems.append(f"unreferenced_evidence:{uid}:{r.get('axis')}")
    axes = {r.get("axis") for recs in records.values() for r in recs}
    for uid, entry in (state.get("units") or {}).items():
        status = entry.get("status")
        if status and status not in STATES:
            problems.append(f"unknown_status:{uid}:{status}")
        if status == "FULLY_VERIFIED":
            own = {r.get("axis") for r in records.get(uid, [])}
            missing = {"SOURCE_LOCATION", "SOURCE_CORRESPONDENCE_AUDIT",
                       "DECOMPOSITION_AUDIT", "SPEC_INDEPENDENT", "IMPLEMENTATION",
                       "PROOF_SOUNDNESS", "PROOF_SCOPE", "PROOF_BOUNDARY",
                       "TESTS", "ADVERSARIAL_REVIEW"} - own
            if missing or entry.get("blockers") or not axes:
                problems.append(f"unsupported_full_verification:{uid}:{sorted(missing)}")
    return finding(
        "evidence_ledger_no_false_completion", True,
        "H: a string-level gate passes while the evidence ledger is empty",
        "T: read both durable ledgers and reject unreferenced or unsupported FULLY_VERIFIED",
        "FAIL" if problems else "PASS",
        "C: empty ledgers are valid before work starts, but cannot prove completion",
        "U: legal review remains a separate, human axis",
    ) | {"problems": problems[:10]}


RULES = (rule_no_needle_completion, rule_distinct_states,
         rule_dependency_signals, rule_skip_not_pass, rule_evidence_ledger)


def audit(root: Path = REPO) -> dict:
    sources = {}
    for rel in ("scripts/ci/task_queue.py", "scripts/ci/article_obligations.py",
                "scripts/ci/task_state.py", "scripts/ci/task_selector.py",
                "scripts/ci/run_python_gates.py", "scripts/ci/dependency_parser.py"):
        p = root / rel
        if p.exists():
            sources[rel] = p.read_text(encoding="utf-8")
    findings = [rule(root) if rule is rule_evidence_ledger else rule(sources)
                for rule in RULES]
    return {"tool": "scripts/ci/completion_gate_adversary.py",
            "findings": findings,
            "all_pass": all(f["D"] == "PASS" for f in findings)}


def main() -> int:
    print(json.dumps(audit(), ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
