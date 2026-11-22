import json, re, hashlib, subprocess
from pathlib import Path

REPO = Path(".").resolve()
q = json.loads(Path("build/task_queue.json").read_text(encoding="utf-8"))
ev = json.loads(Path("data/verification_evidence.json").read_text(encoding="utf-8"))
fv_units = [u for u in q["tasks"] if u.get("status") == "FULLY_VERIFIED"]
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
                broken.append(f"{uid[:16]}:{axis}:missing:{rel}")
            else:
                actual = hashlib.sha256(fp.read_bytes().replace(b"\r\n", b"\n")).hexdigest()
                if actual != claimed:
                    broken.append(f"{uid[:16]}:{axis}:mismatch:{rel} claimed={claimed[:12]} actual={actual[:12]}")
print("BROKEN COUNT:", len(broken))
for b in broken:
    print(" ", b)

# Registry detail
reg = json.loads(Path("data/TRANSCRIPTION_CHECK_REGISTRY.json").read_text(encoding="utf-8"))
mods = reg.get("modules", {})
print("registry modules type:", type(mods).__name__, "count:", len(mods) if hasattr(mods,'__len__') else '?')
