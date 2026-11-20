#!/usr/bin/env python3
"""Independent adversarial auditor for completion-gate code (Objective §5).

This module does NOT trust the queue modules it inspects. It reads their source
as text, strips comments/docstrings, and looks for the forbidden shortcuts:

  * COMPLETE derived from a needle match / file existence / theorem name;
  * a single boolean standing in for the distinct verification states;
  * dependency analysis that is only a 15-digit number search;
  * a required gate being SKIPped while the runner still exits 0.

Every finding is an H/T/D/C/U tuple (refutable hypothesis, reproduction test,
decision, competing interpretation, residual uncertainty). D is a mechanical
decision about the source text only, never a legal or proof claim.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]

STATES = ("NOT_STARTED", "PARTIAL", "PROVED_SCOPE", "FULLY_VERIFIED", "BLOCKED")


def strip_comments(text: str) -> str:
    """Remove block docstrings, strings used as prose, and line comments."""
    text = re.sub(r'""".*?"""', "", text, flags=re.S)
    text = re.sub(r"'''.*?'''", "", text, flags=re.S)
    text = re.sub(r"#[^\n]*", "", text)
    return text


def finding(rule: str, ok: bool, h: str, t: str, d: str, c: str, u: str) -> dict:
    return {
        "rule": rule,
        "must": bool(ok),
        "H": h,
        "T": t,
        "D": "PASS" if ok else "FAIL",
        "C": c,
        "U": u,
    }


def _sources(paths: list[Path]) -> dict[str, str]:
    out = {}
    for p in paths:
        if p.exists():
            out[str(p.relative_to(REPO)).replace("\\", "/")] = strip_comments(
                p.read_text(encoding="utf-8"))
    return out


def rule_no_needle_completion(sources: dict[str, str]) -> dict:
    h = "a numeric/needle/file/theorem-name match alone can set a COMPLETE status"
    t = "scan comment-stripped source for all([fidelity, exists, agree]) patterns"
    c = "a presence fact may legitimately be recorded, but never as completion"
    u = "dynamic evidence content is not inspected by this textual rule"
    bad = []
    presence_aggregation = re.compile(
        r"(\w+)\s*=\s*(?:all|any)\s*\(\s*\[[^\]]*(?:fidelity|exists|needle|agree)")
    for name, src in sources.items():
        # Aggregating presence facts is allowed when the result is named as
        # presence/reported separately. It is a forbidden shortcut only when
        # the result is written into the status/completion variable.
        hits = [m.group(1).lower() for m in presence_aggregation.finditer(src)]
        if any(v in ("status", "done", "complete", "completed", "verified")
               or "complete" in v or "verified" in v for v in hits):
            bad.append(name)
        if re.search(r"\b(?:complete|COMPLETE)\b\s*=\s*(?:True|bool\()", src):
            bad.append(name)
    return finding("no_needle_completion", not bad, h, t,
                   ",".join(bad) or "none", c, u)


def rule_distinct_states(sources: dict[str, str]) -> dict:
    h = "a single boolean collapses NOT_STARTED / PROVED_SCOPE / FULLY_VERIFIED / BLOCKED"
    t = "require the distinct state vocabulary and reject bool(status)"
    c = "a boolean may exist as a projection, not as the verification state"
    u = "aliases in other modules are not resolved by this rule"
    bad = []
    for name, src in sources.items():
        if re.search(r"status\s*=\s*bool\s*\(", src):
            bad.append(name)
    joined = "\n".join(sources.values())
    ok = not bad and all(s in joined for s in STATES)
    return finding("distinct_states", ok, h, t, ",".join(bad) or "none", c, u)


def rule_dependency_signals(sources: dict[str, str]) -> dict:
    h = "dependency analysis is only a 15-digit number search"
    t = "require law name, article and revision signals alongside any numeric id"
    c = "a 15-digit id is a useful hint, not a complete dependency"
    u = "legal correctness of resolved references is out of scope"
    joined = "\n".join(sources.values())
    has15 = bool(re.search(r"\\d\{15\}|\d{15}", joined))
    has_full = all(k in joined for k in ("law_name", "article", "revision"))
    ok = has_full and (not has15 or has15 and has_full)
    return finding("dependency_signals", ok, h, t,
                   "15digit_only" if has15 and not has_full else "ok", c, u)


def rule_skip_not_pass(runner_src: str) -> dict:
    h = "a mandatory gate is SKIPped yet the runner reports overall success"
    t = "require an explicit required-gate set and a strict flag when SKIP exists"
    c = "SKIP is legitimate for optional gates on incremental branches"
    u = "the gate set itself is not validated against the objective here"
    if not runner_src:
        return finding("skip_not_pass", False, h, t, "runner missing", c, u)
    has_skip = "SKIP" in runner_src
    # A strict runner either uses an explicit strict flag or declares a set of
    # required gates and turns a missing required gate into a FAIL.
    strict = ("strict" in runner_src) or (
        "REQUIRED_GATES" in runner_src and "if required" in runner_src)
    ok = (not has_skip) or strict
    return finding("skip_not_pass", ok, h, t,
                   "skip_without_required_set" if not ok else "ok", c, u)


def audit() -> dict:
    sources = _sources([
        REPO / "scripts/ci/task_queue.py",
        REPO / "scripts/ci/task_selector.py",
        REPO / "scripts/ci/article_obligations.py",
        REPO / "scripts/ci/normative_core.py",
    ])
    runner = REPO / "scripts/ci/run_python_gates.py"
    runner_src = strip_comments(runner.read_text(encoding="utf-8")) if runner.exists() else ""
    findings = [
        rule_no_needle_completion(sources),
        rule_distinct_states(sources),
        rule_dependency_signals(sources),
        rule_skip_not_pass(runner_src),
    ]
    return {
        "tool": "scripts/ci/completion_gate_adversary.py",
        "note": "H/T/D/C/U findings describe source-text checks, not legal correctness",
        "findings": findings,
        "failures": [f for f in findings if f["D"] == "FAIL"],
    }


def main() -> int:
    report = audit()
    print(json.dumps(report, ensure_ascii=False, indent=2))
    return 1 if report["failures"] else 0


if __name__ == "__main__":
    sys.exit(main())
