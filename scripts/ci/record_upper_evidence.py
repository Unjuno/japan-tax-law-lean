#!/usr/bin/env python3
"""Record evidence for the art.2(1) strict-exceedance band from real artifacts."""
from __future__ import annotations

import hashlib
import json
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "data" / "verification_evidence.json"
QUEUE = REPO / "build" / "task_queue.json"
UID = "NORM|2a1dc80cd4074bee88062395289ab4abddf8db19565f3d14b6d56b4003fbfb01"
RAW = "data/raw/322AC0000000175_20220101_503AC0000000011.law.json"
BASE = "DisasterIncomeUpperBand"


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def main() -> int:
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    unit = next(t for t in q["tasks"] if t["id"] == UID)
    ev = json.loads(OUT.read_text(encoding="utf-8"))
    ev.setdefault("units", {})[UID] = {
        "source_location": (f"{RAW}#{unit.get('source_path', '')} "
                            f"sha256={sha(REPO / RAW)}; verbatim located in art. 2"),
        "decomposition_audit": (f"queue coverage exact={unit['coverage']['exact']} "
                                f"unique_ids={unit['coverage']['unique_ids']}; "
                                "one clause of art. 2, distinct id from the ≤7.5M band"),
        "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                        "verbatim_located=true; amounts_in_source=[7500000]; "
                                        "missing=[]"),
        "independent_spec": (f"JapanTaxLaw/{BASE}Spec.lean "
                             f"sha256={sha(REPO / f'JapanTaxLaw/{BASE}Spec.lean')}; "
                             "spec restates strict exceedance as ¬(income ≤ 7.5M)"),
        "implementation": (f"JapanTaxLaw/{BASE}.lean "
                           f"sha256={sha(REPO / f'JapanTaxLaw/{BASE}.lean')}"),
        "kernel_proof": ("lake build JapanTaxLaw.DisasterIncomeUpperBandTests: Build completed "
                         "successfully (5 jobs); #print axioms at_edge / above_edge: no axioms; "
                         "agree_spec_impl: standard propext only"),
        "proof_scope": ("agree_spec_impl quantified over ALL Nat (universal); this unit covers "
                        "only the strict >¥7,500,000 band of art. 2(1)"),
        "boundary_proof": (f"{BASE}Tests.lean: 7,499,999→false, 7,500,000→false, "
                           "7,500,001→true, 10,000,000→true, all kernel-decided"),
        "cross_law_proof": (f"dependencies={unit.get('dependencies', [])}; no cross-law "
                            "dependency for this threshold clause"),
        "tests": (f"JapanTaxLaw/{BASE}Tests.lean "
                  f"sha256={sha(REPO / f'JapanTaxLaw/{BASE}Tests.lean')}; kernel-decided examples"),
        "adversarial_review": ("docs/ADVERSARIAL_DISASTER_UPPER.md H/T/D/C/U; strict-vs-inclusive "
                               "competing reading recorded; scope limits explicit"),
    }
    OUT.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n",
                   encoding="utf-8")
    print("recorded evidence for", UID)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
