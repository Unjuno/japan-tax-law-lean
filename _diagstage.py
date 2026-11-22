import subprocess
from pathlib import Path

p = "data/verification_evidence.json"
raw = Path(p).read_text(encoding="utf-8")
print("WORKTREE head:", repr(raw[:200]))
for stage in [":1", ":2", ":3"]:
    try:
        out = subprocess.run(["git", "show", stage + ":" + p], capture_output=True,
                             text=True, encoding="utf-8", errors="replace")
        if out.returncode != 0:
            print("stage", stage, "MISSING")
            continue
        print("stage", stage, "size:", len(out.stdout), "head:", repr(out.stdout[:120]))
    except Exception as e:
        print("stage", stage, "ERR", e)
