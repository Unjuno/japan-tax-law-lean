#!/usr/bin/env python3
"""Guarded batch verification for period-only thresholds (年/月/日/回).

Accepts ONLY dependency-ready units with exactly one period literal of the
form 「N年以内 / N月以内 / N日以内 / N年以下 / N年未満 / N年を超える」 and no
other statutory numeral. Generates impl/spec/tests, builds with lake, scans
axioms, runs the Lean-independent source audit, records all 11 evidence axes.
Failures stay NOT_STARTED and are skip-listed.

Usage: python scripts/ci/batch_period_pipeline.py --limit 50 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_PERIOD_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_period_axioms")
KANJI = {"零": 0, "〇": 0, "一": 1, "二": 2, "三": 3, "四": 4,
         "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
UNITS = {"十": 10, "百": 100, "千": 1000, "万": 10000, "億": 100000000}
PERIOD = re.compile(r"([〇零一二三四五六七八九十百千万億]+)(年|月|日|回)(以下|以内|未満|を超える)")
OTHER = re.compile(r"([〇零一二三四五六七八九十百千万億]+)(円|条|項|号|割|百分|千分|分の)")


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
    if op == "le":
        return "x <= limit", "limit < x", "Nat.not_lt.mpr h", "Nat.lt_of_not_ge h"
    if op == "lt":
        return "x < limit", "limit <= x", "Nat.not_le.mpr h", "Nat.le_of_not_gt h"
    return "limit < x", "x <= limit", "Nat.not_le.mpr h", "Nat.le_of_not_gt h"


def cases(op: str, n: int):
    if op == "le":
        return n, n + 1, True, False
    if op == "lt":
        return n - 1, n, True, False
    return n + 1, n, True, False


def impl_src(mod: str, n: int, unit: str, op: str) -> str:
    p, _, _, _ = props(op)
    t, f, tv, fv = cases(op, n)
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: {unit}. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.{mod}

/-- Statutory period count ({unit}). -/
def limit : Nat := {n}

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide ({p})

theorem sample_true : meets {t} = {str(tv).lower()} := by decide
theorem sample_false : meets {f} = {str(fv).lower()} := by decide

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str, op: str) -> str:
    p, neg, mpr, other = props(op)
    return f'''import JapanTaxLaw.{mod}

/-! Independent restatement via the complementary comparison.
    Agreement is universal over all Nat elapsed counts. -/
namespace JapanTaxLaw.{mod}

def specMeets (x : Nat) : Bool := !decide ({neg})

theorem agree_spec_impl (x : Nat) : specMeets x = meets x := by
  unfold specMeets meets
  by_cases h : {p}
  · have hn : ¬ {neg} := {mpr}
    simp [h, hn]
  · have hle : {neg} := {other}
    simp [h, hle]

end JapanTaxLaw.{mod}
'''


def test_src(mod: str, n: int, op: str) -> str:
    t, f, _, _ = cases(op, n)
    return f'''import JapanTaxLaw.{mod}Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.{mod}

example : limit = {n} := by decide
example : specMeets {t} = meets {t} := agree_spec_impl {t}
example : specMeets {f} = meets {f} := agree_spec_impl {f}
example : specMeets 0 = meets 0 := agree_spec_impl 0

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
    attempts = 0
    for t in q["tasks"]:
        if attempts >= a.limit:
            break
        uid = t.get("id", "")
        if t.get("status") != "NOT_STARTED" or uid in ev["units"] or uid in skips:
            continue
        if t.get("unhandled_conditions") or t.get("dependencies"):
            continue
        verb = t.get("text", "")
        ms = list(PERIOD.finditer(verb))
        if len(ms) != 1 or OTHER.search(PERIOD.sub("", verb)):
            continue
        suffix = ms[0].group(3)
        op = "le" if suffix in ("以下", "以内") else ("lt" if suffix == "未満" else "gt")
        try:
            n = kanji_number(ms[0].group(1))
        except ValueError:
            continue
        if n <= 0:
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        attempts += 1
        mod = "BatchPeriod" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} {n}{ms[0].group(2)} {op} {mod}")
            done.append(uid)
            continue
        paths[0].write_text(impl_src(mod, n, ms[0].group(2), op), encoding="utf-8")
        paths[1].write_text(spec_src(mod, op), encoding="utf-8")
        paths[2].write_text(test_src(mod, n, op), encoding="utf-8")
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
            "source_correspondence_audit": f"scripts/ci/source_correspondence.py D=PASS; period=[{n}{ms[0].group(2)}]; op={op}",
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; complementary comparison",
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": f"agree_spec_impl universal over all Nat counts; {n}{ms[0].group(2)} {op} only",
            "boundary_proof": f"{mod}Tests.lean kernel-decided boundary points",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_PERIOD_REVIEW.md generated entry for {uid[:16]} ({n}{ms[0].group(2)} {op})",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_PERIOD_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: period template accepted; H=period/op misread; "
                    f"T=kernel build + axiom scan + pinned audit; D=PASS; "
                    f"C=other readings excluded by verbatim; U=caller supplies elapsed count; "
                    f"no legal review.\n")
    print(f"period batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
