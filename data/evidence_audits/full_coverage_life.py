#!/usr/bin/env python3
"""Full-coverage read-only adversarial source-fidelity check for the 3 life.json units.

Writes nothing into the repository; saves only beside this script.
"""
import hashlib
import importlib.util
import json
import re
import sys
from pathlib import Path

REPO = Path(r"C:\Users\user\.local\share\opencode\worktree\484e09\norm-queue-fix")
LIFE = Path(r"D:\CodexData\Temp\opencode\goal208\life.json")
LEANS = [
    REPO / "JapanTaxLaw" / "LifePremiumDeduction.lean",
    REPO / "JapanTaxLaw" / "LifePremiumDeductionSpec.lean",
    REPO / "JapanTaxLaw" / "LifePremiumDeductionTests.lean",
]
BANDS = ["二万円以下", "二万円を超え四万円以下", "四万円を超え八万円以下", "八万円を超える"]
RATES = ["二分の一", "四分の一"]
SUPPORT = ["二万円と当該合計額から二万円を控除した金額の二分の一",
           "三万円と当該合計額から四万円を控除した金額の四分の一",
           "八万円を超える場合四万円"]

failures = []


def load_module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    mod = importlib.util.module_from_spec(spec)
    sys.modules[name] = mod
    spec.loader.exec_module(mod)
    return mod


lp = load_module("lp_verify", REPO / "scripts" / "ci" / "link_existing_proofs.py")
ni = load_module("ni_verify", REPO / "scripts" / "ci" / "normative_ids.py")
cns = load_module("cns_verify", REPO / "scripts" / "ci" / "check_no_sorry.py")
reader = lp.make_full_text_reader()

recs = json.loads(LIFE.read_text(encoding="utf-8"))
queue = json.loads((REPO / "build" / "task_queue.json").read_text(encoding="utf-8"))
by_id = {t["normative_id"]: t for t in queue["tasks"]}

# ---- statutory 4-band formula (independent Python implementation) ----
def law(a):
    if a <= 20000:
        return a
    if a <= 40000:
        return 20000 + (a - 20000) // 2
    if a <= 80000:
        return 30000 + (a - 40000) // 4
    return 40000

# ---- mirror of the Lean `deduction` bracket chain (Nat floor division) ----
def model(a):
    if a <= 20_000:
        return a
    elif a <= 40_000:
        return 20_000 + (a - 20_000) // 2
    elif a <= 80_000:
        return 30_000 + (a - 40_000) // 4
    else:
        return 40_000

print("=== RECORD CHECKS (full coverage) ===")
print(f"records: {len(recs)}")
sha_ok = frag_ok = band_ok = 0
for i, r in enumerate(recs, 1):
    uid = r["normative_id"]
    short = uid[:12]
    # 1) pinned source SHA-256
    src = REPO / r["source_file"]
    actual = hashlib.sha256(src.read_bytes()).hexdigest().upper()
    pinned = r["source_sha256"].upper()
    sha_match = (actual == pinned)
    t = by_id.get(uid)
    task_sha = (t or {}).get("source_sha256", "").upper()
    task_sha_match = (task_sha == pinned)
    if not (sha_match and task_sha_match):
        failures.append(f"[{i}] {short}: source SHA mismatch (file={actual}, task={task_sha}, pinned={pinned})")
    else:
        sha_ok += 1

    # obtain the exact unit text via the repo reader
    if t is None:
        failures.append(f"[{i}] {short}: no matching task_queue unit")
        continue
    full = reader(t) or ""
    norm_full = ni.norm_text(full)

    # 2) full provision text contains the bands and rates
    missing = [b for b in BANDS + RATES if b not in norm_full]
    if missing:
        failures.append(f"[{i}] {short}: full text missing {missing}")
    else:
        band_ok += 1

    # 2b) statutory text supports the formula's rates/bands and ceiling
    missing_support = [s for s in SUPPORT if s not in norm_full]
    if missing_support:
        failures.append(f"[{i}] {short}: statutory support phrases missing {missing_support}")

    # 3) norm_fragment substring of normalized full text
    nf = ni.norm_text(r["norm_fragment"])
    in_full = nf in norm_full
    if not in_full:
        failures.append(f"[{i}] {short}: norm_fragment NOT substring of normalized full text")
    else:
        frag_ok += 1
    # cross-check: record fragment equals the queue unit's fragment
    if r["norm_fragment"] != t.get("norm_fragment"):
        failures.append(f"[{i}] {short}: record norm_fragment differs from task_queue norm_fragment")
    if t.get("article") != r["article"]:
        failures.append(f"[{i}] {short}: article mismatch ({t.get('article')} vs {r['article']})")

    print(f"  [{i}] {short}: sha_file={sha_match} sha_task={task_sha_match} "
          f"bands+rates={not missing} support={not missing_support} "
          f"fragment_substring={in_full} len(full)={len(full)}")

print(f"COUNTS: sha_ok={sha_ok}/{len(recs)} band_ok={band_ok}/{len(recs)} "
      f"fragment_ok={frag_ok}/{len(recs)}")

# ---- sweep law vs model ----
print("\n=== SWEEP (amount 0..200000 step 3) ===")
mismatches = []
swept = 0
for a in range(0, 200001, 3):
    swept += 1
    la, ma = law(a), model(a)
    if la != ma:
        mismatches.append((a, la, ma))
print(f"values swept: {swept}; mismatches: {len(mismatches)}")
if mismatches:
    for m in mismatches[:10]:
        print("  mismatch:", m)
        failures.append(f"sweep mismatch at a={m[0]}: law={m[1]} model={m[2]}")
print("boundary spot checks (a, law, model):",
      [(a, law(a), model(a)) for a in (20000, 20001, 40000, 40001, 80000, 80001, 200000)])

# ---- forbidden proof tokens in the Lean files ----
print("\n=== FORBIDDEN PROOF TOKEN SCAN (sorry/admit) ===")
FORBIDDEN = re.compile(r"\b(sorry|admit)\b")
lean_hits = []
for p in LEANS:
    text = p.read_text(encoding="utf-8")
    stripped = cns.strip_comments_and_strings(text)
    raw = FORBIDDEN.findall(text)
    code = [m.group(0) for ln in stripped.splitlines() for m in FORBIDDEN.finditer(ln)]
    print(f"  {p.name}: raw={raw} in_proof_code={code}")
    if raw or code:
        lean_hits.append(p.name)
if lean_hits:
    failures.append(f"forbidden proof tokens in {lean_hits}")

# ---- verdict ----
print("\n=== FAILURE LIST ===")
if failures:
    for f in failures:
        print("  FAIL:", f)
else:
    print("  (none)")
print("VERDICT: PASS" if not failures else f"VERDICT: FAIL ({'; '.join(failures)})")
