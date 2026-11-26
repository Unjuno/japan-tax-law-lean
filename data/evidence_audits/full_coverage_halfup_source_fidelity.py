#!/usr/bin/env python3
"""Full-coverage adversarial source-fidelity check for halfup_all.json (87 units).

READ-ONLY with respect to the repository. Script/report live only in
D:\CodexData\Temp\opencode\goal208\.

Checks (every record, no sampling):
  1. pinned source SHA-256 (INVENTORY.json raw_snapshot) == unit source_sha256
     (also cross-checks task_queue and the on-disk raw source bytes).
  2. full provision text (scripts/ci/link_existing_proofs.py:make_full_text_reader)
     contains both '円未満の端数' and '四捨五入'.
  3. kanji threshold(s) attached to 四捨五入 in the full text are modelled and
     match the unit's IMPLEMENTATION evidence_ref mode(s)
     (roundHalfUpThousand -> 千, roundHalfUpTenThousand -> 万,
      roundHalfUpMillion -> 百万). No unmodelled kanji threshold anywhere in
     the full text.
  4. norm_fragment is a substring of the normalized full text.

Plus: forbidden proof-token scan and git-HEAD comparison of HalfUpRounding*.lean.
"""
from __future__ import annotations

import hashlib
import importlib.util
import json
import re
import subprocess
import sys
from pathlib import Path

sys.stdout.reconfigure(encoding="utf-8")

REPO = Path(r"C:\Users\user\.local\share\opencode\worktree\484e09\norm-queue-fix")
TMP = Path(r"D:\CodexData\Temp\opencode\goal208")
TARGET = TMP / "halfup_all.json"
REPORT = TMP / "fullcov_halfup_source_fidelity_report.json"
sys.path.insert(0, str(REPO / "scripts" / "ci"))
sys.path.insert(0, str(REPO / "scripts" / "law_audit"))


def load_json(path: Path):
    return json.loads(path.read_text(encoding="utf-8"))


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


lep = load_module("lep_fullcov", REPO / "scripts" / "ci" / "link_existing_proofs.py")
check_no_sorry = load_module("nosorry_fullcov", REPO / "scripts" / "ci" / "check_no_sorry.py")
kansuji = lep.kansuji

units = load_json(TARGET)
q = load_json(REPO / "build" / "task_queue.json")
tasks = {t["normative_id"]: t for t in q["tasks"]}
evidence = load_json(REPO / "data" / "verification_evidence.json")["records"]
inventory = load_json(REPO / "data" / "INVENTORY.json")

# Locate pinned raw snapshots in INVENTORY by law_id.
pinned: dict[str, dict] = {}


def walk_pins(node):
    if isinstance(node, dict):
        if "law_id" in node and isinstance(node.get("raw_snapshot"), dict):
            snap = node["raw_snapshot"]
            if "source_sha256" in snap:
                pinned.setdefault(node["law_id"], {
                    "sha": snap["source_sha256"],
                    "source_file": snap.get("source_file", ""),
                    "law_revision_id": (node.get("current_revision") or {}).get("law_revision_id", ""),
                })
        for v in node.values():
            walk_pins(v)
    elif isinstance(node, list):
        for v in node:
            walk_pins(v)


walk_pins(inventory)

full_text = lep.make_full_text_reader()

MODES = {
    "roundHalfUpThousand": 1000,
    "roundHalfUpTenThousand": 10000,
    "roundHalfUpMillion": 1_000_000,
}
MODELLED = set(MODES.values())
KANJI_THR = re.compile(r"([〇零一二三四五六七八九十百千万]+)円未満の端数")
HALFUP_THR = re.compile(r"([〇零一二三四五六七八九十百千万]+)円未満の端数[^。]*?四捨五入")
MODE_RE = re.compile(r"roundHalfUp(?:Thousand|TenThousand|Million)")


KANJI_DIGITS = {
    "〇": 0, "零": 0, "一": 1, "二": 2, "三": 3, "四": 4,
    "五": 5, "六": 6, "七": 7, "八": 8, "九": 9,
}
KANJI_UNITS = {"十": 10, "百": 100, "千": 1000}


