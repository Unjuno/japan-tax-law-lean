import json, re, subprocess
from pathlib import Path

# 1) Compare audit file HEAD vs current worktree for registered checks
def show(ref):
    out = subprocess.run(["git", "show", ref], capture_output=True, text=True,
                         encoding="utf-8", errors="replace")
    return out.stdout if out.returncode == 0 else ""

cur = Path("scripts/ci/transcription_audit.py").read_text(encoding="utf-8")
head = show("HEAD:scripts/ci/transcription_audit.py")
mainv = show("origin/main:scripts/ci/transcription_audit.py")
for label, s in [("WORKTREE", cur), ("HEAD", head), ("MAIN", mainv)]:
    yields = re.findall(r'yield \(\s*"([^"]+)"', s)
    print(label, "yield checks:", len(yields), "markers:", s.count("<<<<<<<"), s.count("======="), s.count(">>>>>>>"))

# marker detail if any
if cur.count("<<<<<<<"):
    for i, l in enumerate(cur.splitlines(), 1):
        if "<<<<<<<" in l or "=======" in l or ">>>>>>>" in l:
            print("MARKER line", i, repr(l[:80]))

# 2) registry
regp = Path("data/TRANSCRIPTION_CHECK_REGISTRY.json")
if regp.exists():
    reg = json.loads(regp.read_text(encoding="utf-8"))
    print("registry keys:", list(reg.keys())[:8])
    s = json.dumps(reg, ensure_ascii=True)
    print("registry size:", len(s))

# 3) broken evidence refs - replicate invariant logic
src = show("HEAD:scripts/ci/verify_queue_invariants.py")
print("=== invariant file present, searching 'evidence refs resolve' ===")
for i, l in enumerate(src.splitlines(), 1):
    if "resolve" in l.lower() and "evidence" in l.lower():
        print("HEAD line", i, l.strip()[:120])
