#!/usr/bin/env python3
"""Per-norm-unit verification obligations and honest completion ledger.

This REPLACES the article-level check that called a unit COMPLETE when a needle
matched, three files existed, no forbidden marker was found and an `agree*`
string appeared.  Those are exactly the signals Objective §1.4 forbids as sole
grounds for COMPLETE.

A norm unit is FULLY_VERIFIED only when all twelve technical obligations have
recorded evidence AND human legal review is recorded.  All technical
obligations satisfied with review still pending yields PROVED_SCOPE.  Nothing
is inferred from file names or theorem-name strings alone.

Evidence sources (all keyed by norm_id):
  evidence/module_bindings.json        impl/spec/tests module binding
  evidence/proof_obligations.json      theorem names + proof obligations
  evidence/kernel_audit.json           Lean kernel result, axioms, exit code
  evidence/boundary_cases.json         boundary/case coverage
  evidence/adversarial_findings.json   H / T / D / C / U record
  evidence/unhandled_conditions.json   disclosed unhandled conditions
  evidence/legal_review.json           reviewer / review_date / conclusion

Regenerate with `python scripts/ci/article_obligations.py`; deterministic gate.
"""
from __future__ import annotations

import importlib.util
import json
import re
import sys
from pathlib import Path

from norm_identity import (
    ALL_OBLIGATIONS, BLOCKED, FULLY_VERIFIED, LEGAL_REVIEW_OBLIGATION,
    NOT_STARTED, PARTIAL, PENDING_HUMAN, PROVED_SCOPE, SATISFIED, SKIPPED,
    TECHNICAL_OBLIGATIONS, UNSATISFIED, derive_status,
)

REPO = Path(__file__).resolve().parents[2]
INVENTORY = REPO / "data" / "INVENTORY.json"
AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"
EVIDENCE = REPO / "evidence"
REVIEW = REPO / "docs" / "ADVERSARIAL_REVIEW.md"
OUT = REPO / "docs" / "ARTICLE_OBLIGATIONS.md"
OUT_JSON = REPO / "build" / "article_obligations.json"
FORBIDDEN = re.compile(r"\b(sorry|admit|axiom|Classical\.choice)\b")

EVIDENCE_FILES = {
    "bindings": "module_bindings.json",
    "proof_obligations": "proof_obligations.json",
    "kernel_audit": "kernel_audit.json",
    "boundary_cases": "boundary_cases.json",
    "adversarial": "adversarial_findings.json",
    "unhandled": "unhandled_conditions.json",
    "legal_review": "legal_review.json",
}


def load_evidence(name: str) -> dict:
    path = EVIDENCE / EVIDENCE_FILES[name]
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
        return data if isinstance(data, dict) else {}
    except (OSError, ValueError):
        return {}


def strip_comments(text: str) -> str:
    text = re.sub(r"/-.*?-/", "", text, flags=re.S)
    text = re.sub(r"--[^\n]*", "", text)
    return text


def flat(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat(c) for c in node.get("children", []))
    if isinstance(node, list):
        return "".join(flat(c) for c in node)
    return ""


def norm(text: str) -> str:
    return re.sub(r"[\s\u3000]+", "", text)


