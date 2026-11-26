#!/usr/bin/env python3
"""FULL-COVERAGE mechanical source-fidelity review of the 47 PROVED_SCOPE units.

READ-ONLY with respect to the repository: reads the pinned source JSON bytes,
the task queue projection, and the family Lean files; never writes into REPO.
All output is written only under D:/CodexData/Temp/opencode/goal208/.
"""
from __future__ import annotations

import hashlib
import importlib.util
import json
import os
import re
import subprocess
import sys
from collections import Counter, OrderedDict
from pathlib import Path

OUTDIR = Path(r"D:\CodexData\Temp\opencode\goal208")
REPO = Path(r"C:\Users\user\.local\share\opencode\worktree\484e09\norm-queue-fix")
SMALL = OUTDIR / "smallfams.json"
QUEUE = REPO / "build" / "task_queue.json"
LINKER = REPO / "scripts" / "ci" / "link_existing_proofs.py"
CHECK_NO_SORRY = REPO / "scripts" / "ci" / "check_no_sorry.py"

FAMILIES = [
    "MonthProration",
    "ProgressiveSurchargeBrackets",
    "DecimalPercentRates",
    "FractionRates110",
    "CeilRoundingMinimum",
]

# ---------------------------------------------------------------- helpers
def load_module(path: Path, name: str):
    spec = importlib.util.spec_from_file_location(name, str(path))
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


linker = load_module(LINKER, "pl_link_existing_proofs")
nosorry = load_module(CHECK_NO_SORRY, "pl_check_no_sorry")
make_full_text_reader = linker.make_full_text_reader

records = json.loads(SMALL.read_text(encoding="utf-8"))
q = json.loads(QUEUE.read_text(encoding="utf-8"))
tasks = q["tasks"] if isinstance(q, dict) else q
by_id = {t["normative_id"]: t for t in tasks}

MONTH_DEN = ("十二", "二十四", "三十六", "四十八", "六十", "百八十")
MONTH_RE = re.compile(r"月数を乗じてこれを(" + "|".join(MONTH_DEN) + r")で除して")
DEC_PCT_RE = re.compile(r"百分の([一二三四五六七八九十百]+)・([一二三四五六七八九十百]+)")
DEC_KNOWN = {"一・三五", "四十・八五", "四十四・六五", "六・二四", "一・四"}
# forbidden proof tokens: union of check_no_sorry.py and lean_kernel_audit.py
FORBIDDEN_RE = re.compile(r"\b(sorry|admit|axiom)\b|Classical\.choice")


def family_phrase_check(fam: str, frag: str, full: str):
    """Return (passed: bool, detail: str) for the family-specific phrase check."""
    if fam == "MonthProration":
        m = MONTH_RE.search(frag)
        return (bool(m), f"month-denominator={m.group(1) if m else None}")
    if fam == "ProgressiveSurchargeBrackets":
        parts = {
            "五十万円": "五十万円" in frag,
            "百分の十五": "百分の十五" in frag,
            "三百万円": "三百万円" in frag,
            "二十/三十": ("百分の二十" in frag or "百分の三十" in frag),
        }
        return (all(parts.values()), json.dumps(parts, ensure_ascii=False))
    if fam == "DecimalPercentRates":
        toks = [a + "・" + b for a, b in DEC_PCT_RE.findall(frag)]
        known = [t for t in toks if t in DEC_KNOWN]
        # pass if any decimal-percent token is present (known-list reported too)
        return (bool(toks), f"decimal-tokens={toks}; known={known}")
    if fam == "FractionRates110":
        return ("百十分の百" in frag, "百十分の百")
    if fam == "CeilRoundingMinimum":
        has_frac = "円未満の端数" in full
        has_ceil = ("切り上げ" in full or "切上げ" in full)
        return (has_frac and has_ceil,
                json.dumps({"in_full_text": True, "円未満の端数": has_frac,
                            "切り上げ/切上げ": has_ceil}, ensure_ascii=False))
    return (False, f"UNKNOWN FAMILY {fam}")


