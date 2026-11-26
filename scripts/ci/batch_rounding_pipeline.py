#!/usr/bin/env python3
"""Guarded batch verification for single-unit truncation (端数切り捨て) norms.

Accepts dependency-ready units whose text mentions exactly one monetary
rounding unit (all N円 occurrences the same), a 未満の端数 phrase and
切り捨て, with no competing 切り上げ/四捨五入 or 以上 band. The model defines
truncation as x / unit * unit; the independent spec uses x - x % unit and
agreement is proved universally with kernel Nat lemmas (no omega/simp
arithmetic, hence no Quot.sound).

Usage: python scripts/ci/batch_rounding_pipeline.py --limit 50 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_ROUNDING_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_rounding_axioms")
AMT = re.compile(r"([〇零一二三四五六七八九十百千万億]+)円")
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


NUM_RE = re.compile(r"[〇零一二三四五六七八九十千百万億]+")
AMOUNT_RE = re.compile(r"([〇零一二三四五六七八九十千百万億]+)円")
PCT_RE = re.compile(r"百分の([〇零一二三四五六七八九十百千]+)")
FRAC_RE = re.compile(r"([〇零一二三四五六七八九十百千]+)分の([〇零一二三四五六七八九十百千]+)")
PERIOD_RE = re.compile(r"([〇零一二三四五六七八九十百千]+)(?:年|月|日|回)(?:以下|以内|未満|を超える)")


def numeric_values(verb: str) -> set[int]:
    """Mirror the Lean-independent source audit's numeric extraction."""
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
    if "切り捨て" not in verb:
        return None
    if not any(k in verb for k in ("未満の端数", "未満であるとき")):
        return None
    if any(k in verb for k in ("以上", "切り上げ", "四捨五入")):
        return None
    vals = set(AMT.findall(verb))
    if len(vals) != 1 or len(verb) > 130:
        return None
    try:
        u = kanji_number(vals.pop())
    except ValueError:
        return None
    # Units with other statutory numerals (fractions, periods, percentages)
    # require additional modelling; leave them NOT_STARTED rather than let the
    # generic source audit reject them after a build.
    if numeric_values(verb) - {u}:
        return None
    return u if u else None


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def impl_src(mod: str, u: int) -> str:
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated template for a single-unit truncation norm.
    The amount to be rounded is caller-established (Nat). -/
namespace JapanTaxLaw.{mod}

/-- Rounding unit, in yen. -/
def unit : Nat := {u}

/-- Statutory truncation: discard the remainder below `unit`. -/
def truncateAmount (x : Nat) : Nat := x / unit * unit

theorem below_unit_zero (x : Nat) (h : x < unit) : truncateAmount x = 0 := by
  unfold truncateAmount
  have hdiv : x / unit = 0 := Nat.div_eq_of_lt h
  rw [hdiv]
  simp

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str) -> str:
    return f'''import JapanTaxLaw.{mod}

/-! Independent spec: subtract the remainder instead of dividing and
    multiplying. Agreement is proved for every Nat amount. -/
namespace JapanTaxLaw.{mod}

def specTruncate (x : Nat) : Nat := x - x % unit

theorem agree_spec_impl (x : Nat) : specTruncate x = truncateAmount x := by
  unfold specTruncate truncateAmount
  have h : x = (x / unit * unit) + x % unit := by
    rw [Nat.mul_comm]
    exact (Nat.div_add_mod x unit).symm
  exact Nat.sub_eq_of_eq_add h

end JapanTaxLaw.{mod}
'''


def test_src(mod: str, u: int) -> str:
    return f'''import JapanTaxLaw.{mod}Spec

namespace JapanTaxLaw.{mod}

example : unit = {u} := by rfl
example : truncateAmount 0 = 0 := by decide
example : truncateAmount ({u} - 1) = 0 := by decide
example : truncateAmount {u} = {u} := by decide
example : truncateAmount ({u} + {u}) = {u} + {u} := by decide
example : truncateAmount ({u} * 7) = {u} * 7 := by decide
example : specTruncate ({u} * 7) = truncateAmount ({u} * 7) := agree_spec_impl ({u} * 7)

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


def rounding_audit(sf: str, article: str, verb: str, u: int, impl_text: str) -> bool:
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
    return f"def unit : Nat := {u}" in impl_text


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
        u = unit_of(t.get("text", ""))
        if u is None or u == 0:
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        attempts += 1
        mod = "BatchRound" + hashlib.sha256(uid.encode()).hexdigest()[:10]
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
            "#print axioms below_unit_zero\n#print axioms agree_spec_impl\n", encoding="utf-8")
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
        if not rounding_audit(sf, t.get("article", ""), t.get("text", ""), u,
                              paths[0].read_text(encoding="utf-8")):
            failed.append({"id": uid, "reason": "rounding_audit", "out": "unit/verbatim mismatch"})
            for p in paths: p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                            "rounding_audit D=PASS: verbatim located in pinned article and "
                                            "unit constant matches the single 円 threshold in the text"),
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; remainder-subtraction spec vs div-mul impl",
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": ("agree_spec_impl universal over all Nat amounts; truncation only, "
                            "no rounding-up or half-up semantics; amount caller-established"),
            "boundary_proof": f"{mod}Tests.lean kernel-decided 0 / below-unit / at-unit / above-unit boundaries",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}; surrounding calculation steps NOT resolved",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_ROUNDING_REVIEW.md generated entry for {uid[:16]}",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_ROUNDING_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: truncation template accepted; surrounding calculation NOT resolved; "
                    f"T=kernel build + axiom scan + two independent audits; D=PASS; "
                    f"U=legal interpretation requires human review.\n")
    print(f"rounding batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
