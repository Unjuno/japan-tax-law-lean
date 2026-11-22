import json, subprocess
from pathlib import Path

def show(ref):
    out = subprocess.run(["git", "show", ref], capture_output=True, text=True,
                         encoding="utf-8", errors="replace")
    return out.stdout if out.returncode == 0 else ""

uid = "NORM|35c971a0758598e57593706d43c4732904e25dab80fb92770430a30ab0f83d3f"
p = Path("scripts/ci/transcription_audit.py")
worktree = p.read_text(encoding="utf-8")
mainv = show("origin/main:scripts/ci/transcription_audit.py")

q = json.loads(Path("build/task_queue.json").read_text(encoding="utf-8"))
needle = next(x for x in q["tasks"] if x.get("normative_id") == uid)["text"]
nl = json.dumps(needle, ensure_ascii=True)

# Take main's NEWER version (382 checks) as base; add my unit's check if missing.
import re
if "<<<<<<<" in mainv:
    pat = re.compile(r"^<<<<<<< HEAD[^\n]*\n(.*?)^=======[^\n]*\n(.*?)^>>>>>>>[^\n]*\n?", re.S | re.M)
    m = pat.search(mainv)
    mainv = pat.sub(lambda m: m.group(1) if nl in m.group(1) else m.group(2), mainv)
assert nl in mainv or nl in worktree, "needle unexpectedly absent from both sides"

base = mainv if mainv.count("yield (") >= worktree.count("yield (") else worktree
if nl not in base:
    anchor = "# CustomsTariffArt14UnconditionalExemption.lean"
    idx = base.index(anchor)
    pos = idx
    while pos > 0 and base[pos-1] != "\n":
        pos -= 1
    block = ("    # CustomsTariffArt17Delegation.lean - NORM|35c971a0... (para1 processing-goods DELEGATION, law 143AC0000000054)\n"
             "    # Needle is in MainProvision Article 第十七条 (Paragraph 1, Item 1);\n"
             "    # find_article_text(...,\"第十七条\") returns that article (len 1032) with needle -\n"
             "    # use the precise article locator. Needle literal from queue via \\u escapes.\n"
             "    yield (\"customs tariff art.17 delegation - CustomsTariffArt17Delegation.lean\",\n"
             "           \"143AC0000000054\",\n"
             "           \"article\", \"第十七条\",\n"
             "           [" + nl + "])\n\n")
    base = base[:pos] + block + base[pos:]

p.write_text(base, encoding="utf-8")
print("audit checks now:", base.count("yield ("), "markers:", base.count("<<<<<<<"),
      "my needle present:", nl in base)