def parse_kanji_int(s: str) -> int:
    """Parse short kanji numerals including bare 万 / 百万 (kansuji rejects those)."""
    if s.endswith("万"):
        head = s[:-1] or "一"
        return parse_kanji_int(head) * 10_000
    total = 0
    section = 0
    digit = 0
    for ch in s:
        if ch in KANJI_DIGITS:
            digit = KANJI_DIGITS[ch]
        elif ch in KANJI_UNITS:
            unit = KANJI_UNITS[ch]
            section += (digit or 1) * unit
            digit = 0
    return total + section + digit


def to_int(kanji: str) -> int | None:
    try:
        value = kansuji.kanji_to_int(kanji)
        if value is not None:
            return int(value)
    except Exception:
        pass
    try:
        return parse_kanji_int(kanji)
    except Exception:
        return None


counts = {1: 0, 2: 0, 3: 0, 4: 0}
failures: list[dict] = []
file_sha_cache: dict[str, str] = {}


def fail(idx: int, uid: str, check: int, reason: str, detail: str = "") -> None:
    failures.append({
        "index": idx, "normative_id": uid, "check": check,
        "reason": reason, "detail": detail[:400],
    })


for idx, u in enumerate(units):
    uid = u["normative_id"]
    short = uid[:12]
    t = tasks.get(uid)
    if t is None:
        for c in (1, 2, 3, 4):
            fail(idx, uid, c, "normative_id absent from build/task_queue.json")
        continue

    # Hydration sanity: the unit must correspond to the queued task.
    hydrated_ok = (
        t.get("source_file") == u.get("source_file")
        and t.get("source_sha256") == u.get("source_sha256")
        and t.get("norm_fragment") == u.get("norm_fragment")
        and t.get("article") == u.get("article")
    )

    # ---- check 1: pinned source SHA-256 ----
    sf = u["source_file"]
    if sf not in file_sha_cache:
        p = REPO / sf
        file_sha_cache[sf] = (
            hashlib.sha256(p.read_bytes()).hexdigest().upper() if p.exists() else "MISSING_FILE"
        )
    pin = pinned.get(u["law_id"])
    pin_sha = pin["sha"].upper() if pin else "NO_PIN"
    unit_sha = str(u["source_sha256"]).upper()
    task_sha = str(t.get("source_sha256", "")).upper()
    file_sha = file_sha_cache[sf]
    if not hydrated_ok:
        fail(idx, uid, 1, "unit fields disagree with task_queue task")
    elif not (pin_sha == unit_sha == task_sha == file_sha):
        fail(idx, uid, 1,
             f"SHA mismatch: pinned={pin_sha} unit={unit_sha} task={task_sha} file={file_sha}")
    elif pin and pin["source_file"] and pin["source_file"] != sf:
        fail(idx, uid, 1, f"pinned source_file mismatch: {pin['source_file']} != {sf}")
    else:
        counts[1] += 1

    txt = full_text(t)

    # ---- check 2: exact phrases in full provision text ----
    has_frac = "円未満の端数" in txt
    has_half = "四捨五入" in txt
    if has_frac and has_half:
        counts[2] += 1
    else:
        missing = [n for n, ok in (("円未満の端数", has_frac), ("四捨五入", has_half)) if not ok]
        fail(idx, uid, 2, "missing phrase(s): " + ", ".join(missing), txt)

    # ---- check 3: threshold kanji vs implementation evidence_ref ----
    impl_refs = [
        str(r.get("evidence_ref", ""))
        for r in evidence.get(uid, [])
        if r.get("axis") == "IMPLEMENTATION" and "HalfUpRounding.lean" in str(r.get("evidence_ref", ""))
    ]
    modes = sorted({m for ref in impl_refs for m in MODE_RE.findall(ref)})
    expected = {MODES[m] for m in modes}
    all_values = [to_int(k) for k in KANJI_THR.findall(txt)]
    half_values = [to_int(k) for k in HALFUP_THR.findall(txt)]
    unmodelled = sorted({v for v in all_values if v is not None and v not in MODELLED})
    if not modes:
        fail(idx, uid, 3, "no HalfUpRounding IMPLEMENTATION evidence_ref", str(impl_refs))
    elif not half_values:
        fail(idx, uid, 3, "no kanji threshold attached to 四捨五入 in full text",
             f"impl={impl_refs} all_thr={all_values} text={txt}")
    elif unmodelled:
        fail(idx, uid, 3, f"unmodelled threshold kanji in full text: {unmodelled}",
             f"impl={impl_refs} halfup_thr={half_values} text={txt}")
    elif not set(half_values).issubset(expected):
        fail(idx, uid, 3,
             f"threshold {half_values} does not match impl modes {modes} (expected {sorted(expected)})",
             f"impl={impl_refs} text={txt}")
    else:
        counts[3] += 1

    # ---- check 4: norm_fragment substring of normalized full text ----
    if u["norm_fragment"] in txt:
        counts[4] += 1
    else:
        fail(idx, uid, 4, "norm_fragment not found in normalized full text",
             f"fragment={u['norm_fragment']} text={txt}")

