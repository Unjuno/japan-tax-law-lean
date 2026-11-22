import subprocess, json, re
from pathlib import Path

def show(ref):
    out = subprocess.run(["git", "show", ref], capture_output=True, text=True,
                         encoding="utf-8", errors="replace")
    return out.stdout if out.returncode == 0 else ""

raw = show("origin/main:data/verification_evidence.json")
pat = re.compile(r"^<<<<<<< HEAD[^\n]*\n(.*?)^=======[^\n]*\n(.*?)^>>>>>>>[^\n]*\n?", re.S | re.M)
m = pat.search(raw)
print("main has conflict block:", bool(m))
if m:
    for label, side in [("OURS-side", m.group(1)), ("THEIRS-side", m.group(2))]:
        try:
            d = json.loads(side)
            print(label, "VALID units:", len(d.get("units", {})))
        except Exception as e:
            print(label, "INVALID:", str(e)[:80], "size:", len(side))

mine = show("HEAD:data/verification_evidence.json")
dm = json.loads(mine)
mu = set(dm["units"])
print("MY HEAD units:", len(mu))
myuid = "NORM|35c971a0758598e57593706d43c4732904e25dab80fb92770430a30ab0f83d3f"
print("my unit in HEAD:", myuid in mu)

# Collect all unit ids from every parsable side to find the true union.
allids = set(mu)
for label, side in ([("OURS", m.group(1)), ("THEIRS", m.group(2))] if m else []):
    try:
        allids |= set(json.loads(side).get("units", {}))
    except Exception:
        pass
print("union of all unit ids:", len(allids))