def sha256_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest().upper()


# ---------------------------------------------------------------- per-record audit
full_text = make_full_text_reader()
failures: list[dict] = []
per_family_checks = OrderedDict(
    (f, Counter({"sha": 0, "phrase": 0, "substring": 0, "all": 0, "total": 0}))
    for f in FAMILIES
)
record_results = []

if len(records) != 47:
    failures.append({"kind": "SETUP", "detail": f"expected 47 records, got {len(records)}"})

for idx, rec in enumerate(records):
    uid = rec["normative_id"]
    fam = rec["family"]
    frag = rec["norm_fragment"]
    sf = rec["source_file"]
    pinned = rec["source_sha256"]
    counter = per_family_checks.setdefault(fam, Counter())
    counter["total"] += 1

    # 1) pinned source SHA-256
    spath = REPO / sf
    if not spath.exists():
        sha_ok, actual, qsha = False, "<MISSING>", None
    else:
        actual = sha256_file(spath)
        task = by_id.get(uid, {})
        qsha = task.get("source_sha256")
        sha_ok = (actual == pinned.upper()) and (qsha is None or qsha.upper() == pinned.upper())
    if sha_ok:
        counter["sha"] += 1

    # full provision text (used for CeilRoundingMinimum phrase + substring check)
    task = by_id.get(uid)
    if task is None:
        full = ""
        task_note = "NO TASK IN QUEUE"
    else:
        full = full_text(task)
        task_note = ""
    if not full:
        failures.append({"kind": "NO_FULL_TEXT", "uid": uid, "family": fam,
                         "article": rec.get("article"), "detail": task_note})

    # 2) family phrase check
    phr_ok, phr_detail = family_phrase_check(fam, frag, full)
    if phr_ok:
        counter["phrase"] += 1

    # 3) norm_fragment substring of normalized full text
    sub_ok = bool(full) and frag in full
    if sub_ok:
        counter["substring"] += 1

    if sha_ok and phr_ok and sub_ok:
        counter["all"] += 1

    if not (sha_ok and phr_ok and sub_ok):
        failures.append({
            "kind": "RECORD", "uid": uid, "family": fam, "article": rec.get("article"),
            "sha_ok": sha_ok, "actual_sha": actual, "pinned_sha": pinned,
            "queue_sha": qsha, "phrase_ok": phr_ok, "phrase_detail": phr_detail,
            "substring_ok": sub_ok, "frag_len": len(frag), "full_len": len(full),
            "frag_head": frag[:40], "full_head": full[:40],
        })

    record_results.append({
        "uid": uid, "family": fam, "article": rec.get("article"),
        "sha_ok": sha_ok, "actual_sha": actual,
        "phrase_ok": phr_ok, "phrase_detail": phr_detail,
        "substring_ok": sub_ok,
        "frag_len": len(frag), "full_len": len(full),
        "frag_is_proper_substring": sub_ok and len(frag) < len(full),
        "full_text_head": full[:24],
    })

# ---------------------------------------------------------------- Lean family scan
fam_files = []
for fam in FAMILIES:
    for suffix in ("", "Spec", "Tests"):
        rel = f"JapanTaxLaw/{fam}{suffix}.lean"
        p = REPO / rel
        if p.exists():
            fam_files.append(rel)

lean_findings = []
for rel in fam_files:
    text = (REPO / rel).read_text(encoding="utf-8")
    stripped = nosorry.strip_comments_and_strings(text)
    for lineno, line in enumerate(stripped.splitlines(), start=1):
        for m in FORBIDDEN_RE.finditer(line):
            lean_findings.append({"file": rel, "line": lineno, "token": m.group(0)})

