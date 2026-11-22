import subprocess, json, re
from pathlib import Path

def show(ref):
    out = subprocess.run(["git", "show", ref], capture_output=True, text=True,
                         encoding="utf-8", errors="replace")
    return out.stdout if out.returncode == 0 else ""

uid = "NORM|35c971a0758598e57593706d43c4732904e25dab80fb92770430a30ab0f83d3f"
pat = re.compile(r"^<<<<<<< HEAD[^\n]*\n(.*?)^=======[^\n]*\n(.*?)^>>>>>>>[^\n]*\n?", re.S | re.M)

mainsrc = show("origin/main:data/verification_evidence.json")
m = pat.search(mainsrc)
assert m, "expected conflict block in main evidence"
sideA = json.loads(m.group(1))   # 355 units (newer main state)
sideB = json.loads(m.group(2))   # 348 units (older)
mysrc = json.loads(show("HEAD:data/verification_evidence.json"))  # 349 units, valid
assert uid in mysrc["units"], "my unit missing from HEAD"

# Base document = sideA (newer, 355 units); union in every unit from sideB and my HEAD.
merged = dict(sideA)
units = dict(sideA.get("units", {}))
for src in (sideB, mysrc):
    for k, v in src.get("units", {}).items():
        units[k] = v  # my finalized unit wins last
merged["units"] = units
assert uid in units
p = Path("data/verification_evidence.json")
p.write_text(json.dumps(merged, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

# Verify the written file.
check = json.loads(p.read_text(encoding="utf-8"))
print("reconstituted evidence units:", len(check["units"]),
      "my unit present:", uid in check["units"],
      "markers:", p.read_text(encoding="utf-8").count("<<<<<<<"))
