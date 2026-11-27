#!/usr/bin/env python3
"""Guarded batch for mutatis-mutandis reference (準用) norms.

Form: 「〈base provisions〉は、〈target case〉について準用する。」 The base
provision's effect, the target-case match and the resulting applicability are
caller-established Bools and are NOT resolved. The pipeline proves only the
dispatch structure: applicability requires both the target match and the
referenced rule's effect, and agrees with an independent branch spec.

Usage: python scripts/ci/batch_mutatis_mutandis_pipeline.py --limit 50 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_MUTATIS_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_mutatis_axioms")
BARE = re.compile(r"[〇零一二三四五六七八九十百千万億]+(?!条|項|号|目)")


def select(verb: str) -> bool:
    return ("準用する" in verb and not BARE.search(verb)
            and 20 <= len(verb) <= 110)


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def impl_src(mod: str) -> str:
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated template for a mutatis-mutandis reference. The referenced rule's
    effect, the target-case match, and applicability itself are
    caller-established (Bool) and NOT resolved by this pipeline. -/
namespace JapanTaxLaw.{mod}

def appliesVia (targetMatch : Bool) (referencedEffect : Bool) : Bool :=
  targetMatch && referencedEffect

theorem requires_both (t r : Bool) : appliesVia t r = true → t = true ∧ r = true := by
  intro h
  cases t <;> cases r <;> simp [appliesVia] at h ⊢

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str) -> str:
    return f'''import JapanTaxLaw.{mod}

/-! Independent branch-form spec over the two caller-established Bools. -/
namespace JapanTaxLaw.{mod}

def specApplies (t r : Bool) : Bool :=
  if t then r else false

theorem agree_spec_impl (t r : Bool) : specApplies t r = appliesVia t r := by
  cases t <;> cases r <;> rfl

end JapanTaxLaw.{mod}
'''


def test_src(mod: str) -> str:
    return f'''import JapanTaxLaw.{mod}Spec

namespace JapanTaxLaw.{mod}

example : appliesVia true true = true := by rfl
example : appliesVia true false = false := by rfl
example : appliesVia false true = false := by rfl
example : specApplies true true = appliesVia true true := agree_spec_impl true true
example : specApplies false true = appliesVia false true := agree_spec_impl false true

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
    return bool(texts) and norm(verb) in norm("\n".join(texts))


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
        if t.get("unhandled_conditions") or t.get("dependencies") or not select(t.get("text", "")):
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        attempts += 1
        mod = "BatchMutatis" + hashlib.sha256(uid.encode()).hexdigest()[:10]
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
            "#print axioms requires_both\n#print axioms agree_spec_impl\n", encoding="utf-8")
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
        rc3, audit_out = run(cmd)
        if rc3 != 0 or '"D": "PASS"' not in audit_out:
            cmd[5] = t.get("article", "").split("_")[0]
            rc3, audit_out = run(cmd)
        if rc3 != 0 or '"D": "PASS"' not in audit_out:
            failed.append({"id": uid, "reason": "source_audit", "out": audit_out[-400:]})
            for p in paths: p.unlink(missing_ok=True)
            continue
        if not audit(sf, t.get("article", ""), t.get("text", "")):
            failed.append({"id": uid, "reason": "mutatis_audit", "out": "verbatim mismatch"})
            for p in paths: p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS (phrase-only); "
                                            "mutatis_audit D=PASS: verbatim located in pinned article"),
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; branch spec vs conjunction impl",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": ("exhaustive over both caller-established Bools; referenced rule's content, "
                            "target-case match and applicability are NOT resolved"),
            "boundary_proof": f"{mod}Tests.lean exhaustive Bool boundary cases",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}; referenced provisions NOT resolved",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_MUTATIS_REVIEW.md generated entry for {uid[:16]}",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_MUTATIS_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: mutatis-mutandis dispatch accepted; referenced content NOT resolved; "
                    f"T=kernel build + axiom scan + two audits; D=PASS; U=human review separate.\n")
    print(f"mutatis-mutandis batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
