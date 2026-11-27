#!/usr/bin/env python3
"""Record evidence for the art.38(4) deferral exception unit."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "data/verification_evidence.json"
QUEUE = REPO / "build/task_queue.json"
UID = "NORM|6c27921434c59ba57a352e0bf3f7ff011871be1423b177bd348091a1ab4d0156"
RAW = "data/raw/325AC0000000073_20260401_506AC0000000008.law.json"
BASE = "DeferralExceptionLimit"
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()

def main() -> int:
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    unit = next(t for t in q["tasks"] if t["id"] == UID)
    ev = json.loads(OUT.read_text(encoding="utf-8"))
    ev.setdefault("units", {})[UID] = {
        "source_location": (f"{RAW}#{unit.get('source_path','')} sha256={sha(REPO/RAW)}; "
                            "verbatim located in art.38(4) sentence 2"),
        "decomposition_audit": (f"coverage exact={unit['coverage']['exact']} "
                                f"unique_ids={unit['coverage']['unique_ids']}"),
        "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                        "amounts_in_source=[1000000]; no missing constants; "
                                        "period 三年→3 years verified in verbatim and constants"),
        "independent_spec": (f"JapanTaxLaw/{BASE}Spec.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}Spec.lean')}; "
                             "spec uses negated strict comparisons joined by Bool AND"),
        "implementation": f"JapanTaxLaw/{BASE}.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}.lean')}",
        "kernel_proof": (f"lake build JapanTaxLaw.{BASE}Tests: Build completed successfully (5 jobs); "
                         "amount_at_cap/amount_over_cap/period_over_cap: no axioms; "
                         "agree_spec_impl: standard propext"),
        "proof_scope": ("agree_spec_impl universal over all Nat pairs; exception predicate only, "
                        "not the negated base rule"),
        "boundary_proof": (f"{BASE}Tests.lean kernel-decided (1M,3),(1M+1,3),(1M,4),(1M+1,4)"),
        "cross_law_proof": f"dependencies={unit.get('dependencies', [])}",
        "tests": (f"JapanTaxLaw/{BASE}Tests.lean "
                  f"sha256={sha(REPO/f'JapanTaxLaw/{BASE}Tests.lean')}"),
        "adversarial_review": ("docs/ADVERSARIAL_DEFERRAL_EXCEPTION.md H/T/D/C/U; AND-vs-OR and "
                               "money-vs-years dimension checks recorded"),
    }
    OUT.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
    print("recorded evidence for", UID)
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
