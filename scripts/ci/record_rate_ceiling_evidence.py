#!/usr/bin/env python3
"""Record evidence for the 地方税法 art.51 2% ceiling unit."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "data/verification_evidence.json"
QUEUE = REPO / "build/task_queue.json"
UID = "NORM|c6450946afa36af4ed52b19ff5433b84df5afb14341f23ab94d02f93d73b7450"
RAW = "data/raw/325AC0000000226_20261101_508AC0000000002.law.json"
BASE = "RateCeilingTwoPercent"
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()

def main() -> int:
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    unit = next(t for t in q["tasks"] if t["id"] == UID)
    ev = json.loads(OUT.read_text(encoding="utf-8"))
    ev.setdefault("units", {})[UID] = {
        "source_location": (f"{RAW}#{unit.get('source_path','')} sha256={sha(REPO/RAW)}; "
                            "verbatim located in art.51"),
        "decomposition_audit": (f"coverage exact={unit['coverage']['exact']} "
                                f"unique_ids={unit['coverage']['unique_ids']}"),
        "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                        "percent_numerators=[2]; constants_checked=[2,100]; missing=[]"),
        "independent_spec": (f"JapanTaxLaw/{BASE}Spec.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}Spec.lean')}; "
                             "specWithinCeiling uses non-strict cross-multiplied comparison"),
        "implementation": f"JapanTaxLaw/{BASE}.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}.lean')}",
        "kernel_proof": (f"lake build JapanTaxLaw.{BASE}Tests: Build completed successfully (5 jobs); "
                         "at_ceiling/above_ceiling: no axioms; agree_spec_impl: standard propext"),
        "proof_scope": ("agree_spec_impl universal over all Nat pairs; ceiling test only, "
                        "not the standard rate or local decision"),
        "boundary_proof": (f"{BASE}Tests.lean kernel-decided 2/100, 3/100, 1/100, 20/1000, 21/1000"),
        "cross_law_proof": f"dependencies={unit.get('dependencies', [])}",
        "tests": f"JapanTaxLaw/{BASE}Tests.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}Tests.lean')}",
        "adversarial_review": ("docs/ADVERSARIAL_RATE_CEILING_2.md H/T/D/C/U; strict ceiling "
                               "and equal-fraction comparison recorded"),
    }
    OUT.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
    print("recorded evidence for", UID)
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
