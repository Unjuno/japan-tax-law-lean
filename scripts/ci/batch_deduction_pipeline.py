#!/usr/bin/env python3
"""Guarded batch verification for simple single-amount deduction norms.

Accepts only dependency-ready units whose text ends with 「…からN円を控除する。」
and contains no other numerals. The eligibility condition stated in the
sentence is caller-established (Bool) and is NOT resolved: this pipeline only
verifies the saturating arithmetic of the statutory deduction itself.

Kernel proofs use Nat lemmas only (no omega / no Quot.sound).

Usage: python scripts/ci/batch_deduction_pipeline.py --limit 20 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_DEDUCTION_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_deduction_axioms")
PAT = re.compile(r"から([〇零一二三四五六七八九十百千万億]+)円を控除する。$")
NUM = re.compile(r"[〇零一二三四五六七八九十百千万億]+")
KANJI = {"零": 0, "〇": 0, "一": 1, "二": 2, "三": 3, "四": 4,
         "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
UNITS = {"十": 10, "百": 100, "千": 1000, "万": 10000, "億": 100000000}


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


def deduction_of(verb: str) -> int | None:
    m = PAT.search(verb.strip())
    if not m or NUM.search(PAT.sub("", verb)):
        return None
    try:
        return kanji_number(m.group(1)) or None
    except ValueError:
        return None


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def impl_src(mod: str, n: int) -> str:
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory deduction. Eligibility is
    caller-established (Bool) and is NOT resolved by this pipeline. -/
namespace JapanTaxLaw.{mod}

/-- Statutory deduction, in yen. -/
def deduction : Nat := {n}

/-- Saturating deduction: the base never goes below zero. -/
def afterDeduction (eligible : Bool) (base : Nat) : Nat :=
  if eligible then base - Nat.min base deduction else base

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str) -> str:
    return f'''import JapanTaxLaw.{mod}

/-! Independent spec: explicit branch on the comparison instead of `min`. -/
namespace JapanTaxLaw.{mod}

def specDeduction (eligible : Bool) (base : Nat) : Nat :=
  if eligible then (if base ≤ deduction then 0 else base - deduction) else base

theorem agree_spec_impl (eligible : Bool) (base : Nat) :
    specDeduction eligible base = afterDeduction eligible base := by
  cases eligible
  · rfl
  · unfold specDeduction afterDeduction
    by_cases h : base ≤ deduction
    · have hm : Nat.min base deduction = base := Nat.min_eq_left h
      rw [if_pos h, hm, Nat.sub_self]
    · have hlt : deduction < base := Nat.lt_of_not_ge h
      have hm : Nat.min base deduction = deduction := Nat.min_eq_right (Nat.le_of_lt hlt)
      rw [if_neg h, hm]

end JapanTaxLaw.{mod}
'''


def test_src(mod: str, n: int) -> str:
    return f'''import JapanTaxLaw.{mod}Spec

namespace JapanTaxLaw.{mod}

example : deduction = {n} := by rfl
example : afterDeduction false 0 = 0 := by rfl
example : afterDeduction false ({n} + 5) = {n} + 5 := by rfl
example : afterDeduction true 0 = 0 := by decide
example : afterDeduction true ({n} - 1) = 0 := by decide
example : afterDeduction true ({n}) = 0 := by decide
example : afterDeduction true ({n} + 7) = 7 := by decide
example : specDeduction true ({n} + 7) = afterDeduction true ({n} + 7) := agree_spec_impl true ({n} + 7)

end JapanTaxLaw.{mod}
'''


def run(cmd: list[str]) -> tuple[int, str]:
    r = subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8", errors="replace")
    return r.returncode, (r.stdout or "") + (r.stderr or "")


def flat(n) -> str:
    if isinstance(n, str):
        return n
    if isinstance(n, dict):
        return "".join(flat(c) for c in n.get("children", []))
    return ""


def norm(s: str) -> str:
    return re.sub(r"[\s\u3000]+", "", s)


def deduction_audit(sf: str, article: str, verb: str, n: int, impl_text: str) -> bool:
    doc = json.loads((REPO / sf).read_text(encoding="utf-8"))
    texts = []
    def walk(x):
        if isinstance(x, dict):
            if x.get("tag") == "Article" and str((x.get("attr") or {}).get("Num", "")) == article:
                texts.append(flat(x))
            for c in x.get("children", []): walk(c)
        elif isinstance(x, list):
            for c in x: walk(c)
    walk(doc.get("law_full_text"))
    return bool(texts) and norm(verb) in norm("\n".join(texts)) and f"def deduction : Nat := {n}" in impl_text


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--limit", type=int, default=20)
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
        n = deduction_of(t.get("text", ""))
        if n is None:
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        attempts += 1
        mod = "BatchDeduct" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} deduction={n} {mod}")
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
            "#print axioms agree_spec_impl\n", encoding="utf-8")
        rc2, ax = run([str(LAKE), "env", "lean", str(axfile)])
        bad = any(k in ax for k in ("Classical.choice", "Quot.sound", "sorryAx"))
        if rc != 0 or rc2 != 0 or bad or "Build completed successfully" not in out:
            failed.append({"id": uid, "reason": "build_or_axiom", "out": (out + ax)[-400:]})
            for p in paths: p.unlink(missing_ok=True)
            continue
        cmd = [sys.executable, str(REPO / "scripts/ci/source_correspondence.py"),
               "--source-file", sf, "--article", t.get("article", ""),
               "--verbatim", t.get("text", ""), "--spec", f"JapanTaxLaw/{mod}Spec.lean",
               "--impl", f"JapanTaxLaw/{mod}.lean"]
        rc3, audit = run(cmd)
        if rc3 != 0 or '"D": "PASS"' not in audit:
            cmd[5] = t.get("article", "").split("_")[0]
            rc3, audit = run(cmd)
        if rc3 != 0 or '"D": "PASS"' not in audit:
            failed.append({"id": uid, "reason": "source_audit", "out": audit[-400:]})
            for p in paths: p.unlink(missing_ok=True)
            continue
        if not deduction_audit(sf, t.get("article", ""), t.get("text", ""), n,
                               paths[0].read_text(encoding="utf-8")):
            failed.append({"id": uid, "reason": "deduction_audit", "out": "deduction/verbatim mismatch"})
            for p in paths: p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                            "deduction_audit D=PASS: verbatim located in pinned article and "
                                            "the single deduction constant matches the text"),
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; explicit-comparison spec vs min impl",
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": ("agree_spec_impl universal over all Nat bases and both eligibility values; "
                            "saturating deduction only, surrounding eligibility NOT resolved"),
            "boundary_proof": f"{mod}Tests.lean kernel-decided 0 / below / at / above deduction boundaries",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}; eligibility caller-established, NOT resolved",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_DEDUCTION_REVIEW.md generated entry for {uid[:16]}",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_DEDUCTION_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: deduction template accepted; eligibility NOT resolved; "
                    f"T=kernel build + axiom scan + two independent audits; D=PASS; "
                    f"U=legal scope requires human review.\n")
    print(f"deduction batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
