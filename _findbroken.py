import json, re, hashlib
from pathlib import Path
REPO = Path(".").resolve()
q = json.loads(Path("build/task_queue.json").read_text(encoding="utf-8"))
tasks = q.get("tasks", [])
units = []
for t in tasks:
    nested = t.get("normative_units")
    if nested:
        units.extend(nested)
    else:
        units.append(t)
ev = json.loads(Path("data/verification_evidence.json").read_text(encoding="utf-8")).get("units", {})
fv_units = [u for u in units if u.get("status") == "FULLY_VERIFIED"]
hash_ref = re.compile(r"(JapanTaxLaw/[\w.]+\.lean)\s+sha256=([0-9a-f]{64})")
broken = []
for u in fv_units:
    uid = str(u.get("normative_id", ""))
    axes = ev.get(uid, {})
    for axis in ("implementation", "independent_spec", "tests"):
        for m in hash_ref.finditer(str(axes.get(axis, ""))):
            rel, claimed = m.group(1), m.group(2)
            fp = REPO / rel
            if not fp.exists():
                broken.append(f"{uid[:20]}:{axis}:missing:{rel}")
            else:
                actual = hashlib.sha256(fp.read_bytes().replace(b"\r\n", b"\n")).hexdigest()
                if actual != claimed:
                    broken.append(f"{uid[:20]}:{axis}:MISMATCH:{rel} claimed={claimed[:12]} actual={actual[:12]}")
print("FV units:", len(fv_units), "BROKEN:", len(broken))
for b in broken:
    print(" ", b)
