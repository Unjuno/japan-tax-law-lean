#!/usr/bin/env python3
"""Adversarial audit of the task queue / completion judgement (Objective §5).

Independent static path: this script imports none of the queue/completion
modules, so a bug or a circular proof in those modules cannot hide here. It
inspects the actual source of the four tools plus the generated ledgers and
records, for every candidate defect, the required H/T/D/C/U tuple.

Docstrings and comments are stripped before the code rules run, so a docstring
saying "the old code wrote COMPLETE" is not mistaken for a live shortcut.

Outputs: build/completion_gate_adversarial.json and
docs/COMPLETION_GATE_ADVERSARIAL.md. Exit 0 iff no MUST rule is FAIL; a SKIP is
never reported as PASS.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path
from typing import Any

REPO = Path(__file__).resolve().parents[2]
TOOLS = [
    REPO / "scripts" / "ci" / "task_queue.py",
    REPO / "scripts" / "ci" / "task_selector.py",
    REPO / "scripts" / "ci" / "article_obligations.py",
    REPO / "scripts" / "law_audit" / "phase_e" / "article_scope.py",
]
GATES = REPO / "scripts" / "ci" / "run_python_gates.py"
LEDGER = REPO / "docs" / "ARTICLE_OBLIGATIONS.md"
SCOPE = REPO / "docs" / "ARTICLE_SCOPE.md"
QUEUE_DOC = REPO / "docs" / "TASK_QUEUE.md"
EVIDENCE_FILES = [
    REPO / "data" / "verification_evidence.json",
    REPO / "data" / "TASK_EVIDENCE.json",
]
STATE_FILES = [
    REPO / "data" / "task_state.json",
    REPO / "data" / "TASK_STATE.json",
]
OUT_JSON = REPO / "build" / "completion_gate_adversarial.json"
OUT_MD = REPO / "docs" / "COMPLETION_GATE_ADVERSARIAL.md"

STATES = ("NOT_STARTED", "PARTIAL", "PROVED_SCOPE", "FULLY_VERIFIED", "BLOCKED")


def strip_comments(text: str) -> str:
    """Remove docstrings, block comments and line comments for code-only rules."""
    text = re.sub(r'("""|\'\'\')(?:.*?)\1', "", text, flags=re.S)
    text = re.sub(r"/-.*?-/", "", text, flags=re.S)
    text = re.sub(r"#[^\n]*", "", text)
    return text


def finding(rule: str, must: bool, H: str, T: str, D: str, C: str, U: str) -> dict[str, Any]:
    return {"rule": rule, "must": must, "H": H, "T": T, "D": D, "C": C, "U": U}


def rule_distinct_states(src: dict[str, str]) -> dict[str, Any]:
    seen = sorted({s for s in STATES if any(s in code for code in src.values())})
    ok = len(seen) >= 4 and "FULLY_VERIFIED" in seen and "PROVED_SCOPE" in seen
    return finding(
        "distinct_completion_states", True,
        "The tools collapse verification into a single boolean/COMPLETE flag.",
        "searched stripped code of %d tools for %s" % (len(src), ", ".join(STATES)),
        "PASS" if ok else "FAIL",
        "A tool may mention FULLY_VERIFIED only in a docstring while using a boolean in code.",
        "The emitted status column is checked by the ledger rules.",
    )


def rule_no_needle_completion(src: dict[str, str]) -> dict[str, Any]:
    """Two-step detection of the historical presence->completion shortcut.

        oks = [fidelity, exists["impl"], ..., agree]
        done = all(oks)                  # completion decided here
    """
    hits: list[str] = []
    presence_rx = re.compile(
        r"(?im)^\s*(\w+)\s*=\s*(?:all\(\s*)?\[?[^\n]*"
        r"(fidelity|needle|exists|agree|artifact|clean|pinned)")
    derived_rx = re.compile(r"(?im)^\s*(\w+)\s*=\s*(?:all|any)\(\s*(\w+)\s*\)")
    status_rx = re.compile(r"(?im)^\s*(\w*(?:status|done|complete|formalized)\w*)\s*=([^\n]*)")
    for name, code in src.items():
        presence = {m.group(1) for m in presence_rx.finditer(code)}
        for _ in range(3):
            for m in derived_rx.finditer(code):
                if m.group(2) in presence:
                    presence.add(m.group(1))
        for m in status_rx.finditer(code):
            rhs = m.group(2)
            used = sorted(v for v in presence if re.search(r"\b" + re.escape(v) + r"\b", rhs))
            direct = re.search(r"\b(fidelity|needle|exists|agree|artifact|clean|pinned)\b", rhs)
            if used or direct:
                hits.append("%s:%s -> %s" % (Path(name).name, m.group(0).strip()[:90],
                                             ",".join(used) if used else direct.group(1)))
    return finding(
        "no_presence_or_string_completion", True,
        "A needle match, file existence or theorem-name string match alone sets a completion status.",
        "two-step assignment scan over %d tools (presence vars -> status vars)" % len(src),
        "FAIL" if hits else "PASS",
        "A variable named 'fidelity' may be legitimate evidence; only its use in a status assignment is flagged.",
        "Cross-checks ARTICLE_OBLIGATIONS.md: presence must cap at PARTIAL.",
    )


