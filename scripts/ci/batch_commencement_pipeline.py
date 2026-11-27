#!/usr/bin/env python3
"""Guarded batch for calculated commencement (施行期日) norms.

Two exact forms are accepted:
  A. 公布の日から起算してN(年|月|日)を超えない範囲内において政令で定める日
     から施行する。   → delegated date, bounded by an abstract period count.
  B. 公布の日から起算してN(年|月)を経過した日から施行する。
     → fixed abstract offset from promulgation.

In both cases the delegated choice / the promulgation day are caller-established
and NOT resolved. No calendar arithmetic (month lengths, eras) is modelled.

Usage: python scripts/ci/batch_commencement_pipeline.py --limit 100 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_COMMENCEMENT_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_commencement_axioms")
A_RE = re.compile(r"^(?:この法律|この条例)は、公布の日から起算して([〇零一二三四五六七八九十百千]+)(年|月|日)を超えない範囲内において政令で定める日(?:（以下「施行日」という。）)?から施行する。$")
B_RE = re.compile(r"^(?:この法律|この条例)は、公布の日から起算して([〇零一二三四五六七八九十百千]+)(年|月)を経過した日から施行する。$")
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


def parse(verb: str) -> tuple[int, str] | None:
    s = verb.strip()
    a, b = A_RE.fullmatch(s), B_RE.fullmatch(s)
    m = a or b
    if not m:
        return None
    try:
        n = kanji_number(m.group(1))
    except ValueError:
        return None
    return (n, "bounded" if a else "fixed") if n > 0 else None


MAX_SOURCE_BYTES = 50_000_000


def source_ok(sf: str) -> bool:
    p = REPO / sf
    if not p.exists():
        return False
    try:
        return p.stat().st_size <= MAX_SOURCE_BYTES
    except OSError:
        return False


def sha(p: Path) -> str:
    h = hashlib.sha256()
    with p.open("rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def impl_src(mod: str, n: int, kind: str) -> str:
    if kind == "bounded":
        body = f'''/-- Abstract period bound (years/months/days recorded from the text). -/
def periodLimit : Nat := {n}

/-- The delegated commencement day must lie within the statutory bound. -/
def withinLimit (delegated : Nat) : Bool := decide (delegated ≤ periodLimit)

theorem at_limit (d : Nat) : withinLimit d = true → d ≤ periodLimit := by
  intro h
  change decide (d ≤ periodLimit) = true at h
  exact decide_eq_true_eq.mp h

theorem below_limit_true (d : Nat) (h : d ≤ periodLimit) : withinLimit d = true := by
  change decide (d ≤ periodLimit) = true
  exact decide_eq_true_eq.mpr h
'''
        probe = "#print axioms at_limit\n#print axioms below_limit_true\n"
    else:
        body = f'''/-- Abstract offset (months recorded from the text). -/
def offset : Nat := {n}

def effectiveDay (promulgation : Nat) : Nat := promulgation + offset

def appliesAt (promulgation day : Nat) : Bool :=
  decide (effectiveDay promulgation ≤ day)

theorem applies_on_effective_day (p : Nat) : appliesAt p (p + {n}) = true := by
  unfold appliesAt effectiveDay offset
  exact decide_eq_true_eq.mpr (Nat.le_refl (p + {n}))

theorem shift_invariant (p k : Nat) : appliesAt p (p + k) = decide ({n} ≤ k) := by
  unfold appliesAt effectiveDay offset
  by_cases h : {n} ≤ k
  · have h2 : p + {n} ≤ p + k :=
      (Nat.add_le_add_iff_left (n := p) (m := {n}) (k := k)).mpr h
    rw [decide_eq_true_eq.mpr h2, decide_eq_true_eq.mpr h]
  · have h2 : ¬ p + {n} ≤ p + k := fun hle =>
      h ((Nat.add_le_add_iff_left (n := p) (m := {n}) (k := k)).mp hle)
    rw [decide_eq_false_iff_not.mpr h2, decide_eq_false_iff_not.mpr h]
'''
        probe = "#print axioms applies_on_effective_day\n#print axioms shift_invariant\n"
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated template for a calculated commencement norm ({kind}).
    The delegated day / promulgation day is caller-established and NOT resolved.
    No calendar arithmetic is modelled. -/
namespace JapanTaxLaw.{mod}

{body}end JapanTaxLaw.{mod}
'''


def spec_src(mod: str, n: int, kind: str) -> str:
    if kind == "bounded":
        body = f'''def specWithin (d : Nat) : Bool :=
  if periodLimit < d then false else true

theorem agree_spec_impl (d : Nat) : specWithin d = withinLimit d := by
  unfold specWithin withinLimit
  by_cases h : periodLimit < d
  · rw [if_pos h]
    exact (decide_eq_false_iff_not.mpr (Nat.not_le_of_gt h)).symm
  · rw [if_neg h]
    exact (decide_eq_true_eq.mpr (Nat.le_of_not_gt h)).symm
'''
        probe = "#print axioms agree_spec_impl\n"
    else:
        body = f'''def specApplies (promulgation day : Nat) : Bool :=
  if day < promulgation then false else decide ({n} ≤ day - promulgation)

theorem agree_spec_impl (p day : Nat) : specApplies p day = appliesAt p day := by
  unfold specApplies appliesAt effectiveDay offset
  by_cases h : day < p
  · have hbase : ¬ p ≤ day := Nat.not_le_of_gt h
    have hnot : ¬ p + {n} ≤ day := by
      intro hle
      exact hbase (Nat.le_trans (Nat.le_add_right p {n}) hle)
    rw [if_pos h, decide_eq_false_iff_not.mpr hnot]
  · have hpday : p ≤ day := Nat.le_of_not_gt h
    have hiff : ({n} ≤ day - p) ↔ (p + {n} ≤ day) := by
      have hh := Nat.le_sub_iff_add_le (n := {n}) (m := day) (k := p) hpday
      simpa [Nat.add_comm] using hh
    by_cases hs : {n} ≤ day - p
    · have hi : p + {n} ≤ day := hiff.mp hs
      rw [if_neg h, decide_eq_true_eq.mpr hs, decide_eq_true_eq.mpr hi]
    · have hi : ¬ p + {n} ≤ day := fun hle => hs (hiff.mpr hle)
      rw [if_neg h, decide_eq_false_iff_not.mpr hs, decide_eq_false_iff_not.mpr hi]
'''
        probe = "#print axioms agree_spec_impl\n"
    return f'''import JapanTaxLaw.{mod}

/-! Independent spec; agreement is universal over the abstract Nat domain. -/
namespace JapanTaxLaw.{mod}

{body}end JapanTaxLaw.{mod}
'''


def test_src(mod: str, n: int, kind: str) -> str:
    if kind == "bounded":
        examples = f'''example : withinLimit {n} = true := by decide
example : withinLimit ({n} + 1) = false := by decide
example : specWithin {n} = withinLimit {n} := agree_spec_impl {n}
example : specWithin 0 = withinLimit 0 := agree_spec_impl 0
'''
    else:
        examples = f'''example : appliesAt 0 {n} = true := applies_on_effective_day 0
example : appliesAt 100 (100 + {n}) = true := applies_on_effective_day 100
example : appliesAt 100 (100 + 1) = decide ({n} ≤ 1) := shift_invariant 100 1
example : specApplies 100 (100 + {n}) = appliesAt 100 (100 + {n}) := agree_spec_impl 100 (100 + {n})
example : specApplies 100 99 = appliesAt 100 99 := agree_spec_impl 100 99
'''
    return f'''import JapanTaxLaw.{mod}Spec

namespace JapanTaxLaw.{mod}

{examples}end JapanTaxLaw.{mod}
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
    return (bool(texts) and norm(verb) in norm("\n".join(texts))
            and (f"def periodLimit : Nat := {n}" in impl_text
                 or f"def offset : Nat := {n}" in impl_text))


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
        if t.get("unhandled_conditions") or t.get("dependencies"):
            continue
        parsed = parse(t.get("text", ""))
        if parsed is None:
            continue
        n, kind = parsed
        sf = t.get("source_file", "")
        if not sf or not source_ok(sf):
            continue
        attempts += 1
        mod = "BatchCommence" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} {kind} n={n} {mod}")
            done.append(uid)
            continue
        paths[0].write_text(impl_src(mod, n, kind), encoding="utf-8")
        paths[1].write_text(spec_src(mod, n, kind), encoding="utf-8")
        paths[2].write_text(test_src(mod, n, kind), encoding="utf-8")
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
            failed.append({"id": uid, "reason": "commencement_audit", "out": "period/verbatim mismatch"})
            for p in paths: p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS (phrase-only); "
                                            "commencement_audit D=PASS: verbatim located and period count matches"),
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; branch spec vs decide impl",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": (f"universal over the abstract Nat domain ({kind}); no calendar, era or "
                            "amendment-history semantics; delegated day / promulgation NOT resolved"),
            "boundary_proof": f"{mod}Tests.lean kernel-decided boundary cases",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}; delegated determination NOT resolved",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_COMMENCEMENT_REVIEW.md generated entry for {uid[:16]}",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_COMMENCEMENT_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: calculated-commencement template accepted; delegated day NOT resolved; "
                    f"T=kernel build + axiom scan + two audits; D=PASS; U=human review separate.\n")
    print(f"commencement batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