# ---------------------------------------------------------------- universal theorems vs HEAD
THEOREM_RE = re.compile(r"^[ \t]*(?:theorem|lemma)\s+([A-Za-z_][A-Za-z0-9_']*)[\s\S]*?(?::=|$)", re.M)


def universal_signatures(text: str):
    """Extract universal theorem declarations (name + full statement before `:=`)."""
    out = []
    for m in THEOREM_RE.finditer(text):
        block = m.group(0)
        sig = block.split(":=", 1)[0]
        sig = re.sub(r"\s+", " ", sig).strip()
        # universal = has an explicitly typed binder or an explicit forall
        if re.search(r"\([^)]*:[^)]*\)", sig) or "∀" in sig:
            out.append((m.group(1), sig))
    return out


theorem_report = []
for rel in fam_files:
    cur_bytes = (REPO / rel).read_bytes()
    g = subprocess.run(["git", "show", f"HEAD:{rel}"], cwd=str(REPO),
                       capture_output=True)
    if g.returncode != 0:
        theorem_report.append({"file": rel, "head_exists": False,
                               "byte_identical": False, "universal_theorems": []})
        continue
    head_text = g.stdout.decode("utf-8")
    cur_text = cur_bytes.decode("utf-8")
    cur_u = universal_signatures(cur_text)
    head_u = universal_signatures(head_text)
    theorem_report.append({
        "file": rel,
        "head_exists": True,
        "byte_identical": cur_bytes == g.stdout,
        "cur_universal_count": len(cur_u),
        "head_universal_count": len(head_u),
        "universal_signatures_equal": cur_u == head_u,
        "universal_theorems": [name for name, _ in cur_u],
        "changed_signatures": [
            {"cur": c, "head": h}
            for c, h in zip(cur_u, head_u) if c != h
        ] if len(cur_u) == len(head_u) else "COUNT_MISMATCH",
    })

theorem_ok = all(
    (not r["head_exists"]) or
    (r["byte_identical"] and r["universal_signatures_equal"])
    for r in theorem_report
)
lean_ok = not lean_findings

# ---------------------------------------------------------------- report
report = OrderedDict()
report["record_count"] = len(records)
report["per_family_checks"] = {f: dict(c) for f, c in per_family_checks.items()}
report["totals"] = {
    "sha": sum(c["sha"] for c in per_family_checks.values()),
    "phrase": sum(c["phrase"] for c in per_family_checks.values()),
    "substring": sum(c["substring"] for c in per_family_checks.values()),
    "all": sum(c["all"] for c in per_family_checks.values()),
    "total_records": len(records),
}
report["failure_count"] = len(failures)
report["failures_first_20"] = failures[:20]
report["record_results"] = record_results
report["proper_substring_count"] = sum(
    1 for r in record_results if r["frag_is_proper_substring"])
report["lean_family_files_scanned"] = fam_files
report["forbidden_token_pattern"] = FORBIDDEN_RE.pattern
report["lean_forbidden_findings"] = lean_findings
report["lean_forbidden_ok"] = lean_ok
report["universal_theorem_report"] = theorem_report
report["universal_theorems_unchanged"] = theorem_ok

out_path = OUTDIR / "verify_smallfams_report.json"
out_path.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")

all_pass = (len(records) == 47
            and report["totals"]["all"] == 47
            and lean_ok and theorem_ok)
report["ALL_PASS"] = all_pass
out_path.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")

# concise console summary (ASCII only to avoid console mojibake)
print("records:", len(records))
for f, c in per_family_checks.items():
    print(f"  {f}: total={c['total']} sha={c['sha']} phrase={c['phrase']} "
          f"substring={c['substring']} all={c['all']}")
print("totals:", dict(report["totals"]))
print("failures:", len(failures))
print("lean_forbidden_findings:", len(lean_findings), "ok:", lean_ok)
print("universal_theorems_unchanged:", theorem_ok)
print("ALL_PASS:", all_pass)
print("report:", out_path)
sys.exit(0 if all_pass else 1)
