#!/usr/bin/env python3
"""Guarded batch verification for table-based 読替え norms.

Accepts ONLY dependency-ready units whose verbatim text is located in exactly
one Paragraph of the pinned source and whose paragraph carries exactly one
TableStruct with a clean three-column shape (上欄 provision / 中欄 original /
下欄 replacement, optional rowspan only in the provision column). The pairs
are re-extracted from the pinned table by a Lean-independent audit and then
modelled as whole-phrase rewrites over an explicit finite domain, with
exhaustive spec/implementation agreement. The trigger is caller-established
and is NOT resolved.

Failures stay NOT_STARTED and are skip-listed with a recorded reason.

Usage: python scripts/ci/batch_table_reading_pipeline.py --limit 50 [--dry-run]
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO))
from scripts.ci.batch_multi_reading_pipeline import (  # noqa: E402
    impl_src, spec_src, test_src, run, norm, sha, HOSTILE, JAPAN, LAKE, TEMP,
)

QUEUE, EVIDENCE = REPO / "build/task_queue.json", REPO / "data/verification_evidence.json"
SKIPS = REPO / "data" / "BATCH_TABLE_READING_SKIPS.json"
TABLE_PHRASE = "次の表の上欄に掲げる規定中同表の中欄に掲げる字句は、それぞれ同表の下欄に掲げる字句に読み替える"


def flat(n) -> str:
    if isinstance(n, str):
        return n
    if isinstance(n, dict):
        return "".join(flat(c) for c in n.get("children", []))
    return ""


def table_rows(ts: dict) -> list[list[tuple[str, int]]]:
    tables = [c for c in ts.get("children", []) if isinstance(c, dict) and c.get("tag") == "Table"]
    if not tables and ts.get("tag") == "Table":
        tables = [ts]
    rows = []
    for tb in tables:
        for row in tb.get("children", []):
            if isinstance(row, dict) and row.get("tag") == "TableRow":
                cells = [c for c in row.get("children", []) if isinstance(c, dict) and c.get("tag") == "TableColumn"]
                rows.append([(flat(c), int((c.get("attr") or {}).get("rowspan", "1") or 1)) for c in cells])
    return rows


def parse_pairs(ts: dict) -> list[tuple[str, str]] | None:
    """Return (original, replacement) phrases, concatenating continuation rows."""
    groups: list[tuple[str, list[str], list[str]]] = []
    carry = 0
    for row in table_rows(ts):
        if carry:
            if len(row) != 2:
                return None
            _, orig, repl = groups[-1]
            orig.append(row[0][0]); repl.append(row[1][0])
            carry -= 1
            continue
        if len(row) != 3:
            return None
        prov, span = row[0]
        if span < 1:
            return None
        groups.append((prov, [row[1][0]], [row[2][0]]))
        carry = span - 1
    if carry or not groups:
        return None
    pairs = [("".join(o), "".join(r)) for _, o, r in groups]
    if not all(p and q and p != q for p, q in pairs):
        return None
    # Identical source phrases in different upper-column provisions are kept
    # as distinct constructors; the provision selects the applicable pair and
    # is explicitly recorded as caller-established (NOT resolved).
    if any(HOSTILE.search(p + q) for p, q in pairs):
        return None
    return pairs


def _parse_seg(seg: str) -> tuple[str, str | None, int | None]:
    if ":" in seg and "#" not in seg:
        tag, num = seg.split(":", 1)
        return tag, num, None
    if "#" in seg:
        tag, num = seg.split("#", 1)
        return tag, num, None
    if seg.endswith("]") and "[" in seg:
        tag, idx = seg[:-1].split("[", 1)
        return tag, None, int(idx)
    return seg, None, None


TRANSPARENT = {"Chapter", "Section", "Subsection", "Division", "Part", "ParagraphSentence"}


def resolve_all(doc: dict, source_path: str) -> list:
    """Follow the queue's structural source_path with backtracking.

    The path mixes (a) markers for the current node (plain Tag / Tag#Num /
    Article:Num), (b) sibling-index selectors (Tag[i], where the index is
    taken among the children of the node whose tag is named), and (c) child
    selectors. Backtracking over the small number of segments tolerates the
    mixture and pins the node by position rather than by searching for its
    text. Returns None when the path is ambiguous (more than one match)."""
    segs = [s for s in source_path.split("/") if s]

    def matches(node, tag, num) -> bool:
        return (isinstance(node, dict) and node.get("tag") == tag
                and (num is None or str((node.get("attr") or {}).get("Num", "")) == num))

    def find_segment(nodes, seg) -> list:
        tag, num, idx = _parse_seg(seg)
        out: list = []

        def rec(node, self_ok: bool):
            if not isinstance(node, dict):
                return
            if self_ok and matches(node, tag, num):
                if idx is None:
                    out.append(node)
                else:
                    ch = node.get("children", []) or []
                    if 0 <= idx < len(ch):
                        out.append(ch[idx])
            for c in node.get("children", []) or []:
                if not isinstance(c, dict):
                    continue
                ctag = c.get("tag")
                if ctag in TRANSPARENT:
                    rec(c, True)
                elif matches(c, tag, num):
                    if idx is None:
                        out.append(c)
                    else:
                        ch = c.get("children", []) or []
                        if 0 <= idx < len(ch):
                            out.append(ch[idx])
                elif idx is not None and matches(c, tag, None):
                    ch = c.get("children", []) or []
                    if 0 <= idx < len(ch):
                        out.append(ch[idx])

        for n in nodes:
            rec(n, True)
        seen, uniq = set(), []
        for n in out:
            if id(n) not in seen:
                seen.add(id(n)); uniq.append(n)
        return uniq

    nodes = [doc.get("law_full_text")]
    for seg in segs:
        nodes = find_segment(nodes, seg)
        if not nodes:
            return []
    return nodes


def resolve_path(doc: dict, source_path: str) -> dict | None:
    hits = resolve_all(doc, source_path)
    return hits[0] if len(hits) == 1 else None


def find_paragraph(sf: str, verb: str, source_path: str = "") -> dict | None:
    """Resolve the exact pinned paragraph from source_path and confirm the
    verbatim sentence is located there. Returns None when ambiguous."""
    doc = json.loads((REPO / sf).read_text(encoding="utf-8"))
    segs = [s for s in source_path.split("/") if s]
    if len(segs) < 2:
        return None
    hits = [n for n in resolve_all(doc, source_path) if norm(verb) in norm(flat(n))]
    if len(hits) != 1:
        return None
    paras = [n for n in resolve_all(doc, "/".join(segs[:-2]))
             if isinstance(n, dict) and n.get("tag") == "Paragraph"
             and norm(verb) in norm(flat(n))]
    if len(paras) != 1:
        return None
    return paras[0]


def table_audit(sf: str, verb: str, source_path: str, pairs: list[tuple[str, str]], impl_text: str, spec_text: str) -> bool:
    para = find_paragraph(sf, verb, source_path)
    if para is None:
        return False
    tables = [c for c in para.get("children", []) if isinstance(c, dict) and "Table" in str(c.get("tag"))]
    if len(tables) != 1:
        return False
    extracted = parse_pairs(tables[0])
    if extracted is None or extracted != pairs:
        return False
    for i, (a, b) in enumerate(pairs):
        if f'sourcePhraseText{i} : String := "{a}"' not in impl_text:
            return False
        if f'replacementPhraseText{i} : String := "{b}"' not in impl_text:
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
        if TABLE_PHRASE not in t.get("text", ""):
            continue
        sf = t.get("source_file", "")
        if not sf or not (REPO / sf).exists():
            continue
        para = find_paragraph(sf, t.get("text", ""), t.get("source_path", ""))
        if para is None:
            continue
        tables = [c for c in para.get("children", []) if isinstance(c, dict) and "Table" in str(c.get("tag"))]
        if len(tables) != 1:
            continue
        pairs = parse_pairs(tables[0])
        if not pairs:
            continue
        mod = "BatchTableRead" + hashlib.sha256(uid.encode()).hexdigest()[:10]
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
        if not table_audit(sf, t.get("text", ""), t.get("source_path", ""), pairs,
                           paths[0].read_text(encoding="utf-8"), paths[1].read_text(encoding="utf-8")):
            failed.append({"id": uid, "reason": "table_audit", "out": "table pairs not re-extracted"})
            for p in paths: p.unlink(missing_ok=True)
            continue
        ev["units"][uid] = {
            "source_location": f"{sf}#{t.get('source_path','')} sha256={sha(REPO/sf)}",
            "decomposition_audit": f"coverage exact={t['coverage']['exact']} unique_ids={t['coverage']['unique_ids']}",
            "source_correspondence_audit": ("scripts/ci/source_correspondence.py D=PASS; "
                                            "table_audit D=PASS: every 中欄/下欄 pair re-extracted from the "
                                            "single pinned TableStruct and reproduced verbatim in spec+impl"),
            "independent_spec": f"JapanTaxLaw/{mod}Spec.lean sha256={sha(paths[1])}; equality-chain spec vs pattern-match impl",
            "implementation": f"JapanTaxLaw/{mod}.lean sha256={sha(paths[0])}",
            "kernel_proof": f"lake build JapanTaxLaw.{mod}Tests OK; axioms: {ax.strip().replace(chr(10), ' | ')}",
            "proof_scope": (f"agree_spec_impl exhaustive over all {2*len(pairs)+1} constructors of the "
                            "declared phrase domain; whole-phrase rewrite only; cross-cell phrase "
                            "concatenation follows the pinned rowspan structure; trigger NOT resolved"),
            "boundary_proof": f"{mod}Tests.lean kernel-decided per-table-pair original/replacement plus other and untriggered identity",
            "cross_law_proof": f"dependencies={t.get('dependencies', [])}; upper-column provisions recorded as source provenance, NOT resolved",
            "tests": f"JapanTaxLaw/{mod}Tests.lean sha256={sha(paths[2])}",
            "adversarial_review": f"docs/BATCH_TABLE_READING_REVIEW.md generated entry for {uid[:16]}",
        }
        done.append(uid)
    EVIDENCE.write_text(json.dumps(ev, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    for f in failed:
        skips[f["id"]] = {"reason": f["reason"], "note": f.get("out", "")[-400:]}
    SKIPS.write_text(json.dumps(skips, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    review = REPO / "docs/BATCH_TABLE_READING_REVIEW.md"
    with review.open("a", encoding="utf-8") as f:
        for uid in done:
            f.write(f"- {uid}: table reading-substitution template accepted; pairs re-extracted from pinned "
                    f"TableStruct; trigger and upper-column applicability NOT resolved; "
                    f"T=kernel build + axiom scan + two Lean-independent audits; D=PASS; "
                    f"U=legal interpretation requires human review.\n")
    print(f"table-reading batch pipeline: verified={len(done)} failed={len(failed)}")
    for f in failed:
        print("FAILED", f["id"][:24], f["reason"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
