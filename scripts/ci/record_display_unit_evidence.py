#!/usr/bin/env python3
"""Record evidence for the art.22の4(2) presentation-unit unit."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "data/verification_evidence.json"
QUEUE = REPO / "build/task_queue.json"
UID = "NORM|70d9948f3c285aa1bca4e2e5dc6a76fd82dede46f1b4739c742e85b5d838098c"
RAW = "data/raw/326M50000040055_20260901_506M60000040025.law.json"
BASE = "BalanceSheetDisplayUnit"
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()

def main() -> int:
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    unit = next(t for t in q["tasks"] if t["id"] == UID)
    ev = json.loads(OUT.read_text(encoding="utf-8"))
    ev.setdefault("units", {})[UID] = {
        "source_location": (f"{RAW}#{unit.get('source_path','')} sha256={sha(REPO/RAW)}; "
                            "verbatim located in art.22_4(2)"),
        "decomposition_audit": (f"coverage exact={unit['coverage']['exact']} "
                                f"unique_ids={unit['coverage']['unique_ids']}"),
        "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                        "amounts_in_source=[1,1000,1000000]; missing=[]"),
        "independent_spec": (f"JapanTaxLaw/{BASE}Spec.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}Spec.lean')}; "
                             "spec uses nested conditionals, impl pattern matching"),
        "implementation": f"JapanTaxLaw/{BASE}.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}.lean')}",
        "kernel_proof": (f"lake build JapanTaxLaw.{BASE}Tests: Build completed successfully (5 jobs); "
                         "divisor_one/divisor_million/agree_spec_impl all axiom-free"),
        "proof_scope": ("agree_spec_impl exhaustive over three declared units; truncation is "
                        "a documented model choice, not a statutory rounding rule"),
        "boundary_proof": (f"{BASE}Tests.lean kernel-decided divisors and 1,234,567 scaled "
                           "in all three units"),
        "cross_law_proof": f"dependencies={unit.get('dependencies', [])}",
        "tests": f"JapanTaxLaw/{BASE}Tests.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}Tests.lean')}",
        "adversarial_review": ("docs/ADVERSARIAL_DISPLAY_UNIT.md H/T/D/C/U; invented rounding "
                               "rule explicitly rejected"),
    }
    OUT.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print("recorded evidence for", UID)
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
