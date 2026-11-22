import json, re, hashlib, subprocess
from pathlib import Path

def show(ref):
    out = subprocess.run(["git", "show", ref], capture_output=True, text=True,
                         encoding="utf-8", errors="replace")
    return out.stdout if out.returncode == 0 else ""

uid = "NORM|167b8cabf184adb"  # prefix
pat = re.compile(r"^<<<<<<< HEAD[^\n]*\n(.*?)^=======[^\n]*\n(.*?)^>>>>>>>[^\n]*\n?", re.S | re.M)
mainsrc = show("origin/main:data/verification_evidence.json")
m = pat.search(mainsrc)

sides = {}
if m:
    sides["main-sideA"] = json.loads(m.group(1))
    sides["main-sideB"] = json.loads(m.group(2))
sides["my-HEAD"] = json.loads(show("HEAD:data/verification_evidence.json"))

files = ["JapanTaxLaw/GiftTax.lean", "JapanTaxLaw/GiftTaxSpec.lean", "JapanTaxLaw/GiftTaxTests.lean"]
for f in files:
    p = Path(f)
    actual = hashlib.sha256(p.read_bytes().replace(b"\r\n", b"\n")).hexdigest() if p.exists() else "MISSING"
    print(f, "actual:", actual[:16], "exists:", p.exists())
    for label, d in sides.items():
        full = next((k for k in d.get("units", {}) if k.startswith(uid)), None)
        h = "n/a"
        if full:
            blob = json.dumps(d["units"][full], ensure_ascii=True)
            mm = re.search(re.escape(f) + r"\s+sha256=([0-9a-f]{64})", blob)
            h = mm.group(1)[:16] if mm else "no-hash"
        print("   ", label, h)
