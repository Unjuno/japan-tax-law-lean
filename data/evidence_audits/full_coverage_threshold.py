#!/usr/bin/env python3
"""Full-coverage, read-only adversarial source-fidelity check (2 pinned units).

Targets:
  spouseDeduction  normative_id prefix e1ff699c49a9
  longTermDeduction normative_id prefix eb30477c44d8
Model: JapanTaxLaw/ThresholdDeductions*.lean

Checks performed for EACH matching record:
  1. SHA-256 of the pinned source file bytes == record['source_sha256'].
  2. Full provision text from scripts/ci/link_existing_proofs.py::make_full_text_reader
     contains every expected amount/threshold needle for that unit.
  3. record['norm_fragment'] is a substring of that normalized full text.

Additionally:
  4. Independent arithmetic sweep of the pinned reference table vs the Lean model
     whose constants/structure are parsed out of ThresholdDeductions.lean.
  5. Scan of Lean files for forbidden proof tokens (repo's authoritative set).

This script writes only to D:\\CodexData\\Temp\\opencode\\goal208\\ and never modifies
the repository. It makes no legal-advice or completeness claim.
"""
from __future__ import annotations

import hashlib
import importlib.util
import json
import re
import sys
from pathlib import Path

REPO = Path(r"C:\Users\user\.local\share\opencode\worktree\484e09\norm-queue-fix")
OUTDIR = Path(r"D:\CodexData\Temp\opencode\goal208")
REPORT = OUTDIR / "source_fidelity_report.txt"

PREFIXES = {
    "e1ff699c49a9": "spouseDeduction",
    "eb30477c44d8": "longTermDeduction",
}

SPOUSE_NEEDLES = [
    "三十八万円",    # 三十八万円
    "四十八万円",    # 四十八万円
    "二十六万円",    # 二十六万円
    "三十二万円",    # 三十二万円
    "十三万円",      # 十三万円
    "十六万円",      # 十六万円
    "九百万円",      # 九百万円
    "九百五十万円",  # 九百五十万円
    "千万円",        # 千万円
]
LONG_NEEDLES = [
    "一万円",        # 一万円
    "二万円",        # 二万円
    "一万五千円",    # 一万五千円
    "二分の一",      # 二分の一
]

# Repo-authoritative forbidden proof tokens (scripts/ci/lean_kernel_audit.py:20).
FORBIDDEN = ("sorry", "admit", "axiom", "Classical.choice")

failures: list[str] = []
notes: list[str] = []


def fail(msg: str) -> None:
    failures.append(msg)


def strip_comments_and_strings(src: str) -> str:
    """Mirror scripts/ci/check_no_sorry.py (nested block/line comments, strings)."""
    out: list[str] = []
    i, n = 0, len(src)
    while i < n:
        if src[i] == '"':
            out.append(" ")
            i += 1
            while i < n:
                c = src[i]
                if c == "\\":
                    out.append("  ")
                    i += 2
                elif c == '"':
                    out.append(" ")
                    i += 1
                    break
                else:
                    out.append("\n" if c == "\n" else " ")
                    i += 1
            continue
        if src.startswith("--", i):
            while i < n and src[i] != "\n":
                out.append(" ")
                i += 1
            continue
        if src.startswith("/-", i):
            depth = 0
            while i < n:
                if src.startswith("/-", i):
                    depth += 1
                    out.append("  ")
                    i += 2
                elif src.startswith("-/", i):
                    depth -= 1
                    out.append("  ")
                    i += 2
                    if depth == 0:
                        break
                else:
                    out.append("\n" if src[i] == "\n" else " ")
                    i += 1
            continue
        out.append(src[i])
        i += 1
    return "".join(out)


def to_int(s: str) -> int:
    return int(s.replace("_", ""))


