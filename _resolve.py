import json, subprocess
from pathlib import Path

path = "data/verification_evidence.json"
def stage(n):
    r = subprocess.run(["git","show",f":{n}:{path}"], capture_output=True)
    return json.loads(r.stdout.decode("utf-8")) if r.returncode == 0 else None

ours = stage(2); theirs = stage(3)
merged = dict(theirs) if theirs else json.loads(Path(path).read_text(encoding="utf-8"))
merged.setdefault("units", {})
if ours:
    for uid, rec in ours.get("units", {}).items():
        if uid in merged["units"]:
            c = dict(merged["units"][uid])
            for k, v in rec.items():
                if isinstance(v, str) and v.strip(): c[k] = v
            merged["units"][uid] = c
        else:
            merged["units"][uid] = rec
Path(path).write_text(json.dumps(merged, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
print("evidence units:", len(merged["units"]))
