import json
from pathlib import Path
d = json.loads(Path("data/verification_evidence.json").read_text(encoding="utf-8"))
uid="NORM|8bf684764da81b921477924a5e17db0d25d2ddfae535431c99302894578f927c"
u = d.get("units",{}).get(uid)
print("present:", bool(u), "axes:", len(u) if u else 0)
