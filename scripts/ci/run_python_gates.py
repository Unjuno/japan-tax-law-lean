"""Run whichever Python audit gates exist on this branch, honestly.

Design: every branch in the stacked PR series carries only the tooling of its
phase. A later-phase gate must not fail an earlier-phase branch, but absence
of a gate is either expected (phase not reached yet) or a silent hole in the
inventory. This runner:

  * executes each gate that is present on THIS branch,
  * prints SKIP with an explicit reason for each gate not present,
  * exits 0 iff every present gate passes (or none is present).
"""
import os
import subprocess
import sys

GATES = [
    ("structural audit tests", ["python", "-m", "unittest", "scripts.tests.test_structural_audit", "-v"], ["scripts/tests/test_structural_audit.py"]),
    ("mutation injection tests", ["python", "-m", "unittest", "scripts.tests.test_mutation_injection", "-v"], ["scripts/tests/test_mutation_injection.py"]),
    ("inventory selection tests", ["python", "-m", "unittest", "scripts.tests.test_inventory_selection", "-v"], ["scripts/tests/test_inventory_selection.py"]),
    ("cross-law consistency tests", ["python", "-m", "unittest", "scripts.tests.test_cross_law", "-v"], ["scripts/tests/test_cross_law.py"]),
    ("revision impact tests", ["python", "-m", "unittest", "scripts.tests.test_revision_impact", "-v"], ["scripts/tests/test_revision_impact.py"]),
    ("Phase A inventory integrity", ["python", "scripts/law_audit/inventory/validate_inventory.py"], ["scripts/law_audit/inventory/validate_inventory.py"]),
    ("Phase E cross-law pin consistency", ["python", "scripts/law_audit/phase_e/cross_law.py"], ["scripts/law_audit/phase_e/cross_law.py"]),
    ("Phase F revision impact integrity", ["python", "scripts/law_audit/phase_f/revision_impact.py"], ["scripts/law_audit/phase_f/revision_impact.py"]),
    ("Run audit and verify hashes", ["python", "-m", "scripts.law_audit.audit", "--out", "build"], ["scripts/law_audit/audit.py"]),
    ("Generate audit report", ["python", "-m", "scripts.law_audit.report"], ["scripts/law_audit/report.py"]),
]

fails = 0
for name, cmd, paths in GATES:
    missing = [p for p in paths if not os.path.exists(p)]
    if missing:
        print(f"SKIP {name}: missing {missing}")
        continue
    print(f"RUN  {name}: {' '.join(cmd)}")
    r = subprocess.run(cmd)
    if r.returncode != 0:
        print(f"FAIL {name}: exit {r.returncode}")
        fails += 1
    else:
        print(f"PASS {name}")
if fails:
    print(f"{fails} gate(s) FAILED")
    sys.exit(1)
print("all present gates passed")