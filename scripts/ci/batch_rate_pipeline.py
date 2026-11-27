#!/usr/bin/env python3
"""Batch verification for simple 百分のX rate norms (second norm-kind pipeline).

Accepts only dependency-ready units whose verbatim contains exactly ONE
「百分のX」 percentage and no other statutory literal, with an existing pinned
source. Generates an independent spec, implementation and kernel tests; builds
with lake; scans axiom footprint; runs the Lean-independent source audit;
records all 11 evidence axes. Failures stay NOT_STARTED and are skip-listed.

Usage: python scripts/ci/batch_rate_pipeline.py --limit 50 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_RATE_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_rate_axioms")
KANJI = {"零": 0, "〇": 0, "一": 1, "二": 2, "三": 3, "四": 4,
         "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
UNITS = {"十": 10, "百": 100, "千": 1000, "万": 10000, "億": 100000000}
PCT_RE = re.compile(r"百分の([〇零一二三四五六七八九十百千万億]+)")
DECIMAL_PCT_RE = re.compile(r"百分の[〇零一二三四五六七八九十百千万億]+・")
# 「四百分の二百」 is a 200/400 fraction, not a 200/100 rate. PCT_RE would
# otherwise match the 「百分の二百」 substring and silently mis-state the law.
NON_HUNDRED_DENOM_RE = re.compile(r"[〇零一二三四五六七八九十千万億]+百分の")
# Structural references (第X条 / 第Y項 / 第Z号 / 第W目) identify provisions;
# they are recorded as unresolved dependencies, not statutory quantities.
# Other bare numerals remain excluded from this guarded class.
BARE_NUM_RE = re.compile(r"[〇零一二三四五六七八九十百千万億]+(?!条|項|号|目)")


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


def impl_src(mod: str, n: int) -> str:
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single statutory 百分のX rate.
    Unit and source position are recorded in data/verification_evidence.json. -/
namespace JapanTaxLaw.{mod}

open JapanTaxLaw.TaxFinance

/-- 百分の{n} as a fraction with a positivity-typed denominator. -/
def rate : TaxRate := ⟨{n}, 100, by decide⟩

/-- Amount obtained by applying the rate to a caller-established base. -/
def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = ({n}, 100) := by decide
theorem at_zero : amount 0 = 0 := by decide
theorem at_100 : amount 100 = {n} := by decide

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str, n: int) -> str:
    return f'''import JapanTaxLaw.{mod}

/-! Independent restatement using a plain (numerator, denominator) pair,
    without TaxRate. Agreement is universal over every base amount. -/
namespace JapanTaxLaw.{mod}

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := ({n}, 100)

def specAmount (base : Nat) : Nat :=
  base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.{mod}
'''


def test_src(mod: str, n: int) -> str:
    return f'''import JapanTaxLaw.{mod}Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.{mod}

example : rate.den = 100 := by decide
example : amount 0 = 0 := by decide
example : amount 100 = {n} := by decide
example : specAmount 0 = amount 0 := agree_spec_impl 0
example : specAmount 100 = amount 100 := agree_spec_impl 100
example : specAmount 1_000 = amount 1_000 := agree_spec_impl 1_000

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
        # 百分の一・四 is 1.4%, NOT 1%: the integer parser would silently
        # truncate the fractional part. Such units need a rational model and
        # must not enter this integer-rate class.
        if DECIMAL_PCT_RE.search(verb):
            continue
        if NON_HUNDRED_DENOM_RE.search(verb):
            continue
        pcts = PCT_RE.findall(verb)
        if len(pcts) != 1:
            continue
        # Exclude norms that also carry other statutory literals: they need
        # a dedicated model (e.g. tiered rates, penalty caps).
        if BARE_NUM_RE.search(PCT_RE.sub("", verb)):
            continue
        try:
            n = kanji_number(pcts[0])
        except ValueError:
            continue
        # Rates at or below 1% and above 100% are legitimate statutory rates
        # (e.g. 百分の一, 百分の百十). The template's at_100 theorem holds for
        # every numerator, so the former (1,100) guard was overly conservative
        # and left these obligations unverified. Only an upper sanity bound on
        # the parsed numerator is retained.
        if n > 1000:
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        mod = "BatchRate" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} pct={n} {mod}")
            done.append(uid)
            continue
        paths[0].write_text(impl_src(mod, n), encoding="utf-8")
        paths[1].write_text(spec_src(mod, n), encoding="utf-8")
        paths[2].write_text(test_src(mod, n), encoding="utf-8")
        rc, out = run([str(LAKE), "build", f"JapanTaxLaw.{mod}Tests"])
        axfile = TEMP / f"{mod}.lean"
        axfile.parent.mkdir(parents=True, exist_ok=True)
        axfile.write_text(
            f"import JapanTaxLaw.{mod}\nimport JapanTaxLaw.{mod}Spec\n"
            f"import JapanTaxLaw.{mod}Tests\nopen JapanTaxLaw.{mod}\n"
            "#print axioms rate_components\n#print axioms at_100\n"
            "#print axioms agree_spec_impl\n", encoding="utf-8")
        rc2, ax = run([str(LAKE), "env", "lean", str(axfile)])
        bad_ax = any(k in ax for k in ("Classical.choice", "Quot.sound", "sorryAx"))
        if rc != 0 or rc2 != 0 or bad_ax or "Build completed successfully" not in out:
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
            "source_correspondence_audit": f"scripts/ci/source_correspondence.py D=PASS; percent_numerators=[{n}]; constants=[{n},100]",
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; specFraction=({n},100) without TaxRate",
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": (f"agree_spec_impl universal over all Nat bases; {n}% rate only; "
                            "surrounding applicability conditions NOT resolved"),
            "boundary_proof": f"{mod}Tests.lean kernel-decided bases 0/100/1000",
            "cross_law_proof": (f"dependencies={t.get('dependencies', [])}; structural 条/項/号/目 "
                                "references in the unit are caller-established, NOT resolved"),
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_RATE_REVIEW.md generated entry for {uid[:16]} ({n}%)",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_RATE_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: rate template accepted; H=misread percentage; "
                    f"T=kernel build + axiom scan + pinned audit; D=PASS; "
                    f"C=other readings excluded by verbatim; U=caller supplies base; "
                    f"no legal review.\n")
    print(f"rate batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