def extract_def_body(text: str, name: str) -> str:
    m = re.search(rf"def\s+{re.escape(name)}\b", text)
    if not m:
        fail(f"Lean definition {name} not found")
        return ""
    tail = text[m.end():]
    eq = tail.find(":=")
    if eq < 0:
        fail(f"Lean definition {name} has no ':='")
        return ""
    body = tail[eq + 2:]
    # cut at next top-level declaration/example/end
    cut = re.search(r"\n\s*(?:def|theorem|example|end|namespace|axiom)\b", body)
    if cut:
        body = body[:cut.start()]
    return body


def parse_spouse_model(text: str):
    body = extract_def_body(text, "spouseDeduction")
    pat = re.compile(
        r"if\s+income\s+\u2264\s+(\d[\d_]*)\s+then\s*\(\s*if\s+elder\s+then\s+"
        r"(\d[\d_]*)\s+else\s+(\d[\d_]*)\s*\)\s*"
        r"else\s+if\s+income\s+\u2264\s+(\d[\d_]*)\s+then\s*\(\s*if\s+elder\s+then\s+"
        r"(\d[\d_]*)\s+else\s+(\d[\d_]*)\s*\)\s*"
        r"else\s+if\s+income\s+\u2264\s+(\d[\d_]*)\s+then\s*\(\s*if\s+elder\s+then\s+"
        r"(\d[\d_]*)\s+else\s+(\d[\d_]*)\s*\)\s*"
        r"else\s+(\d[\d_]*)",
        re.S,
    )
    m = pat.search(body)
    if not m:
        fail("could not parse spouseDeduction body from Lean source")
        return None
    vals = tuple(to_int(g) for g in m.groups())
    return vals  # A,E1,N1,B,E2,N2,C,E3,N3,Z


def parse_long_model(text: str):
    body = extract_def_body(text, "longTermDeduction")
    pat = re.compile(
        r"if\s+premium\s+\u2264\s+(\d[\d_]*)\s+then\s+premium\s*"
        r"else\s+if\s+premium\s+\u2264\s+(\d[\d_]*)\s+then\s+"
        r"(\d[\d_]*)\s*\+\s*\(\s*premium\s+-\s+(\d[\d_]*)\s*\)\s*/\s*(\d[\d_]*)\s*"
        r"else\s+(\d[\d_]*)",
        re.S,
    )
    m = pat.search(body)
    if not m:
        fail("could not parse longTermDeduction body from Lean source")
        return None
    return tuple(to_int(g) for g in m.groups())  # T1,T2,MB,MS,D,H


# ---------- load records ----------
q = json.loads((REPO / "build" / "task_queue.json").read_text(encoding="utf-8"))
tasks = q["tasks"]
records: dict[str, dict] = {}
for prefix in PREFIXES:
    hits = [r for r in tasks if r.get("normative_id", "").startswith(prefix)]
    if len(hits) != 1:
        fail(f"expected exactly 1 record for prefix {prefix}, found {len(hits)}")
    else:
        records[prefix] = hits[0]

# ---------- full-text reader ----------
spec = importlib.util.spec_from_file_location(
    "link_existing_proofs", REPO / "scripts" / "ci" / "link_existing_proofs.py"
)
mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)
full_text = mod.make_full_text_reader()

detail: list[str] = []


def check_record(prefix: str, needles: list[str]) -> str:
    r = records.get(prefix)
    if r is None:
        return ""
    uid = r["normative_id"]
    short = prefix
    detail.append(f"\n=== RECORD {short} ({PREFIXES[short]}) ===")
    detail.append(f"normative_id: {uid}")
    detail.append(f"source_file:  {r['source_file']}")
    detail.append(f"source_sha256 (pinned): {r['source_sha256']}")

    # 1. pinned source SHA-256
    sf = REPO / r["source_file"]
    if not sf.is_file():
        fail(f"[{short}] pinned source file missing: {r['source_file']}")
        computed = "<MISSING>"
        hash_ok = False
    else:
        computed = hashlib.sha256(sf.read_bytes()).hexdigest().upper()
        hash_ok = computed == r["source_sha256"].upper()
        if not hash_ok:
            fail(f"[{short}] source SHA-256 mismatch: computed {computed} != pinned {r['source_sha256']}")
    detail.append(f"computed sha256:        {computed}")
    detail.append(f"sha256 match: {hash_ok}")

    # 2. full provision text needles
    text = full_text(r)
    detail.append(f"full_text length: {len(text)}")
    detail.append(f"full_text: {text}")
    missing = [n for n in needles if n not in text]
    if missing:
        fail(f"[{short}] full text missing needles: {missing}")
    detail.append(f"needles checked: {len(needles)}; missing: {len(missing)}")

    # 3. norm_fragment substring
    sub = r["norm_fragment"] in text
    if not sub:
        fail(f"[{short}] norm_fragment is NOT a substring of normalized full text")
    detail.append(f"norm_fragment substring: {sub}")
    detail.append(f"norm_fragment: {r['norm_fragment']}")
    return text


