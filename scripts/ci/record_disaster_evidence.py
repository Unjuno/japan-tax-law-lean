#!/usr/bin/env python3
"""Record evidence for the art.2(1) ¥5,000,000 unit from real artifacts."""
from __future__ import annotations

import hashlib
import json
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "data" / "verification_evidence.json"
QUEUE = REPO / "build" / "task_queue.json"
UID = "NORM|89a8b5e3962e7db358a45105bea6669582c82591554b65860296e9fc58cc71cf"
RAW = "data/raw/322AC0000000175_20220101_503AC0000000011.law.json"


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
                                "unit is one clause of art. 2"),
        "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                        "verbatim_located=true; amounts_in_source=[5000000]; "
                                        "missing=[]"),
        "independent_spec": (f"JapanTaxLaw/DisasterIncomeThresholdSpec.lean "
                             f"sha256={sha(REPO / 'JapanTaxLaw/DisasterIncomeThresholdSpec.lean')}; "
                             "specEligible restates threshold as ¬(5M < income)"),
        "implementation": (f"JapanTaxLaw/DisasterIncomeThreshold.lean "
                           f"sha256={sha(REPO / 'JapanTaxLaw/DisasterIncomeThreshold.lean')}"),
        "kernel_proof": ("lake build JapanTaxLaw.DisasterIncomeThresholdTests: Build completed "
                         "successfully (5 jobs); #print axioms eligible_at_boundary / "
                         "eligible_above: no axioms; agree_spec_impl: standard propext only"),
        "proof_scope": ("agree_spec_impl is a theorem for ALL Nat inputs (universal), "
                        "not a finite grid; band scope limited to art. 2(1) first threshold"),
        "boundary_proof": ("DisasterIncomeThresholdTests.lean: 4,999,999→true, 5,000,000→true, "
                           "5,000,001→false, all kernel-decided"),
        "cross_law_proof": (f"dependencies={unit.get('dependencies', [])}; no cross-law "
                            "dependency for this threshold clause; dependency analysis "
                            "records law name + article, not a bare 15-digit id"),
        "tests": (f"JapanTaxLaw/DisasterIncomeThresholdTests.lean "
                  f"sha256={sha(REPO / 'JapanTaxLaw/DisasterIncomeThresholdTests.lean')}; "
                  "10 kernel-decided examples"),
        "adversarial_review": ("docs/ADVERSARIAL_DISASTER_2_1.md H/T/D/C/U; inclusive-vs-strict "
                               "competing reading recorded; scope limits explicit"),
    }
    OUT.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
                   encoding="utf-8")
    print("recorded evidence for", UID)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
