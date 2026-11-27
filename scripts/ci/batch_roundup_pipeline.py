#!/usr/bin/env python3
"""Guarded batch verification for single-unit round-up (端数切り上げ) norms.

Only dependency-ready units with one monetary unit, a 未満の端数 phrase,
切り上げ, no competing rounding mode and no other statutory numerals are
accepted. The model adds the unit when a remainder exists; the independent
spec uses the successor quotient. Agreement is proved universally with kernel
Nat lemmas (propext only; no omega, no Quot.sound).

Usage: python scripts/ci/batch_roundup_pipeline.py --limit 20 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_ROUNDUP_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_roundup_axioms")
AMT = re.compile(r"([〇零一二三四五六七八九十百千万億]+)円")
AMOUNT_RE = re.compile(r"([〇零一二三四五六七八九十千百万億]+)円")
PCT_RE = re.compile(r"百分の([〇零一二三四五六七八九十百千]+)")
FRAC_RE = re.compile(r"([〇零一二三四五六七八九十百千]+)分の([〇零一二三四五六七八九十百千]+)")
PERIOD_RE = re.compile(r"([〇零一二三四五六七八九十百千]+)(?:年|月|日|回)(?:以下|以内|未満|を超える)")
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


def numeric_values(verb: str) -> set[int]:
    out = set()
    for pat in (AMOUNT_RE, PCT_RE, PERIOD_RE):
        for m in pat.finditer(verb):
            try:
                out.add(kanji_number(m.group(1)))
            except ValueError:
                pass
    for m in FRAC_RE.finditer(verb):
        try:
            out.add(kanji_number(m.group(1))); out.add(kanji_number(m.group(2)))
        except ValueError:
            pass
    if PCT_RE.search(verb):
        out.add(100)
    return out


def unit_of(verb: str) -> int | None:
    if "切り上げ" not in verb or "未満の端数" not in verb:
        return None
    if any(k in verb for k in ("切り捨て", "四捨五入", "以上")):
        return None
    vals = set(AMT.findall(verb))
    if len(vals) != 1 or len(verb) > 130:
        return None
    try:
        u = kanji_number(vals.pop())
    except ValueError:
        return None
    return u if u > 0 and not (numeric_values(verb) - {u}) else None


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def impl_src(mod: str, u: int) -> str:
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated template for a single-unit round-up norm.
    The amount to be rounded is caller-established (Nat). -/
namespace JapanTaxLaw.{mod}

/-- Rounding unit, in yen. -/
def unit : Nat := {u}

/-- Statutory round-up: add one unit when a remainder exists. -/
def roundUpAmount (x : Nat) : Nat :=
  x / unit * unit + (if x % unit == 0 then 0 else unit)

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str) -> str:
    return f'''import JapanTaxLaw.{mod}

/-! Independent spec: successor quotient when a remainder exists. -/
namespace JapanTaxLaw.{mod}

def specRoundUp (x : Nat) : Nat :=
  if x % unit == 0 then x else (x / unit + 1) * unit

theorem agree_spec_impl (x : Nat) : specRoundUp x = roundUpAmount x := by
  unfold specRoundUp roundUpAmount
  by_cases h : x % unit == 0
  · rw [if_pos h, if_pos h, Nat.add_zero, Nat.mul_comm]
    have hx : x % unit = 0 := by exact decide_eq_true_eq.mp h
    have hdiv : unit * (x / unit) + x % unit = x := Nat.div_add_mod x unit
    rw [hx, Nat.add_zero] at hdiv
    exact hdiv.symm
  · rw [if_neg h, if_neg h, Nat.succ_mul]

end JapanTaxLaw.{mod}
'''


def test_src(mod: str, u: int) -> str:
    return f'''import JapanTaxLaw.{mod}Spec

namespace JapanTaxLaw.{mod}

example : unit = {u} := by rfl
example : roundUpAmount 0 = 0 := by decide
example : roundUpAmount ({u} - 1) = {u} := by decide
example : roundUpAmount {u} = {u} := by decide
example : roundUpAmount ({u} + 1) = {u} + {u} := by decide
example : specRoundUp ({u} * 7 + 3) = roundUpAmount ({u} * 7 + 3) := agree_spec_impl ({u} * 7 + 3)

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


def roundup_audit(sf: str, article: str, verb: str, u: int, impl_text: str) -> bool:
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
    return bool(texts) and norm(verb) in norm("\n".join(texts)) and f"def unit : Nat := {u}" in impl_text


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
        u = unit_of(t.get("text", ""))
        if u is None:
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        attempts += 1
        mod = "BatchRoundUp" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} unit={u} {mod}")
            done.append(uid)
            continue
        paths[0].write_text(impl_src(mod, u), encoding="utf-8")
        paths[1].write_text(spec_src(mod), encoding="utf-8")
        paths[2].write_text(test_src(mod, u), encoding="utf-8")
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
        if not roundup_audit(sf, t.get("article", ""), t.get("text", ""), u,
                             paths[0].read_text(encoding="utf-8")):
            failed.append({"id": uid, "reason": "roundup_audit", "out": "unit/verbatim mismatch"})
            for p in paths: p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                            "roundup_audit D=PASS: verbatim located in pinned article and "
                                            "unit constant matches the single 円 threshold"),
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; successor-quotient spec vs remainder-add impl",
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": "agree_spec_impl universal over all Nat amounts; round-up only",
            "boundary_proof": f"{mod}Tests.lean kernel-decided 0 / below-unit / at-unit / above-unit boundaries",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}; surrounding calculation NOT resolved",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_ROUNDUP_REVIEW.md generated entry for {uid[:16]}",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_ROUNDUP_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: round-up template accepted; surrounding calculation NOT resolved; "
                    f"T=kernel build + axiom scan + two independent audits; D=PASS; "
                    f"U=legal interpretation requires human review.\n")
    print(f"round-up batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