sp_text = check_record("e1ff699c49a9", SPOUSE_NEEDLES)
lt_text = check_record("eb30477c44d8", LONG_NEEDLES)

# ---------- 4. independent arithmetic sweep ----------
lean_text = (REPO / "JapanTaxLaw" / "ThresholdDeductions.lean").read_text(encoding="utf-8")
sp = parse_spouse_model(lean_text)
lt = parse_long_model(lean_text)

# Reference table, independently specified from the pinned prose.
REF_A, REF_B, REF_C = 9_000_000, 9_500_000, 10_000_000
REF_E1, REF_N1, REF_E2, REF_N2, REF_E3, REF_N3, REF_Z = (
    480_000, 380_000, 320_000, 260_000, 160_000, 130_000, 0
)
REF_T1, REF_T2, REF_MB, REF_MS, REF_D, REF_H = 10_000, 20_000, 10_000, 10_000, 2, 15_000

sweep: list[str] = []
if sp is not None:
    A, E1, N1, B, E2, N2, C, E3, N3, Z = sp
    detail.append("\n=== SPARSED LEAN SPOUSE CONSTANTS ===")
    detail.append(f"A={A} E1={E1} N1={N1} B={B} E2={E2} N2={N2} C={C} E3={E3} N3={N3} Z={Z}")
    expected_sp = (REF_A, REF_E1, REF_N1, REF_B, REF_E2, REF_N2, REF_C, REF_E3, REF_N3, REF_Z)
    if sp != expected_sp:
        fail(f"Lean spouse constants differ from pinned table: {sp} != {expected_sp}")

    # Full sweep over every income value up to well past the top boundary;
    # both elder branches. Beyond C the function is constant, and the tail
    # points below cover that equivalence class.
    mism_spouse = 0
    first_mismatch = None
    max_income = 10_010_000
    for income in range(0, max_income + 1):
        r_f = REF_E1 if income <= REF_A else (REF_E2 if income <= REF_B else (REF_E3 if income <= REF_C else REF_Z))
        m_f = E1 if income <= A else (E2 if income <= B else (E3 if income <= C else Z))
        if r_f != m_f:
            mism_spouse += 1
            if first_mismatch is None:
                first_mismatch = (income, False, r_f, m_f)
        r_t = REF_N1 if income <= REF_A else (REF_N2 if income <= REF_B else (REF_N3 if income <= REF_C else REF_Z))
        m_t = N1 if income <= A else (N2 if income <= B else (N3 if income <= C else Z))
        if r_t != m_t:
            mism_spouse += 1
            if first_mismatch is None:
                first_mismatch = (income, True, r_t, m_t)
    tail = [10_010_001, 11_000_000, 100_000_000, 10**12, 2**64 - 1]
    for income in tail:
        for elder in (False, True):
            r = (REF_E1 if elder else REF_N1) if income <= REF_A else (
                (REF_E2 if elder else REF_N2) if income <= REF_B else (
                    (REF_E3 if elder else REF_N3) if income <= REF_C else REF_Z))
            m = (E1 if elder else N1) if income <= A else (
                (E2 if elder else N2) if income <= B else (
                    (E3 if elder else N3) if income <= C else Z))
            if r != m:
                mism_spouse += 1
                if first_mismatch is None:
                    first_mismatch = (income, elder, r, m)
    sweep.append(f"spouseDeduction: {2*(max_income+1) + 2*len(tail)} comparisons, mismatches={mism_spouse}, first={first_mismatch}")
    if mism_spouse:
        fail(f"spouse arithmetic mismatches: {mism_spouse} (first {first_mismatch})")

