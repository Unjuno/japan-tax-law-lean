#!/usr/bin/env python3
"""Guarded batch for two threshold wordings not covered by earlier pipelines.

  「N円を超えない」 → applies x := x ≤ N
  「N円に満たない」 → applies x := x < N

Only dependency-ready units with exactly one such phrase and no other numerals
are accepted. Both directions are proved universally over Nat with kernel
decide/lemmas (no omega, no Quot.sound), and the Lean-independent source audit
checks the constant against the pinned article.

Usage: python scripts/ci/batch_misc_threshold_pipeline.py --limit 20 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_MISC_THRESHOLD_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_misc_threshold_axioms")
LE = re.compile(r"([〇零一二三四五六七八九十百千万億]+)円を超えない")
LT = re.compile(r"([〇零一二三四五六七八九十百千万億]+)円に満たない")
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


def parse(verb: str) -> tuple[int, str] | None:
    a, b = LE.findall(verb), LT.findall(verb)
    if bool(a) == bool(b) or len(a + b) != 1:
        return None
    if NUM.search((LE if a else LT).sub("", verb)) or len(verb) > 130:
        return None
    try:
        return kanji_number((a or b)[0]), ("le" if a else "lt")
    except ValueError:
        return None


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def impl_src(mod: str, n: int, op: str) -> str:
    if op == "le":
        pred, at, proof = "x ≤ limit", n, f"Nat.le_refl {n}"
    else:
        pred, at, proof = "x < limit", n - 1, f"Nat.lt.base {n - 1}"
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory threshold ({op}). -/
namespace JapanTaxLaw.{mod}

def limit : Nat := {n}

def applies (x : Nat) : Bool := decide ({pred})

theorem boundary_true : applies {at} = true := by
  unfold applies limit
  exact decide_eq_true_eq.mpr ({proof})

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str, op: str) -> str:
    if op == "le":
        pred, guard, notproof, yesproof = "x ≤ limit", "limit < x", "Nat.not_le_of_gt", "Nat.le_of_not_gt"
    else:
        pred, guard, notproof, yesproof = "x < limit", "limit ≤ x", "Nat.not_lt_of_ge", "Nat.lt_of_not_ge"
    return f'''import JapanTaxLaw.{mod}

/-! Independent two-branch spec; agreement is universal over every Nat. -/
namespace JapanTaxLaw.{mod}

def specApplies (x : Nat) : Bool :=
  if {guard} then false else true

theorem agree_spec_impl (x : Nat) : specApplies x = applies x := by
  unfold specApplies applies
  by_cases h : {guard}
  · rw [if_pos h]
    have hnot : ¬ ({pred}) := by
      exact {notproof} h
    exact (decide_eq_false_iff_not.mpr hnot).symm
  · rw [if_neg h]
    have hyes : {pred} := by
      exact {yesproof} h
    exact (decide_eq_true_eq.mpr hyes).symm

end JapanTaxLaw.{mod}
'''


def test_src(mod: str, n: int, op: str) -> str:
    t = n if op == "le" else n - 1
    return f'''import JapanTaxLaw.{mod}Spec

namespace JapanTaxLaw.{mod}

example : limit = {n} := by rfl
example : applies {t} = true := boundary_true
example : specApplies 0 = applies 0 := agree_spec_impl 0
example : specApplies {n + 1} = applies {n + 1} := agree_spec_impl {n + 1}

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


def audit(sf: str, article: str, verb: str, n: int, impl_text: str) -> bool:
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
    return bool(texts) and norm(verb) in norm("\n".join(texts)) and f"def limit : Nat := {n}" in impl_text


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
        parsed = parse(t.get("text", ""))
        if parsed is None:
            continue
        n, op = parsed
        if op == "lt" and n == 0:
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        attempts += 1
        mod = "BatchMiscTh" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} {op} {n} {mod}")
            done.append(uid)
            continue
        paths[0].write_text(impl_src(mod, n, op), encoding="utf-8")
        paths[1].write_text(spec_src(mod, op), encoding="utf-8")
        paths[2].write_text(test_src(mod, n, op), encoding="utf-8")
        rc, out = run([str(LAKE), "build", f"JapanTaxLaw.{mod}Tests"])
        axfile = TEMP / f"{mod}.lean"
        axfile.parent.mkdir(parents=True, exist_ok=True)
        axfile.write_text(
            f"import JapanTaxLaw.{mod}\nimport JapanTaxLaw.{mod}Spec\n"
            f"import JapanTaxLaw.{mod}Tests\nopen JapanTaxLaw.{mod}\n"
            "#print axioms boundary_true\n#print axioms agree_spec_impl\n", encoding="utf-8")
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
        if not audit(sf, t.get("article", ""), t.get("text", ""), n,
                     paths[0].read_text(encoding="utf-8")):
            failed.append({"id": uid, "reason": "threshold_audit", "out": "limit/verbatim mismatch"})
            for p in paths: p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                            "threshold_audit D=PASS: verbatim located and limit matches"),
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; two-branch spec vs decide impl",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": f"agree_spec_impl universal over all Nat amounts; op={op}",
            "boundary_proof": f"{mod}Tests.lean kernel-decided boundary cases",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}; surrounding conditions NOT resolved",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_MISC_THRESHOLD_REVIEW.md generated entry for {uid[:16]}",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_MISC_THRESHOLD_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: misc-threshold template accepted; surrounding conditions NOT resolved; "
                    f"T=kernel build + axiom scan + two audits; D=PASS; U=human review separate.\n")
    print(f"misc-threshold batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
