import hashlib, subprocess
from pathlib import Path

def show(ref):
    out = subprocess.run(["git", "show", ref], capture_output=True, text=True,
                         encoding="utf-8", errors="replace")
    return out.stdout if out.returncode == 0 else None

def h(b):
    if isinstance(b, str): b = b.encode("utf-8")
    return hashlib.sha256(b.replace(b"\r\n", b"\n")).hexdigest()[:16]

for f in ["JapanTaxLaw/GiftTax.lean", "JapanTaxLaw/GiftTaxSpec.lean", "JapanTaxLaw/GiftTaxTests.lean"]:
    wt = h(Path(f).read_bytes())
    om = show("origin/main:" + f)
    hd = show("HEAD:" + f)
    print(f)
    print("  worktree:", wt)
    print("  origin/main:", h(om) if om is not None else "MISSING")
    print("  HEAD:", h(hd) if hd is not None else "MISSING")
