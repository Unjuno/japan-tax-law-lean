import json, subprocess
from pathlib import Path

def stage(n):
    return subprocess.check_output(
        ["git", "show", f":{n}:data/verification_evidence.json"]
    ).decode("utf-8")

ours = json.loads(stage(2))
theirs = json.loads(stage(3))
merged_units = dict(theirs["units"])
merged_units.update(ours["units"])  # prefer our freshly verified units
result = dict(theirs)
result["units"] = merged_units
Path("data/verification_evidence.json").write_text(
    json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
)
print(f"resolved: ours={len(ours['units'])} theirs={len(theirs['units'])} merged={len(merged_units)}")
for uid in [
    "NORM|ef7f5c0f1105d358392be865c4f7bac9f076278926d6a9faa8be0e5f000d68a2",
    "NORM|4034ae765e5c94d4bbd4588b6536d08053f9a82d48e12c78330531a3d78aa234",
]:
    print(uid[:24], uid in merged_units, len(merged_units.get(uid, {})))
