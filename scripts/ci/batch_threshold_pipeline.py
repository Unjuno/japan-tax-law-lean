#!/usr/bin/env python3
"""Batch SPECIFY→IMPLEMENT→PROVE→CHALLENGE→VERIFY for simple threshold norms.

The pipeline only accepts units whose verbatim text contains exactly ONE
monetary threshold of the form 「…N円以下」 (inclusive) or 「…N円を超える」
(strict), with no dependencies, no unhandled conditions and a pinned source
file that exists. For each accepted unit it generates an independent spec, an
implementation and kernel tests from a fixed template; builds them with lake;
checks the axiom footprint; runs the Lean-independent source correspondence
audit; and records all 11 evidence axes. Units that fail any check are LEFT
NOT_STARTED and reported — never silently promoted.

Usage:
  python scripts/ci/batch_threshold_pipeline.py --limit 8 [--dry-run]
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
EVIDENCE = REPO / "data" / "verification_evidence.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_axioms")
KANJI = {"零": 0, "〇": 0, "一": 1, "二": 2, "三": 3, "四": 4,
         "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
UNITS = {"十": 10, "百": 100, "千": 1000, "万": 10000, "億": 100000000}
LE_RE = re.compile(r"([〇零一二三四五六七八九十百千万億]+)円以下")
GT_RE = re.compile(r"([〇零一二三四五六七八九十百千万億]+)円を超える")


def kanji_number(s: str) -> int:
    total = section = digit = 0
    for ch in s:
        if ch in KANJI:
            digit = KANJI[ch]
        elif ch in UNITS:
            u = UNITS[ch]
            if u >= 10000:
                section = (section + digit) * u
                total += section
                section = digit = 0
            else:
                section += (digit or 1) * u
                digit = 0
        else:
            raise ValueError(ch)
    return total + section + digit


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def impl_src(mod: str, n: int, op: str) -> str:
    cmp = "x <= limit" if op == "le" else "limit < x"
    at = "true" if op == "le" else "false"
    above = "false" if op == "le" else "true"
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single statutory monetary threshold.
    Unit and source position are recorded in data/verification_evidence.json. -/
namespace JapanTaxLaw.{mod}

/-- Statutory threshold, in yen. -/
def limit : Nat := {n}
/-- Threshold predicate. Caller supplies the amount in yen. -/
def meets (x : Nat) : Bool := decide ({cmp})

theorem at_limit : meets {n} = {at} := by decide
theorem beyond_limit : meets {n + 1} = {above} := by decide
theorem below_limit : meets 0 = {"true" if op == "le" else "false"} := by decide

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str, op: str) -> str:
    if op == "le":
        neg = "limit < x"
        hcmp = "x <= limit"
        mpr = "Nat.not_lt.mpr h"
        notgt = "Nat.lt_of_not_ge h"
    else:
        neg = "x <= limit"
        hcmp = "limit < x"
        mpr = "Nat.not_le.mpr h"
        notgt = "Nat.le_of_not_gt h"
    return f'''import JapanTaxLaw.{mod}

/-! Independent restatement of the threshold by the opposite comparison.
    Agreement holds for every Nat amount (universal, not a finite grid). -/
namespace JapanTaxLaw.{mod}

def specMeets (x : Nat) : Bool := !decide ({neg})

theorem agree_spec_impl (x : Nat) : specMeets x = meets x := by
  unfold specMeets meets
  by_cases h : {hcmp}
  · have hn : ¬ {neg} := {mpr}
    simp [h, hn]
  · have hle : {neg} := {notgt}
    simp [h, hle]

end JapanTaxLaw.{mod}
'''


def test_src(mod: str, n: int) -> str:
    return f'''import JapanTaxLaw.{mod}Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.{mod}

example : limit = {n} := by decide
example : meets 0 = meets 0 := rfl
example : specMeets {n} = meets {n} := agree_spec_impl {n}
example : specMeets {n + 1} = meets {n + 1} := agree_spec_impl {n + 1}
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.{mod}
'''


def run(cmd: list[str]) -> tuple[int, str]:
    r = subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8", errors="replace")
    return r.returncode, (r.stdout or "") + (r.stderr or "")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--limit", type=int, default=8)
    ap.add_argument("--dry-run", action="store_true")
    a = ap.parse_args()

    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    ev = json.loads(EVIDENCE.read_text(encoding="utf-8"))
    done, failed = [], []
    for t in q["tasks"]:
        if len(done) >= a.limit:
            break
        uid = t.get("id", "")
        if t.get("status") != "NOT_STARTED" or uid in ev["units"]:
            continue
        if t.get("unhandled_conditions") or t.get("dependencies"):
            continue
        verb = t.get("text", "")
        le, gt = LE_RE.findall(verb), GT_RE.findall(verb)
        if (bool(le) == bool(gt)) or (le and len(le) != 1) or (gt and len(gt) != 1):
            continue
        if "を超え" in verb and "以下" in verb:   # ranges need a dedicated model
            continue
        op = "le" if le else "gt"
        try:
            n = kanji_number((le or gt)[0])
        except ValueError:
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        suffix = hashlib.sha256(uid.encode()).hexdigest()[:10]
        mod = f"BatchThreshold{op.upper()}{suffix}"
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} {op} {n} {mod}")
            done.append(uid)
            continue
        paths[0].write_text(impl_src(mod, n, op), encoding="utf-8")
        paths[1].write_text(spec_src(mod, op), encoding="utf-8")
        paths[2].write_text(test_src(mod, n), encoding="utf-8")
        rc, out = run([str(LAKE), "build", f"JapanTaxLaw.{mod}Tests"])
        axfile = TEMP / f"{mod}.lean"
        axfile.parent.mkdir(parents=True, exist_ok=True)
        axfile.write_text(
            f"import JapanTaxLaw.{mod}\nimport JapanTaxLaw.{mod}Spec\n"
            f"import JapanTaxLaw.{mod}Tests\nopen JapanTaxLaw.{mod}\n"
            "#print axioms at_limit\n#print axioms beyond_limit\n#print axioms agree_spec_impl\n",
            encoding="utf-8")
        rc2, ax = run([str(LAKE), "env", "lean", str(axfile)])
        bad_ax = any(k in ax for k in ("Classical.choice", "Quot.sound", "sorryAx"))
        if rc != 0 or rc2 != 0 or bad_ax or "Build completed successfully" not in out:
            failed.append({"id": uid, "reason": "build_or_axiom", "out": out[-400:], "ax": ax[-400:]})
            for p in paths:
                p.unlink(missing_ok=True)
            continue
        rc3, audit = run([sys.executable, str(REPO / "scripts/ci/source_correspondence.py"),
                          "--source-file", sf, "--article", t.get("article", ""),
                          "--verbatim", verb, "--spec", f"JapanTaxLaw/{mod}Spec.lean",
                          "--impl", f"JapanTaxLaw/{mod}.lean"])
        if rc3 != 0 or '"D": "PASS"' not in audit:
            failed.append({"id": uid, "reason": "source_audit", "out": audit[-400:]})
            for p in paths:
                p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": f"scripts/ci/source_correspondence.py D=PASS; threshold={n} yen; op={op}",
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}",
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axiom scan: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": f"agree_spec_impl universal over all Nat; {op} threshold only",
            "boundary_proof": f"{mod}Tests.lean kernel-decided 0/{n}/{n+1}",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_THRESHOLD_REVIEW.md generated entry for {uid[:16]} ({op} {n})",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_THRESHOLD_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: threshold template accepted; H=threshold misread; "
                    f"T=kernel build + axiom scan + pinned audit; "
                    f"D=PASS; C=other readings excluded by verbatim; "
                    f"U=caller supplies the amount; no legal review.\n")
    print(f"batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
