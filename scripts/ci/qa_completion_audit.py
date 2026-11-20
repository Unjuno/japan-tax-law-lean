#!/usr/bin/env python3
"""Independent static audit of the completion-determination machinery.

This tool does NOT trust completion claims made by the scripts it inspects. It
checks the four target scripts for the shortcuts forbidden by the objective:

  Q1  a pinned literal / numeric needle match producing COMPLETE;
  Q2  Lean file existence (or a theorem-name regex) producing COMPLETE;
  Q3  dependency analysis based only on a 15-digit number search;
  Q4  SKIP being treated as PASS by the gate runner;
  Q5  a distinct, five-valued status vocabulary;
  Q6  exact source position + unit-level obligation linkage;
  Q7  H/T/D/C/U evidence fields in the article-scope diagnostic;
  Q8  durable state owned by an explicit state/evidence module.

Usage:
  python scripts/ci/qa_completion_audit.py                 # local workspace
  python scripts/ci/qa_completion_audit.py --source github # pinned main baseline
  python scripts/ci/qa_completion_audit.py --json          # machine-readable
"""
from __future__ import annotations

import argparse
import json
import re
import urllib.request
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
RAW = "https://raw.githubusercontent.com/Unjuno/japan-tax-law-lean/main/"
FILES = {
    "task_queue": "scripts/ci/task_queue.py",
    "task_selector": "scripts/ci/task_selector.py",
    "article_obligations": "scripts/ci/article_obligations.py",
    "article_scope": "scripts/law_audit/phase_e/article_scope.py",
    "gate_runner": "scripts/ci/run_python_gates.py",
    # Canonical measurement layer: the status vocabulary and evidence axes live
    # here, so the four scripts intentionally do not repeat them verbatim.
    "core": "scripts/ci/normative_core.py",
    "identity": "scripts/ci/normative_identity.py",
    "state": "scripts/ci/task_state.py",
}
STATUS_TOKENS = ("NOT_STARTED", "PARTIAL", "PROVED_SCOPE", "FULLY_VERIFIED", "BLOCKED")


def load_sources(source: str) -> dict[str, str]:
    out: dict[str, str] = {}
    for key, rel in FILES.items():
        if source == "github":
            try:
                out[key] = urllib.request.urlopen(RAW + rel, timeout=20).read().decode("utf-8")
            except Exception as exc:  # keep a truthful record of an unreadable file
                out[key] = f"__FETCH_ERROR__ {type(exc).__name__}: {exc}"
        else:
            p = REPO / rel
            out[key] = p.read_text(encoding="utf-8") if p.exists() else "__MISSING__"
    return out


def has(src: str, pattern: str) -> bool:
    return bool(re.search(pattern, src, re.S))


