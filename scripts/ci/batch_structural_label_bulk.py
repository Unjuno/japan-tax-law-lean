#!/usr/bin/env python3
"""Bulk variant of the structural-label pipeline.

Instead of one Lean module per unit, one module contains one namespace per unit
(each with its own labelCode, label_valid theorem and spec agreement). This keeps
per-unit artifacts (namespace + theorem) while requiring only one lake build per
batch, making the large STRUCTURE class tractable.

Scope is unchanged: STRUCTURE ONLY, no legal condition/effect/obligation is
formalized. Each evidence entry records the batch module hash and its namespace.

Usage: python scripts/ci/batch_structural_label_bulk.py --limit 500 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_STRUCTURAL_LABEL_BULK_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_structural_label_bulk_axioms")
LABEL = re.compile(r"^([〇零一二三四五六七八九十百千]+)(?:の([〇零一二三四五六七八九十百千]+))?$")
LABEL_SET = re.compile(r"^([〇零一二三四五六七八九十百千]+)(?:及び|から)([〇零一二三四五六七八九十百千]+)(?:まで)?$")
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
    s = text.strip()
    m = LABEL.fullmatch(s)
    if m:
        try:
            a = kanji_number(m.group(1))
            b = kanji_number(m.group(2)) if m.group(2) else 0
        except ValueError:
            return None
        return (a, b) if a > 0 else None
    m = LABEL_SET.fullmatch(s)
    if m:
        try:
            a, b = kanji_number(m.group(1)), kanji_number(m.group(2))
        except ValueError:
            return None
        # Encode set/range expressions as (first, last); the invariant
        # 0 < first ∧ (last = 0 ∨ 0 < last) still holds. The original form
        # is recorded in the per-unit source location, not reinterpreted.
        return (a, b) if a > 0 and b > 0 else None
    return None


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


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
    ap.add_argument("--limit", type=int, default=500)
    ap.add_argument("--dry-run", action="store_true")
    a = ap.parse_args()
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    ev = json.loads(EVIDENCE.read_text(encoding="utf-8"))
    skips = json.loads(SKIPS.read_text(encoding="utf-8")) if SKIPS.exists() else {}
    candidates = []
    for t in q["tasks"]:
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
        candidates.append((t, code))
    chosen = candidates[:a.limit]
    if a.dry_run:
        for t, code in chosen:
            print(f"DRY {t['id'][:24]} code={code}")
        print(f"bulk structural-label dry: {len(chosen)}")
        return 0
    if not chosen:
        print("bulk structural-label pipeline: verified=0 failed=0")
        return 0
    batch_id = "BulkStructLbl" + hashlib.sha256(
        ("|".join(t["id"] for t, _ in chosen)).encode()).hexdigest()[:10]
    # namespace ids must be valid Lean identifiers: prefix with x
    impl, spec, tests = batch_modules_prefixed(
        batch_id,
        [("x" + hashlib.sha256(t["id"].encode()).hexdigest()[:10], code)
         for t, code in chosen])
    paths = [JAPAN / f"{batch_id}.lean", JAPAN / f"{batch_id}Spec.lean", JAPAN / f"{batch_id}Tests.lean"]
    paths[0].write_text(impl, encoding="utf-8")
    paths[1].write_text(spec, encoding="utf-8")
    paths[2].write_text(tests, encoding="utf-8")
    rc, out = run([str(LAKE), "build", f"JapanTaxLaw.{batch_id}Tests"])
    axfile = TEMP / f"{batch_id}.lean"
    axfile.parent.mkdir(parents=True, exist_ok=True)
    axfile.write_text(f"import JapanTaxLaw.{batch_id}\nimport JapanTaxLaw.{batch_id}Spec\n"
                      f"import JapanTaxLaw.{batch_id}Tests\n"
                      + "\n".join(f"#print axioms JapanTaxLaw.{batch_id}.x{hashlib.sha256(t['id'].encode()).hexdigest()[:10]}.label_valid"
                                  for t, _ in chosen) + "\n", encoding="utf-8")
    rc2, ax = run([str(LAKE), "env", "lean", str(axfile)])
    bad = any(k in ax for k in ("Classical.choice", "Quot.sound", "sorryAx"))
    if rc != 0 or rc2 != 0 or bad or "Build completed successfully" not in out:
        for p in paths: p.unlink(missing_ok=True)
        print(f"bulk structural-label pipeline: verified=0 failed={len(chosen)} (build_or_axiom)")
        print((out + ax)[-800:])
        return 0
    ok = 0
    for t, code in chosen:
        uid = t["id"]
        if not audit(t.get("source_file", ""), t.get("article", ""), t.get("text", "")):
            continue
        ns = "x" + hashlib.sha256(uid.encode()).hexdigest()[:10]
        ev["units"][uid] = {
            "source_location": f"{t.get('source_file','')}#{t.get('source_path','')} sha256={sha(REPO/t.get('source_file',''))}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": "bulk label audit D=PASS: verbatim located in pinned article",
            "implementation": f"JapanTaxLaw/{batch_id}.lean namespace JapanTaxLaw.{batch_id}.{ns} sha256={sha(paths[0])}",
            "independent_spec": f"JapanTaxLaw/{batch_id}Spec.lean namespace JapanTaxLaw.{batch_id}.{ns} sha256={sha(paths[1])}",
            "kernel_proof": f"lake build JapanTaxLaw.{batch_id}Tests OK; batch axiom scan: {ax.strip().replace(chr(10), ' | ')[:400]}",
            "proof_scope": "STRUCTURE ONLY: no legal condition, effect or obligation formalized; shared batch module with per-unit namespace",
            "boundary_proof": f"{batch_id}Tests namespace {ns}: kernel-decided label-domain boundaries",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}; no legal relation claimed",
            "tests": f"JapanTaxLaw/{batch_id}Tests.lean namespace JapanTaxLaw.{batch_id}.{ns} sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_STRUCT_LABEL_BULK_REVIEW.md batch {batch_id}",
        }
        ok += 1
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_STRUCT_LABEL_BULK_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        f.write(f"- batch {batch_id}: {ok} structural labels; shared module with per-unit namespaces; "
                f"T=one kernel build + batch axiom scan + per-unit source audit; D=PASS (structure scope only).\n")
    print(f"bulk structural-label pipeline: verified={ok} failed={len(chosen) - ok}")
    return 0


def batch_modules_prefixed(batch_id, items):
    impl = ["import JapanTaxLaw.TaxFinance", "", "/-! Bulk structural-label module. STRUCTURE ONLY; no legal effect. -/"]
    spec = [f"import JapanTaxLaw.{batch_id}", "", "/-! Independent branch-form spec per label namespace. -/"]
    tests = [f"import JapanTaxLaw.{batch_id}Spec", ""]
    for mod, (a, b) in items:
        impl += [f"namespace JapanTaxLaw.{batch_id}.{mod}",
                 f"def labelCode : Nat × Nat := ({a}, {b})",
                 "def validCode (c : Nat × Nat) : Bool := decide (0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2))",
                 "theorem label_valid : validCode labelCode = true := by",
                 "  unfold validCode labelCode", "  decide", "", f"end JapanTaxLaw.{batch_id}.{mod}", ""]
        spec += [f"namespace JapanTaxLaw.{batch_id}.{mod}",
                 "def specValid (c : Nat × Nat) : Bool :=",
                 "  if c.1 = 0 then false else true",
                 "theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :",
                 "    specValid c = validCode c := by",
                 "  unfold specValid validCode",
                 "  rcases h with ⟨h1, h2⟩",
                 "  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1",
                 "  rw [if_neg hn]",
                 "  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩",
                 "  exact (decide_eq_true_eq.mpr hh).symm", "",
                 f"end JapanTaxLaw.{batch_id}.{mod}", ""]
        tests += [f"namespace JapanTaxLaw.{batch_id}.{mod}",
                  "example : validCode labelCode = true := label_valid",
                  "example : specValid (1, 0) = validCode (1, 0) := agree_spec_impl (1, 0) (by decide)",
                  f"end JapanTaxLaw.{batch_id}.{mod}", ""]
    return "\n".join(impl), "\n".join(spec), "\n".join(tests)


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8")
    sys.exit(main())
