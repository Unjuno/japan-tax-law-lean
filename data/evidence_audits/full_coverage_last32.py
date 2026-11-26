#!/usr/bin/env python3
"""Full-coverage (NOT sampled) adversarial source-fidelity check for last32.json.

READ-ONLY with respect to the repository. Script and report live only in
D:\\CodexData\\Temp\\opencode\\goal208\\.

For EVERY one of the 32 PROVED_SCOPE units:
  1. pinned source SHA-256 (INVENTORY.json raw_snapshot) == unit source_sha256
     (cross-checked against task_queue.json and the on-disk raw source bytes);
  2. family-specific phrase check:
       PercentageSurcharge      -> 百分の十五 / 百分の三十五 / 百分の二十 in fragment or full text
       TenthsFractions          -> 十分のNに相当する in fragment, N in {一,二,五,七,九}
       HistoricalSalaryDeduction-> 給与所得控除 and 十分の二 in full text
       DisasterTaxReduction     -> 合計所得金額 and (十分の五 / 十分の二・五 or the three bands)
  3. norm_fragment is a substring of the normalized full text
     (full text reconstructed by scripts/ci/link_existing_proofs.py:make_full_text_reader).

Plus: per-family counts, full failure list (capped at 20), forbidden proof-token
scan of the four family Lean modules, and git-HEAD comparison of their theorems.

Scope: mechanical phrases / SHA / substring only. Surrounding semantic context,
legal correctness and completeness are explicitly out of scope.
"""
from __future__ import annotations

import hashlib
import importlib.util
import json
import re
import subprocess
import sys
from collections import Counter, defaultdict
from pathlib import Path

sys.stdout.reconfigure(encoding="utf-8")

REPO = Path(r"C:\Users\user\.local\share\opencode\worktree\484e09\norm-queue-fix")
TMP = Path(r"D:\CodexData\Temp\opencode\goal208")
TARGET = TMP / "last32.json"
REPORT = TMP / "fullcov_last32_source_fidelity_report.json"
sys.path.insert(0, str(REPO / "scripts" / "ci"))
sys.path.insert(0, str(REPO / "scripts" / "law_audit"))


def load_json(path: Path):
    return json.loads(path.read_text(encoding="utf-8"))


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


lep = load_module("lep_last32_audit", REPO / "scripts" / "ci" / "link_existing_proofs.py")
check_no_sorry = load_module("nosorry_last32_audit", REPO / "scripts" / "ci" / "check_no_sorry.py")

units = load_json(TARGET)
q = load_json(REPO / "build" / "task_queue.json")
tasks = {t["normative_id"]: t for t in q["tasks"]}
inventory = load_json(REPO / "data" / "INVENTORY.json")

# Locate pinned raw snapshots in INVENTORY by law_id (same pin used by task_queue).
pinned: dict[str, dict] = {}


def walk_pins(node):
    if isinstance(node, dict):
        if "law_id" in node and isinstance(node.get("raw_snapshot"), dict):
            snap = node["raw_snapshot"]
            if "source_sha256" in snap:
                pinned.setdefault(node["law_id"], {
                    "sha": str(snap["source_sha256"]).upper(),
                    "source_file": snap.get("source_file", ""),
                })
        for v in node.values():
            walk_pins(v)
    elif isinstance(node, list):
        for v in node:
            walk_pins(v)


walk_pins(inventory)
full_text = lep.make_full_text_reader()

FAMILIES = ("PercentageSurcharge", "TenthsFractions",
            "HistoricalSalaryDeduction", "DisasterTaxReduction")
PCT_RATES = ("百分の十五", "百分の三十五", "百分の二十")
TENTH_RE = re.compile(r"十分の([一二五七九])に相当する")
DIS_BANDS = ("五百万円以下", "七百五十万円以下", "七百五十万円を超える")
DIS_RATES = ("十分の五", "十分の二・五")
WS = re.compile(r"[\s\u3000]+")


def norm(s: str) -> str:
    return WS.sub("", s)


family_totals = Counter(u["family"] for u in units)
unknown_families = sorted(set(family_totals) - set(FAMILIES))
pass_counts = defaultdict(Counter)     # family -> {check: passed}
fail_counts = defaultdict(Counter)     # family -> {check: failed}
failures: list[dict] = []
file_sha_cache: dict[str, str] = {}
seen_ids: set[str] = set()
dup_ids: list[str] = []


