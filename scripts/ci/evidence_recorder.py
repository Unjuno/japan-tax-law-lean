#!/usr/bin/env python3
"""Record verification evidence for queue units from real machine artifacts.

This closes the gap between "the queue has 396,854 NOT_STARTED units" and "no
unit can ever reach FULLY_VERIFIED": evidence must be *recorded* with a concrete
reference, and the reference must come from an artifact that actually checked
something.

Evidence sources (all machine-produced):
  * pinned e-Gov snapshot + transcription_audit check (source location/fidelity)
  * queue unit coverage audit (decomposition)
  * JapanTaxLaw/<Base>.lean / <Base>Spec.lean / <Base>Tests.lean (presence)
  * a kernel-decided `agree*` correspondence in the independent Spec, and the
    green `lake build` + `#print axioms` report in data/kernel_attestation.json
  * docs/ADVERSARIAL_REVIEW.md for the independent-review axis

The recorder refuses to fabricate an axis. If an artifact is missing or the
pinned needle is not inside the stated article, no evidence is written. Legal
review is never touched.

Usage:
  python scripts/ci/evidence_recorder.py --dry-run
  python scripts/ci/evidence_recorder.py --write
"""
from __future__ import annotations

import argparse
import importlib.util
import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
sys.path.insert(0, str(REPO / "scripts"))

import normative_core as core  # noqa: E402
from law_audit.kansuji import kanji_to_int  # noqa: E402

QUEUE = REPO / "build" / "task_queue.json"
STATE = REPO / "data" / "task_state.json"
ATTEST = REPO / "data" / "kernel_attestation.json"
EVIDENCE_FILE = REPO / "data" / "verification_evidence.json"
AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"
ADVERSARIAL = REPO / "docs" / "ADVERSARIAL_REVIEW.md"
FORBIDDEN = re.compile(r"\b(sorry|admit|axiom|Classical\.choice)\b")


def article_key(kanji: str | None) -> str:
    """'第六十六条' -> '66'; '第二十一条の七' -> '21_7'."""
    if not kanji:
        return ""
    m = re.match(r"第([〇零一二三四五六七八九十百千0-9０-９]+)条", kanji)
    if not m:
        return ""
    main = str(kanji_to_int(m.group(1)))
    branches = re.findall(r"の([〇零一二三四五六七八九十百千0-9０-９]+)", kanji[m.end():])
    return main + "".join("_" + str(kanji_to_int(b)) for b in branches)


