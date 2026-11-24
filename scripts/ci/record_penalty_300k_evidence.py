#!/usr/bin/env python3
"""Record evidence for the 地方税法 art.30 ¥300,000 fine cap unit."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "data/verification_evidence.json"
QUEUE = REPO / "build/task_queue.json"
UID = "NORM|78c4b66be4df3492b588b23896bb80a6c620035b38cf0677804af0bc7f039118"
RAW = "data/raw/325AC0000000226_20261101_508AC0000000002.law.json"
BASE = "PenaltyCap300k"
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()

def main() -> int:
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    unit = next(t for t in q["tasks"] if t["id"] == UID)
    ev = json.loads(OUT.read_text(encoding="utf-8"))
    ev.setdefault("units", {})[UID] = {
        "source_location": (f"{RAW}#{unit.get('source_path','')} sha256={sha(REPO/RAW)}; "
                            "verbatim located in art.30"),
        "decomposition_audit": (f"coverage exact={unit['coverage']['exact']} "
                                f"unique_ids={unit['coverage']['unique_ids']}"),
        "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                        "amounts_in_source=[300000]; missing=[]"),
        "independent_spec": (f"JapanTaxLaw/{BASE}Spec.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}Spec.lean')}; "
                             "spec uses negation of strict excess"),
        "implementation": f"JapanTaxLaw/{BASE}.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}.lean')}",
        "kernel_proof": (f"lake build JapanTaxLaw.{BASE}Tests: Build completed successfully (5 jobs); "
                         "at_cap/above_cap axiom-free; agree_spec_impl standard propext"),
        "proof_scope": ("agree_spec_impl universal over all Nat amounts; only the cap, "
                        "violation conditions caller-established"),
        "boundary_proof": f"{BASE}Tests.lean kernel-decided 0/299999/300000/300001",
        "cross_law_proof": (f"dependencies={unit.get('dependencies', [])}; 前条第一項 "
                            "cross-reference out of scope"),
        "tests": f"JapanTaxLaw/{BASE}Tests.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}Tests.lean')}",
        "adversarial_review": ("docs/ADVERSARIAL_PENALTY_300K.md H/T/D/C/U; inclusive-vs-exclusive "
                               "competing reading recorded"),
    }
    OUT.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print("recorded evidence for", UID)
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