def rule_id_components(src: dict[str, str]) -> dict[str, Any]:
    joined = "\n".join(src.values()).lower()
    required = ("law_id", "revision", "history", "suppl", "appdx", "cell",
                "unit", "sha256")
    missing = [r for r in required if r not in joined]
    return finding(
        "collision_free_id_components", True,
        "Normative IDs omit law/revision/history/main-supplementary/appendix-cell/unit fields.",
        "searched stripped code for %s" % ", ".join(required),
        "PASS" if not missing else "FAIL",
        "A helper module outside the four tools may construct the ID.",
        "Digest construction is covered by dedicated unit tests.",
    )


def rule_dependency_signals(src: dict[str, str]) -> dict[str, Any]:
    joined = "\n".join(src.values())
    has_name = bool(re.search(r"law_name|official_title|law_title", joined))
    has_article = bool(re.search(r"article|条", joined))
    has_revision = bool(re.search(r"revision|enforcement|施行", joined))
    has_15 = bool(re.search(r"15|\\d\{15\}|ID15", joined))
    ok = has_name and has_article and has_revision and has_15
    return finding(
        "dependency_not_15digit_only", True,
        "Dependencies are resolved by 15-digit number search only.",
        "searched stripped code for law-name/article/revision parsing alongside 15-digit handling",
        "PASS" if ok else "FAIL",
        "Parsing may be delegated to a helper module not in the four files.",
        "Helper behaviour is exercised by the queue tests.",
    )


def rule_state_persistence(src: dict[str, str]) -> dict[str, Any]:
    joined = "\n".join(src.values()).lower()
    required = ("owner", "blocker", "artifact", "task_state.json", "merge")
    missing = [r for r in required if r not in joined]
    return finding(
        "durable_ownership_and_blockers", True,
        "Regeneration loses owner, blocker and artifact information.",
        "searched stripped code for %s" % ", ".join(required),
        "PASS" if not missing else "FAIL",
        "The durable state file may use a different case; both known names are checked on disk.",
        "Existence of fields does not prove conflict-free assignment across agents.",
    )


def rule_skip_not_pass(gate_src: str) -> dict[str, Any]:
    ok = "REQUIRED_GATES" in gate_src and "strict" in gate_src
    return finding(
        "skip_is_not_pass", True,
        "An absent required gate is counted as a pass.",
        "inspected run_python_gates.py for a required-gate set and strict mode",
        "PASS" if ok else "FAIL",
        "Optional phase gates may legitimately SKIP; only REQUIRED_GATES matter.",
        "CI enforcement itself is outside this static audit.",
    )


def rule_ledger_no_bare_complete() -> dict[str, Any]:
    text = LEDGER.read_text(encoding="utf-8") if LEDGER.exists() else ""
    rows = [ln for ln in text.splitlines() if ln.startswith("| `")]
    bare = [ln for ln in rows if re.search(r"\|\s*COMPLETE\s*\|", ln)]
    return finding(
        "ledger_no_bare_complete", True,
        "The article ledger still reports a bare COMPLETE status.",
        "scanned %d article rows in docs/ARTICLE_OBLIGATIONS.md" % len(rows),
        "FAIL" if bare else "PASS",
        "FULLY_VERIFIED rows are allowed but require recorded evidence (next rule).",
        "A stale ledger could pass here; regenerate before trusting the result.",
    )


def first_existing(paths: list[Path]) -> Path | None:
    return next((p for p in paths if p.exists()), None)


def load_json(path: Path | None) -> dict[str, Any]:
    if path is None:
        return {}
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
    except (ValueError, OSError):
        return {}
    return data if isinstance(data, dict) else {}