if lt is not None:
    T1, T2, MB, MS, D, H = lt
    detail.append("\n=== PARSED LEAN LONG-TERM CONSTANTS ===")
    detail.append(f"T1={T1} T2={T2} MB={MB} MS={MS} D={D} H={H}")
    expected_lt = (REF_T1, REF_T2, REF_MB, REF_MS, REF_D, REF_H)
    if lt != expected_lt:
        fail(f"Lean long-term constants differ from pinned table: {lt} != {expected_lt}")

    mism_long = 0
    first_mismatch = None
    max_premium = 25_000
    for premium in range(0, max_premium + 1):
        r = premium if premium <= REF_T1 else (
            REF_MB + (premium - REF_MS) // REF_D if premium <= REF_T2 else REF_H)
        m = premium if premium <= T1 else (
            MB + (premium - MS) // D if premium <= T2 else H)
        if r != m:
            mism_long += 1
            if first_mismatch is None:
                first_mismatch = (premium, r, m)
    for premium in [25_001, 100_000, 10**9, 10**12, 2**64 - 1]:
        r = premium if premium <= REF_T1 else (
            REF_MB + (premium - REF_MS) // REF_D if premium <= REF_T2 else REF_H)
        m = premium if premium <= T1 else (
            MB + (premium - MS) // D if premium <= T2 else H)
        if r != m:
            mism_long += 1
            if first_mismatch is None:
                first_mismatch = (premium, r, m)
    sweep.append(f"longTermDeduction: {max_premium+1 + 5} comparisons, mismatches={mism_long}, first={first_mismatch}")
    if mism_long:
        fail(f"long-term arithmetic mismatches: {mism_long} (first {first_mismatch})")

detail.append("\n=== ARITHMETIC SWEEP ===")
detail.extend(sweep)

# ---------- 5. forbidden proof token scan ----------
detail.append("\n=== FORBIDDEN PROOF TOKEN SCAN ===")
detail.append(f"tokens: {FORBIDDEN}")
lean_files = sorted((REPO / "JapanTaxLaw").glob("*.lean"))
token_hits = []
for p in lean_files:
    stripped = strip_comments_and_strings(p.read_text(encoding="utf-8"))
    for token in FORBIDDEN:
        if re.search(rf"\b{re.escape(token)}\b", stripped):
            token_hits.append(f"{p.name}:{token}")
detail.append(f"lean files scanned: {len(lean_files)}")
detail.append(f"token hits: {token_hits}")
if token_hits:
    fail(f"forbidden proof tokens found: {token_hits}")

# ---------- report ----------
lines = [
    "FULL-COVERAGE ADVERSARIAL SOURCE-FIDELITY CHECK",
    "READ-ONLY. No legal advice. No completeness claim.",
    f"records checked: {len(records)} of 2 expected",
]
lines.extend(detail)
if failures:
    lines.append("\nFAILURES:")
    lines.extend(f"  - {f}" for f in failures)
else:
    lines.append("\nALL CHECKS CLEARED (within the checks listed above).")

if failures:
    verdict = f"VERDICT: FAIL ({'; '.join(failures[:3])}{' ...' if len(failures) > 3 else ''})"
else:
    verdict = "VERDICT: PASS"

lines.append(verdict)
REPORT.write_text("\n".join(lines) + "\n", encoding="utf-8")
print(f"records_checked={len(records)} failures={len(failures)}")
for s in sweep:
    print(s)
print(f"forbidden_token_hits={len(token_hits)}")
print(f"report={REPORT}")
print(verdict)
