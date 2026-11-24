#!/usr/bin/env python3
"""Attach genuine kernel-build evidence to pinned normative units (Objective §3/§5).

This does NOT declare completion. It records evidence axes only where a real
artifact exists and the Lean kernel accepted it:

  SOURCE_LOCATION              exact span in the derived queue projection
  SOURCE_CORRESPONDENCE_AUDIT   pinned needle located inside the unit span
  SPEC_INDEPENDENT              <Base>Spec.lean compiled by lake build
  IMPLEMENTATION                <Base>.lean compiled by lake build
  TESTS                         <Base>Tests.lean compiled by lake build
  PROOF_SOUNDNESS               only when the compiled spec contains an
                                `agree*` correspondence theorem

DECOMPOSITION_AUDIT / PROOF_SCOPE / PROOF_BOUNDARY / ADVERSARIAL_REVIEW stay
missing, so linked units become PARTIAL, never FULLY_VERIFIED.
"""
from __future__ import annotations

import importlib.util
import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO / "scripts" / "ci"))
sys.path.insert(0, str(REPO / "scripts" / "law_audit"))
import kansuji  # noqa: E402
import task_queue as tq  # noqa: E402
import task_state as st  # noqa: E402

QUEUE = REPO / "build" / "task_queue.json"
KERNEL = REPO / "build" / "lean_kernel_audit.json"
AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"
OUT = REPO / "build" / "proof_link_report.json"


def parse_article(text: str) -> str:
    m = re.match(r"第(.+?)条(?:の(.+))?$", text)
    if not m:
        return ""
    try:
        main = kansuji.kanji_to_int(m.group(1))
        branch = f"_{kansuji.kanji_to_int(m.group(2))}" if m.group(2) else ""
    except ValueError:
        return ""
    return f"第{main}{branch}条"


def base_module(check_name: str) -> str:
    m = re.search(r"(\w+)\.lean", check_name)
    return m.group(1) if m else ""


def make_full_text_reader():
    """Return a cached reader for exact unit text reconstructed from pinned bytes."""
    docs: dict[str, dict] = {}
    texts: dict[tuple[str, str], str] = {}

    def full_text(t: dict) -> str:
        span = t["source_span"]
        key = (t["source_file"], t["path"], span["norm_start"], span["norm_end"])
        if key in texts:
            return texts[key]
        sf = t["source_file"]
        if sf not in docs:
            p = REPO / sf
            docs[sf] = json.loads(p.read_text(encoding="utf-8")) if p.exists() else {}
        target = tuple(t["path"].split("/"))
        node = None
        for path, candidate in tq._walk(docs[sf].get("law_full_text") or {}):
            if tq._provision_path(path) == target:
                node = candidate
                break
        if node is None:
            texts[key] = ""
            return ""
        segments = []
        tq._collect(node, (), segments)
        text = "".join(s for s, _ in segments)
        full = text[span["norm_start"]:span["norm_end"]]
        texts[key] = full
        return full

    return full_text


def main() -> int:
    kernel = json.loads(KERNEL.read_text(encoding="utf-8")) if KERNEL.exists() else {}
    if not kernel.get("pass"):
        print("kernel audit not passing; refusing to record proof evidence")
        return 1
    spec = importlib.util.spec_from_file_location("pl_ta", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    tasks = q["tasks"]
    by_key: dict[tuple[str, str], list[dict]] = {}
    for t in tasks:
        by_key.setdefault((t["law_id"], t["article"]), []).append(t)

    evidence = st.load_evidence()
    state = st.load_state()
    state_before = json.dumps(state["units"], sort_keys=True, ensure_ascii=False)
    full_text = make_full_text_reader()

    def add_once(uid: str, axis: str, ref: str, tool: str, note: str) -> bool:
        existing = evidence["records"].get(uid, [])
        if any(r.get("axis") == axis and r.get("evidence_ref") == ref for r in existing):
            return False
        st.record_evidence(evidence, uid, axis, evidence_ref=ref, tool=tool, note=note)
        return True

    linked = 0
    axes_recorded = 0
    for name, law_id, kind, art, needles in mod.checks():
        base = base_module(name)
        if not base:
            continue
        impl = REPO / "JapanTaxLaw" / f"{base}.lean"
        spec_f = REPO / "JapanTaxLaw" / f"{base}Spec.lean"
        tests_f = REPO / "JapanTaxLaw" / f"{base}Tests.lean"
        artifacts = {
            "IMPLEMENTATION": impl, "SPEC_INDEPENDENT": spec_f, "TESTS": tests_f,
        }
        if not any(p.exists() for p in artifacts.values()):
            continue
        agree = bool(re.search(r"theorem\s+agree\w*",
                               spec_f.read_text(encoding="utf-8"))) if spec_f.exists() else False
        if art:
            units = by_key.get((law_id, parse_article(art)), [])
        else:
            # file-level appendix pins: cheap prefix pre-filter, then full span.
            units = [t for t in tasks if t["law_id"] == law_id
                     and any(n[:12] in t["norm_fragment"] for n in needles)]
        for t in units:
            uid = t["normative_id"]
            span_text = full_text(t)
            located = any(n in span_text for n in needles) if span_text else (
                any(n in t["norm_fragment"] for n in needles))
            records_before = len(evidence["records"].get(uid, []))
            add_once(uid, "SOURCE_LOCATION",
                     f"build/task_queue.json#{uid[:12]}#source_span",
                     "task_queue.py", "exact structural path and offsets")
            if located:
                add_once(uid, "SOURCE_CORRESPONDENCE_AUDIT",
                         f"transcription_audit:{base}",
                         "transcription_audit.py",
                         "pinned needle located in exact unit span")
            for axis, path in artifacts.items():
                if path.exists():
                    add_once(uid, axis,
                             f"{path.relative_to(REPO).as_posix()}@kernel",
                             "lake build", "compiled in successful kernel build")
            if agree:
                add_once(uid, "PROOF_SOUNDNESS",
                         f"{spec_f.relative_to(REPO).as_posix()}#agree*@kernel",
                         "lake build", "compiled spec correspondence theorem")
            added = len(evidence["records"].get(uid, [])) - records_before
            if added:
                linked += 1
                axes_recorded += added
                if uid not in state["units"]:
                    entry = st.default_unit_state()
                    entry["notes"] = f"linked to {base} by kernel evidence (not complete)"
                    entry["artifacts"] = [str(p.relative_to(REPO)) for p in artifacts.values()
                                          if p.exists()]
                    state["units"][uid] = entry

    st.save_evidence(evidence)
    if json.dumps(state["units"], sort_keys=True, ensure_ascii=False) != state_before:
        st.save_state(state)
    claim = st.completion_claim(tasks, state, evidence)
    OUT.write_text(json.dumps({
        "linked_units": linked,
        "evidence_records_added": axes_recorded,
        "status_counts": {k: claim[k] for k in ("not_started", "partial", "proved_scope",
                                                "fully_verified", "blocked", "stale")},
        "claim": "PARTIAL_EVIDENCE_ONLY",
    }, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"linked {linked} units, {axes_recorded} evidence records; "
          f"NOT_STARTED={claim['not_started']} PARTIAL={claim['partial']} "
          f"FULLY_VERIFIED={claim['fully_verified']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