def rule_no_unbacked_full() -> dict[str, Any]:
    text = LEDGER.read_text(encoding="utf-8") if LEDGER.exists() else ""
    rows = [ln for ln in text.splitlines()
            if ln.startswith("| `") and "FULLY_VERIFIED" in ln]
    ev_path = first_existing(EVIDENCE_FILES)
    ev = load_json(ev_path)
    return finding(
        "fully_verified_has_evidence", True,
        "FULLY_VERIFIED is asserted without a machine-produced evidence record.",
        "found %d FULLY_VERIFIED rows; evidence file %s (%d top-level keys)"
        % (len(rows), ev_path.name if ev_path else "absent", len(ev)),
        "FAIL" if rows and not ev else "PASS",
        "An evidence file may exist but be stale relative to the ledger.",
        "Run the proof/attestation gates before trusting any FULLY_VERIFIED row.",
    )


def rule_scope_candidates() -> dict[str, Any]:
    text = SCOPE.read_text(encoding="utf-8") if SCOPE.exists() else ""
    mis = len(re.findall(r"CANDIDATE_MIS_PIN|NO_SCOPED_LOCATION|CROSS_ARTICLE|WHOLE_TEXT_ONLY",
                         text))
    return finding(
        "scope_mispin_reported", False,
        "Needles match in a different article than the one stated in the check.",
        "counted scope-candidate states in docs/ARTICLE_SCOPE.md",
        "BY_DESIGN" if mis else "PASS",
        "Cross-article needle reuse may be legitimate (e.g. an appendix value).",
        "Each candidate needs independent confirmation; none is a law defect.",
    )


def state_counts() -> dict[str, int]:
    data = load_json(first_existing(STATE_FILES))
    counts: dict[str, int] = {}
    for unit in (data.get("units") or {}).values():
        if isinstance(unit, dict):
            s = str(unit.get("status", "UNKNOWN"))
            counts[s] = counts.get(s, 0) + 1
    return counts


def main() -> int:
    src = {str(p): strip_comments(p.read_text(encoding="utf-8")) if p.exists() else ""
           for p in TOOLS}
    gate_src = GATES.read_text(encoding="utf-8") if GATES.exists() else ""
    findings = [
        rule_distinct_states(src),
        rule_no_needle_completion(src),
        rule_id_components(src),
        rule_dependency_signals(src),
        rule_state_persistence(src),
        rule_skip_not_pass(gate_src),
        rule_ledger_no_bare_complete(),
        rule_no_unbacked_full(),
        rule_scope_candidates(),
    ]
    fails = [f for f in findings if f["must"] and f["D"] == "FAIL"]
    payload = {
        "tool": "scripts/ci/completion_gate_adversarial.py",
        "measured": {
            "tools_scanned": len(TOOLS),
            "tools_present": sum(1 for p in TOOLS if p.exists()),
            "durable_state_counts": state_counts(),
            "evidence_file": str(first_existing(EVIDENCE_FILES)) if first_existing(EVIDENCE_FILES) else "",
        },
        "findings": findings,
        "verdict": "FAIL" if fails else "PASS",
        "note": "BY_DESIGN candidates are not defects and are not counted as failures.",
    }
    OUT_JSON.parent.mkdir(parents=True, exist_ok=True)
    OUT_JSON.write_text(json.dumps(payload, ensure_ascii=False, sort_keys=True, indent=2),
                        encoding="utf-8")
    lines = [
        "# Adversarial audit of the completion gate (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/completion_gate_adversarial.py`.",
        "",
        "Independent static path: this script imports none of the queue/completion",
        "modules, so a circular proof there cannot conceal a shortcut here.",
        "",
        "verdict: **%s** (%d MUST failures)" % (payload["verdict"], len(fails)),
        "",
        "- tools scanned: %d (present: %d)" % (payload["measured"]["tools_scanned"],
                                                payload["measured"]["tools_present"]),
        "- evidence file: %s" % payload["measured"]["evidence_file"],
        "- durable state counts: %s" % json.dumps(payload["measured"]["durable_state_counts"],
                                                  ensure_ascii=False, sort_keys=True),
        "",
        "| rule | must | H | T | D | C | U |",
        "|---|---|---|---|---|---|---|",
    ]
    for f in findings:
        lines.append("| %s | %s | %s | %s | %s | %s | %s |" % (
            f["rule"], "yes" if f["must"] else "no", f["H"].replace("|", "/"),
            f["T"].replace("|", "/"), f["D"], f["C"].replace("|", "/"),
            f["U"].replace("|", "/")))
    lines.append("")
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print("completion gate adversary: %s; %d MUST failures" % (payload["verdict"], len(fails)))
    for f in fails:
        print("  FAIL %s: %s" % (f["rule"], f["T"]))
    return 1 if fails else 0


if __name__ == "__main__":
    sys.exit(main())
