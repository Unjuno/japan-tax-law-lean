import json, sys
sys.stdout.reconfigure(encoding="utf-8")
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
d = json.loads((REPO / "data/LOCAL_JURISDICTIONS.json").read_text(encoding="utf-8"))
print("total", d["jurisdictions_total"], "counts", d["kind_counts"],
      "sha", d["source_sha256"][:16])
print("doc exists", (REPO / "docs/LOCAL_ORDINANCE_ENUMERATION.md").exists())
