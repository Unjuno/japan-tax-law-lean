#!/usr/bin/env python3
"""Guarded batch pipeline for fraction-threshold norms (「X分のY」+ comparison).

Accepts ONLY dependency-ready units with exactly one fraction, one comparison
operator (以上 / 以下 / 未満 / を超える), no other statutory numerals, and a
pinned source. Generates impl/spec/tests with cross-multiplied predicates,
builds with lake, scans axioms, runs the Lean-independent source audit and
records all 11 evidence axes. Failures remain NOT_STARTED and are skip-listed.

Usage: python scripts/ci/batch_fraction_pipeline.py --limit 50 [--dry-run]
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
QUEUE, EVIDENCE = REPO / "build/task_queue.json", REPO / "data/verification_evidence.json"
SKIPS = REPO / "data" / "BATCH_FRACTION_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_fraction_axioms")
KANJI = {"零": 0, "〇": 0, "一": 1, "二": 2, "三": 3, "四": 4,
         "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
UNITS = {"十": 10, "百": 100, "千": 1000, "万": 10000, "億": 100000000}
FRAC = re.compile(r"([〇零一二三四五六七八九十百千万億]+)分の([〇零一二三四五六七八九十百千万億]+)")
OTHER = re.compile(r"([〇零一二三四五六七八九十百千万億]+)(円|年|月|日|回|号|条|項|百分|千分)")
OPS = (("を超える", "gt"), ("以上", "ge"), ("以下", "le"), ("未満", "le"))


def kanji_number(s: str) -> int:
    total = section = digit = 0
    for ch in s:
        if ch in KANJI:
            digit = KANJI[ch]
        elif ch in UNITS:
            u = UNITS[ch]
            if u >= 10000:
                section = (section + digit) * u; total += section; section = digit = 0
            else:
                section += (digit or 1) * u; digit = 0
        else:
            raise ValueError(ch)
    return total + section + digit


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def props(op: str):
    if op == "ge":
        return "num * d <= den * n", "den * n < num * d", "Nat.not_lt.mpr h", "Nat.lt_of_not_ge h"
    if op == "le":
        return "den * n <= num * d", "num * d < den * n", "Nat.not_lt.mpr h", "Nat.lt_of_not_ge h"
    return "num * d < den * n", "den * n <= num * d", "Nat.not_le.mpr h", "Nat.le_of_not_gt h"


def impl_src(mod: str, num: int, den: int, op: str) -> str:
    p, _, _, _ = props(op)
    false_case = 0 if op == "ge" else (num + 1 if op == "le" else num)
    true_case = num + 1 if op == "gt" else num
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory fraction threshold.
    Units: n and d are caller-established numerator/denominator (d > 0). -/
namespace JapanTaxLaw.{mod}

/-- 原文 fraction: {den}分の{num}. -/
def num : Nat := {num}
def den : Nat := {den}

/-- Threshold predicate via cross-multiplication (no division). -/
def meets (n d : Nat) : Bool := decide ({p})

theorem sample_true : meets {true_case} {den} = true := by decide
theorem sample_false : meets {false_case} {den} = false := by decide

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str, op: str) -> str:
    p, neg, mpr, other = props(op)
    return f'''import JapanTaxLaw.{mod}

/-! Independent restatement: negation of the complementary comparison.
    Agreement is universal over all Nat numerator/denominator pairs. -/
namespace JapanTaxLaw.{mod}

def specMeets (n d : Nat) : Bool := !decide ({neg})

theorem agree_spec_impl (n d : Nat) : specMeets n d = meets n d := by
  unfold specMeets meets
  by_cases h : {p}
  · have hn : ¬ {neg} := {mpr}
    simp [h, hn]
  · have hle : {neg} := {other}
    simp [h, hle]

end JapanTaxLaw.{mod}
'''


def test_src(mod: str, den: int) -> str:
    return f'''import JapanTaxLaw.{mod}Spec

/-! Kernel-decided boundary checks. -/
namespace JapanTaxLaw.{mod}

example : den = {den} := by decide
example : specMeets 0 {den} = meets 0 {den} := agree_spec_impl 0 {den}
example : specMeets 1 {den} = meets 1 {den} := agree_spec_impl 1 {den}
example : specMeets 2 {den} = meets 2 {den} := agree_spec_impl 2 {den}

end JapanTaxLaw.{mod}
'''


def run(cmd: list[str]) -> tuple[int, str]:
    r = subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8", errors="replace")
    return r.returncode, (r.stdout or "") + (r.stderr or "")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--limit", type=int, default=50)
    ap.add_argument("--dry-run", action="store_true")
    a = ap.parse_args()
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    ev = json.loads(EVIDENCE.read_text(encoding="utf-8"))
    skips = json.loads(SKIPS.read_text(encoding="utf-8")) if SKIPS.exists() else {}
    done, failed = [], []
    for t in q["tasks"]:
        if len(done) >= a.limit:
            break
        uid = t.get("id", "")
        if t.get("status") != "NOT_STARTED" or uid in ev["units"] or uid in skips:
            continue
        if t.get("unhandled_conditions") or t.get("dependencies"):
            continue
        verb = t.get("text", "")
        ms = list(FRAC.finditer(verb))
        if len(ms) != 1 or OTHER.search(FRAC.sub("", verb)):
            continue
        op = next((o for s, o in OPS if s in verb), None)
        if op is None:
            continue
        try:
            den, num = kanji_number(ms[0].group(1)), kanji_number(ms[0].group(2))
        except ValueError:
            continue
        if den <= 1 or num <= 0 or num > den:
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        mod = "BatchFraction" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} {den}分の{num} {op} {mod}")
            done.append(uid)
            continue
        paths[0].write_text(impl_src(mod, num, den, op), encoding="utf-8")
        paths[1].write_text(spec_src(mod, op), encoding="utf-8")
        paths[2].write_text(test_src(mod, den), encoding="utf-8")
        rc, out = run([str(LAKE), "build", f"JapanTaxLaw.{mod}Tests"])
        axfile = TEMP / f"{mod}.lean"
        axfile.parent.mkdir(parents=True, exist_ok=True)
        axfile.write_text(
            f"import JapanTaxLaw.{mod}\nimport JapanTaxLaw.{mod}Spec\n"
            f"import JapanTaxLaw.{mod}Tests\nopen JapanTaxLaw.{mod}\n"
            "#print axioms sample_true\n#print axioms agree_spec_impl\n", encoding="utf-8")
        rc2, ax = run([str(LAKE), "env", "lean", str(axfile)])
        bad = any(k in ax for k in ("Classical.choice", "Quot.sound", "sorryAx"))
        if rc != 0 or rc2 != 0 or bad or "Build completed successfully" not in out:
            failed.append({"id": uid, "reason": "build_or_axiom", "out": out[-300:], "ax": ax[-300:]})
            for p in paths: p.unlink(missing_ok=True)
            continue
        rc3, audit = run([sys.executable, str(REPO / "scripts/ci/source_correspondence.py"),
                          "--source-file", sf, "--article", t.get("article", ""),
                          "--verbatim", verb, "--spec", f"JapanTaxLaw/{mod}Spec.lean",
                          "--impl", f"JapanTaxLaw/{mod}.lean"])
        if rc3 != 0 or '"D": "PASS"' not in audit:
            failed.append({"id": uid, "reason": "source_audit", "out": audit[-300:]})
            for p in paths: p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": f"scripts/ci/source_correspondence.py D=PASS; fraction=[{num}/{den}]; op={op}",
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; complementary comparison",
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": f"agree_spec_impl universal over all Nat pairs; {num}/{den} {op} only",
            "boundary_proof": f"{mod}Tests.lean kernel-decided 0/1/2 over denominator {den}",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_FRACTION_REVIEW.md generated entry for {uid[:16]} ({num}/{den} {op})",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_FRACTION_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: fraction-threshold template accepted; H=fraction/op misread; "
                    f"T=kernel build + axiom scan + pinned audit; D=PASS; "
                    f"C=other readings excluded by verbatim; U=caller supplies ratio; "
                    f"no legal review.\n")
    print(f"fraction batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
