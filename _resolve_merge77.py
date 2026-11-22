import json, subprocess
from pathlib import Path

MY_UNIT = "NORM|e0b944b35e9349347a9ceecafce676e12456b363118f2bb1271a40efde92025b"

def stage(num, path):
    r = subprocess.run(["git", "show", f":{num}:{path}"], capture_output=True, check=True)
    return json.loads(r.stdout.decode("utf-8"))

path = "data/verification_evidence.json"
ours = stage(2, path)
theirs = stage(3, path)
assert MY_UNIT in ours.get("units", {}), "my unit missing from ours!"

# Preserve ALL of theirs (other agents' work); overlay only MY unit.
merged = dict(theirs)
merged_units = dict(theirs.get("units", {}))
merged_units[MY_UNIT] = ours["units"][MY_UNIT]
merged["units"] = merged_units
Path(path).write_text(json.dumps(merged, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
print("theirs units:", len(theirs.get("units", {})), "-> merged:", len(merged_units))
print("my unit present:", MY_UNIT in merged_units)
