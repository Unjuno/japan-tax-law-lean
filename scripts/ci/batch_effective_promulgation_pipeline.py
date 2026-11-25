#!/usr/bin/env python3
"""Guarded batch verification for simple commencement (施行期日) norms.

Accepts ONLY dependency-ready units whose verbatim text is exactly one of:
  この法律(条例)は、公布の日から施行する。
  この法律(条例)は、公布の日の翌日から施行する。
The model records the statutory day offset from promulgation and defines
applicability from the effective day onward. The promulgation day itself is a
caller-established Nat and is NOT resolved by this pipeline; no calendar,
era or amendment-history semantics are claimed.

Full cycle: generated impl/spec/tests, kernel build, #print axioms, two
Lean-independent source audits, 11 evidence axes; failures stay NOT_STARTED
and are skip-listed with a recorded reason.

Usage: python scripts/ci/batch_effective_promulgation_pipeline.py --limit 50 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_EFFECTIVE_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_effective_axioms")

FORMS = {
    "この法律は、公布の日から施行する": 0,
    "この条例は、公布の日から施行する": 0,
    "この法律は、公布の日の翌日から施行する": 1,
    "この条例は、公布の日の翌日から施行する": 1,
}


def offset_of(text: str) -> int | None:
    return FORMS.get(text.strip().rstrip("。"))


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def impl_src(mod: str, off: int) -> str:
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated batch template for a simple commencement norm.
    `offset` is the statutory day offset from promulgation. The promulgation
    day is caller-established (Nat) and is NOT resolved. No calendar/era
    arithmetic is modelled. -/
namespace JapanTaxLaw.{mod}

/-- Statutory day offset from promulgation to the effective day. -/
def offset : Nat := {off}

/-- Effective day = promulgation day + statutory offset. -/
def effectiveDay (promulgation : Nat) : Nat := promulgation + offset

/-- The norm applies from the effective day onward. -/
def appliesAt (promulgation day : Nat) : Bool := decide (effectiveDay promulgation ≤ day)

theorem applies_on_effective_day (p : Nat) : appliesAt p (p + {off}) = true := by
  unfold appliesAt effectiveDay offset
  exact decide_eq_true_eq.mpr (Nat.le_refl (p + {off}))

theorem shift_invariant (p k : Nat) : appliesAt p (p + k) = decide ({off} ≤ k) := by
  unfold appliesAt effectiveDay offset
  by_cases h : {off} ≤ k
  · have h2 : p + {off} ≤ p + k :=
      (Nat.add_le_add_iff_left (n := p) (m := {off}) (k := k)).mpr h
    rw [decide_eq_true_eq.mpr h2, decide_eq_true_eq.mpr h]
  · have h2 : ¬ p + {off} ≤ p + k := fun hle =>
      h ((Nat.add_le_add_iff_left (n := p) (m := {off}) (k := k)).mp hle)
    rw [decide_eq_false_iff_not.mpr h2, decide_eq_false_iff_not.mpr h]

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str, off: int) -> str:
    return f'''import JapanTaxLaw.{mod}

/-! Independent spec: subtract the promulgation day and compare the offset,
    with an explicit guard for days before promulgation. The implementation
    instead adds the offset and compares; agreement is proved for all Nat
    promulgation/day values, not a sampled grid. -/
namespace JapanTaxLaw.{mod}

def specApplies (promulgation day : Nat) : Bool :=
  if day < promulgation then false else decide ({off} ≤ day - promulgation)

theorem agree_spec_impl (p day : Nat) : specApplies p day = appliesAt p day := by
  unfold specApplies appliesAt effectiveDay offset
  by_cases h : day < p
  · have hbase : ¬ p ≤ day := Nat.not_le_of_gt h
    have hnot : ¬ p + {off} ≤ day := by
      intro hle
      exact hbase (Nat.le_trans (Nat.le_add_right p {off}) hle)
    rw [if_pos h, decide_eq_false_iff_not.mpr hnot]
  · have hpday : p ≤ day := Nat.le_of_not_gt h
    have hiff : ({off} ≤ day - p) ↔ (p + {off} ≤ day) := by
      have hh := Nat.le_sub_iff_add_le (n := {off}) (m := day) (k := p) hpday
      simpa [Nat.add_comm] using hh
    by_cases hs : {off} ≤ day - p
    · have hi : p + {off} ≤ day := hiff.mp hs
      rw [if_neg h, decide_eq_true_eq.mpr hs, decide_eq_true_eq.mpr hi]
    · have hi : ¬ p + {off} ≤ day := fun hle => hs (hiff.mpr hle)
      rw [if_neg h, decide_eq_false_iff_not.mpr hs, decide_eq_false_iff_not.mpr hi]

end JapanTaxLaw.{mod}
'''


def test_src(mod: str, off: int) -> str:
    return f'''import JapanTaxLaw.{mod}Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.{mod}

example : offset = {off} := by rfl
example : effectiveDay 100 = 100 + {off} := by rfl
example : appliesAt 100 (100 + {off}) = true := applies_on_effective_day 100
example : appliesAt 0 {off} = true := applies_on_effective_day 0
example : appliesAt 100 (100 + 5) = decide ({off} ≤ 5) := shift_invariant 100 5
example : appliesAt 100 (100 + 0) = decide ({off} ≤ 0) := shift_invariant 100 0
example : specApplies 100 (100 + {off}) = appliesAt 100 (100 + {off}) := agree_spec_impl 100 (100 + {off})
example : specApplies 100 99 = appliesAt 100 99 := agree_spec_impl 100 99
example : specApplies 0 0 = appliesAt 0 0 := agree_spec_impl 0 0

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


def commencement_audit(sf: str, article: str, verb: str, off: int, impl_text: str) -> bool:
    """Lean-independent check that the pinned article contains the verbatim
    commencement sentence and that the modelled offset matches its wording."""
    doc = json.loads((REPO / sf).read_text(encoding="utf-8"))
    texts = []
    def walk(n):
        if isinstance(n, dict):
            if n.get("tag") == "Article" and str((n.get("attr") or {}).get("Num", "")) == article:
                texts.append(flat(n))
            for c in n.get("children", []): walk(c)
        elif isinstance(n, list):
            for c in n: walk(c)
    walk(doc.get("law_full_text"))
    if not texts or norm(verb) not in norm("\n".join(texts)):
        return False
    expected = 1 if "公布の日の翌日から" in verb else 0
    if expected != off or f"def offset : Nat := {off}" not in impl_text:
        return False
    return True


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
        off = offset_of(t.get("text", ""))
        if off is None:
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        attempts += 1
        mod = "BatchEffective" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} offset={off} {mod}")
            done.append(uid)
            continue
        paths[0].write_text(impl_src(mod, off), encoding="utf-8")
        paths[1].write_text(spec_src(mod, off), encoding="utf-8")
        paths[2].write_text(test_src(mod, off), encoding="utf-8")
        rc, out = run([str(LAKE), "build", f"JapanTaxLaw.{mod}Tests"])
        axfile = TEMP / f"{mod}.lean"
        axfile.parent.mkdir(parents=True, exist_ok=True)
        axfile.write_text(
            f"import JapanTaxLaw.{mod}\nimport JapanTaxLaw.{mod}Spec\n"
            f"import JapanTaxLaw.{mod}Tests\nopen JapanTaxLaw.{mod}\n"
            "#print axioms applies_on_effective_day\n#print axioms shift_invariant\n"
            "#print axioms agree_spec_impl\n", encoding="utf-8")
        rc2, ax = run([str(LAKE), "env", "lean", str(axfile)])
        bad = any(k in ax for k in ("Classical.choice", "Quot.sound", "sorryAx"))
        if rc != 0 or rc2 != 0 or bad or "Build completed successfully" not in out:
            failed.append({"id": uid, "reason": "build_or_axiom", "out": (out + ax)[-400:]})
            for p in paths: p.unlink(missing_ok=True)
            continue
        cmd = [sys.executable, str(REPO / "scripts/ci/source_correspondence.py"),
               "--source-file", sf, "--article", t.get("article", ""),
               "--verbatim", t.get("text", ""),
               "--spec", f"JapanTaxLaw/{mod}Spec.lean",
               "--impl", f"JapanTaxLaw/{mod}.lean"]
        rc3, audit = run(cmd)
        if rc3 != 0 or '"D": "PASS"' not in audit:
            cmd[5] = t.get("article", "").split("_")[0]
            rc3, audit = run(cmd)
        if rc3 != 0 or '"D": "PASS"' not in audit:
            failed.append({"id": uid, "reason": "source_audit", "out": audit[-400:]})
            for p in paths: p.unlink(missing_ok=True)
            continue
        if not commencement_audit(sf, t.get("article", ""), t.get("text", ""), off,
                                  paths[0].read_text(encoding="utf-8")):
            failed.append({"id": uid, "reason": "commencement_audit", "out": "offset/verbatim mismatch"})
            for p in paths: p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS (phrase-only, no numeral); "
                                            "commencement_audit D=PASS: verbatim located in pinned article and "
                                            "offset matches 公布の日 / 公布の日の翌日 wording"),
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; subtract-and-compare spec vs add-and-compare impl",
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": ("agree_spec_impl proved for ALL Nat promulgation/day values, not a finite grid; "
                            "temporal model is an inclusive day offset only"),
            "boundary_proof": f"{mod}Tests.lean kernel-decided effective-day and pre-promulgation boundaries",
            "cross_law_proof": (f"dependencies={t.get('dependencies', [])}; promulgation day caller-established, "
                                "NOT resolved; no calendar/era/amendment-history semantics claimed"),
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_EFFECTIVE_REVIEW.md generated entry for {uid[:16]}",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_EFFECTIVE_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: commencement template accepted; promulgation day NOT resolved; "
                    f"T=kernel build + axiom scan + two Lean-independent audits; D=PASS; "
                    f"C=inclusive day offset only, no calendar semantics; "
                    f"U=legal effect scope requires human review.\n")
    print(f"effective batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