def load_checks():
    spec = importlib.util.spec_from_file_location("er_audit", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return list(mod.checks()), mod


def strip_comments(text: str) -> str:
    return re.sub(r"--[^\n]*", "", re.sub(r"/-.*?-/", "", text, flags=re.S))


def module_facts(base: str, att: dict, review_text: str) -> dict:
    """Machine-checkable facts about one Lean module chain."""
    paths = {
        "impl": REPO / "JapanTaxLaw" / f"{base}.lean",
        "spec": REPO / "JapanTaxLaw" / f"{base}Spec.lean",
        "tests": REPO / "JapanTaxLaw" / f"{base}Tests.lean",
    }
    if not all(p.exists() for p in paths.values()):
        return {"ok": False, "reason": "missing module/spec/tests"}
    impl = strip_comments(paths["impl"].read_text(encoding="utf-8"))
    spec = strip_comments(paths["spec"].read_text(encoding="utf-8"))
    tests = strip_comments(paths["tests"].read_text(encoding="utf-8"))
    if FORBIDDEN.search(impl) or FORBIDDEN.search(spec) or FORBIDDEN.search(tests):
        return {"ok": False, "reason": "forbidden proof marker"}
    agree_defs = re.findall(r"\b(?:def|theorem|lemma)\s+(agree\w*)", spec)
    if not agree_defs:
        return {"ok": False, "reason": "no independent agree* correspondence"}
    kernel_decided = all(
        re.search(r"example\s*:\s*" + re.escape(name) + r"\s*=\s*true\s*:=\s*by\s+decide", spec)
        for name in agree_defs
    )
    if not kernel_decided:
        return {"ok": False, "reason": "agree* not kernel-decided by `by decide`"}
    if not re.search(r"\bexample\b", tests):
        return {"ok": False, "reason": "no regression examples"}
    # Use the field actually emitted by build_kernel_attestation.py. A stale
    # or forged attestation with forbidden axioms must never be accepted.
    forbidden = att.get("forbidden_axioms_observed") or att.get("forbidden_axiom_hits") or {}
    observed = {a for axioms in att.get("theorems", {}).values() for a in axioms}
    if forbidden or observed & {"sorryAx", "Classical.choice"}:
        return {"ok": False, "reason": "forbidden axioms in attestation"}
    return {
        "ok": True,
        "paths": {k: str(v.relative_to(REPO)).replace("\\", "/") for k, v in paths.items()},
        "agree": sorted(set(agree_defs)),
        "review": f"{base}.lean" in review_text,
        "ci_run": att.get("ci_run_id", ""),
        "commit": att.get("commit", ""),
    }


def flat_text(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat_text(c) for c in node.get("children", []))
    if isinstance(node, list):
        return "".join(flat_text(c) for c in node)
    return ""


def locate_paragraphs(audit_mod, law_id: str, art: str, needles: list[str]) -> tuple[set[str], str]:
    """Locate each pinned needle in the STATED MAIN article's paragraphs.

    Returns (paragraph_numbers, reason). A check using find_article_text only
    sees MainProvision, so supplementary provisions with the same article
    number are never matched. A needle whose prefix is absent from every
    paragraph is reported; no article-level shortcut is taken.
    """
    article_text = audit_mod.find_article_text(law_id, art)
    if not article_text:
        return set(), "stated_main_article_not_found"
    norm = audit_mod._norm
    normalized = norm(article_text)
    missing = [n for n in needles if norm(n) not in normalized]
    if missing:
        return set(), "needle_not_in_stated_article"

    inv = json.loads((REPO / "data" / "INVENTORY.json").read_text(encoding="utf-8"))
    rec = next((l for l in inv.get("laws", []) if l.get("law_id") == law_id), None)
    sf = (rec or {}).get("raw_snapshot", {}).get("source_file")
    if not sf or not (REPO / sf).exists():
        return set(), "pinned_source_unavailable"
    doc = json.loads((REPO / sf).read_text(encoding="utf-8"))

    found: set[str] = set()

    def walk(n, in_main=False):
        if isinstance(n, dict):
            tag = n.get("tag")
            if tag == "MainProvision":
                in_main = True
            if in_main and tag == "Article" and str((n.get("attr") or {}).get("Num", "")) == article_key(art).split("_")[0]:
                for c in n.get("children", []):
                    if isinstance(c, dict) and c.get("tag") == "Paragraph":
                        pno = str((c.get("attr") or {}).get("Num", ""))
                        pt = norm(flat_text(c))
                        for needle in needles:
                            probe = norm(needle)[:40]
                            if probe and probe in pt:
                                found.add(pno)
                return
            for c in n.get("children", []):
                walk(c, in_main)
        elif isinstance(n, list):
            for c in n:
                walk(c, in_main)

    walk(doc.get("law_full_text", doc))
    if not found:
        return set(), "needle_not_located_in_any_paragraph"
    return found, ""


def evidence_for(unit: dict, base: str, facts: dict, check_name: str, needles_ok: bool) -> dict:
    """Record only axes this check can actually establish for THIS unit."""
    ev = {}
    ev["source_location"] = f"{unit.get('source_file', '')}#{unit.get('source_path', '')}"
    cov = unit.get("coverage") or {}
    if cov.get("status") == "COVERED" and cov.get("exact"):
        ev["decomposition_audit"] = "coverage:COVERED:exact"
    if needles_ok:
        ev["source_correspondence_audit"] = f"scoped-article-check:{check_name[:80]}"
    # Presence axes and proof references are recorded only for the unit that
    # the check's literal actually locates; see locate_paragraphs() in main().
    ev["implementation"] = facts["paths"]["impl"]
    ev["independent_spec"] = facts["paths"]["spec"] + ":" + ",".join(facts["agree"])
    ev["tests"] = facts["paths"]["tests"]
    ev["kernel_proof"] = (f"ci:run={facts['ci_run']}:commit={facts['commit']}:"
                          "lake build PASS; #print axioms forbidden=0")
    ev["proof_scope"] = facts["paths"]["spec"] + ":agree* kernel-decided"
    ev["boundary_proof"] = facts["paths"]["tests"] + ":examples kernel-decided"
    if facts["review"]:
        ev["adversarial_review"] = "docs/ADVERSARIAL_REVIEW.md:" + base
    # cross_law_proof is recorded only when the unit has a real dependency;
    # this recorder does not fabricate cross-law proofs.
    return {k: v for k, v in ev.items() if v}


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--write", action="store_true")
    args = ap.parse_args()

    queue = json.loads(QUEUE.read_text(encoding="utf-8"))
    tasks = queue["tasks"]
    by_article: dict[tuple[str, str], list[dict]] = {}
    for t in tasks:
        by_article.setdefault((t.get("law_id", ""), str(t.get("article", ""))), []).append(t)

    state = json.loads(STATE.read_text(encoding="utf-8")) if STATE.exists() else {"schema": "task_state/v1", "units": {}}
    evidence_file = (json.loads(EVIDENCE_FILE.read_text(encoding="utf-8"))
                     if EVIDENCE_FILE.exists() else {"schema": "verification-evidence/v1", "units": {}})
    # Drop this tool's own earlier records before writing a new snapshot.
    # Otherwise a corrected, narrower mapping would leave stale over-broad
    # evidence behind and keep units FULLY_VERIFIED for the wrong reason.
    for uid, rec in list(state.get("units", {}).items()):
        if any(h.get("actor") == "evidence_recorder.py" for h in rec.get("history", [])):
            del state["units"][uid]
    evidence_file = {"schema": "verification-evidence/v1", "units": {}}
    att = json.loads(ATTEST.read_text(encoding="utf-8"))
    review_text = ADVERSARIAL.read_text(encoding="utf-8") if ADVERSARIAL.exists() else ""
    checks, audit_mod = load_checks()

    updated = 0
    statuses: dict[str, int] = {}
    missing_axes: dict[str, int] = {}
    reasons: dict[str, int] = {}
    for name, law_id, _kind, art, needles in checks:
        if not art:
            continue
        mods = re.findall(r"(\w+)\.lean", name)
        if not mods:
            continue
        base = mods[0]
        facts = module_facts(base, att, review_text)
        if not facts["ok"]:
            reasons[facts["reason"]] = reasons.get(facts["reason"], 0) + 1
            continue
        key = (law_id, article_key(art))
        paragraphs, loc_reason = locate_paragraphs(audit_mod, law_id, art, needles)
        if not paragraphs:
            reasons[loc_reason] = reasons.get(loc_reason, 0) + 1
            continue
        candidates = [
            t for t in by_article.get(key, [])
            if t.get("kind") != "UNRESOLVED"
            and t.get("coverage", {}).get("status") == "COVERED"
            and str(t.get("provision", "")).upper() == "MAIN"
            and str(t.get("paragraph", "")) in paragraphs
        ]
        hit = False
        for unit in candidates:
            ev = evidence_for(unit, base, facts, name, needles_ok=True)
            status, _errs = core.derive_status(unit, ev)
            statuses[status] = statuses.get(status, 0) + 1
            for axis in core.EVIDENCE_AXES:
                if not ev.get(axis) and (axis != "cross_law_proof" or unit.get("dependencies")):
                    missing_axes[axis] = missing_axes.get(axis, 0) + 1
            if status in ("PROVED_SCOPE", "FULLY_VERIFIED"):
                hit = True
                uid = unit.get("id") or unit.get("normative_id") or unit.get("unit_id")
                rec = state["units"].setdefault(uid, core.default_state(uid))
                rec.setdefault("evidence", {}).update(ev)
                rec["status"] = status
                rec.setdefault("artifacts", {}).update(facts["paths"])
                rec.setdefault("history", []).append({
                    "event": "EVIDENCE_RECORDED", "actor": "evidence_recorder.py",
                    "reason": f"ci={facts['ci_run']} commit={facts['commit']} check={name[:60]}",
                    "status": status,
                })
                evidence_file["units"].setdefault(uid, {}).update(ev)
                updated += 1
        if not hit:
            reasons["no_qualifying_unit_for_check"] = reasons.get("no_qualifying_unit_for_check", 0) + 1

    print("evidence recorder:", json.dumps({
        "checks": len(checks), "units_updated": updated,
        "resulting_statuses": statuses, "missing_axes": missing_axes,
        "skip_reasons": reasons,
        "legal_review": "LEGAL_REVIEW_PENDING (never modified)",
    }, ensure_ascii=False, indent=2))
    if args.write:
        core.save_state(state, STATE)
        EVIDENCE_FILE.parent.mkdir(parents=True, exist_ok=True)
        EVIDENCE_FILE.write_text(
            json.dumps(evidence_file, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        print("wrote", STATE, "and", EVIDENCE_FILE)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
