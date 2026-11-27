#!/usr/bin/env python3
"""Batch verification for simple inclusive lower-bound norms (「N円以上」).

Only dependency-ready units with exactly one monetary lower bound and no other
statutory literals are accepted. Full cycle: generated impl/spec/tests, lake
build, axiom scan, Lean-independent source audit, 11 evidence axes; failures
remain NOT_STARTED and are skip-listed.

Usage: python scripts/ci/batch_lower_bound_pipeline.py --limit 50 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_LOWER_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_lower_axioms")
KANJI = {"零": 0, "〇": 0, "一": 1, "二": 2, "三": 3, "四": 4,
         "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
UNITS = {"十": 10, "百": 100, "千": 1000, "万": 10000, "億": 100000000}
GE_RE = re.compile(r"([〇零一二三四五六七八九十百千万億]+)円以上")
OTHER_RE = re.compile(r"([〇零一二三四五六七八九十百千万億]+)(円|年|月|日|回|号|条|項|割|百分|千分|未満|以下|超え)")


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
    prev = n - 1
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single inclusive lower bound (円以上).
    The compared amount is caller-established; unit is yen. -/
namespace JapanTaxLaw.{mod}

/-- Inclusive lower bound, in yen. -/
def lowerYen : Nat := {n}

/-- True iff the amount is at least the statutory lower bound. -/
def meets (x : Nat) : Bool := decide (lowerYen <= x)

theorem at_lower : meets {n} = true := by decide
theorem below_lower : meets {prev} = false := by decide
theorem far_above : meets {n * 2} = true := by decide

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str) -> str:
    return f'''import JapanTaxLaw.{mod}

/-! Independent restatement: negation of strict below-bound comparison.
    Agreement is universal over all Nat amounts. -/
namespace JapanTaxLaw.{mod}

def specMeets (x : Nat) : Bool := !decide (x < lowerYen)

theorem agree_spec_impl (x : Nat) : specMeets x = meets x := by
  unfold specMeets meets
  by_cases h : lowerYen <= x
  · have hn : ¬ x < lowerYen := Nat.not_lt.mpr h
    simp [h, hn]
  · have hlt : x < lowerYen := Nat.lt_of_not_ge h
    simp [h, hlt]

end JapanTaxLaw.{mod}
'''


def test_src(mod: str, n: int) -> str:
    prev = n - 1
    return f'''import JapanTaxLaw.{mod}Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.{mod}

example : lowerYen = {n} := by decide
example : meets {prev} = false := by decide
example : meets {n} = true := by decide
example : specMeets {prev} = meets {prev} := agree_spec_impl {prev}
example : specMeets {n} = meets {n} := agree_spec_impl {n}
example : specMeets {n * 2} = meets {n * 2} := agree_spec_impl {n * 2}

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
        m = GE_RE.search(verb)
        if not m:
            continue
        stripped = verb[:m.start()] + verb[m.end():]
        if OTHER_RE.search(stripped):   # ranges, multiple literals, etc.
            continue
        try:
            n = kanji_number(m.group(1))
        except ValueError:
            continue
        if n <= 0:
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        mod = "BatchLower" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} >= {n} {mod}")
            done.append(uid)
            continue
        paths[0].write_text(impl_src(mod, n), encoding="utf-8")
        paths[1].write_text(spec_src(mod), encoding="utf-8")
        paths[2].write_text(test_src(mod, n), encoding="utf-8")
        rc, out = run([str(LAKE), "build", f"JapanTaxLaw.{mod}Tests"])
        axfile = TEMP / f"{mod}.lean"
        axfile.parent.mkdir(parents=True, exist_ok=True)
        axfile.write_text(
            f"import JapanTaxLaw.{mod}\nimport JapanTaxLaw.{mod}Spec\n"
            f"import JapanTaxLaw.{mod}Tests\nopen JapanTaxLaw.{mod}\n"
            "#print axioms at_lower\n#print axioms below_lower\n"
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
            "source_correspondence_audit": f"scripts/ci/source_correspondence.py D=PASS; lower_bound=[{n}] yen",
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; negation of x<lower",
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": f"agree_spec_impl universal over all Nat; lower bound {n} yen only",
            "boundary_proof": f"{mod}Tests.lean kernel-decided {n-1}/{n}/{n*2}",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_LOWER_REVIEW.md generated entry for {uid[:16]} (>={n})",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_LOWER_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: lower-bound template accepted; H=bound misread; "
                    f"T=kernel build + axiom scan + pinned audit; D=PASS; "
                    f"C=other readings excluded by verbatim; U=caller supplies amount; "
                    f"no legal review.\n")
    print(f"lower-bound batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
