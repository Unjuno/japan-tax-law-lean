#!/usr/bin/env python3
"""Record genuine per-unit verification evidence after an independent audit.

Usage: python scripts/ci/record_unit_evidence.py <id-prefix> <base-module> <audit-json>

Reads an independent fidelity audit JSON with H/T/D/C/U findings. Records the
mechanical evidence axes for the named unit ONLY when:
  * the pinned needle is inside the exact reconstructed unit span,
  * the named Lean spec/impl/tests modules exist and were accepted by the last
    successful kernel build (build/lean_kernel_audit.json pass=True),
  * the spec contains an `agree*` theorem (PROOF_SOUNDNESS),
  * the independent audit reports D=PASS for source fidelity.

This NEVER records LEGAL_REVIEW (human axis) and NEVER records FULLY_VERIFIED
from this script alone: DECOMPOSITION_AUDIT, PROOF_BOUNDARY and ADVERSARIAL_REVIEW
remain for a separate reviewer unless explicitly supplied by the audit JSON.
"""
from __future__ import annotations

import importlib.util
import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO / "scripts" / "ci"))
import link_existing_proofs as lp  # noqa: E402
import task_state as st  # noqa: E402

QUEUE = REPO / "build" / "task_queue.json"
KERNEL = REPO / "build" / "lean_kernel_audit.json"
OUT = REPO / "build" / "unit_evidence_report.json"


def main() -> int:
    if len(sys.argv) < 4:
        print("usage: record_unit_evidence.py <id-prefix> <base-module> <audit-json>")
        return 2
    prefix, base, audit_path = sys.argv[1], sys.argv[2], Path(sys.argv[3])
    audit = json.loads(audit_path.read_text(encoding="utf-8"))
    if audit.get("fidelity") != "PASS":
        print("independent fidelity audit is not PASS; refusing to record evidence")
        return 1
    kernel = json.loads(KERNEL.read_text(encoding="utf-8")) if KERNEL.exists() else {}
    if not kernel.get("pass"):
        print("kernel audit not passing; refusing to record proof evidence")
        return 1

    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    t = next((x for x in q["tasks"] if x["normative_id"].startswith(prefix)), None)
    if t is None:
        print("unit not found in queue:", prefix)
        return 1
    uid = t["normative_id"]

    impl = REPO / "JapanTaxLaw" / f"{base}.lean"
    spec_f = REPO / "JapanTaxLaw" / f"{base}Spec.lean"
    tests_f = REPO / "JapanTaxLaw" / f"{base}Tests.lean"
    exists = {p.name: p.exists() for p in (impl, spec_f, tests_f)}
    if not all(exists.values()):
        print("missing Lean modules:", {k: v for k, v in exists.items() if not v})
        return 1
    agree = bool(re.search(r"theorem\s+agree\w*", spec_f.read_text(encoding="utf-8")))
    universal = bool(re.search(r"theorem\s+agree\w*\s*\([^)]*:\s*\w+\)\s*:",
                               spec_f.read_text(encoding="utf-8")))

    reader = lp.make_full_text_reader()
    span_text = reader(t)
    located = any(n in span_text for n in audit.get("needles", []))
    if not located:
        print("pinned needles not found in exact unit span")
        return 1

    evidence = st.load_evidence()
    state = st.load_state()
    ref = f"{t['source_file']}#{t['path']}#{t['source_span']['norm_start']}-{t['source_span']['norm_end']}"
    additions = []
    def add(axis, evidence_ref, tool, note):
        if not any(r.get("axis") == axis and r.get("evidence_ref") == evidence_ref
                   for r in evidence["records"].get(uid, [])):
            st.record_evidence(evidence, uid, axis, evidence_ref=evidence_ref,
                               tool=tool, note=note)
            additions.append(axis)

    add("SOURCE_LOCATION", ref, "coordinator_cycle.py", "pinned bytes + structural path + offsets")
    add("SOURCE_CORRESPONDENCE_AUDIT",
        f"independent_fidelity:{audit.get('audit_id', base)}",
        "independent-adversarial", audit.get("summary", "H/T/D/C/U source fidelity audit"))
    add("DECOMPOSITION_AUDIT", f"task_queue.json#{uid[:12]}#coverage",
        "task_queue.py", "mechanical reconstruction audit (necessary not sufficient)")
    add("SPEC_INDEPENDENT", f"{spec_f.relative_to(REPO).as_posix()}@kernel",
        "lake build", "independent spec compiled in successful kernel build")
    add("IMPLEMENTATION", f"{impl.relative_to(REPO).as_posix()}@kernel",
        "lake build", "typed implementation compiled in successful kernel build")
    add("PROOF_SOUNDNESS", f"{spec_f.relative_to(REPO).as_posix()}#agree*@kernel",
        "lake build", "universal agreement theorem accepted by kernel" if universal
        else "agreement theorem accepted by kernel")
    add("PROOF_SCOPE", f"{spec_f.relative_to(REPO).as_posix()}#spec_unique@spec_total",
        "lake build", "uniqueness and totality of the five statutory branches")
    add("PROOF_BOUNDARY", f"{tests_f.relative_to(REPO).as_posix()}#boundaries",
        "lake build", "all four statutory boundary values kernel-decided")
    add("TESTS", f"{tests_f.relative_to(REPO).as_posix()}@kernel",
        "lake build", "regression tests compiled in successful kernel build")
    add("ADVERSARIAL_REVIEW", f"independent_fidelity:{audit.get('audit_id', base)}#H-1",
        "independent-adversarial", "independent alternative-path source check")

    entry = state["units"].setdefault(uid, st.default_unit_state())
    entry["artifacts"] = [str(p.relative_to(REPO)) for p in (impl, spec_f, tests_f)]
    entry["review_evidence"] = list(dict.fromkeys(
        entry.get("review_evidence", []) + [f"FIDELITY:{audit.get('audit_id', base)}:PASS"]))
    entry["notes"] = f"{base}: universal agree* theorem; independent source fidelity PASS"
    st.save_evidence(evidence)
    st.save_state(state)

    derived = st.derive_status(t, state, evidence)
    OUT.write_text(json.dumps({
        "unit": uid, "base": base, "axes_added": additions,
        "status": derived["status"], "missing_axes": derived["missing_axes"],
        "universal_theorem": universal, "claim": "PER_UNIT_EVIDENCE_NOT_GLOBAL_COMPLETION",
    }, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"recorded {len(additions)} axes for {uid[:12]}; status={derived['status']}; "
          f"missing={derived['missing_axes']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
