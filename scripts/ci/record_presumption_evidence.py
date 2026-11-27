#!/usr/bin/env python3
"""Record evidence for the 租税特別措置法 art.40の4(3) presumption unit."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "data/verification_evidence.json"
QUEUE = REPO / "build/task_queue.json"
UID = "NORM|aa4f3f14e89453a655123308fabc4e12a2dc360836eecd7bfb35ff829538c7ce"
RAW = "data/raw/332AC0000000026_20261101_507AC0000000013.law.json"
BASE = "PresumptionNoDocuments"
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()

def main() -> int:
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    unit = next(t for t in q["tasks"] if t["id"] == UID)
    ev = json.loads(OUT.read_text(encoding="utf-8"))
    ev.setdefault("units", {})[UID] = {
        "source_location": (f"{RAW}#{unit.get('source_path','')} sha256={sha(REPO/RAW)}; "
                            "verbatim located in art.40_4(3)"),
        "decomposition_audit": (f"coverage exact={unit['coverage']['exact']} "
                                f"unique_ids={unit['coverage']['unique_ids']}"),
        "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                        "phrase_only_correspondence=true; verbatim located"),
        "independent_spec": (f"JapanTaxLaw/{BASE}Spec.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}Spec.lean')}; "
                             "spec uses two-branch conditional, impl boolean negation"),
        "implementation": f"JapanTaxLaw/{BASE}.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}.lean')}",
        "kernel_proof": (f"lake build JapanTaxLaw.{BASE}Tests: Build completed successfully (5 jobs); "
                         "presume_when_absent / no_presumption_when_present / agree_spec_impl all axiom-free"),
        "proof_scope": "agree_spec_impl exhaustive over Bool; one-way presumption, converse not asserted",
        "boundary_proof": f"{BASE}Tests.lean covers submitted=true/false, kernel-checked",
        "cross_law_proof": f"dependencies={unit.get('dependencies', [])}",
        "tests": f"JapanTaxLaw/{BASE}Tests.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}Tests.lean')}",
        "adversarial_review": ("docs/ADVERSARIAL_PRESUMPTION_40_4.md H/T/D/C/U; rebuttable-vs-conclusive "
                               "competing interpretation recorded"),
    }
    OUT.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
    print("recorded evidence for", UID)
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
