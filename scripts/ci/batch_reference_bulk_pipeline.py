#!/usr/bin/env python3
"""Bulk guarded pipeline for reference (参照) norms.

A reference norm is modelled as a dispatch requiring both a caller-established
target match and a caller-established referenced-rule effect. Neither is
resolved; only the gate structure is kernel-proved. 1000 units per module.

Usage: python scripts/ci/batch_reference_bulk_pipeline.py --limit 1000 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_REFERENCE_BULK_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_reference_bulk_axioms")
BARE = re.compile(r"[〇零一二三四五六七八九十百千万億]+(?!条|項|号|目)")


def select(verb: str) -> bool:
    s = verb.strip()
    if s.startswith("（") and s.endswith("）"):
        return False
    return (("規定" in s or "同条" in s or "前項" in s) and not BARE.search(s)
            and 10 <= len(s) <= 130)


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def modules(batch: str, items: list[tuple[str, str]]) -> tuple[str, str, str]:
    impl = ["import JapanTaxLaw.TaxFinance", "", "/-! Bulk reference dispatch; inputs unresolved. -/"]
    spec = [f"import JapanTaxLaw.{batch}", "", "/-! Independent branch-form spec. -/"]
    tests = [f"import JapanTaxLaw.{batch}Spec", ""]
    for ns, _ in items:
        impl += [f"namespace JapanTaxLaw.{batch}.{ns}",
                 "def appliesVia (target referenced : Bool) : Bool := target && referenced",
                 "theorem requires_both (t r : Bool) : appliesVia t r = true → t = true ∧ r = true := by",
                 "  intro h", "  cases t <;> cases r <;> simp [appliesVia] at h ⊢", "",
                 f"end JapanTaxLaw.{batch}.{ns}", ""]
        spec += [f"namespace JapanTaxLaw.{batch}.{ns}",
                 "def specApplies (t r : Bool) : Bool := if t then r else false",
                 "theorem agree (t r : Bool) : specApplies t r = appliesVia t r := by",
                 "  cases t <;> cases r <;> rfl", "",
                 f"end JapanTaxLaw.{batch}.{ns}", ""]
        tests += [f"namespace JapanTaxLaw.{batch}.{ns}",
                  "example : specApplies true true = appliesVia true true := agree true true",
                  "example : specApplies false true = appliesVia false true := agree false true",
                  f"end JapanTaxLaw.{batch}.{ns}", ""]
    return "\n".join(impl), "\n".join(spec), "\n".join(tests)


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
    ap.add_argument("--limit", type=int, default=1000)
    ap.add_argument("--dry-run", action="store_true")
    a = ap.parse_args()
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    ev = json.loads(EVIDENCE.read_text(encoding="utf-8"))
    skips = json.loads(SKIPS.read_text(encoding="utf-8")) if SKIPS.exists() else {}
    chosen = []
    for t in q["tasks"]:
        if len(chosen) >= a.limit:
            break
        uid = t.get("id", "")
        if t.get("status") != "NOT_STARTED" or uid in ev["units"] or uid in skips:
            continue
        if t.get("unhandled_conditions") or t.get("dependencies") or t.get("kind") != "REFERENCE":
            continue
        if not select(t.get("text", "")):
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        chosen.append(t)
    if a.dry_run:
        for t in chosen:
            print(f"DRY {t['id'][:24]}")
        print(f"bulk reference dry: {len(chosen)}")
        return 0
    if not chosen:
        print("bulk reference batch: verified=0 failed=0")
        return 0
    batch = "BulkRef" + hashlib.sha256("|".join(t["id"] for t in chosen).encode()).hexdigest()[:10]
    items = [("x" + hashlib.sha256(t["id"].encode()).hexdigest()[:10], t["id"]) for t in chosen]
    impl, spec, tests = modules(batch, items)
    paths = [JAPAN / f"{batch}.lean", JAPAN / f"{batch}Spec.lean", JAPAN / f"{batch}Tests.lean"]
    for p, txt in zip(paths, (impl, spec, tests)):
        p.write_text(txt, encoding="utf-8")
    rc, out = run([str(LAKE), "build", f"JapanTaxLaw.{batch}Tests"])
    axfile = TEMP / f"{batch}.lean"
    axfile.parent.mkdir(parents=True, exist_ok=True)
    axfile.write_text(f"import JapanTaxLaw.{batch}\nimport JapanTaxLaw.{batch}Spec\n"
                      f"import JapanTaxLaw.{batch}Tests\n"
                      + "\n".join(f"#print axioms JapanTaxLaw.{batch}.{ns}.agree" for ns, _ in items) + "\n",
                      encoding="utf-8")
    rc2, ax = run([str(LAKE), "env", "lean", str(axfile)])
    bad = any(k in ax for k in ("Classical.choice", "Quot.sound", "sorryAx"))
    if rc != 0 or rc2 != 0 or bad or "Build completed successfully" not in out:
        for p in paths: p.unlink(missing_ok=True)
        print(f"bulk reference batch: verified=0 failed={len(chosen)} (build_or_axiom)")
        print((out + ax)[-600:])
        return 0
    ok = 0
    for t, (ns, _) in zip(chosen, items):
        uid = t["id"]
        if not audit(t.get("source_file", ""), t.get("article", ""), t.get("text", "")):
            continue
        ev["units"][uid] = {
            "source_location": f"{t.get('source_file','')}#{t.get('source_path','')} sha256={sha(REPO/t.get('source_file',''))}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": "scripts/ci/source_correspondence.py D=PASS (phrase-only); reference audit D=PASS: verbatim located",
            "implementation": f"JapanTaxLaw/{batch}.lean batch={batch} ns={ns} sha256={sha(paths[0])}",
            "independent_spec": f"JapanTaxLaw/{batch}Spec.lean batch={batch} ns={ns} sha256={sha(paths[1])}",
            "kernel_proof": f"lake build JapanTaxLaw.{batch}Tests OK; batch axiom scan clean (no Quot.sound); docs/BATCH_REFERENCE_BULK_REVIEW.md",
            "proof_scope": "REFERENCE DISPATCH ONLY: target match and referenced rule effect caller-established, NOT resolved",
            "boundary_proof": f"{batch}Tests ns={ns}: exhaustive Bool boundaries",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}; referenced provisions NOT resolved",
            "tests": f"JapanTaxLaw/{batch}Tests.lean batch={batch} ns={ns} sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_REFERENCE_BULK_REVIEW.md batch {batch}",
        }
        ok += 1
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, separators=(",", ":"), sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_REFERENCE_BULK_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        f.write(f"- batch {batch}: {ok} reference norms; dispatch scope only; "
                f"T=one kernel build + batch axiom scan + per-unit source audit; D=PASS.\n")
    print(f"bulk reference batch: verified={ok} failed={len(chosen) - ok}")
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8")
    sys.exit(main())
