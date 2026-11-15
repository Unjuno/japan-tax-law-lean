"""Phase B full sweep with a verified-anomaly gate.

Runs the structural sweep over every pinned law (with family cross-law
resolution) and fails iff `findings_verified_anomaly` > 0. Candidates may be
anything — they are recorded, never auto-failing; a verified anomaly is a
mechanically certain contradiction and must stop the line.

Exit 0 iff sweep completes and the verified-anomaly count is 0.
"""
import json
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]

r = subprocess.run([sys.executable, str(REPO / "scripts" / "law_audit" / "inventory" / "sweep.py")])
if r.returncode != 0:
    print(f"sweep runner failed: exit {r.returncode}")
    sys.exit(1)
data = json.loads((REPO / "build" / "audit_sweep.json").read_text(encoding="utf-8"))
totals = data.get("totals", {})
v = totals.get("findings_verified_anomaly", 0)
c = totals.get("findings_candidate", 0)
print(f"sweep summary: laws={totals.get('laws_total')} verified-anomaly={v} candidates={c}")
if v:
    print("VERIFIED ANOMALY FOUND — see build/audit_sweep.json")
    sys.exit(1)
sys.exit(0)
