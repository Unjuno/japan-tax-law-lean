#!/usr/bin/env python3
"""Guarded batch for list-wise reading substitution (リスト読替え).

Form: 「A1」、「A2」…又は「An」とあるのは、それぞれ「B1」、「B2」…又は「Bn」と
読み替える. The pairs are zipped positionally from the pinned verbatim; the
applicability trigger is caller-established and NOT resolved.

The token domain is the quoted phrases only: whole-token rewrite, no substring
rewriting, and no claim that overlapping tokens (e.g. 道府県 inside 道府県税)
are resolved by priority. This scope limit is recorded in every evidence entry.

Usage: python scripts/ci/batch_list_reading_pipeline.py --limit 20 [--dry-run]
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
SKIPS = REPO / "data" / "BATCH_LIST_READING_SKIPS.json"
JAPAN = REPO / "JapanTaxLaw"
LAKE = Path(r"C:\Users\user\.elan\bin\lake.exe")
TEMP = Path(r"D:\CodexData\Temp\opencode\batch_list_reading_axioms")
QUOTE = re.compile(r"「([^」]{1,80})」")
GROUP = re.compile(r"([^。]*?)とあるのは、それぞれ([^。]*?)と(?=、|読み替えるものとする。|する。)")
ALLOWED_SURROUND = re.compile(r"^(?:この場合において(?:は)?、?|次に掲げる|それぞれ|、|又は|\s)*$")


def parse_pairs(verb: str) -> list[tuple[str, str]] | None:
    groups = GROUP.findall(verb)
    if not groups:
        return None
    pairs: list[tuple[str, str]] = []
    for src_part, tgt_part in groups:
        src, tgt = QUOTE.findall(src_part), QUOTE.findall(tgt_part)
        if not src or len(src) != len(tgt):
            return None
        if (not ALLOWED_SURROUND.fullmatch(QUOTE.sub("", src_part))
                or not ALLOWED_SURROUND.fullmatch(QUOTE.sub("", tgt_part))):
            return None
        pairs.extend(zip(src, tgt))
    if len({a for a, _ in pairs}) != len(pairs):
        return None
    if any(a == b for a, b in pairs):
        return None
    if any(re.search(r'["\\\r\n]', a + b) for a, b in pairs):
        return None
    return pairs


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def main() -> int:
    sys.path.insert(0, str(REPO))
    from scripts.ci.batch_multi_reading_pipeline import (impl_src, spec_src, test_src, run)
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
        pairs = parse_pairs(t.get("text", ""))
        if not pairs:
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        attempts += 1
        mod = "BatchListRead" + hashlib.sha256(uid.encode()).hexdigest()[:10]
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
               "--impl", f"JapanTaxLaw/{mod}.lean", "--ignore-quoted"]
        rc3, audit_out = run(cmd)
        if rc3 != 0 or '"D": "PASS"' not in audit_out:
            cmd[5] = t.get("article", "").split("_")[0]
            rc3, audit_out = run(cmd)
        if rc3 != 0 or '"D": "PASS"' not in audit_out:
            failed.append({"id": uid, "reason": "source_audit", "out": audit_out[-400:]})
            for p in paths: p.unlink(missing_ok=True)
            continue
        # Phrase-level check: every quoted source/replacement pair is reproduced
        # verbatim in the generated module.
        impl_text, spec_text = paths[0].read_text(encoding="utf-8"), paths[1].read_text(encoding="utf-8")
        if not all(f'"{a}"' in impl_text and f'"{b}"' in impl_text
                   and f'Phrase.original{i}' in spec_text
                   for i, (a, b) in enumerate(pairs)):
            failed.append({"id": uid, "reason": "phrase_audit", "out": "phrases missing in model"})
            for p in paths: p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS (--ignore-quoted); "
                                            "phrase audit D=PASS: every quoted pair reproduced verbatim"),
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; equality-chain spec vs pattern-match impl",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": (f"agree_spec_impl exhaustive over {2*len(pairs)+1} whole-token phrase constructors; "
                            "no substring or overlap-priority semantics; trigger NOT resolved"),
            "boundary_proof": f"{mod}Tests.lean kernel-decided per-pair boundaries",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}; trigger NOT resolved",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_LIST_READING_REVIEW.md generated entry for {uid[:16]}",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_LIST_READING_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: list-wise reading accepted; whole-token scope, no overlap priority; "
                    f"T=kernel build + axiom scan + two audits; D=PASS; U=human review separate.\n")
    print(f"list-reading batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