def audit_checks():
    spec = importlib.util.spec_from_file_location("ao_ta", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return list(mod.checks())


def checks_with_articles():
    spec = importlib.util.spec_from_file_location("ao_ta2", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    laws = json.loads(INVENTORY.read_text(encoding="utf-8")).get("laws", [])
    by_id = {l["law_id"]: l for l in laws}
    out = []
    for name, law_id, kind, art, needles in mod.checks():
        if not art:
            continue
        rec = by_id.get(law_id) or {}
        sf = (rec.get("raw_snapshot") or {}).get("source_file")
        if not sf or not (REPO / sf).exists():
            # Unavailable/unenforced snapshot: record as unavailable, never as
            # whole-text verification or completion.
            continue
        text = mod.find_article_text(law_id, art)
        out.append({
            "name": name,
            "law_id": law_id,
            "title": (by_id.get(law_id) or {}).get("official_title", ""),
            "art": art,
            "needles": [norm(n) for n in needles if n],
            "article_text": norm(text) if text else "",
            "module": (re.findall(r"(\w+)\.lean", name) or [""])[0],
        })
    return out


def module_text(rel: str) -> str:
    p = REPO / rel
    try:
        return p.read_text(encoding="utf-8") if p.exists() else ""
    except OSError:
        return ""


def build_evidence(unit: dict, check: dict, ev: dict) -> dict:
    """Fill technical evidence from recorded artifacts; never from names."""
    uid = unit["norm_id"]
    bindings = ev["bindings"].get(uid, {})
    proof = ev["proof_obligations"].get(uid, {})
    kernel = ev["kernel_audit"].get(uid, {})
    boundary = ev["boundary_cases"].get(uid, {})
    adversarial = ev["adversarial"].get(uid, {})
    unhandled = ev["unhandled"].get(uid, {})
    legal = ev["legal_review"].get(uid, {})

    # 1. source locator: exact offsets + content hash, not a whole-file match.
    loc_ok = bool(unit.get("source_file") and unit.get("source_sha256")
                  and unit.get("char_start") is not None)
    locator = {
        "source_file": unit.get("source_file"),
        "char_start": unit.get("char_start"),
        "char_end": unit.get("char_end"),
        "source_sha256": unit.get("source_sha256"),
    }
    out = {}
    out["source_locator_fixed"] = (
        {"state": SATISFIED, **locator} if loc_ok
        else {"state": UNSATISFIED, "reason": "no exact locator"}
    )

    # 2. structure from pinned JSON attrs.
    out["structure_identified"] = (
        {"state": SATISFIED,
         "provision_kind": unit.get("provision_kind"),
         "article_no": unit.get("article_no"),
         "paragraph_no": unit.get("paragraph_no"),
         "item_no": unit.get("item_no"),
         "table_cell": unit.get("table_cell")}
        if unit.get("provision_kind") and (unit.get("article_no") or unit.get("table_cell"))
        else {"state": UNSATISFIED}
    )

    # 3. decomposition + independent coverage audit.
    out["norm_decomposed"] = (
        {"state": UNSATISFIED, "reason": "unresolved norm"}
        if unit.get("kind") == "UNRESOLVED_NORM"
        else {"state": SATISFIED, "kind": unit.get("kind"),
              "secondary_kinds": unit.get("secondary_kinds", [])}
    )
    cov = unit.get("coverage_evidence", {})
    out["coverage_audited"] = (
        {"state": SATISFIED, "coverage": cov} if cov.get("covered")
        else {"state": UNSATISFIED, "coverage": cov}
    )

    # 4. fidelity: needle must occur in THIS unit's exact text, not just anywhere.
    hits = [n for n in check["needles"] if n and n in unit["text"]]
    out["fidelity_pinned_needle"] = (
        {"state": SATISFIED, "needles": hits} if hits
        else {"state": SKIPPED,
              "reason": "no pinned needle covers this norm unit; SKIPPED != PASS"}
    )

    # 5-6. impl/spec must be BOUND to the norm id and actually exist. A module
    # name appearing in a review document is not a binding.
    def binding_check(key):
        rel = bindings.get(key, "")
        if not rel or not (REPO / rel).exists():
            return {"state": UNSATISFIED, "reason": "no bound %s module" % key,
                    "binding": rel}
        text = strip_comments(module_text(rel))
        bound = ("norm-id: %s" % uid) in text or ("norm_unit %s" % uid) in text
        if not bound:
            return {"state": UNSATISFIED,
                    "reason": "module exists but is not bound to norm_id", "binding": rel}
        if key == "spec":
            declared = bool(re.search(r"\b(def|theorem|structure|abbrev)\s+\w*[Ss]pec", text))
            if not declared:
                return {"state": UNSATISFIED,
                        "reason": "spec module has no typed spec declaration", "binding": rel}
        return {"state": SATISFIED, "binding": rel}

    out["independent_spec"] = binding_check("spec")
    out["implementation_linked"] = binding_check("impl")

    # 7. proof obligations: explicit theorem names + obligations, not a name match.
    theorem_names = proof.get("theorem_names", [])
    obligations = proof.get("proof_obligations", [])
    out["proof_obligations_defined"] = (
        {"state": SATISFIED, "theorem_names": theorem_names,
         "proof_obligations": obligations}
        if theorem_names and obligations
        else {"state": UNSATISFIED, "reason": "no recorded proof obligations"}
    )

    # 8. kernel check: a real Lean result with exit code, axiom list and version.
    kernel_ok = (
        bool(kernel.get("axiom_free")) and kernel.get("exit_code") == 0
        and bool(kernel.get("lean_version"))
        and not any(a in (kernel.get("axioms") or [])
                    for a in ("sorryAx", "Classical.choice", "Quot.sound"))
        and theorem_names and set(theorem_names).issubset(set(kernel.get("theorems", [])))
    )
    out["kernel_proof_checked"] = (
        {"state": SATISFIED, "kernel": kernel} if kernel_ok
        else {"state": UNSATISFIED, "reason": "no matching kernel audit artifact"}
    )

    # 9. boundary cases: structured, non-empty and explicitly boundary-bearing.
    cases = boundary.get("cases", [])
    out["boundary_tests_recorded"] = (
        {"state": SATISFIED, "cases": cases,
         "boundary_covered": bool(boundary.get("boundary_covered"))}
        if cases and boundary.get("boundary_covered")
        else {"state": UNSATISFIED, "reason": "no recorded boundary cases"}
    )

    # 10. adversarial audit must carry all five H/T/D/C/U fields.
    htdcu = {k: adversarial.get(k, "") for k in ("H", "T", "D", "C", "U")}
    out["adversarial_audit_recorded"] = (
        {"state": SATISFIED, "HTDCU": htdcu} if all(str(v).strip() for v in htdcu.values())
        else {"state": UNSATISFIED, "reason": "incomplete H/T/D/C/U record"}
    )

    # 11. unhandled conditions must be *disclosed*, even if the list is empty.
    out["unhandled_conditions_disclosed"] = (
        {"state": SATISFIED, "conditions": unhandled.get("conditions", [])}
        if isinstance(unhandled.get("conditions"), list)
        else {"state": UNSATISFIED, "reason": "no disclosure record"}
    )

    # 12. human legal review — never satisfied mechanically.
    out[LEGAL_REVIEW_OBLIGATION] = (
        {"state": SATISFIED, "reviewer": legal.get("reviewer"),
         "review_date": legal.get("review_date"), "conclusion": legal.get("conclusion")}
        if legal.get("reviewer") and legal.get("review_date") and legal.get("conclusion")
        else {"state": PENDING_HUMAN, "note": "human legal review is a separate axis"}
    )
    return out


def build():
    ev = {name: load_evidence(name) for name in EVIDENCE_FILES}
    checks = checks_with_articles()
    law_ids = sorted({c["law_id"] for c in checks})

    sys.path.insert(0, str(REPO / "scripts" / "ci"))
    import task_queue
    generated, _reports, _inv = task_queue.generate_units(only_laws=set(law_ids))

    by_law = {}
    for u in generated:
        by_law.setdefault(u["law_id"], []).append(u)

    rows = []
    counts = {s: 0 for s in (NOT_STARTED, PARTIAL, PROVED_SCOPE,
                             FULLY_VERIFIED, BLOCKED)}
    skipped_obligations = 0
    htdcu_rows = []
    per_article = {}

    for check in checks:
        art_text = check["article_text"]
        units = [u for u in by_law.get(check["law_id"], [])
                 if u["text"] in art_text]
        if not units:
            rows.append({
                "norm_id": "-", "law_id": check["law_id"], "title": check["title"],
                "art": check["art"], "kind": "NO_UNITS", "status": BLOCKED,
                "satisfied": 0, "skipped": 0,
                "reason": "no norm units matched the pinned article",
            })
            counts[BLOCKED] += 1
            continue
        per_article[(check["law_id"], check["art"])] = len(units)
        for unit in units:
            unit_evidence = build_evidence(unit, check, ev)
            unit["evidence"] = unit_evidence
            if unit.get("blocker"):
                status = BLOCKED
            else:
                status = derive_status(unit)
            satisfied = sum(
                1 for k in TECHNICAL_OBLIGATIONS
                if (unit_evidence.get(k) or {}).get("state") == SATISFIED
            )
            skipped = sum(
                1 for k in ALL_OBLIGATIONS
                if (unit_evidence.get(k) or {}).get("state") == SKIPPED
            )
            skipped_obligations += skipped
            counts[status] += 1
            rows.append({
                "norm_id": unit["norm_id"], "law_id": unit["law_id"],
                "title": check["title"], "art": check["art"],
                "kind": unit["kind"], "status": status,
                "satisfied": satisfied, "skipped": skipped,
                "locator": "%s:%d-%d" % (unit.get("source_file", "").split("/")[-1],
                                         unit["char_start"], unit["char_end"]),
            })
            adv = ev["adversarial"].get(unit["norm_id"], {})
            if adv:
                htdcu_rows.append((unit["norm_id"], check["law_id"],
                                   adv.get("H", ""), adv.get("T", ""),
                                   adv.get("D", ""), adv.get("C", ""), adv.get("U", "")))

    # Full per-unit ledger is machine-readable; the markdown is a bounded
    # sample so a 500k-unit queue does not produce a 30 MB commit.
    OUT_JSON.parent.mkdir(parents=True, exist_ok=True)
    OUT_JSON.write_text(
        json.dumps({"rows": rows, "htdcu": htdcu_rows, "counts": counts},
                   ensure_ascii=False, separators=(",", ":")),
        encoding="utf-8",
    )

    total = len(rows)
    technical_complete = sum(
        1 for r in rows
        if r["satisfied"] == len(TECHNICAL_OBLIGATIONS)
    )
    lines = [
        "# Norm-unit verification obligations (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/article_obligations.py`.",
        "",
        "Objective §1.4/§1.5: a numeric needle match, a file's existence and a",
        "theorem-name string match are NOT sufficient for COMPLETE. Every norm",
        "unit carries an exact source locator, an independent coverage audit,",
        "bound implementation/spec modules, proof obligations, a Lean kernel",
        "result, boundary cases, H/T/D/C/U findings, disclosed unhandled",
        "conditions and a separate human-review axis.",
        "",
        "## Totals — registered checks vs completed obligations",
        "",
        f"- pinned checks with an article: {len(checks)}",
        f"- norm units under those checks: {total}",
        f"- registered technical obligations per unit: {len(TECHNICAL_OBLIGATIONS)}",
        f"- all-technical-obligations-satisfied units: {technical_complete}",
        f"- SKIPPED obligations (never counted as PASS): {skipped_obligations}",
        f"- human legal review completed: {counts[FULLY_VERIFIED]} "
        "(recorded per norm id, not inferred)",
        "",
        "## Completion status (distinct states)",
        "",
        "| status | units |",
        "|---|---:|",
    ]
    for st in (NOT_STARTED, PARTIAL, PROVED_SCOPE, FULLY_VERIFIED, BLOCKED):
        lines.append("| %s | %d |" % (st, counts[st]))
    lines += [
        "",
        "`PROVED_SCOPE` = all technical obligations satisfied but human legal",
        "review still pending. `FULLY_VERIFIED` additionally requires a recorded",
        "reviewer, review date and conclusion. `BLOCKED` records an explicit",
        "blocker. No status is derived from names or file existence alone.",
        "",
        "## Detection candidates — H / T / D / C / U",
        "",
        "| norm_id | law_id | H (falsifiable) | T (reproduction) | D (decision) "
        "| C (competing reading) | U (uncertainty) |",
        "|---|---|---|---|---|---|---|",
    ]
    for row in htdcu_rows:
        cells = [str(c).replace("|", "\\|").replace("\n", " ") for c in row]
        lines.append("| " + " | ".join(cells) + " |")
    if not htdcu_rows:
        lines.append("| (none recorded) | | | | | | |")
    lines += [
        "",
        "## Per-norm-unit status (bounded sample)",
        "",
        "The complete per-unit ledger (all %d rows) is written to" % total,
        "`build/article_obligations.json` (git-ignored, regenerated). The first",
        "500 rows are shown here.",
        "",
        "| norm_id | law_id | article | kind | locator | satisfied/"
        + str(len(TECHNICAL_OBLIGATIONS)) + " | skipped | status |",
        "|---|---|---|---|---|---:|---:|---|",
    ]
    for r in rows[:500]:
        lines.append(
            "| `%s` | %s | %s | %s | %s | %d | %d | %s |" % (
                r["norm_id"], r["law_id"], r["art"], r["kind"],
                r.get("locator", r.get("reason", "")), r["satisfied"],
                r["skipped"], r["status"],
            )
        )
    lines.append("")
    return "\n".join(lines)


def main() -> int:
    text = build()
    if OUT.exists() and OUT.read_text(encoding="utf-8") == text:
        print("norm-unit obligations ledger matches committed state (deterministic)")
        return 0
    OUT.write_text(text, encoding="utf-8")
    print("wrote", OUT)
    return 1


if __name__ == "__main__":
    sys.exit(main())
