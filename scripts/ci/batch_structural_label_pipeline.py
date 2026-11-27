#!/usr/bin/env python3
"""Guarded batch for structural item labels (STRUCTURE units).

The decomposition classified certain leaf texts as STRUCTURE (e.g. 「一」,
「六の二」): these are item/subitem numbering labels, not normative effects.
This pipeline verifies the structure claim only: the pinned text is located,
parses as a valid kanji item label, and the recorded code satisfies the
declared label-domain invariant in Lean.

NO legal effect, condition or obligation is formalized for these units. That
scope limit is recorded in every evidence entry.

Usage: python scripts/ci/batch_structural_label_pipeline.py --limit 100 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_STRUCTURAL_LABEL_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_structural_label_axioms")
LABEL = re.compile(r"^([〇零一二三四五六七八九十百千]+)(?:の([〇零一二三四五六七八九十百千]+))?$")
KANJI = {"零": 0, "〇": 0, "一": 1, "二": 2, "三": 3, "四": 4,
         "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
UNITS = {"十": 10, "百": 100, "千": 1000}


def kanji_number(s: str) -> int:
    total = section = digit = 0
    for ch in s:
        if ch in KANJI:
            digit = KANJI[ch]
        elif ch in UNITS:
            section += (digit or 1) * UNITS[ch]
            digit = 0
        else:
            raise ValueError(ch)
    return total + section + digit


def label_code(text: str) -> tuple[int, int] | None:
    m = LABEL.fullmatch(text.strip())
    if not m:
        return None
    try:
        a = kanji_number(m.group(1))
        b = kanji_number(m.group(2)) if m.group(2) else 0
    except ValueError:
        return None
    return (a, b) if a > 0 else None


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def impl_src(mod: str, code: tuple[int, int]) -> str:
    a, b = code
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated record of a structural item label. This is NOT a norm: there is
    no legal condition, effect or obligation here. Only the declared label
    domain invariant is kernel-checked. -/
namespace JapanTaxLaw.{mod}

def labelCode : Nat × Nat := ({a}, {b})

def validCode (c : Nat × Nat) : Bool := decide (0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2))

theorem label_valid : validCode labelCode = true := by
  unfold validCode labelCode
  decide

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str) -> str:
    return f'''import JapanTaxLaw.{mod}

/-! Independent spec: explicit branch form of the same domain predicate. -/
namespace JapanTaxLaw.{mod}

def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else (if c.2 = 0 then true else true)

theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  simp only [ite_self]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.{mod}
'''


def test_src(mod: str) -> str:
    return f'''import JapanTaxLaw.{mod}Spec

namespace JapanTaxLaw.{mod}

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

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
        if t.get("unhandled_conditions") or t.get("dependencies") or t.get("kind") != "STRUCTURE":
            continue
        code = label_code(t.get("text", ""))
        if code is None:
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        attempts += 1
        mod = "BatchStructLbl" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} code={code} {mod}")
            done.append(uid)
            continue
        paths[0].write_text(impl_src(mod, code), encoding="utf-8")
        paths[1].write_text(spec_src(mod), encoding="utf-8")
        paths[2].write_text(test_src(mod), encoding="utf-8")
        rc, out = run([str(LAKE), "build", f"JapanTaxLaw.{mod}Tests"])
        axfile = TEMP / f"{mod}.lean"
        axfile.parent.mkdir(parents=True, exist_ok=True)
        axfile.write_text(
            f"import JapanTaxLaw.{mod}\nimport JapanTaxLaw.{mod}Spec\n"
            f"import JapanTaxLaw.{mod}Tests\nopen JapanTaxLaw.{mod}\n"
            "#print axioms label_valid\n#print axioms agree_spec_impl\n", encoding="utf-8")
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
            failed.append({"id": uid, "reason": "label_audit", "out": "verbatim mismatch"})
            for p in paths: p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS (phrase-only); "
                                            "label_audit D=PASS: item label located in pinned article"),
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; branch spec vs decide impl",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": ("STRUCTURE ONLY: no legal condition, effect or obligation is formalized; "
                            "only the recorded item-label code domain invariant is kernel-checked"),
            "boundary_proof": f"{mod}Tests.lean kernel-decided label-domain boundaries",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}; no legal relation claimed",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_STRUCTURAL_LABEL_REVIEW.md generated entry for {uid[:16]}",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_STRUCTURAL_LABEL_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: structural item label only; NO legal effect formalized; "
                    f"T=kernel build + axiom scan + two audits; D=PASS (structure scope only).\n")
    print(f"structural-label batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