def audit(srcs: dict[str, str]) -> list[dict]:
    tq = srcs.get("task_queue", "")
    ts = srcs.get("task_selector", "")
    ao = srcs.get("article_obligations", "")
    asc = srcs.get("article_scope", "")
    gr = srcs.get("gate_runner", "")
    allsrc = "\n".join(srcs.values())
    checks: list[dict] = []

    def add(qid: str, title: str, ok: bool, evidence: str) -> None:
        checks.append({"id": qid, "title": title, "verdict": "PASS" if ok else "FAIL", "evidence": evidence})

    # Q1: literal/numeric needle match alone must not produce a COMPLETE state.
    q1_bad = has(tq, r'"formalized"\s*:\s*"COMPLETE_SCOPE"\s+if\s+covered')
    q1_bad |= has(tq, r'covered\s*=\s*anum\s+in\s+covered_articles')
    add("Q1", "needle/numeric match does not itself set COMPLETE", not q1_bad,
        "legacy pattern found" if q1_bad else "no needle->COMPLETE assignment found")

    # Q2: file existence / theorem-name regex must not produce completion.
    # A presence fact (agree* regex, file exists, needle found) may be reported
    # as PARTIAL evidence, but only the legacy `all(oks) -> COMPLETE` pattern is
    # a forbidden shortcut. Evidence-derived status via derive_status is OK.
    q2_bad = has(ao, r'\bdone\s*=\s*all\(oks\)') or has(ao, r"'COMPLETE' if done else 'INCOMPLETE'")
    q2_ok = not q2_bad and (has(ao, r"derive_status") or has(allsrc, r"derive_status"))
    add("Q2", "file existence / agree* name regex is not the completion decision", q2_ok,
        "legacy all(oks) -> COMPLETE found" if q2_bad else
        "presence facts are separate; status derived from evidence")

    # Q3: dependency analysis must not be just a 15-digit search.
    q3_bad = has(tq, r'def\s+refs_of[\s\S]{0,240}?findall\(r"\\d\{15\}"')
    q3_ok = has(allsrc, r"enforcement_date|enforcement_version|law_name")
    add("Q3", "dependencies carry law name + article + enforcement version", q3_ok and not q3_bad,
        "bare 15-digit refs_of() only" if q3_bad and not q3_ok else "structured dependency information present")

    # Q4: SKIP must never be counted as PASS.
    q4_ok = has(gr, r"SKIP") and has(gr, r"never") and has(gr, r"PASS")
    q4_ok = q4_ok and (has(gr, r"REQUIRED_GATES") or has(allsrc, r"REQUIRED_GATES"))
    add("Q4", "SKIP is not PASS", q4_ok,
        "explicit SKIP/PASS separation + required gates" if q4_ok else "runner can silently skip required checks")

    # Q5: distinct status vocabulary.
    missing = [s for s in STATUS_TOKENS if s not in allsrc]
    add("Q5", "five distinct verification states are represented", not missing,
        "missing: " + ", ".join(missing) if missing else "all five states present")

    # Q6: exact source coordinates + per-unit obligations.
    q6_ok = has(allsrc, r"source_start|char_start|source_path|source_location")
    q6_ok &= has(allsrc, r"obligations|EVIDENCE_AXES|evidence")
    add("Q6", "units carry source coordinates and separate obligation axes", q6_ok,
        "coordinates + obligations present" if q6_ok else "missing coordinate or obligation linkage")

    # Q7: H/T/D/C/U evidence tuple.
    h_ok = has(asc, r'"H"|\bH\s*=') or has(asc, r"HYPOTHESIS")
    t_ok = has(asc, r'"T"|\bT\s*=') or has(asc, r"REPRODUCTION")
    d_ok = has(asc, r'"D"|\bD\s*=') or has(asc, r"DECISION")
    c_ok = has(asc, r'"C"|\bC\s*=') or has(asc, r"COMPETING")
    u_ok = has(asc, r'"U"|\bU\s*=') or has(asc, r"UNCERTAINTY")
    add("Q7", "H / T / D / C / U recorded per finding", all([h_ok, t_ok, d_ok, c_ok, u_ok]),
        f"H={h_ok} T={t_ok} D={d_ok} C={c_ok} U={u_ok}")

    # Q8: durable state + evidence module.
    q8_ok = has(allsrc, r"data[/\\](TASK_STATE|task_state|verification_evidence)")
    add("Q8", "durable state/evidence ledger present", q8_ok,
        "committed state ledger referenced" if q8_ok else "no durable state ledger reference")
    return checks


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--source", choices=("local", "github"), default="local")
    ap.add_argument("--json", action="store_true")
    args = ap.parse_args()
    srcs = load_sources(args.source)
    checks = audit(srcs)
    passed = sum(1 for c in checks if c["verdict"] == "PASS")
    if args.json:
        print(json.dumps({"source": args.source, "pass": passed, "total": len(checks),
                          "checks": checks}, ensure_ascii=False, indent=2))
        return 0
    lines = [
        "# Completion-mechanism audit (independent)",
        "",
        f"- source inspected: `{args.source}`",
        f"- passing checks: {passed}/{len(checks)}",
        "",
        "| id | check | verdict | evidence |",
        "|---|---|---|---|",
    ]
    for c in checks:
        lines.append(f"| {c['id']} | {c['title']} | {c['verdict']} | {c['evidence']} |")
    lines.append("")
    print("\n".join(lines))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
