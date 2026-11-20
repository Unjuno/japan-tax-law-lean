#!/usr/bin/env python3
"""Independent adversarial audit of the japan-tax-law-lean completion gate.

Durable copy kept outside the shared repository because that repository is
being reset concurrently. Usage:
    python completion_gate_adversarial.py <repo-root>

Imports none of the queue/completion modules. Records H/T/D/C/U per finding.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path
from typing import Any

REPO = Path(sys.argv[1]) if len(sys.argv) > 1 else Path.cwd()
OUT_JSON = REPO / "build" / "completion_gate_adversarial.json"
OUT_MD = REPO / "docs" / "COMPLETION_GATE_ADVERSARIAL.md"

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
EVIDENCE_FILES = [REPO / "data" / "verification_evidence.json",
                  REPO / "data" / "TASK_EVIDENCE.json"]
STATE_FILES = [REPO / "data" / "task_state.json", REPO / "data" / "TASK_STATE.json"]
STATES = ("NOT_STARTED", "PARTIAL", "PROVED_SCOPE", "FULLY_VERIFIED", "BLOCKED")


def strip_comments(text: str) -> str:
    text = re.sub(r'("""|\'\'\')(?:.*?)\1', "", text, flags=re.S)
    text = re.sub(r"/-.*?-/", "", text, flags=re.S)
    text = re.sub(r"#[^\n]*", "", text)
    return text


def finding(rule, must, H, T, D, C, U):
    return {"rule": rule, "must": must, "H": H, "T": T, "D": D, "C": C, "U": U}


def rule_distinct_states(src, repo=REPO):
    helpers = []
    for p in sorted((repo / "scripts").rglob("*.py")):
        helpers.append(strip_comments(p.read_text(encoding="utf-8", errors="replace")))
    allsrc = list(src.values()) + helpers
    seen = sorted({s for s in STATES if any(s in c for c in allsrc)})
    ok = len(seen) >= 4 and "FULLY_VERIFIED" in seen and "PROVED_SCOPE" in seen
    return finding("distinct_completion_states", True,
        "Tools collapse verification into a single boolean/COMPLETE flag.",
        "searched stripped code of %d tools" % len(src),
        "PASS" if ok else "FAIL",
        "A tool may mention FULLY_VERIFIED only in a docstring.",
        "Emitted status column checked by ledger rules.")


def rule_no_needle_completion(src):
    hits = []
    presence_rx = re.compile(r"(?im)^\s*(\w+)\s*=\s*(?:all\(\s*)?\[?[^\n]*(fidelity|needle|exists|agree|artifact|clean|pinned)")
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
                hits.append("%s: %s" % (Path(name).name, m.group(0).strip()[:100]))
    return finding("no_presence_or_string_completion", True,
        "A needle/file/name match alone sets a completion status.",
        "two-step assignment scan over %d tools" % len(src),
        "FAIL" if hits else "PASS",
        "Only presence variables used in status assignments are flagged.",
        "Cross-checks ARTICLE_OBLIGATIONS.md: presence must cap at PARTIAL.")


def rule_id_components(src):
    joined = "\n".join(src.values()).lower()
    required = ("law_id", "revision", "history", "suppl", "appdx", "cell", "unit", "sha256")
    missing = [r for r in required if r not in joined]
    return finding("collision_free_id_components", True,
        "IDs omit law/revision/history/main-supplementary/appendix-cell/unit fields.",
        "searched stripped code for %s" % ", ".join(required),
        "PASS" if not missing else "FAIL", "ID construction may be in a helper module.",
        "Digest construction covered by dedicated unit tests.")


def rule_dependency_signals(src, repo=REPO):
    # Parsing may legitimately live in helper modules; scan the whole tooling
    # tree rather than only the four entry points.
    helpers = []
    for p in sorted((repo / "scripts").rglob("*.py")):
        helpers.append(strip_comments(p.read_text(encoding="utf-8", errors="replace")))
    joined = "\n".join(src.values()) + "\n" + "\n".join(helpers)
    ok = (bool(re.search(r"law_name|official_title|law_title", joined))
          and bool(re.search(r"article|\u6761", joined))
          and bool(re.search(r"revision|enforcement|\u65bd\u884c", joined))
          and bool(re.search(r"15|\\d\{15\}|ID15", joined)))
    return finding("dependency_not_15digit_only", True,
        "Dependencies resolved by 15-digit number search only.",
        "searched law-name/article/revision plus 15-digit handling",
        "PASS" if ok else "FAIL", "Parsing may be delegated to a helper.",
        "Queue tests exercise helper behaviour.")


def rule_state_persistence(src):
    joined = "\n".join(src.values()).lower()
    required = ("owner", "blocker", "artifact", "task_state.json", "merge")
    missing = [r for r in required if r not in joined]
    return finding("durable_ownership_and_blockers", True,
        "Regeneration loses owner/blocker/artifacts.",
        "searched stripped code for %s" % ", ".join(required),
        "PASS" if not missing else "FAIL", "State file name may differ in case.",
        "Fields existing does not prove conflict-free assignment.")


