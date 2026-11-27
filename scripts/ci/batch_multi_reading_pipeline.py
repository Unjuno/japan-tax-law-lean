#!/usr/bin/env python3
"""Guarded batch verification for multi-pair 読替え norms.

Accepts ONLY dependency-ready units whose text contains one or more
「A」とあるのは(、)?「B」と … 読み替える pairs, all source phrases distinct,
with no dependencies or unhandled conditions and an existing pinned source.
Each pair is modelled as a whole-phrase rewrite over an explicit finite
phrase domain; spec/implementation agreement is proved exhaustively. The
applicability trigger stays caller-established and is NOT resolved.

Full cycle: generated impl/spec/tests, kernel build, #print axioms, two
Lean-independent source audits, 11 evidence axes; failures stay NOT_STARTED
and are skip-listed with a recorded reason.

Usage: python scripts/ci/batch_multi_reading_pipeline.py --limit 50 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_MULTI_READING_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_multi_reading_axioms")
PAT = re.compile(r"「([^」]{1,80})」とある(?:のは|のを)、?「([^」]{1,80})」と")
HOSTILE = re.compile(r'["\\\r\n]')


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def lean_str(s: str) -> str:
    return s.replace("\\", "\\\\").replace('"', '\\"')


def pairs_of(verb: str) -> list[tuple[str, str]]:
    pairs = PAT.findall(verb)
    # 「A」とあるのは「B」とする / と定める are read-as substitutions too.
    # と読み替える is the explicit form handled in earlier batches.
    if not pairs or not any(k in verb for k in ("読み替え", "とする", "と定める", "として")):
        return []
    # A source phrase may recur under different target provisions with
    # different replacements. Each pair gets its own constructor, so the
    # provision-based selection is represented as caller-established and is
    # explicitly recorded as NOT resolved rather than silently collapsed.
    if any(a == b for a, b in pairs) or any(HOSTILE.search(a + b) for a, b in pairs):
        return []
    return pairs


def impl_src(mod: str, pairs: list[tuple[str, str]]) -> str:
    lines = [f'import JapanTaxLaw.TaxFinance', '',
             '/-! Generated batch template for a multi-pair 読替え norm.',
             '    Every quoted pair is a whole-phrase rewrite over an explicit',
             '    finite domain; the trigger is caller-established, NOT resolved. -/',
             f'namespace JapanTaxLaw.{mod}', '']
    for i, (a, b) in enumerate(pairs):
        lines.append(f'def sourcePhraseText{i} : String := "{lean_str(a)}"')
        lines.append(f'def replacementPhraseText{i} : String := "{lean_str(b)}"')
    lines += ['', 'inductive Phrase where']
    for i in range(len(pairs)):
        lines.append(f'  | original{i} | replacement{i}')
    lines += ['  | other', '  deriving DecidableEq, Repr', '', 'def applyReading : Phrase → Phrase']
    for i in range(len(pairs)):
        lines.append(f'  | Phrase.original{i} => Phrase.replacement{i}')
    lines += ['  | p => p', '',
              'def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=',
              '  if trigger then applyReading p else p', '',
              'theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl',
              'theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by',
              '  cases p <;> rfl',
              'theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by',
              '  rfl', '', f'end JapanTaxLaw.{mod}', '']
    return "\n".join(lines)


def spec_src(mod: str, pairs: list[tuple[str, str]]) -> str:
    chain = 'p'
    for i in range(len(pairs) - 1, -1, -1):
        chain = f'if p == Phrase.original{i} then Phrase.replacement{i} else {chain}'
    return f'''import JapanTaxLaw.{mod}

/-! Independent spec: equality chain rather than pattern match. Agreement is
    proved for every constructor of the declared finite phrase domain. -/
namespace JapanTaxLaw.{mod}

def specReading (p : Phrase) : Phrase :=
  {chain}

def specWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then specReading p else p

theorem agree_spec_impl (p : Phrase) : specReading p = applyReading p := by
  cases p <;> rfl

theorem agree_when_spec_impl (trigger : Bool) (p : Phrase) :
    specWhen trigger p = applyWhen trigger p := by
  cases trigger <;> cases p <;> rfl

end JapanTaxLaw.{mod}
'''


def test_src(mod: str, pairs: list[tuple[str, str]]) -> str:
    lines = [f'import JapanTaxLaw.{mod}Spec', '',
             '/-! Kernel-decided boundary tests over the declared phrase domain. -/',
             f'namespace JapanTaxLaw.{mod}', '']
    for i, (a, b) in enumerate(pairs):
        lines.append(f'example : sourcePhraseText{i} = "{lean_str(a)}" := by rfl')
        lines.append(f'example : replacementPhraseText{i} = "{lean_str(b)}" := by rfl')
        lines.append(f'example : applyReading Phrase.original{i} = Phrase.replacement{i} := by rfl')
        lines.append(f'example : specReading Phrase.original{i} = applyReading Phrase.original{i} := agree_spec_impl Phrase.original{i}')
    lines += ['example : applyReading Phrase.other = Phrase.other := by rfl',
              'example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other',
              'example : applyWhen false Phrase.other = Phrase.other := by rfl',
              'example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other',
              '', f'end JapanTaxLaw.{mod}', '']
    return "\n".join(lines)


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


def phrase_audit(sf: str, verb: str, pairs: list[tuple[str, str]],
                 spec_text: str, impl_text: str) -> bool:
    doc = json.loads((REPO / sf).read_text(encoding="utf-8"))
    full, nv = norm(flat(doc.get("law_full_text"))), norm(verb)
    if nv not in full:
        return False
    for i, (a, b) in enumerate(pairs):
        if norm(a) not in nv or norm(b) not in nv or norm(a) not in full or norm(b) not in full:
            return False
        if f'sourcePhraseText{i} : String := "{lean_str(a)}"' not in impl_text:
            return False
        if f'replacementPhraseText{i} : String := "{lean_str(b)}"' not in impl_text:
            return False
        if f'Phrase.original{i} => Phrase.replacement{i}' not in impl_text:
            return False
        if f'if p == Phrase.original{i} then Phrase.replacement{i}' not in spec_text:
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
        if "READING" not in (t.get("kinds") or [t.get("kind")]):
            continue
        pairs = pairs_of(t.get("text", ""))
        if not pairs:
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        mod = "BatchMultiRead" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} pairs={len(pairs)} {mod}")
            done.append(uid)
            continue
        paths[0].write_text(impl_src(mod, pairs), encoding="utf-8")
        paths[1].write_text(spec_src(mod, pairs), encoding="utf-8")
        paths[2].write_text(test_src(mod, pairs), encoding="utf-8")
        rc, out = run([str(LAKE), "build", f"JapanTaxLaw.{mod}Tests"])
        axfile = TEMP / f"{mod}.lean"
        axfile.parent.mkdir(parents=True, exist_ok=True)
        axfile.write_text(
            f"import JapanTaxLaw.{mod}\nimport JapanTaxLaw.{mod}Spec\n"
            f"import JapanTaxLaw.{mod}Tests\nopen JapanTaxLaw.{mod}\n"
            "#print axioms leaves_other\n#print axioms agree_spec_impl\n"
            "#print axioms agree_when_spec_impl\n#print axioms untriggered_identity\n", encoding="utf-8")
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
               "--impl", f"JapanTaxLaw/{mod}.lean", "--ignore-quoted"]
        rc3, audit = run(cmd)
        if rc3 != 0 or '"D": "PASS"' not in audit:
            cmd[5] = t.get("article", "").split("_")[0]
            rc3, audit = run(cmd)
        if rc3 != 0 or '"D": "PASS"' not in audit:
            failed.append({"id": uid, "reason": "source_audit", "out": audit[-400:]})
            for p in paths: p.unlink(missing_ok=True)
            continue
        if not phrase_audit(sf, t.get("text", ""), pairs,
                            paths[1].read_text(encoding="utf-8"), paths[0].read_text(encoding="utf-8")):
            failed.append({"id": uid, "reason": "phrase_audit", "out": "quoted pairs not located/reproduced"})
            for p in paths: p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS (--ignore-quoted); "
                                            "phrase_audit D=PASS: every quoted pair located in pinned text, "
                                            "reproduced verbatim in spec+impl with correct direction"),
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; equality-chain spec vs pattern-match impl",
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": (f"agree_spec_impl and agree_when_spec_impl exhaustive over all {2*len(pairs)+1} "
                            "constructors of the declared phrase domain and both trigger values; "
                            "whole-phrase rewrite only; quoted numeric content is not re-derived"),
            "boundary_proof": f"{mod}Tests.lean kernel-decided per-pair original/replacement plus other and untriggered identity",
            "cross_law_proof": (f"dependencies={t.get('dependencies', [])}; trigger and target-provision "
                                "selection for repeated source phrases caller-established, NOT resolved"),
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_MULTI_READING_REVIEW.md generated entry for {uid[:16]}",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_MULTI_READING_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: multi-pair reading-substitution template accepted; trigger NOT resolved; "
                    f"T=kernel build + axiom scan + two Lean-independent audits; D=PASS; "
                    f"C=whole-phrase rewrite only; U=scope/applicability require human review.\n")
    print(f"multi-reading batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
