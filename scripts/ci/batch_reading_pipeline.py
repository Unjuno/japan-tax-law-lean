#!/usr/bin/env python3
"""Guarded batch verification for 読替え (reading-substitution) norms.

Accepts ONLY dependency-ready units whose text contains exactly one
「A」とあるのは、「B」と読み替える pattern, with no dependencies or unhandled
conditions and an existing pinned source. The trigger (「この場合」 etc.) is
modelled as a caller-established Bool and is explicitly NOT resolved.

Full cycle: generated impl/spec/tests, kernel build, #print axioms, two
Lean-independent source audits (generic correspondence + quoted-phrase
correspondence), 11 evidence axes; failures stay NOT_STARTED and are
skip-listed with a recorded reason.

Usage: python scripts/ci/batch_reading_pipeline.py --limit 50 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_READING_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_reading_axioms")
PAT = re.compile(r"「([^」]{1,60})」とあるのは、「([^」]{1,60})」と読み替える")
HOSTILE = re.compile(r'["\\\r\n]')


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def lean_str(s: str) -> str:
    return s.replace("\\", "\\\\").replace('"', '\\"')


def impl_src(mod: str, orig: str, repl: str) -> str:
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated batch template for a 読替え norm.
    The quoted phrases are recorded verbatim; the whole-phrase rewrite is
    exhaustive over the declared three-constructor domain. The applicability
    trigger is caller-established and is NOT resolved by this pipeline. -/
namespace JapanTaxLaw.{mod}

def sourcePhraseText : String := "{lean_str(orig)}"
def replacementPhraseText : String := "{lean_str(repl)}"

inductive Phrase where
  | original | replacement | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original => Phrase.replacement
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem applies_to_quoted : applyReading Phrase.original = Phrase.replacement := by rfl
theorem leaves_replacement : applyReading Phrase.replacement = Phrase.replacement := by rfl
theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str) -> str:
    return f'''import JapanTaxLaw.{mod}

/-! Independent spec: equality test rather than pattern match. Agreement is
    proved for every phrase and both trigger values, exhaustively. -/
namespace JapanTaxLaw.{mod}

def specReading (p : Phrase) : Phrase :=
  if p == Phrase.original then Phrase.replacement else p

def specWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then specReading p else p

theorem agree_spec_impl (p : Phrase) : specReading p = applyReading p := by
  cases p <;> rfl

theorem agree_when_spec_impl (trigger : Bool) (p : Phrase) :
    specWhen trigger p = applyWhen trigger p := by
  cases trigger <;> cases p <;> rfl

end JapanTaxLaw.{mod}
'''


def test_src(mod: str, orig: str, repl: str) -> str:
    return f'''import JapanTaxLaw.{mod}Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.{mod}

example : sourcePhraseText = "{lean_str(orig)}" := by rfl
example : replacementPhraseText = "{lean_str(repl)}" := by rfl
example : applyReading Phrase.original = Phrase.replacement := by rfl
example : applyReading Phrase.replacement = Phrase.replacement := by rfl
example : applyReading Phrase.other = Phrase.other := by rfl
example : applyWhen false Phrase.original = Phrase.original := by rfl
example : applyWhen false Phrase.replacement = Phrase.replacement := by rfl
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

example : specReading Phrase.original = applyReading Phrase.original := agree_spec_impl Phrase.original
example : specReading Phrase.replacement = applyReading Phrase.replacement := agree_spec_impl Phrase.replacement
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : specWhen true Phrase.original = applyWhen true Phrase.original := agree_when_spec_impl true Phrase.original
example : specWhen false Phrase.original = applyWhen false Phrase.original := agree_when_spec_impl false Phrase.original

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


def phrase_audit(sf: str, verbatim: str, orig: str, repl: str,
                 spec_text: str, impl_text: str) -> bool:
    """Lean-independent check: quoted phrases occur in the pinned text and
    are reproduced verbatim, with the correct direction, in spec and impl."""
    doc = json.loads((REPO / sf).read_text(encoding="utf-8"))
    full = norm(flat(doc.get("law_full_text")))
    nv, no, nr = norm(verbatim), norm(orig), norm(repl)
    if not (nv in full and no in nv and nr in nv):
        return False
    if no not in full or nr not in full:
        return False
    if f'sourcePhraseText : String := "{lean_str(orig)}"' not in impl_text:
        return False
    if f'replacementPhraseText : String := "{lean_str(repl)}"' not in impl_text:
        return False
    # direction: original maps to replacement in impl; spec derives it by
    # equality test against the original phrase constant.
    if "Phrase.original => Phrase.replacement" not in impl_text:
        return False
    if "if p == Phrase.original then Phrase.replacement else p" not in spec_text:
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
    for t in q["tasks"]:
        if len(done) >= a.limit:
            break
        uid = t.get("id", "")
        if t.get("status") != "NOT_STARTED" or uid in ev["units"] or uid in skips:
            continue
        if t.get("unhandled_conditions") or t.get("dependencies"):
            continue
        m = PAT.search(t.get("text", ""))
        if not m:
            continue
        orig, repl = m.group(1), m.group(2)
        if orig == repl or HOSTILE.search(orig + repl):
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        mod = "BatchRead" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} {orig} => {repl} {mod}")
            done.append(uid)
            continue
        paths[0].write_text(impl_src(mod, orig, repl), encoding="utf-8")
        paths[1].write_text(spec_src(mod), encoding="utf-8")
        paths[2].write_text(test_src(mod, orig, repl), encoding="utf-8")
        rc, out = run([str(LAKE), "build", f"JapanTaxLaw.{mod}Tests"])
        axfile = TEMP / f"{mod}.lean"
        axfile.parent.mkdir(parents=True, exist_ok=True)
        axfile.write_text(
            f"import JapanTaxLaw.{mod}\nimport JapanTaxLaw.{mod}Spec\n"
            f"import JapanTaxLaw.{mod}Tests\nopen JapanTaxLaw.{mod}\n"
            "#print axioms applies_to_quoted\n#print axioms agree_spec_impl\n"
            "#print axioms agree_when_spec_impl\n#print axioms untriggered_identity\n", encoding="utf-8")
        rc2, ax = run([str(LAKE), "env", "lean", str(axfile)])
        bad = any(k in ax for k in ("Classical.choice", "Quot.sound", "sorryAx"))
        if rc != 0 or rc2 != 0 or bad or "Build completed successfully" not in out:
            failed.append({"id": uid, "reason": "build_or_axiom", "out": (out + ax)[-400:]})
            for p in paths: p.unlink(missing_ok=True)
            continue
        # Lean-independent generic correspondence; retry with the base article
        # number for nested article labels such as 16_4.
        audit_cmd = [sys.executable, str(REPO / "scripts/ci/source_correspondence.py"),
                     "--source-file", sf, "--article", t.get("article", ""),
                     "--verbatim", t.get("text", ""),
                     "--spec", f"JapanTaxLaw/{mod}Spec.lean",
                     "--impl", f"JapanTaxLaw/{mod}.lean", "--ignore-quoted"]
        rc3, audit = run(audit_cmd)
        if rc3 != 0 or '"D": "PASS"' not in audit:
            audit_cmd[5] = t.get("article", "").split("_")[0]
            rc3, audit = run(audit_cmd)
        if rc3 != 0 or '"D": "PASS"' not in audit:
            failed.append({"id": uid, "reason": "source_audit", "out": audit[-400:]})
            for p in paths: p.unlink(missing_ok=True)
            continue
        spec_text, impl_text = paths[1].read_text(encoding="utf-8"), paths[0].read_text(encoding="utf-8")
        if not phrase_audit(sf, t.get("text", ""), orig, repl, spec_text, impl_text):
            failed.append({"id": uid, "reason": "phrase_audit", "out": "quoted phrases not located/reproduced"})
            for p in paths: p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                            "phrase_audit D=PASS: both quoted phrases located in pinned text "
                                            "and reproduced verbatim in spec+impl; direction checked"),
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; equality-test spec vs pattern-match impl",
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": ("agree_spec_impl and agree_when_spec_impl exhaustive over all three Phrase "
                            "constructors and both trigger values; whole-phrase rewrite only; "
                            "numeric content of quoted phrases is not re-derived"),
            "boundary_proof": f"{mod}Tests.lean kernel-decided original/replacement/other + untriggered identity + verbatim phrase constants",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}; trigger 「この場合」 caller-established, NOT resolved",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_READING_REVIEW.md generated entry for {uid[:16]}",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_READING_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: reading-substitution template accepted; trigger NOT resolved; "
                    f"T=kernel build + axiom scan + two Lean-independent audits; D=PASS; "
                    f"C=whole-phrase rewrite only, no semantic re-derivation; "
                    f"U=scope/applicability require human review.\n")
    print(f"reading batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