# ---- forbidden proof tokens in HalfUpRounding*.lean ----
FORBIDDEN = ("sorry", "admit", "axiom", "Classical.choice")  # scripts/ci/lean_kernel_audit.py
lean_files = sorted((REPO / "JapanTaxLaw").glob("HalfUpRounding*.lean"))
token_findings: list[str] = []
for p in lean_files:
    src = p.read_text(encoding="utf-8")
    code = check_no_sorry.strip_comments_and_strings(src)
    for token in FORBIDDEN:
        for m in re.finditer(rf"\b{re.escape(token)}\b", code):
            lineno = code.count("\n", 0, m.start()) + 1
            token_findings.append(f"{p.name}:{lineno}:{token}")

# ---- universal agreement theorems unchanged vs git HEAD ----
def git(*args: str) -> subprocess.CompletedProcess:
    return subprocess.run(["git", *args], cwd=REPO, capture_output=True)


def theorem_blocks(text: str) -> list[str]:
    return [m.group(0).strip() for m in re.finditer(
        r"theorem\s+\w+[\s\S]*?(?=\n(?:theorem|def|end)\b|\Z)", text)]


head_checks: list[dict] = []
for p in lean_files:
    rel = p.relative_to(REPO).as_posix()
    head = git("show", f"HEAD:{rel}")
    head_text = head.stdout.decode("utf-8", errors="replace") if head.returncode == 0 else None
    work_text = p.read_text(encoding="utf-8")
    diff = git("diff", "--exit-code", "HEAD", "--", rel)
    head_checks.append({
        "file": rel,
        "git_show_ok": head.returncode == 0,
        "byte_identical_to_head": head_text == work_text,
        "git_diff_clean": diff.returncode == 0,
        "theorems": re.findall(r"^theorem\s+(\w+)", work_text, flags=re.M),
        "theorems_identical_to_head": (
            theorem_blocks(head_text) == theorem_blocks(work_text) if head_text is not None else False
        ),
    })

report = {
    "scope": "FULL_COVERAGE_MECHANICAL_SOURCE_FIDELITY_NO_SAMPLING",
    "units_total": len(units),
    "pass_counts": {f"check_{k}": counts[k] for k in (1, 2, 3, 4)},
    "failure_counts": {f"check_{k}": sum(1 for f in failures if f["check"] == k)
                       for k in (1, 2, 3, 4)},
    "failures_total": len(failures),
    "failures": failures[:20],
    "forbidden_tokens": token_findings,
    "git_head": head_checks,
}
REPORT.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")

print("=== FULL-COVERAGE SOURCE-FIDELITY AUDIT (87 units) ===")
print("pass counts:", report["pass_counts"])
print("failure counts:", report["failure_counts"], "total:", len(failures))
for f in failures[:20]:
    print(f"  FAIL #{f['index']} {f['normative_id'][:12]} check{f['check']}: {f['reason']}")
    if f["detail"]:
        print("     ", f["detail"])
print("forbidden proof tokens in HalfUpRounding*.lean:", token_findings or "NONE")
for h in head_checks:
    print(f"HEAD {h['file']}: byte_identical={h['byte_identical_to_head']} "
          f"diff_clean={h['git_diff_clean']} theorems_identical={h['theorems_identical_to_head']} "
          f"theorems={h['theorems']}")
print("report:", REPORT)
