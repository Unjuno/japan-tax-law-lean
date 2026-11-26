# -*- coding: utf-8 -*-
"""
Full-coverage (NOT sampled) mechanical source-fidelity review of the 93
TariffSpecificFloor units in tariff.json, plus a read-only Lean scan.
Read-only with respect to the repository; all artifacts stay in goal208.
"""
import json, os, io, re, hashlib, subprocess, sys

REPO   = r"C:\Users\user\.local\share\opencode\worktree\484e09\norm-queue-fix"
GOAL   = r"D:\CodexData\Temp\opencode\goal208"
TARIFF = os.path.join(GOAL, "tariff.json")
REPORT = os.path.join(GOAL, "audit_report.txt")

LEANS = [
    os.path.join(REPO, "JapanTaxLaw", "TariffSpecificFloor.lean"),
    os.path.join(REPO, "JapanTaxLaw", "TariffSpecificFloorSpec.lean"),
    os.path.join(REPO, "JapanTaxLaw", "TariffSpecificFloorTests.lean"),
]
SPEC_REL = "JapanTaxLaw/TariffSpecificFloorSpec.lean"
SPEC     = os.path.join(REPO, *SPEC_REL.split("/"))

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

L = []
def P(s=""):
    L.append(str(s))

WS = re.compile(r"[\s\u3000\u00a0]+")
def norm(s):
    return WS.sub("", s)

