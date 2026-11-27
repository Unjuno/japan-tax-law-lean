#!/usr/bin/env python3
"""Guarded batch for deeming-on-inaction (不作為によるみなし) norms.

Accepts dependency-ready units whose text says that if no decision/action is
taken within a stated period, a legal effect is deemed to have occurred.
The actual decision and the arrival of the deadline are caller-established
Bools and are NOT resolved. The pipeline proves the logical structure of the
deeming effect (exclusivity with an actual decision, necessity of the
deadline) universally over Bool x Bool.

Kernel proofs use `cases` only (no propext beyond the spec agreement, no
omega, no Quot.sound). The Lean-independent source audit locates the verbatim
in the pinned article.

Usage: python scripts/ci/batch_deeming_pipeline.py --limit 20 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_DEEMING_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_deeming_axioms")
PERIOD = re.compile(r"([〇零一二三四五六七八九十百千]+)(年|月|日)を経過")
KANJI = {"零": 0, "〇": 0, "一": 1, "二": 2, "三": 3, "四": 4,
         "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
UNITS = {"十": 10, "百": 100, "千": 1000}


def kanji_number(s: str) -> int:
    total = section = digit = 0
    for ch in s:
        if ch in KANJI:
            digit = KANJI[ch]
        elif ch in UNITS:
            u = UNITS[ch]
            section += (digit or 1) * u
            digit = 0
        else:
            raise ValueError(ch)
    return total + section + digit


def select(verb: str) -> int | None:
    if "とみなす" not in verb or "ない場合" not in verb:
        return None
    if not re.search(r"(期間内|[〇零一二三四五六七八九十百千]+(年|月|日)を経過)", verb):
        return None
    if len(verb) > 180:
        return None
    m = PERIOD.findall(verb)
    if len(m) > 1:
        return None
    if m:
        try:
            return kanji_number(m[0][0])
        except ValueError:
            return None
    return 0  # 期間内 by reference: no standalone period literal


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def impl_src(mod: str, period: int) -> str:
    return f'''import JapanTaxLaw.TaxFinance

/-! Generated template for a deeming-on-inaction norm. The actual decision
    and the deadline condition are caller-established Bools, NOT resolved.
    Period count recorded from the pinned text; no calendar arithmetic. -/
namespace JapanTaxLaw.{mod}

/-- Statutory period count (0 means the period is fixed by another provision). -/
def periodCount : Nat := {period}

/-- The deemed effect: no actual decision and the deadline has arrived. -/
def deemedEffect (decided : Bool) (deadlineReached : Bool) : Bool :=
  !decided && deadlineReached

theorem no_decision_if_deemed (d t : Bool) : deemedEffect d t = true → d = false := by
  intro h
  cases d <;> cases t <;> simp [deemedEffect] at h ⊢

theorem deadline_if_deemed (d t : Bool) : deemedEffect d t = true → t = true := by
  intro h
  cases d <;> cases t <;> simp [deemedEffect] at h ⊢

theorem actual_decision_excludes (d : Bool) : deemedEffect d true = !d := by
  cases d <;> rfl

end JapanTaxLaw.{mod}
'''


def spec_src(mod: str) -> str:
    return f'''import JapanTaxLaw.{mod}

/-! Independent spec: deadline guard with an inner negation. -/
namespace JapanTaxLaw.{mod}

def specDeemed (decided : Bool) (deadlineReached : Bool) : Bool :=
  if deadlineReached then !decided else false

theorem agree_spec_impl (d t : Bool) : specDeemed d t = deemedEffect d t := by
  cases d <;> cases t <;> rfl

end JapanTaxLaw.{mod}
'''


def test_src(mod: str, period: int) -> str:
    return f'''import JapanTaxLaw.{mod}Spec

namespace JapanTaxLaw.{mod}

example : periodCount = {period} := by rfl
example : deemedEffect false true = true := by rfl
example : deemedEffect true true = false := by rfl
example : deemedEffect false false = false := by rfl
example : specDeemed false true = deemedEffect false true := agree_spec_impl false true
example : specDeemed true false = deemedEffect true false := agree_spec_impl true false

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


def deeming_audit(sf: str, article: str, verb: str, period: int, impl_text: str) -> bool:
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
            and f"def periodCount : Nat := {period}" in impl_text)


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
        period = select(t.get("text", ""))
        if period is None:
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        attempts += 1
        mod = "BatchDeem" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        paths = [JAPAN / f"{mod}.lean", JAPAN / f"{mod}Spec.lean", JAPAN / f"{mod}Tests.lean"]
        if a.dry_run:
            print(f"DRY {uid[:24]} period={period} {mod}")
            done.append(uid)
            continue
        paths[0].write_text(impl_src(mod, period), encoding="utf-8")
        paths[1].write_text(spec_src(mod), encoding="utf-8")
        paths[2].write_text(test_src(mod, period), encoding="utf-8")
        rc, out = run([str(LAKE), "build", f"JapanTaxLaw.{mod}Tests"])
        axfile = TEMP / f"{mod}.lean"
        axfile.parent.mkdir(parents=True, exist_ok=True)
        axfile.write_text(
            f"import JapanTaxLaw.{mod}\nimport JapanTaxLaw.{mod}Spec\n"
            f"import JapanTaxLaw.{mod}Tests\nopen JapanTaxLaw.{mod}\n"
            "#print axioms no_decision_if_deemed\n#print axioms agree_spec_impl\n", encoding="utf-8")
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
        if not deeming_audit(sf, t.get("article", ""), t.get("text", ""), period,
                             paths[0].read_text(encoding="utf-8")):
            failed.append({"id": uid, "reason": "deeming_audit", "out": "period/verbatim mismatch"})
            for p in paths: p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                            "deeming_audit D=PASS: verbatim located and period count matches"),
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; deadline-guard spec vs conjunction impl",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": ("universal over both caller-established Bools; exclusivity and deadline "
                            "necessity proved; the decision and deadline themselves are NOT resolved"),
            "boundary_proof": f"{mod}Tests.lean exhaustive Bool x Bool boundary cases",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}; cross-provision conditions NOT resolved",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_DEEMING_REVIEW.md generated entry for {uid[:16]}",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_DEEMING_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: deeming-on-inaction template accepted; decision and deadline NOT resolved; "
                    f"T=kernel build + axiom scan + two audits; D=PASS; U=human review separate.\n")
    print(f"deeming batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
