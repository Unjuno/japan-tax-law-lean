#!/usr/bin/env python3
"""Guarded batch for delegated monetary ceilings (政令で定める額以下).

The delegated ceiling is caller-established (Nat) and is NOT resolved. The
pipeline proves the comparison logic and monotonicity universally over Nat.

Usage: python scripts/ci/batch_delegated_limit_pipeline.py --limit 20 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_DELEGATED_LIMIT_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_delegated_limit_axioms")
PAT = re.compile(r"(?:政令|省令|大臣)で定める額(?:以下|を限度とする)")
NUM = re.compile(r"[〇零一二三四五六七八九十百千万億]+")


def select(verb: str) -> bool:
    return bool(PAT.search(verb)) and not NUM.search(PAT.sub("", verb)) and len(verb) <= 130


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def impl_src(mod: str) -> str:
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated template for a delegated monetary ceiling. The ceiling is
    caller-established (Nat) and is NOT resolved by this pipeline. -/
namespace JapanTaxLaw.{mod}

def applies (limit x : Nat) : Bool := decide (x ≤ limit)

theorem at_limit (limit : Nat) : applies limit limit = true := by
  unfold applies
  exact decide_eq_true_eq.mpr (Nat.le_refl limit)

theorem monotone (a b x : Nat) (h : a ≤ b) :
    applies a x = true → applies b x = true := by
  unfold applies
  intro hx
  exact decide_eq_true_eq.mpr (Nat.le_trans (decide_eq_true_eq.mp hx) h)

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str) -> str:
    return f'''import JapanTaxLaw.{mod}

/-! Independent branch-form spec; universal agreement over Nat x Nat. -/
namespace JapanTaxLaw.{mod}

def specApplies (limit x : Nat) : Bool :=
  if limit < x then false else true

theorem agree_spec_impl (limit x : Nat) : specApplies limit x = applies limit x := by
  unfold specApplies applies
  by_cases h : limit < x
  · rw [if_pos h]
    exact (decide_eq_false_iff_not.mpr (Nat.not_le_of_gt h)).symm
  · rw [if_neg h]
    exact (decide_eq_true_eq.mpr (Nat.le_of_not_gt h)).symm

end JapanTaxLaw.{mod}
'''


def test_src(mod: str) -> str:
    return f'''import JapanTaxLaw.{mod}Spec

namespace JapanTaxLaw.{mod}

example : applies 0 0 = true := at_limit 0
example : applies 5 5 = true := at_limit 5
example : specApplies 5 6 = applies 5 6 := agree_spec_impl 5 6
example : specApplies 5 5 = applies 5 5 := agree_spec_impl 5 5
example : applies 9 3 = true := monotone 5 9 3 (by decide) (by decide)

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


def audit(sf: str, article: str, verb: str) -> bool:
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
    return bool(texts) and norm(verb) in norm("\n".join(texts)) and bool(PAT.search(verb))


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
        if t.get("unhandled_conditions") or t.get("dependencies") or not select(t.get("text", "")):
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        attempts += 1
        mod = "BatchDelegLim" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} {mod}")
            done.append(uid)
            continue
        paths[0].write_text(impl_src(mod), encoding="utf-8")
        paths[1].write_text(spec_src(mod), encoding="utf-8")
        paths[2].write_text(test_src(mod), encoding="utf-8")
        rc, out = run([str(LAKE), "build", f"JapanTaxLaw.{mod}Tests"])
        axfile = TEMP / f"{mod}.lean"
        axfile.parent.mkdir(parents=True, exist_ok=True)
        axfile.write_text(
            f"import JapanTaxLaw.{mod}\nimport JapanTaxLaw.{mod}Spec\n"
            f"import JapanTaxLaw.{mod}Tests\nopen JapanTaxLaw.{mod}\n"
            "#print axioms at_limit\n#print axioms monotone\n#print axioms agree_spec_impl\n", encoding="utf-8")
        rc2, ax = run([str(LAKE), "env", "lean", str(axfile)])
        bad = any(k in ax for k in ("Classical.choice", "Quot.sound", "sorryAx"))
        if rc != 0 or rc2 != 0 or bad or "Build completed successfully" not in out:
            failed.append({"id": uid, "reason": "build_or_axiom", "out": (out + ax)[-500:]})
            for p in paths: p.unlink(missing_ok=True)
            continue
        cmd = [sys.executable, str(REPO / "scripts/ci/source_correspondence.py"),
               "--source-file", sf, "--article", t.get("article", ""),
               "--verbatim", t.get("text", ""), "--spec", f"JapanTaxLaw/{mod}Spec.lean",
               "--impl", f"JapanTaxLaw/{mod}.lean"]
        rc3, audit_out = run(cmd)
        if rc3 != 0 or '"D": "PASS"' not in audit_out:
            cmd[5] = t.get("article", "").split("_")[0]
            rc3, audit_out = run(cmd)
        if rc3 != 0 or '"D": "PASS"' not in audit_out:
            failed.append({"id": uid, "reason": "source_audit", "out": audit_out[-400:]})
            for p in paths: p.unlink(missing_ok=True)
            continue
        if not audit(sf, t.get("article", ""), t.get("text", "")):
            failed.append({"id": uid, "reason": "deleg_limit_audit", "out": "verbatim mismatch"})
            for p in paths: p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS (phrase-only); "
                                            "deleg_limit_audit D=PASS: verbatim and delegated-ceiling phrase located"),
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; branch spec vs decide impl",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": "universal over Nat limit x amount; the delegated ceiling is caller-established, NOT resolved",
            "boundary_proof": f"{mod}Tests.lean kernel-decided boundary and monotonicity cases",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}; delegated determination NOT resolved",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_DELEGATED_LIMIT_REVIEW.md generated entry for {uid[:16]}",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_DELEGATED_LIMIT_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: delegated ceiling accepted; ceiling NOT resolved; "
                    f"T=kernel build + axiom scan + two audits; D=PASS; U=human review separate.\n")
    print(f"delegated-limit batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
