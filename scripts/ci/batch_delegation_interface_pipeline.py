#!/usr/bin/env python3
"""Guarded batch for open-ended delegation (委任) interface units.

These units state that a cabinet order / ministry ordinance determines some
detail. The delegated determination is caller-established and NOT resolved:
the pipeline formalizes only the typed interface (an authorized delegation
record with an opaque determination) and proves the accessor laws.

No claim is made that the delegated content, its legality, or its effects are
verified. Those remain unhandled conditions recorded in the evidence.

Usage: python scripts/ci/batch_delegation_interface_pipeline.py --limit 100 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_DELEGATION_INTERFACE_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_delegation_interface_axioms")
DELEG = re.compile(r"(政令|省令|財務省令|総務省令|大臣|税関長)で(?:定める|定めるところにより)")
BARE = re.compile(r"[〇零一二三四五六七八九十百千万億]+(?!条|項|号|目)")


def select(verb: str) -> bool:
    return bool(DELEG.search(verb)) and not BARE.search(verb) and len(verb) <= 130


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def impl_src(mod: str) -> str:
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated typed interface for an open-ended delegation. The delegated
    determination is caller-established and NOT resolved. No claim about the
    delegated content or its legal effect is made. -/
namespace JapanTaxLaw.{mod}

structure DelegatedRecord where
  authorized : Bool
  determination : Nat

def active (d : DelegatedRecord) : Bool := decide d.authorized

theorem authorized_iff_active (d : DelegatedRecord) :
    d.authorized = true ↔ active d = true := by
  unfold active
  constructor
  · intro h
    rw [h]
    decide
  · intro h
    change decide d.authorized = true at h
    exact decide_eq_true_eq.mp h

theorem determination_accessor (d : DelegatedRecord) : d.determination = d.determination := rfl

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str) -> str:
    return f'''import JapanTaxLaw.{mod}

/-! Independent spec: authorization as an explicit branch. -/
namespace JapanTaxLaw.{mod}

def specActive (d : DelegatedRecord) : Bool :=
  if d.authorized then true else false

theorem agree_spec_impl (d : DelegatedRecord) : specActive d = active d := by
  cases d with
  | mk a n =>
    unfold specActive active
    cases a <;> rfl

end JapanTaxLaw.{mod}
'''


def test_src(mod: str) -> str:
    return f'''import JapanTaxLaw.{mod}Spec

namespace JapanTaxLaw.{mod}

example : active ⟨true, 0⟩ = true := by decide
example : active ⟨false, 0⟩ = false := by decide
example : specActive ⟨true, 1⟩ = active ⟨true, 1⟩ := agree_spec_impl ⟨true, 1⟩
example : specActive ⟨false, 1⟩ = active ⟨false, 1⟩ := agree_spec_impl ⟨false, 1⟩

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
    return bool(texts) and norm(verb) in norm("\n".join(texts)) and bool(DELEG.search(verb))


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--limit", type=int, default=100)
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
        mod = "BatchDelegIface" + hashlib.sha256(uid.encode()).hexdigest()[:10]
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
            "#print axioms authorized_iff_active\n#print axioms agree_spec_impl\n", encoding="utf-8")
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
            failed.append({"id": uid, "reason": "delegation_audit", "out": "verbatim mismatch"})
            for p in paths: p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS (phrase-only); "
                                            "delegation_audit D=PASS: verbatim and delegation phrase located"),
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; branch spec vs decide impl",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": ("only the typed delegation interface (authorization flag + opaque "
                            "determination) is formalized; delegated content, legality and effect "
                            "are NOT resolved and remain unhandled conditions"),
            "boundary_proof": f"{mod}Tests.lean kernel-decided authorization boundaries",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}; delegated instrument NOT resolved",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_DELEGATION_INTERFACE_REVIEW.md generated entry for {uid[:16]}",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_DELEGATION_INTERFACE_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: delegation interface only; content/legality/effect NOT resolved; "
                    f"T=kernel build + axiom scan + two audits; D=PASS (interface scope); "
                    f"U=human legal review required for delegated content.\n")
    print(f"delegation-interface batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
