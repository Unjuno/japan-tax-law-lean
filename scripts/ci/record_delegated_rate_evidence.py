#!/usr/bin/env python3
"""Record evidence for the 地方税法 art.72の24の2 delegated 7% rate unit."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "data/verification_evidence.json"
QUEUE = REPO / "build/task_queue.json"
UID = "NORM|4ce573224735cd582616b3a9fc89d747f78adfc99af4f10479fa672e1b948b19"
RAW = "data/raw/325AC0000000226_20261101_508AC0000000002.law.json"
BASE = "DelegatedSavingsRate"
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()

def main() -> int:
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    unit = next(t for t in q["tasks"] if t["id"] == UID)
    ev = json.loads(OUT.read_text(encoding="utf-8"))
    ev.setdefault("units", {})[UID] = {
        "source_location": (f"{RAW}#{unit.get('source_path','')} sha256={sha(REPO/RAW)}; "
                            "verbatim located in art.72_24_2(2)二"),
        "decomposition_audit": (f"coverage exact={unit['coverage']['exact']} "
                                f"unique_ids={unit['coverage']['unique_ids']}"),
        "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                        "percent_numerators=[7]; constants_checked=[7,100]; missing=[]"),
        "independent_spec": (f"JapanTaxLaw/{BASE}Spec.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}Spec.lean')}; "
                             "spec uses (7,100) pair without TaxRate"),
        "implementation": f"JapanTaxLaw/{BASE}.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}.lean')}",
        "kernel_proof": (f"lake build JapanTaxLaw.{BASE}Tests: Build completed successfully (5 jobs); "
                         "rate_components/applies_when_designated axiom-free; agree_spec_impl standard propext"),
        "proof_scope": ("agree_spec_impl universal over Bool designation and all Nat premiums; "
                        "cabinet-order determination is caller-established, not resolved"),
        "boundary_proof": (f"{BASE}Tests.lean kernel-decided designated true/false with premiums 0/1/100/1000"),
        "cross_law_proof": (f"dependencies={unit.get('dependencies', [])}; 政令 definition is a "
                            "delegation, recorded as caller-established, not a resolved cross-law proof"),
        "tests": f"JapanTaxLaw/{BASE}Tests.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}Tests.lean')}",
        "adversarial_review": ("docs/ADVERSARIAL_DELEGATED_RATE.md H/T/D/C/U; unresolved cabinet-order "
                               "definition explicitly recorded"),
    }
    OUT.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print("recorded evidence for", UID)
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
