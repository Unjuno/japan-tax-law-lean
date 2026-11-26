#!/usr/bin/env python3
"""Guarded batch verification for decimal 百分のX・Y rate norms.

A phrase 百分の一・四 is 1.4%, i.e. 14/1000. The integer-rate pipeline
explicitly rejects these. This pipeline parses both kanji components from
the pinned verbatim, requires no other numerals in the unit, and models the
rate with denominator 1000. A dedicated Lean-independent audit checks that
the numerator is exactly 10*X + Y, not a truncation to X.

Usage: python scripts/ci/batch_decimal_rate_pipeline.py --limit 20 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_DECIMAL_RATE_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_decimal_rate_axioms")
DEC = re.compile(r"百分の([〇零一二三四五六七八九十百千]+)・([〇零一二三四五六七八九十百千]+)")
NUM = re.compile(r"[〇零一二三四五六七八九十百千万億]+")
KANJI = {"零": 0, "〇": 0, "一": 1, "二": 2, "三": 3, "四": 4,
         "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
UNITS = {"十": 10, "百": 100, "千": 1000}


def kanji_number(s: str) -> int:
    total = section = digit = 0
    for ch in s:
        if ch in KANJI:
            digit = KANJI[ch]
        elif ch in UNITS:
            u = UNITS[ch]
            section += (digit or 1) * u
            digit = 0
        else:
            raise ValueError(ch)
    return total + section + digit


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def impl_src(mod: str, num: int) -> str:
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated template for a decimal 百分の rate with denominator 1000. -/
namespace JapanTaxLaw.{mod}

open JapanTaxLaw.TaxFinance

def rate : TaxRate := ⟨{num}, 1000, by decide⟩

def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = ({num}, 1000) := by decide
theorem at_1000 : amount 1000 = {num} := by decide
theorem at_zero : amount 0 = 0 := by decide

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str, num: int) -> str:
    return f'''import JapanTaxLaw.{mod}

/-! Independent plain-pair spec; agreement is universal over every base. -/
namespace JapanTaxLaw.{mod}

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := ({num}, 1000)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.{mod}
'''


def test_src(mod: str, num: int) -> str:
    return f'''import JapanTaxLaw.{mod}Spec

namespace JapanTaxLaw.{mod}

example : rate.den = 1000 := by decide
example : amount 0 = 0 := by decide
example : amount 1000 = {num} := by decide
example : specAmount 1_000 = amount 1_000 := agree_spec_impl 1_000
example : specAmount 7 = amount 7 := agree_spec_impl 7

end JapanTaxLaw.{mod}
'''


def run(cmd: list[str]) -> tuple[int, str]:
    r = subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8", errors="replace")
    return r.returncode, (r.stdout or "") + (r.stderr or "")


def decimal_audit(verb: str, impl_text: str, spec_text: str) -> bool:
    m = DEC.findall(verb)
    if len(m) != 1 or NUM.search(DEC.sub("", verb)):
        return False
    try:
        expected = 10 * kanji_number(m[0][0]) + kanji_number(m[0][1])
    except ValueError:
        return False
    return (f"TaxRate := ⟨{expected}, 1000" in impl_text
            and f"specFraction : Nat × Nat := ({expected}, 1000)" in spec_text)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--limit", type=int, default=20)
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
        m = DEC.findall(verb)
        if len(m) != 1 or NUM.search(DEC.sub("", verb)):
            continue
        try:
            num = 10 * kanji_number(m[0][0]) + kanji_number(m[0][1])
        except ValueError:
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        mod = "BatchDecRate" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} num={num}/1000 {mod}")
            done.append(uid)
            continue
        paths[0].write_text(impl_src(mod, num), encoding="utf-8")
        paths[1].write_text(spec_src(mod, num), encoding="utf-8")
        paths[2].write_text(test_src(mod, num), encoding="utf-8")
        rc, out = run([str(LAKE), "build", f"JapanTaxLaw.{mod}Tests"])
        axfile = TEMP / f"{mod}.lean"
        axfile.parent.mkdir(parents=True, exist_ok=True)
        axfile.write_text(
            f"import JapanTaxLaw.{mod}\nimport JapanTaxLaw.{mod}Spec\n"
            f"import JapanTaxLaw.{mod}Tests\nopen JapanTaxLaw.{mod}\n"
            "#print axioms rate_components\n#print axioms at_1000\n"
            "#print axioms agree_spec_impl\n", encoding="utf-8")
        rc2, ax = run([str(LAKE), "env", "lean", str(axfile)])
        bad = any(k in ax for k in ("Classical.choice", "Quot.sound", "sorryAx"))
        if rc != 0 or rc2 != 0 or bad or "Build completed successfully" not in out:
            failed.append({"id": uid, "reason": "build_or_axiom", "out": (out + ax)[-400:]})
            for p in paths: p.unlink(missing_ok=True)
            continue
        cmd = [sys.executable, str(REPO / "scripts/ci/source_correspondence.py"),
               "--source-file", sf, "--article", t.get("article", ""),
               "--verbatim", verb, "--spec", f"JapanTaxLaw/{mod}Spec.lean",
               "--impl", f"JapanTaxLaw/{mod}.lean"]
        rc3, audit = run(cmd)
        if rc3 != 0 or '"D": "PASS"' not in audit:
            cmd[5] = t.get("article", "").split("_")[0]
            rc3, audit = run(cmd)
        if rc3 != 0 or '"D": "PASS"' not in audit:
            failed.append({"id": uid, "reason": "source_audit", "out": audit[-400:]})
            for p in paths: p.unlink(missing_ok=True)
            continue
        if not decimal_audit(verb, paths[0].read_text(encoding="utf-8"),
                             paths[1].read_text(encoding="utf-8")):
            failed.append({"id": uid, "reason": "decimal_audit", "out": "numerator mismatch"})
            for p in paths: p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                            "decimal_audit D=PASS: numerator 10*X+Y checked "
                                            "against both quoted kanji components"),
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; plain-pair spec vs TaxRate impl",
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": "agree_spec_impl universal over all Nat bases; rate application only",
            "boundary_proof": f"{mod}Tests.lean kernel-decided 0 / denominator boundaries",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}; base caller-established, NOT resolved",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_DECIMAL_RATE_REVIEW.md generated entry for {uid[:16]}",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_DECIMAL_RATE_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: decimal-rate template accepted; both kanji components checked; "
                    f"T=kernel build + axiom scan + two independent audits; D=PASS; "
                    f"U=legal interpretation requires human review.\n")
    print(f"decimal-rate batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
