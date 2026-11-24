#!/usr/bin/env python3
"""Record evidence for the 酒税法 art.23(1)三 tiered-amount unit."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "data/verification_evidence.json"
QUEUE = REPO / "build/task_queue.json"
UID = "NORM|357718120dc5d73305dba5f4884ee941c800423843672b294650d98af017cc47"
RAW = "data/raw/328AC0000000006_20260525_506AC0000000052.law.json"
BASE = "SakeTieredAmount"
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()

def main() -> int:
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    unit = next(t for t in q["tasks"] if t["id"] == UID)
    ev = json.loads(OUT.read_text(encoding="utf-8"))
    ev.setdefault("units", {})[UID] = {
        "source_location": (f"{RAW} (corrected law id; queue path had 14 chars) "
                            f"sha256={sha(REPO/RAW)}; verbatim located in art.23(1)三"),
        "decomposition_audit": (f"coverage exact={unit['coverage']['exact']} "
                                f"unique_ids={unit['coverage']['unique_ids']}"),
        "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                        "amounts_in_source=[10000,200000]; missing=[]"),
        "independent_spec": (f"JapanTaxLaw/{BASE}Spec.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}Spec.lean')}; "
                             "spec uses saturating subtraction, impl uses if/then"),
        "implementation": f"JapanTaxLaw/{BASE}.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}.lean')}",
        "kernel_proof": (f"lake build JapanTaxLaw.{BASE}Tests: Build completed successfully (5 jobs); "
                         "at_20/at_21 axiom-free; agree_spec_impl standard propext"),
        "proof_scope": ("agree_spec_impl universal over all alcohol degrees; tax base out of scope"),
        "boundary_proof": (f"{BASE}Tests.lean kernel-decided degrees 0/19/20/21/22/30"),
        "cross_law_proof": f"dependencies={unit.get('dependencies', [])}",
        "tests": f"JapanTaxLaw/{BASE}Tests.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}Tests.lean')}",
        "adversarial_review": ("docs/ADVERSARIAL_SAKE_TIER.md H/T/D/C/U; malformed queue source path "
                               "recorded and corrected pin documented"),
    }
    OUT.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print("recorded evidence for", UID)
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
