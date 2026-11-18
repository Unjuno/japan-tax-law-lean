#!/usr/bin/env python3
"""Coverage ledger — machine-computed verification coverage (Objective §4).

Counts are derived ONLY from machine-generated inputs:
  * data/INVENTORY.json            — authoritative law ledger (denominator: laws)
  * build/audit_sweep.json         — structural sweep (denominator: articles/paragraphs/items)
  * scripts/ci/transcription_audit.py::checks() — pinned-source literal checks
  * build/cross_law.json           — pinned Lean modules (when present)
  * docs/L7_CANDIDATES_UNREVIEWED.csv — per-candidate human review state

This ledger reports SEPARATE axes with SEPARATE denominators. It never
collapses them into a single "completion" number. A law whose article was
read into the corpus is NOT counted as semantically modelled. A candidate
whose review_status is 'unreviewed' is NOT counted as reviewed. Human legal
review is counted ONLY from recorded reviewer / review_date fields.

Emits docs/COVERAGE.md deterministically; exit 0 iff the emitted file equals
the file on disk (regeneration gate), matching the l7_ledger.py pattern.
"""
from __future__ import annotations

import csv
import importlib.util
import json
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
INVENTORY = REPO / "data" / "INVENTORY.json"
SWEEP = REPO / "build" / "audit_sweep.json"
CROSS = REPO / "build" / "cross_law.json"
CANDIDATES = REPO / "docs" / "L7_CANDIDATES_UNREVIEWED.csv"
REFERENCES = REPO / "build" / "reference_stats.json"
ADVERSARIAL = REPO / "docs" / "ADVERSARIAL_REVIEW.md"
OUT = REPO / "docs" / "COVERAGE.md"
OUT_TMP = REPO / "build" / "coverage.md"
AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"


def _load(path: Path):
    return json.loads(path.read_text(encoding="utf-8")) if path.exists() else None


