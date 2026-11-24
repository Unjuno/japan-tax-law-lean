#!/usr/bin/env python3
"""One High4 coordinator cycle: SELECT -> SOURCE audit -> VERIFY -> record.

This is intentionally narrow and honest: it assigns ownership to units picked
from the persistent queue, runs an independent SOURCE-position check against
the pinned raw bytes, records SOURCE_LOCATION evidence with an H/T/D/C/U
finding, releases ownership for the next phase, and saves the durable ledgers.

It does NOT create Lean proofs or claim completion.
"""
from __future__ import annotations

import hashlib
import json
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO / "scripts" / "ci"))
import link_existing_proofs as lp  # noqa: E402
import task_selector  # noqa: E402
import task_state as st  # noqa: E402

QUEUE = REPO / "build" / "task_queue.json"
INVENTORY = REPO / "data" / "INVENTORY.json"
OUT = REPO / "build" / "coordinator_cycle.json"


def main() -> int:
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 5
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    tasks = q["tasks"]
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    inv_sha = {l["law_id"]: str((l.get("raw_snapshot") or {}).get("source_sha256", ""))
               for l in inv["laws"]}
    state = st.load_state()
    evidence = st.load_evidence()
    full_text = lp.make_full_text_reader()
    by_id = {t["normative_id"]: t for t in tasks}
    selected = [by_id[s["task_id"]] for s in task_selector.select_tasks(tasks, n)["selected"]
                if s["task_id"] in by_id]

    findings = []
    audited = 0
    for t in selected:
        uid = t["normative_id"]
        entry = state["units"].setdefault(uid, st.default_unit_state())
        entry["owner"] = "SOURCE-CYCLE"
        span_text = full_text(t)
        sha_ok = inv_sha.get(t["law_id"], "") == t["source_sha256"]
        prefix_ok = bool(span_text) and t["norm_fragment"] == span_text[:len(t["norm_fragment"])]
        digest_ok = bool(span_text) and hashlib.sha256(
            span_text.encode("utf-8")).hexdigest() == t["source_span"]["span_sha256"]
        decision = "PASS" if (sha_ok and prefix_ok and digest_ok) else "FAIL"
        ref = f"{t['source_file']}#{t['path']}#{t['source_span']['norm_start']}-{t['source_span']['norm_end']}"
        if decision == "PASS":
            exists = any(r.get("axis") == "SOURCE_LOCATION" and r.get("evidence_ref") == ref
                         for r in evidence["records"].get(uid, []))
            if not exists:
                st.record_evidence(evidence, uid, "SOURCE_LOCATION",
                                   evidence_ref=ref, tool="coordinator_cycle.py",
                                   note="pinned bytes, exact structural path, offsets and hash")
        entry["owner"] = ""  # released for SPECIFY / FORMALIZE
        entry["review_evidence"] = list(dict.fromkeys(
            entry.get("review_evidence", []) + [f"SOURCE_CYCLE:{decision}"]))
        audited += (decision == "PASS")
        findings.append({
            "task_id": uid,
            "law_id": t["law_id"],
            "article": t["article"],
            "H": "H: the reported span is not the text at the pinned offsets",
            "T": f"T: reconstruct provision text; sha_match={sha_ok} prefix_match={prefix_ok} digest_match={digest_ok}",
            "D": decision,
            "C": "C: whitespace normalization could hide a transposition (offset audit detects it)",
            "U": "U: semantic fidelity to the statute is NOT tested here",
        })

    st.save_state(state)
    st.save_evidence(evidence)
    payload = {
        "tool": "scripts/ci/coordinator_cycle.py",
        "selected": len(selected),
        "source_audited_pass": audited,
        "findings": findings,
        "claim": "SOURCE_POSITION_ONLY_NOT_LEGAL_VERIFICATION",
    }
    OUT.write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"coordinator cycle: selected={len(selected)} source_pass={audited} "
          f"(no proof or completion claim)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
