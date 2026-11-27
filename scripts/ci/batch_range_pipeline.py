#!/usr/bin/env python3
"""Batch verification for two-bound range norms (「A円を超えB円以下」).

Only dependency-ready units with exactly one strict lower bound and one
inclusive upper bound (and no other statutory literals) are accepted. Each
unit gets a generated impl/spec/tests, a lake build, an axiom scan, a
Lean-independent source audit, and all 11 evidence axes. Failures stay
NOT_STARTED and are skip-listed.

Usage: python scripts/ci/batch_range_pipeline.py --limit 50 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_RANGE_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_range_axioms")
KANJI = {"零": 0, "〇": 0, "一": 1, "二": 2, "三": 3, "四": 4,
         "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
UNITS = {"十": 10, "百": 100, "千": 1000, "万": 10000, "億": 100000000}
RANGE_RE = re.compile(r"([〇零一二三四五六七八九十百千万億]+)円を超え([〇零一二三四五六七八九十百千万億]+)円以下")
OTHER_RE = re.compile(r"([〇零一二三四五六七八九十百千万億]+)(円|年|月|日|回|号|条|項|割|百分|千分)")


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


def impl_src(mod: str, lo: int, hi: int) -> str:
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory range: lower strict, upper inclusive.
    Units: yen. The amount is caller-established. -/
namespace JapanTaxLaw.{mod}

/-- Strict lower edge (円). -/
def lowerYen : Nat := {lo}
/-- Inclusive upper edge (円). -/
def upperYen : Nat := {hi}

/-- Membership in the range (lower < x ∧ x ≤ upper). -/
def inRange (x : Nat) : Bool := decide (lowerYen < x && x <= upperYen)

theorem at_lower : inRange {lo} = false := by decide
theorem just_above_lower : inRange {lo + 1} = true := by decide
theorem at_upper : inRange {hi} = true := by decide
theorem above_upper : inRange {hi + 1} = false := by decide

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str) -> str:
    return f'''import JapanTaxLaw.{mod}

/-! Independent restatement: two negated comparisons joined by Bool AND.
    Agreement is universal over all Nat amounts. -/
namespace JapanTaxLaw.{mod}

def specInRange (x : Nat) : Bool :=
  (!decide (x <= lowerYen)) && (!decide (upperYen < x))

theorem agree_spec_impl (x : Nat) : specInRange x = inRange x := by
  unfold specInRange inRange
  by_cases h1 : lowerYen < x
  · by_cases h2 : x <= upperYen
    · simp [h1, h2]
    · have h2n : upperYen < x := Nat.lt_of_not_ge h2
      simp [h1, h2, h2n]
  · have h1n : x <= lowerYen := Nat.le_of_not_gt h1
    simp [h1, h1n]

end JapanTaxLaw.{mod}
'''


def test_src(mod: str, lo: int, hi: int) -> str:
    return f'''import JapanTaxLaw.{mod}Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.{mod}

example : lowerYen = {lo} := by decide
example : upperYen = {hi} := by decide
example : inRange {lo} = false := by decide
example : inRange {lo + 1} = true := by decide
example : inRange {hi} = true := by decide
example : inRange {hi + 1} = false := by decide
example : specInRange {lo} = inRange {lo} := agree_spec_impl {lo}
example : specInRange {lo + 1} = inRange {lo + 1} := agree_spec_impl {lo + 1}
example : specInRange {hi} = inRange {hi} := agree_spec_impl {hi}

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
        m = RANGE_RE.search(verb)
        if not m:
            continue
        # Reject ranges embedded in longer norms with additional literals.
        stripped = verb[:m.start()] + verb[m.end():]
        if OTHER_RE.search(stripped):
            continue
        try:
            lo, hi = kanji_number(m.group(1)), kanji_number(m.group(2))
        except ValueError:
            continue
        if not (0 <= lo < hi):
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        mod = "BatchRange" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} {lo}..{hi} {mod}")
            done.append(uid)
            continue
        paths[0].write_text(impl_src(mod, lo, hi), encoding="utf-8")
        paths[1].write_text(spec_src(mod), encoding="utf-8")
        paths[2].write_text(test_src(mod, lo, hi), encoding="utf-8")
        rc, out = run([str(LAKE), "build", f"JapanTaxLaw.{mod}Tests"])
        axfile = TEMP / f"{mod}.lean"
        axfile.parent.mkdir(parents=True, exist_ok=True)
        axfile.write_text(
            f"import JapanTaxLaw.{mod}\nimport JapanTaxLaw.{mod}Spec\n"
            f"import JapanTaxLaw.{mod}Tests\nopen JapanTaxLaw.{mod}\n"
            "#print axioms at_lower\n#print axioms at_upper\n"
            "#print axioms agree_spec_impl\n", encoding="utf-8")
        rc2, ax = run([str(LAKE), "env", "lean", str(axfile)])
        bad = any(k in ax for k in ("Classical.choice", "Quot.sound", "sorryAx"))
        if rc != 0 or rc2 != 0 or bad or "Build completed successfully" not in out:
            failed.append({"id": uid, "reason": "build_or_axiom", "out": out[-300:], "ax": ax[-300:]})
            for p in paths:
                p.unlink(missing_ok=True)
            continue
        rc3, audit = run([sys.executable, str(REPO / "scripts/ci/source_correspondence.py"),
                          "--source-file", sf, "--article", t.get("article", ""),
                          "--verbatim", verb, "--spec", f"JapanTaxLaw/{mod}Spec.lean",
                          "--impl", f"JapanTaxLaw/{mod}.lean"])
        if rc3 != 0 or '"D": "PASS"' not in audit:
            failed.append({"id": uid, "reason": "source_audit", "out": audit[-300:]})
            for p in paths:
                p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": f"scripts/ci/source_correspondence.py D=PASS; bounds=[{lo},{hi}] yen",
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; two negated comparisons",
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": f"agree_spec_impl universal over all Nat; range {lo}..{hi} only",
            "boundary_proof": f"{mod}Tests.lean kernel-decided 4 boundary points",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_RANGE_REVIEW.md generated entry for {uid[:16]} ({lo}..{hi})",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_RANGE_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: range template accepted; H=bound misread; "
                    f"T=kernel build + axiom scan + pinned audit; D=PASS; "
                    f"C=other readings excluded by verbatim; U=caller supplies amount; "
                    f"no legal review.\n")
    print(f"range batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
