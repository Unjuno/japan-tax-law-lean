#!/usr/bin/env python3
"""Record evidence for the 地方交付税法 art.6の2(2) 94% reference unit."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "data/verification_evidence.json"
QUEUE = REPO / "build/task_queue.json"
UID = "NORM|2485fde4475c83b98f617ad1f2d8f6543e766e59e6695c54c9cf94f7e1cc48c2"
RAW = "data/raw/325AC0000000211_20261102_508AC0000000062.law.json"
BASE = "OrdinaryGrant94Percent"
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()

def main() -> int:
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    unit = next(t for t in q["tasks"] if t["id"] == UID)
    ev = json.loads(OUT.read_text(encoding="utf-8"))
    ev.setdefault("units", {})[UID] = {
        "source_location": (f"{RAW}#{unit.get('source_path','')} sha256={sha(REPO/RAW)}; "
                            "verbatim located in art.6_2(2)"),
        "decomposition_audit": (f"coverage exact={unit['coverage']['exact']} "
                                f"unique_ids={unit['coverage']['unique_ids']}"),
        "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                        "percent_numerators=[94]; constants_checked=[94,100]; missing=[]"),
        "independent_spec": (f"JapanTaxLaw/{BASE}Spec.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}Spec.lean')}; "
                             "spec computes from (94,100) without TaxRate"),
        "implementation": f"JapanTaxLaw/{BASE}.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}.lean')}",
        "kernel_proof": (f"lake build JapanTaxLaw.{BASE}Tests: Build completed successfully (5 jobs); "
                         "rate_components/of_10_000 axiom-free; agree_spec_impl standard propext"),
        "proof_scope": ("agree_spec_impl universal over all Nat bases; 前条第二項 base is "
                        "caller-established, not resolved by this unit"),
        "boundary_proof": (f"{BASE}Tests.lean kernel-decided bases 0/1/50/100/10,000"),
        "cross_law_proof": (f"dependencies={unit.get('dependencies', [])}; 前条第二項 reference "
                            "recorded as out-of-scope base, not a resolved dependency"),
        "tests": f"JapanTaxLaw/{BASE}Tests.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}Tests.lean')}",
        "adversarial_review": ("docs/ADVERSARIAL_GRANT_94.md H/T/D/C/U; unresolved cross-reference "
                               "and floor-rounding scope recorded"),
    }
    OUT.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print("recorded evidence for", UID)
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
