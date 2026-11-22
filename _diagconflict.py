import subprocess, json
from pathlib import Path

p = "data/verification_evidence.json"
for label, args in [
    ("WORKTREE", None),
    ("INDEX(:0)", ["git", "show", ":" + p]),
    ("ORIGIN/MAIN", ["git", "show", "origin/main:" + p]),
    ("MY_HEAD", ["git", "show", "HEAD:" + p]),
]:
    if args is None:
        raw = Path(p).read_text(encoding="utf-8")
    else:
        out = subprocess.run(args, capture_output=True, text=True, encoding="utf-8", errors="replace")
        raw = out.stdout if out.returncode == 0 else ""
    print("===", label, "size:", len(raw),
          "markers:", raw.count("<<<<<<<"), raw.count("======="), raw.count(">>>>>>>"))
    print("  head:", repr(raw[:90]))
    try:
        d = json.loads(raw)
        print("  VALID units:", len(d.get("units", {})))
    except Exception as e:
        print("  INVALID:", str(e)[:80])