# ----------------------------------------------------------------------------
# Independent kanji -> number parser (no reliance on stored values)
# ----------------------------------------------------------------------------
KDIG = {"〇": 0, "零": 0, "一": 1, "壱": 1, "二": 2, "弐": 2, "三": 3, "参": 3,
        "四": 4, "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
KMULT = {"十": 10, "百": 100, "千": 1000, "万": 10000}

def parse_kanji_int(s):
    """Parse positional digit kanji (六〇 -> 60) and multiplier kanji (六百五 -> 605)."""
    if not s:
        raise ValueError("empty kanji integer")
    if all(c in KDIG for c in s):                     # positional form, 〇 = zero placeholder
        return int("".join(str(KDIG[c]) for c in s))
    total = section = 0
    lastd = None
    for c in s:
        if c in KDIG:
            lastd = KDIG[c]
        elif c in KMULT:
            m = KMULT[c]
            if lastd is None:
                section += m
            else:
                section += lastd * m
                lastd = None
            if m == 10000:
                total += section
                section = 0
        else:
            raise ValueError("unexpected kanji char %r" % c)
    return total + section + (lastd or 0)

def parse_rate_fraction(s):
    """Parse a kanji percentage into (num, den); ・ is a decimal point, base den 100."""
    parts = s.split("・")
    if len(parts) == 1:
        return parse_kanji_int(parts[0]), 100
    if len(parts) == 2:
        whole = parse_kanji_int(parts[0])
        frac = parts[1]
        if any(c not in KDIG for c in frac):
            raise ValueError("bad fractional kanji %r" % frac)
        fdigits = "".join(str(KDIG[c]) for c in frac)
        return int(str(whole) + fdigits), 100 * (10 ** len(fdigits))
    raise ValueError("too many ・ separators in %r" % s)

# ----------------------------------------------------------------------------
# Source loading / caching (text leaves only: skip tag/attr metadata strings)
# ----------------------------------------------------------------------------
src_cache = {}
def load_source(rel):
    if rel in src_cache:
        return src_cache[rel]
    path = os.path.join(REPO, rel.replace("/", os.sep))
    raw = open(path, "rb").read()
    sha = hashlib.sha256(raw).hexdigest().upper()
    obj = json.loads(raw.decode("utf-8"))
    leaves = []
    SKIP = {"tag", "attr"}
    def rec(o):
        if isinstance(o, dict):
            for k, v in o.items():
                if k in SKIP:
                    continue
                rec(v)
        elif isinstance(o, list):
            for v in o:
                rec(v)
        elif isinstance(o, str):
            leaves.append(o)
    rec(obj)
    full_n = norm("".join(leaves))          # whitespace-normalized source text
    src_cache[rel] = (sha, full_n)
    return sha, full_n

# ----------------------------------------------------------------------------
# Load records
# ----------------------------------------------------------------------------
with open(TARIFF, encoding="utf-8") as f:
    data = json.load(f)
N = len(data)
P("TariffSpecificFloor unit records: %d (full coverage: every record examined)" % N)

CHECK_KEYS = ["sha256", "phrase", "parse", "norm_rate"]
counts   = {k: 0 for k in CHECK_KEYS}
subcounts = {"fragment_in_source": 0, "token": 0, "floor_yen": 0, "rate_percent": 0}
fails    = {k: [] for k in CHECK_KEYS}

for i, r in enumerate(data):
    rid = r.get("normative_id", "")[:12]
    sha, full_n = load_source(r["source_file"])

    # 1. pinned source bytes SHA-256
    ok1 = (sha == str(r["source_sha256"]).upper())
    counts["sha256"] += ok1
    if not ok1:
        fails["sha256"].append((i, rid, "computed=" + sha, "stored=" + str(r["source_sha256"])))

    # 2. whitespace-normalized Japanese tariff phrase presence in pinned source
    frag = norm(r["norm_fragment"])                  # the whole unit phrase
    tok  = norm(r["token"])                          # 一キログラムにつき
    yen  = norm(str(r["floor_kanji"]) + "円")         # the 円 amount
    pct  = norm(str(r["rate_kanji"]) + "％")          # ad-valorem percentage, e.g. 二・八％ / 二五％
    parts = {
        "fragment_in_source": frag in full_n,
        "token":              tok in full_n,
        "floor_yen":          yen in full_n,
        "rate_percent":       pct in full_n,
    }
    ok2 = all(parts.values())
    counts["phrase"] += ok2
    for k, v in parts.items():
        subcounts[k] += v
    if not ok2:
        fails["phrase"].append((i, rid, parts, frag[:60]))

    # 3. independent re-parse of rate_kanji -> fraction and floor_kanji -> yen
    try:
        num, den = parse_rate_fraction(str(r["rate_kanji"]))
        yen_val  = parse_kanji_int(str(r["floor_kanji"]))
        ok3 = (num == r["rate_num"] and den == r["rate_den"] and yen_val == r["floor"])
        detail = ("parsed=(%d/%d, %d)" % (num, den, yen_val),
                  "stored=(%d/%d, %d)" % (r["rate_num"], r["rate_den"], r["floor"]))
    except Exception as ex:
        ok3 = False
        detail = ("parser error: %s" % ex, "")
    counts["parse"] += ok3
    if not ok3:
        fails["parse"].append((i, rid, str(r["rate_kanji"]), str(r["floor_kanji"]), detail[0], detail[1]))

    # 4. norm_fragment contains the rate_kanji
    ok4 = str(r["rate_kanji"]) in str(r["norm_fragment"])
    counts["norm_rate"] += ok4
    if not ok4:
        fails["norm_rate"].append((i, rid, r["rate_kanji"], r["norm_fragment"][:60]))

# ----------------------------------------------------------------------------
# Counts and (capped) failure lists
# ----------------------------------------------------------------------------
P("")
P("PER-CHECK COUNTS (pass / total):")
for k in CHECK_KEYS:
    P("  %-12s %d / %d" % (k, counts[k], N))
P("  phrase sub-checks (pass / total):")
for k in subcounts:
    P("    %-20s %d / %d" % (k, subcounts[k], N))
P("")
P("FAILURE LISTS (max 20 shown per check; full count reported):")
for k in CHECK_KEYS:
    fl = fails[k]
    P("  [%s] total failures: %d" % (k, len(fl)))
    for entry in fl[:20]:
        P("    " + repr(entry))
    if len(fl) > 20:
        P("    ... %d more (truncated to 20)" % (len(fl) - 20))

# ----------------------------------------------------------------------------
# Lean scan: forbidden proof tokens
# ----------------------------------------------------------------------------
FORBIDDEN = ["sorry", "sorryAx", "admit", "axiom", "unsafe", "unimplemented",
             "False.elim", "nomatch", "arbitrary", "native_decide", "propext",
             "Classical.choice", "trust", "by_contra", "by_cases!"]
lean_findings = []
for path in LEANS:
    text = open(path, encoding="utf-8").read()
    for tok in FORBIDDEN:
        pat = re.compile(r"(?<![A-Za-z0-9_])" + re.escape(tok) + r"(?![A-Za-z0-9_])")
        for m in pat.finditer(text):
            line = text.count("\n", 0, m.start()) + 1
            lean_findings.append((os.path.basename(path), line, tok))

P("")
P("LEAN SCAN — forbidden proof tokens: %s" % ", ".join(FORBIDDEN))
P("  files scanned: %s" % ", ".join(os.path.basename(p) for p in LEANS))
P("  forbidden-token hits: %d" % len(lean_findings))
for h in lean_findings[:20]:
    P("    " + repr(h))

# ----------------------------------------------------------------------------
# Universal theorem tariffDuty_agrees unchanged
# ----------------------------------------------------------------------------
CANON = ("theorem tariffDuty_agrees (price kg num den floor : Nat) (hd : 0 < den) :\n"
         "    tariffDuty price kg num den floor = specTariffDuty price kg num den floor := by\n")
spec_text = open(SPEC, encoding="utf-8").read().replace("\r\n", "\n")
canon_ok = CANON in spec_text
decl_count = spec_text.count("theorem tariffDuty_agrees")
head = subprocess.run(["git", "-C", REPO, "show", "HEAD:" + SPEC_REL],
                      stdout=subprocess.PIPE, stderr=subprocess.PIPE)
head_text = head.stdout.decode("utf-8", "replace").replace("\r\n", "\n") if head.returncode == 0 else None
unchanged = (head_text is not None and head_text == spec_text)
theo_ok = canon_ok and decl_count == 1 and unchanged
P("")
P("UNIVERSAL THEOREM tariffDuty_agrees:")
P("  canonical universal header present: %s" % canon_ok)
P("  declaration count: %d" % decl_count)
P("  Spec file byte-identical to git HEAD (unchanged): %s" % unchanged)
P("  theorem check overall: %s" % theo_ok)

# ----------------------------------------------------------------------------
# Verdict
# ----------------------------------------------------------------------------
all_ok = all(counts[k] == N for k in CHECK_KEYS) and not lean_findings and theo_ok
P("")
P("This is a FULL-COVERAGE mechanical source-fidelity review (not sampled), scoped to")
P("the exact rate phrase and SHA/parse checks; semantic context beyond that phrase")
P("is out of scope. No legal advice; no completeness claim.")
if all_ok:
    verdict = "VERDICT: PASS"
else:
    reasons = []
    for k in CHECK_KEYS:
        if counts[k] != N:
            reasons.append("%s %d/%d" % (k, counts[k], N))
    if lean_findings:
        reasons.append("forbidden tokens=%d" % len(lean_findings))
    if not theo_ok:
        reasons.append("theorem not unchanged/universal")
    verdict = "VERDICT: FAIL (" + "; ".join(reasons) + ")"
P(verdict)

with io.open(REPORT, "w", encoding="utf-8") as f:
    f.write("\n".join(L) + "\n")
for line in L:
    print(line)