def fail(idx, uid, family, check, reason, detail=""):
    failures.append({
        "index": idx, "normative_id": uid, "family": family, "check": check,
        "reason": reason, "detail": str(detail)[:400],
    })
    fail_counts[family][check] += 1


def phrase_result(u, t, txt):
    """Return (ok, matched_summary) for the family-specific phrase check."""
    fam = u["family"]
    frag = u["norm_fragment"]
    if fam == "PercentageSurcharge":
        in_frag = [p for p in PCT_RATES if p in frag]
        in_full = [p for p in PCT_RATES if p in txt]
        matched = sorted(set(in_frag + in_full))
        return bool(matched), "in_fragment=%s in_full=%s" % (in_frag, in_full)
    if fam == "TenthsFractions":
        ns = TENTH_RE.findall(frag)
        return bool(ns), "N_in_fragment=%s" % ns
    if fam == "HistoricalSalaryDeduction":
        a, b = "給与所得控除" in txt, "十分の二" in txt
        return a and b, "給与所得控除=%s 十分の二=%s" % (a, b)
    if fam == "DisasterTaxReduction":
        total = "合計所得金額" in txt
        rates = [p for p in DIS_RATES if p in txt]
        bands = [b for b in DIS_BANDS if b in txt]
        rate_ok = bool(rates) or len(bands) == 3
        return total and rate_ok, ("合計所得金額=%s rates=%s bands=%s" % (total, rates, bands))
    return False, "UNKNOWN_FAMILY"


for idx, u in enumerate(units):
    uid = u["normative_id"]
    fam = u["family"]
    short = uid[:12]
    if uid in seen_ids:
        dup_ids.append(short)
    seen_ids.add(uid)
    t = tasks.get(uid)

    # ---- hydration sanity: unit fields must agree with the queued task ----
    hydrated_ok = bool(t) and (
        t.get("source_file") == u.get("source_file")
        and str(t.get("source_sha256", "")).upper() == str(u.get("source_sha256", "")).upper()
        and t.get("norm_fragment") == u.get("norm_fragment")
        and t.get("article") == u.get("article")
        and t.get("law_id") == u.get("law_id")
    )
    if not hydrated_ok:
        fail(idx, uid, fam, 1, "unit fields disagree with build/task_queue.json or id absent")

    # ---- check 1: pinned source SHA-256 == source_sha256 ----
    sf = u["source_file"]
    if sf not in file_sha_cache:
        p = REPO / sf
        file_sha_cache[sf] = (
            hashlib.sha256(p.read_bytes()).hexdigest().upper() if p.exists() else "MISSING_FILE"
        )
    pin = pinned.get(u["law_id"])
    pin_sha = pin["sha"] if pin else "NO_PIN"
    unit_sha = str(u["source_sha256"]).upper()
    task_sha = str(t.get("source_sha256", "")).upper() if t else "NO_TASK"
    file_sha = file_sha_cache[sf]
    if not hydrated_ok:
        pass  # already recorded as a check-1 failure
    elif not (pin_sha == unit_sha == task_sha == file_sha):
        fail(idx, uid, fam, 1,
             "SHA mismatch: pinned=%s unit=%s task=%s file=%s" % (pin_sha, unit_sha, task_sha, file_sha))
    elif pin and pin["source_file"] and pin["source_file"] != sf:
        fail(idx, uid, fam, 1, "pinned source_file mismatch: %s != %s" % (pin["source_file"], sf))
    else:
        pass_counts[fam][1] += 1

    txt = full_text(t) if t else ""

    # ---- check 2: family-specific phrase check ----
    ok2, summary2 = phrase_result(u, t, txt)
    if ok2:
        pass_counts[fam][2] += 1
    else:
        fail(idx, uid, fam, 2, "family phrase check failed: " + summary2, txt)

    # ---- check 3: norm_fragment substring of normalized full text ----
    frag_n, txt_n = norm(u["norm_fragment"]), norm(txt)
    direct, normalized = (u["norm_fragment"] in txt), (frag_n in txt_n)
    if normalized:
        pass_counts[fam][3] += 1
    else:
        fail(idx, uid, fam, 3,
             "norm_fragment not a substring of normalized full text (direct=%s)" % direct,
             "fragment=%s || text=%s" % (u["norm_fragment"], txt))

# ---- forbidden proof tokens in the four family Lean modules ----
FORBIDDEN = ("sorry", "admit", "axiom", "Classical.choice")
token_findings: list[dict] = []
lean_files = []
for fam in FAMILIES:
    lean_files.extend(sorted((REPO / "JapanTaxLaw").glob(fam + "*.lean")))
