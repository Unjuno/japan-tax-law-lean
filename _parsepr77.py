import json
from pathlib import Path
s = Path("build/_pr77_out.json").read_text(encoding="utf-8")
try:
    d = json.loads(s)
    print("number:", d.get("number"))
    print("state:", d.get("state"))
    print("head:", d.get("head", {}).get("sha"))
except Exception as e:
    print("RAW:", s[:1000])
    print("ERR:", e)
