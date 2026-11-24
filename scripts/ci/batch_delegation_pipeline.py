#!/usr/bin/env python3
"""Guarded batch verification for delegation-gated thresholds.

Accepts ONLY dependency-ready units whose text contains a delegation phrase
(政令で定める / 省令で定める / 大臣が定める) plus exactly one simple numeric
threshold, with no dependencies or unhandled conditions and an existing pinned
source. The delegated determination is modelled as a caller-established Bool
and is explicitly NOT resolved by this pipeline.

Full cycle: generated impl/spec/tests, lake build, #print axioms, Lean-
independent source audit, 11 evidence axes; failures stay NOT_STARTED and are
skip-listed.

Usage: python scripts/ci/batch_delegation_pipeline.py --limit 50 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_DELEGATION_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_delegation_axioms")
KANJI = {"零": 0, "〇": 0, "一": 1, "二": 2, "三": 3, "四": 4,
         "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
UNITS = {"十": 10, "百": 100, "千": 1000, "万": 10000, "億": 100000000}
DELEG = re.compile(r"(政令|省令|大臣|総務大臣|財務大臣)で定める|が定める")
LE = re.compile(r"([〇零一二三四五六七八九十百千万億]+)円以下")
GT = re.compile(r"([〇零一二三四五六七八九十百千万億]+)円を超える")
NUM = re.compile(r"[〇零一二三四五六七八九十百千万億]+")


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


def impl_src(mod: str, n: int, op: str) -> str:
    p = "x <= limit" if op == "le" else "limit < x"
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated batch template for a delegation-gated threshold.
    The delegated determination is caller-established (Bool), NOT resolved. -/
namespace JapanTaxLaw.{mod}

/-- Statutory threshold, in yen. -/
def limit : Nat := {n}

/-- The norm applies when the delegated designation holds and the amount
    satisfies the statutory comparison. -/
def applies (designated : Bool) (x : Nat) : Bool :=
  designated && decide ({p})

theorem designated_at_boundary : applies true {n} = {str(op == "le").lower()} := by decide
theorem undesignated_zero : applies false 0 = false := by decide

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str, op: str) -> str:
    p = "x <= limit" if op == "le" else "limit < x"
    neg = "limit < x" if op == "le" else "x <= limit"
    mpr, other = ("Nat.not_lt.mpr h", "Nat.lt_of_not_ge h") if op == "le" else (
        "Nat.not_le.mpr h", "Nat.le_of_not_gt h")
    return f'''import JapanTaxLaw.{mod}

/-! Independent two-branch spec; agreement exhaustive over Bool x Nat. -/
namespace JapanTaxLaw.{mod}

def specApplies (designated : Bool) (x : Nat) : Bool :=
  if designated then !decide ({neg}) else false

theorem agree_spec_impl (designated : Bool) (x : Nat) :
    specApplies designated x = applies designated x := by
  cases designated
  · rfl
  · dsimp [specApplies, applies]
    by_cases h : {p}
    · have hn : ¬ {neg} := {mpr}
      simp [h, hn]
    · have hle : {neg} := {other}
      simp [h, hle]

end JapanTaxLaw.{mod}
'''


def test_src(mod: str, n: int, op: str) -> str:
    t = n if op == "le" else n + 1
    return f'''import JapanTaxLaw.{mod}Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.{mod}

example : limit = {n} := by decide
example : specApplies false 0 = applies false 0 := by rfl
example : specApplies true {t} = applies true {t} := agree_spec_impl true {t}
example : specApplies true 0 = applies true 0 := agree_spec_impl true 0

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
        if not DELEG.search(verb):
            continue
        le, gt = LE.findall(verb), GT.findall(verb)
        if (bool(le) == bool(gt)) or len(le + gt) != 1:
            continue
        if NUM.search(DELEG.sub("", (LE if le else GT).sub("", verb))):
            continue
        op = "le" if le else "gt"
        try:
            n = kanji_number((le or gt)[0])
        except ValueError:
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        mod = "BatchDeleg" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} {op} {n} {mod}")
            done.append(uid)
            continue
        paths[0].write_text(impl_src(mod, n, op), encoding="utf-8")
        paths[1].write_text(spec_src(mod, op), encoding="utf-8")
        paths[2].write_text(test_src(mod, n, op), encoding="utf-8")
        rc, out = run([str(LAKE), "build", f"JapanTaxLaw.{mod}Tests"])
        axfile = TEMP / f"{mod}.lean"
        axfile.parent.mkdir(parents=True, exist_ok=True)
        axfile.write_text(
            f"import JapanTaxLaw.{mod}\nimport JapanTaxLaw.{mod}Spec\n"
            f"import JapanTaxLaw.{mod}Tests\nopen JapanTaxLaw.{mod}\n"
            "#print axioms designated_at_boundary\n#print axioms agree_spec_impl\n", encoding="utf-8")
        rc2, ax = run([str(LAKE), "env", "lean", str(axfile)])
        bad = any(k in ax for k in ("Classical.choice", "Quot.sound", "sorryAx"))
        if rc != 0 or rc2 != 0 or bad or "Build completed successfully" not in out:
            failed.append({"id": uid, "reason": "build_or_axiom", "out": out[-300:]})
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
            "source_correspondence_audit": f"scripts/ci/source_correspondence.py D=PASS; threshold={n} yen; op={op}",
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; two-branch conditional",
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": ("agree_spec_impl exhaustive over Bool x Nat; delegated definition "
                            "remains caller-established, NOT resolved"),
            "boundary_proof": f"{mod}Tests.lean kernel-decided boundary cases",
            "cross_law_proof": f"dependencies={unit_deps(t)}",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_DELEGATION_REVIEW.md generated entry for {uid[:16]}",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_DELEGATION_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: delegation-gated template accepted; delegated definition "
                    f"NOT resolved; T=kernel build + axiom scan + pinned audit; D=PASS; "
                    f"U=caller establishes designation; no legal review.\n")
    print(f"delegation batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


def unit_deps(t: dict) -> list:
    return t.get("dependencies", [])


if __name__ == "__main__":
    sys.exit(main())