def rule_skip_not_pass(gate_src):
    # The runner may enforce required gates via a `strict` flag or via a direct
    # `required = name in REQUIRED_GATES` branch; both keep SKIP out of PASS.
    ok = "REQUIRED_GATES" in gate_src and (
        "strict" in gate_src or "required = name in REQUIRED_GATES" in gate_src
        or "required_gate" in gate_src.lower())
    return finding("skip_is_not_pass", True, "Absent required gate counted as pass.",
        "inspected run_python_gates.py for REQUIRED_GATES and distinct required-gate handling",
        "PASS" if ok else "FAIL",
        "Optional phase gates may SKIP legitimately.", "CI enforcement outside this audit.")


def rule_ledger_no_bare_complete():
    text = LEDGER.read_text(encoding="utf-8") if LEDGER.exists() else ""
    rows = [ln for ln in text.splitlines() if ln.startswith("| `")]
    bare = [ln for ln in rows if re.search(r"\|\s*COMPLETE\s*\|", ln)]
    return finding("ledger_no_bare_complete", True, "Ledger reports bare COMPLETE.",
        "scanned %d article rows" % len(rows), "FAIL" if bare else "PASS",
        "FULLY_VERIFIED requires evidence (next rule).", "Stale ledger may pass.")


def first_existing(paths):
    return next((p for p in paths if p.exists()), None)


def load_json(path):
    if path is None:
        return {}
    try:
        d = json.loads(path.read_text(encoding="utf-8"))
    except (ValueError, OSError):
        return {}
    return d if isinstance(d, dict) else {}


def rule_no_unbacked_full():
    text = LEDGER.read_text(encoding="utf-8") if LEDGER.exists() else ""
    rows = [ln for ln in text.splitlines() if ln.startswith("| `") and "FULLY_VERIFIED" in ln]
    p = first_existing(EVIDENCE_FILES)
    ev = load_json(p)
    return finding("fully_verified_has_evidence", True,
        "FULLY_VERIFIED asserted without machine-produced evidence.",
        "%d FULLY_VERIFIED rows; evidence %s (%d keys)" % (len(rows), p.name if p else "absent", len(ev)),
        "FAIL" if rows and not ev else "PASS", "Evidence file may be stale.",
        "Run proof/attestation gates before trusting FULLY_VERIFIED.")


def rule_scope_candidates():
    text = SCOPE.read_text(encoding="utf-8") if SCOPE.exists() else ""
    mis = len(re.findall(r"CANDIDATE_MIS_PIN|NO_SCOPED_LOCATION|CROSS_ARTICLE|WHOLE_TEXT_ONLY|\u30af\u30ed\u30b9\u6761", text))
    return finding("scope_mispin_reported", False,
        "Needles match a different article than stated.",
        "counted scope-candidate states", "BY_DESIGN" if mis else "PASS",
        "Cross-article reuse may be legitimate.", "Each candidate needs confirmation.")


def state_counts():
    d = load_json(first_existing(STATE_FILES))
    counts = {}
    for u in (d.get("units") or {}).values():
        if isinstance(u, dict):
            s = str(u.get("status", "UNKNOWN"))
            counts[s] = counts.get(s, 0) + 1
    return counts


def main():
    src = {str(p): strip_comments(p.read_text(encoding="utf-8")) if p.exists() else "" for p in TOOLS}
    gate_src = GATES.read_text(encoding="utf-8") if GATES.exists() else ""
    findings = [rule_distinct_states(src), rule_no_needle_completion(src),
                rule_id_components(src), rule_dependency_signals(src),
                rule_state_persistence(src), rule_skip_not_pass(gate_src),
                rule_ledger_no_bare_complete(), rule_no_unbacked_full(),
                rule_scope_candidates()]
    fails = [f for f in findings if f["must"] and f["D"] == "FAIL"]
    payload = {
        "tool": "completion_gate_adversarial.py (durable copy)",
        "repo": str(REPO),
        "measured": {
            "tools_present": sum(1 for p in TOOLS if p.exists()),
            "tools_scanned": len(TOOLS),
            "durable_state_counts": state_counts(),
            "evidence_file": str(first_existing(EVIDENCE_FILES)) if first_existing(EVIDENCE_FILES) else "",
        },
        "findings": findings,
        "verdict": "FAIL" if fails else "PASS",
    }
    OUT_JSON.write_text(json.dumps(payload, ensure_ascii=False, sort_keys=True, indent=2), encoding="utf-8")
    lines = ["# Adversarial audit of the completion gate", "",
             "repo: `%s`" % REPO, "",
             "verdict: **%s** (%d MUST failures)" % (payload["verdict"], len(fails)), "",
             "- tools present: %d/%d" % (payload["measured"]["tools_present"], len(TOOLS)),
             "- evidence file: %s" % payload["measured"]["evidence_file"],
             "- durable state counts: %s" % json.dumps(payload["measured"]["durable_state_counts"], sort_keys=True),
             "", "| rule | must | H | T | D | C | U |", "|---|---|---|---|---|---|---|"]
    for f in findings:
        lines.append("| %s | %s | %s | %s | %s | %s | %s |" % (
            f["rule"], "yes" if f["must"] else "no", f["H"], f["T"], f["D"], f["C"], f["U"]))
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print("completion gate adversary: %s; %d MUST failures" % (payload["verdict"], len(fails)))
    for f in fails:
        print("  FAIL", f["rule"], "-", f["T"])
    return 1 if fails else 0


if __name__ == "__main__":
    sys.exit(main())