for p in lean_files:
    code = check_no_sorry.strip_comments_and_strings(p.read_text(encoding="utf-8"))
    for token in FORBIDDEN:
        for m in re.finditer(r"\b" + re.escape(token) + r"\b", code):
            lineno = code.count("\n", 0, m.start()) + 1
            token_findings.append({"file": p.name, "line": lineno, "token": token})


def git(*args: str) -> subprocess.CompletedProcess:
    return subprocess.run(["git", *args], cwd=REPO, capture_output=True)


def theorem_blocks(text: str) -> list[str]:
    return [m.group(0).strip() for m in re.finditer(
        r"theorem\s+\w+[\s\S]*?(?=\n(?:theorem|def|end)\b|\Z)", text)]


head_checks: list[dict] = []
for p in lean_files:
    rel = p.relative_to(REPO).as_posix()
    hs = git("show", "HEAD:" + rel)
    head_text = hs.stdout.decode("utf-8", errors="replace") if hs.returncode == 0 else None
    work_text = p.read_text(encoding="utf-8")
    df = git("diff", "--exit-code", "HEAD", "--", rel)
    head_checks.append({
        "file": rel,
        "git_show_ok": hs.returncode == 0,
        "byte_identical_to_head": head_text == work_text,
        "git_diff_clean": df.returncode == 0,
        "theorems": re.findall(r"^theorem\s+(\w+)", work_text, flags=re.M),
        "theorems_identical_to_head": (
            theorem_blocks(head_text) == theorem_blocks(work_text)
            if head_text is not None else False),
    })

n = len(units)
all_checks_ok = all(pass_counts[f][c] == family_totals[f]
                    for f in FAMILIES for c in (1, 2, 3)) and not failures
lean_ok = not token_findings and all(
    h["git_show_ok"] and h["byte_identical_to_head"] and h["git_diff_clean"]
    and h["theorems_identical_to_head"] for h in head_checks)
verdict_ok = all_checks_ok and lean_ok and n == 32 and not dup_ids and not unknown_families

per_family = {}
for f in FAMILIES:
    per_family[f] = {
        "units": family_totals[f],
        "passed": {str(c): pass_counts[f][c] for c in (1, 2, 3)},
        "failed": {str(c): fail_counts[f][c] for c in (1, 2, 3)},
        "all_pass": pass_counts[f][1] == pass_counts[f][2] == pass_counts[f][3] == family_totals[f],
    }

report = {
    "scope": "FULL_COVERAGE_MECHANICAL_SOURCE_FIDELITY_NO_SAMPLING",
    "units_total": n,
    "family_totals": dict(family_totals),
    "unknown_families": unknown_families,
    "duplicate_ids": dup_ids,
    "per_family": per_family,
    "pass_counts_total": {str(c): sum(pass_counts[f][c] for f in FAMILIES) for c in (1, 2, 3)},
    "failure_counts_total": {str(c): sum(fail_counts[f][c] for f in FAMILIES) for c in (1, 2, 3)},
    "failures_total": len(failures),
    "failures": failures[:20],
    "forbidden_tokens": token_findings,
    "lean_family_files_scanned": len(lean_files),
    "git_head": head_checks,
    "verdict": "PASS" if verdict_ok else "FAIL",
}
REPORT.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")

print("=== FULL-COVERAGE SOURCE-FIDELITY AUDIT: last32.json (32 units, no sampling) ===")
print("family totals:", dict(family_totals))
for f in FAMILIES:
    pf = per_family[f]
    print("  %-26s units=%d checks{pass}=%s {fail}=%s all_pass=%s" % (
        f, pf["units"], pf["passed"], pf["failed"], pf["all_pass"]))
print("total pass:", report["pass_counts_total"], "total fail:", report["failure_counts_total"])
print("failures (max 20):")
for x in failures[:20]:
    print("  FAIL #%d %s %s check%d: %s" % (x["index"], x["normative_id"][:12], x["family"],
                                             x["check"], x["reason"]))
if not failures:
    print("  NONE")
print("forbidden proof tokens:", token_findings or "NONE")
print("git HEAD (lean family files):")
for h in head_checks:
    print("  %-40s show=%s bytes_eq=%s diff_clean=%s theorems_eq=%s theorems=%s" % (
        h["file"], h["git_show_ok"], h["byte_identical_to_head"], h["git_diff_clean"],
        h["theorems_identical_to_head"], h["theorems"]))
print("report:", REPORT)
print("VERDICT: " + report["verdict"])