def audit_checks():
    spec = importlib.util.spec_from_file_location("coverage_ta", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return list(mod.checks())


def build() -> str:
    inv = _load(INVENTORY) or {"laws": [], "summary": {}}
    laws = inv.get("laws", [])
    sweep = _load(SWEEP)
    totals = (sweep or {}).get("totals", {})
    cross = _load(CROSS) or {}
    refs = _load(REFERENCES) or {}
    ref_totals = refs.get("totals", {})
    checks = audit_checks()
    import re as _re
    review_sessions = 0
    if ADVERSARIAL.exists():
        review_sessions = len(_re.findall(r"^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review", ADVERSARIAL.read_text(encoding="utf-8"), _re.M))

    n_laws = len(laws)
    n_enforced = sum(
        1 for l in laws
        if (l.get("current_revision") or {}).get("current_revision_status") == "CurrentEnforced"
    )
    n_with_raw = sum(1 for l in laws if (l.get("raw_snapshot") or {}).get("source_file"))
    unresolved = inv.get("summary", {}).get("unresolved", [])

    # Semantic-model axis: distinct laws with >=1 pinned literal check, and
    # distinct article pins (art is not None) — deliberately NOT law count.
    modelled_law_ids = sorted({law_id for _, law_id, _, _, _ in checks})
    article_pins = sorted({(law_id, art) for _, law_id, _, art, _ in checks if art})
    modules = cross.get("modules") or []
    n_pinned = sum(1 for m in modules if m.get("pinned"))
    n_unpinned = sum(1 for m in modules if not m.get("pinned"))

    # Human review axis: reviewer/review_date must be recorded.
    reviewed = 0
    review_date = 0
    n_candidates = 0
    if CANDIDATES.exists():
        with CANDIDATES.open(encoding="utf-8", newline="") as f:
            rows = list(csv.DictReader(f))
        n_candidates = len(rows)
        for row in rows:
            if (row.get("reviewer") or "").strip():
                reviewed += 1
            if (row.get("review_date") or "").strip():
                review_date += 1

    def pct(a, b):
        return f"{(100.0 * a / b):.2f}%" if b else "n/a"

    lines = [
        "# Coverage ledger (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/coverage_ledger.py`.",
        "Every number below is computed from a machine-generated input. Axes have",
        "DIFFERENT denominators and are deliberately NOT combined into a completion",
        "percentage. Reading a law into the corpus is not semantic modelling; a",
        "fidelity-only literal check is not legal review.",
        "",
        f"snapshot_date: {inv.get('snapshot_date', 'n/a')}",
        "objective_baseline_date: 2026-11-17 (JST; as stated in the directive)",
        "",
        "## Law-level axes (denominator = laws in INVENTORY)",
        "",
        "| axis | count | denominator | rate |",
        "|---|---:|---:|---:|",
        f"| laws in ledger | {n_laws} | {n_laws} | 100.00% |",
        f"| current-enforced (auditable) laws | {n_enforced} | {n_laws} | {pct(n_enforced, n_laws)} |",
        f"| laws with pinned raw snapshot | {n_with_raw} | {n_laws} | {pct(n_with_raw, n_laws)} |",
        f"| laws with >=1 pinned literal check | {len(modelled_law_ids)} | {n_laws} | {pct(len(modelled_law_ids), n_laws)} |",
        f"| unresolved (unenforced) laws | {len(unresolved)} | {n_laws} | {pct(len(unresolved), n_laws)} |",
        "",
        "## Structural sweep axes (denominator = structural units checked)",
        "",
        "| axis | count |",
        "|---|---:|",
        f"| laws parse-ok | {totals.get('parse_ok', 'n/a')} |",
        f"| laws audit-ok | {totals.get('audit_ok', 'n/a')} |",
        f"| articles checked | {totals.get('articles_checked', 'n/a')} |",
        f"| paragraphs checked | {totals.get('paragraphs_checked', 'n/a')} |",
        f"| items checked | {totals.get('items_checked', 'n/a')} |",
        f"| verified anomalies | {totals.get('findings_verified_anomaly', 'n/a')} |",
        f"| unreviewed candidates | {totals.get('findings_candidate', 'n/a')} |",
        "",
        "## Reference-relation axes (Objective §1 — recursive discovery)",
        "",
        "| axis | count |",
        "|---|---:|",
        f"| references extracted | {ref_totals.get('references_extracted', 'n/a')} |",
        f"| internal references checked | {ref_totals.get('references_internal_checked', 'n/a')} |",
        f"| external references NOT bound to the ledger | {ref_totals.get('references_external_unverified', 'n/a')} |",
        f"| references classified unsupported | {ref_totals.get('references_unsupported', 'n/a')} |",
        "",
        "external_unverified references are NOT verified and are NOT silently counted",
        "as covered scope. Recursive discovery of target laws from reference and",
        "delegation relations remains incomplete; the current ledger was enumerated",
        "by the '税' keyword in the law name only.",
        "",
        "## Formalisation axes (denominator = distinct laws / article pins)",
        "",
        "| axis | count | denominator | rate |",
        "|---|---:|---:|---:|",
        f"| pinned literal checks | {len(checks)} | n/a | n/a |",
        f"| distinct article pins | {len(article_pins)} | {totals.get('articles_checked', 'n/a')} | {pct(len(article_pins), totals.get('articles_checked', 0))} |",
        f"| pinned Lean modules (cross-law) | {n_pinned} | n/a | n/a |",
        "",
        "## Unaddressed / unproved / candidate-inconsistency axes (Objective §4)",
        "",
        "| axis | count |",
        "|---|---:|",
        f"| unpinned Lean modules (not counted as verified) | {n_unpinned} |",
        f"| L7 candidates awaiting human legal review | {n_candidates - reviewed} |",
        f"| verified anomalies (requires independent review to establish) | {totals.get('findings_verified_anomaly', 'n/a')} |",
        f"| unresolved (unenforced) laws | {len(unresolved)} |",
        f"| external references NOT bound to the ledger | {ref_totals.get('references_external_unverified', 'n/a')} |",
        "",
        "An unpinned module, an unreviewed candidate, an unbound reference and an",
        "unenforced law are NOT counted as verified or completed. verified-anomaly = 0",
        "means no independent legal review has established a defect; it is not",
        "evidence of absence of defects.",
        "",
        "## Independent transcription-review axis (Objective §4, separate from fidelity-only audit)",
        "",
        "| axis | count |",
        "|---|---:|",
        f"| adversarial review sessions recorded | {review_sessions} |",
        "",
        "These are machine-based independent cross-checks by a separate review",
        "agent, NOT human legal review and NOT a count of fully reviewed articles.",
        "",
        "## Human legal review axis (denominator = L7 candidates)",
        "",
        "| axis | count | denominator | rate |",
        "|---|---:|---:|---:|",
        f"| candidates with recorded reviewer | {reviewed} | {n_candidates} | {pct(reviewed, n_candidates)} |",
        f"| candidates with recorded review_date | {review_date} | n/a | n/a |",
        "",
        "verified-anomaly = 0 means zero independent legal review has established",
        "any candidate as an anomaly; it is NOT evidence that no defect exists.",
        "",
        "## Laws with pinned literal checks",
        "",
    ]
    for lid in modelled_law_ids:
        title = next((l.get("official_title", "") for l in laws if l.get("law_id") == lid), "")
        lines.append(f"- `{lid}` {title}")
    lines.append("")
    return "\n".join(lines)


def main() -> int:
    text = build()
    OUT_TMP.parent.mkdir(parents=True, exist_ok=True)
    OUT_TMP.write_text(text, encoding="utf-8")
    if OUT.exists() and OUT.read_text(encoding="utf-8") == text:
        print("coverage ledger matches committed state (deterministic)")
        return 0
    OUT.write_text(text, encoding="utf-8")
    print("wrote", OUT)
    return 1


if __name__ == "__main__":
    sys.exit(main())
