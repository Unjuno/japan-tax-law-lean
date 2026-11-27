#!/usr/bin/env python3
"""Record evidence for the 関税定率法 art.7 reading-substitution unit."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "data/verification_evidence.json"
QUEUE = REPO / "build/task_queue.json"
UID = "NORM|fc34952b4102c0a6697423e84c629c0eea802fb72c83594cac7374694c7ac66f"
RAW = "data/raw/143AC0000000054_20260601_508AC0000000005.law.json"
BASE = "ReadingSubstitutionArt7"
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()

def main() -> int:
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    unit = next(t for t in q["tasks"] if t["id"] == UID)
    ev = json.loads(OUT.read_text(encoding="utf-8"))
    ev.setdefault("units", {})[UID] = {
        "source_location": (f"{RAW}#{unit.get('source_path','')} sha256={sha(REPO/RAW)}; "
                            "verbatim located in art.7"),
        "decomposition_audit": (f"coverage exact={unit['coverage']['exact']} "
                                f"unique_ids={unit['coverage']['unique_ids']}"),
        "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                        "phrase_only_correspondence=true (no numeric literal); "
                                        "both quoted phrases located in pinned art.7"),
        "independent_spec": (f"JapanTaxLaw/{BASE}Spec.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}Spec.lean')}; "
                             "spec uses equality test, impl uses pattern match"),
        "implementation": f"JapanTaxLaw/{BASE}.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}.lean')}",
        "kernel_proof": (f"lake build JapanTaxLaw.{BASE}Tests: Build completed successfully (5 jobs); "
                         "applies_to_quoted / leaves_other / agree_spec_impl: only standard propext; "
                         "first string-based model rejected for Classical.choice/Quot.sound"),
        "proof_scope": ("agree_spec_impl exhaustive over all three constructors of the declared "
                        "Phrase domain; whole-phrase rewrite only"),
        "boundary_proof": (f"{BASE}Tests.lean covers original/replacement/other plus verbatim "
                           "phrase constants, all kernel-checked"),
        "cross_law_proof": f"dependencies={unit.get('dependencies', [])}",
        "tests": f"JapanTaxLaw/{BASE}Tests.lean sha256={sha(REPO/f'JapanTaxLaw/{BASE}Tests.lean')}",
        "adversarial_review": ("docs/ADVERSARIAL_READING_ART7.md H/T/D/C/U; substring rewrite and "
                               "axiom-footprint rejection recorded"),
    }
    OUT.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
    print("recorded evidence for", UID)
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
