#!/usr/bin/env python3
"""Norm-unit scoped fidelity diagnostic (Objective §1.2/§1.3/§5).

Replaces the article-level diagnostic that only reported whether a needle
occurred somewhere in an article.  It now reports, per pinned check:

  * which norm units contain each needle, with exact character offsets;
  * the independent decomposition-coverage audit result;
  * UNRESOLVED norm units (text that automatic decomposition could not classify);
  * separate counts for scoped, whole-text-only and unresolved units.

This is a DIAGNOSTIC, not a completion gate.  A whole-text numeric match is
never reported as article-level verification.  Deterministic.
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
INVENTORY = REPO / "data" / "INVENTORY.json"
OUT = REPO / "docs" / "ARTICLE_SCOPE.md"

sys.path.insert(0, str(REPO / "scripts" / "ci"))
from norm_identity import UNRESOLVED, norm  # noqa: E402
import task_queue  # noqa: E402


def audit_checks():
    spec = None
    import importlib.util
    audit = REPO / "scripts" / "ci" / "transcription_audit.py"
    spec = importlib.util.spec_from_file_location("as_ta", audit)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return list(mod.checks())


def main() -> int:
    checks = audit_checks()
    law_ids = sorted({law_id for _, law_id, _, _, _ in checks})
    generated, _reports, _inv = task_queue.generate_units(only_laws=set(law_ids))
    by_law = {}
    for u in generated:
        by_law.setdefault(u["law_id"], []).append(u)

    # Count unresolved units once per law, not once per check (a law can have
    # many pinned checks, which would otherwise multiply the same units).
    law_unresolved = {
        lid: sum(1 for u in units if u["kind"] == UNRESOLVED)
        for lid, units in by_law.items()
    }
    rows = []
    scoped = whole_only = coverage_fail_total = 0
    for name, law_id, kind, art, needles in checks:
        units = by_law.get(law_id, [])
        n_needles = len(needles)
        scoped_units = []
        for u in units:
            hits = sum(1 for n in needles if n and norm(n) in u["text"])
            if hits:
                scoped_units.append(
                    (u["norm_id"], u["kind"], u["char_start"], u["char_end"], hits)
                )
        if scoped_units:
            scoped += 1
        else:
            whole_only += 1
        unresolved_count = law_unresolved.get(law_id, 0)
        cov_fail = sum(1 for u in units if not (u.get("coverage_evidence") or {}).get("covered"))
        coverage_fail_total += cov_fail
        loc = "; ".join(
            "%s[%s]@%d-%d×%d" % (nid[:10], k, a, b, h)
            for nid, k, a, b, h in scoped_units[:4]
        ) or "(no norm unit contains the needle text)"
        rows.append((
            law_id, art or "(file-level)", n_needles, len(units), loc,
            unresolved_count, cov_fail, name.split("↔")[0].strip()[:60],
        ))

    lines = [
        "# Norm-unit scoped fidelity diagnostic (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with "
        "`python scripts/law_audit/phase_e/article_scope.py`.",
        "",
        "Objective §1: a numeric match anywhere in the whole pinned text is NOT",
        "article-level or norm-level verification. This report records, per",
        "transcription check, which norm unit (with exact offsets) contains the",
        "needle, whether the decomposition covers the original, and which text",
        "remains UNRESOLVED.",
        "",
        "- checks with norm-unit-scoped needles: %d" % scoped,
        "- checks with no scoped unit (whole-text/cross-unit needles): %d" % whole_only,
        "- UNRESOLVED norm units across checked laws (counted once per law): %d"
        % sum(law_unresolved.values()),
        "- units failing independent coverage audit: %d" % coverage_fail_total,
        "",
        "| law_id | stated article | needles | units | containing norm units "
        "| unresolved | coverage_fail | check |",
        "|---|---|---:|---:|---|---:|---:|---|",
    ]
    for lid, art, n, nu, loc, unres, cf, nm in rows:
        lines.append("| `%s` | %s | %d | %d | %s | %d | %d | %s |" % (
            lid, art, n, nu, loc, unres, cf, nm,
        ))
    lines.append("")
    OUT.write_text("\n".join(lines), encoding="utf-8")
    print(
        "article-scope diagnostic: %d scoped / %d whole-text across %d checks; "
        "unresolved=%d; coverage_fail=%d"
        % (scoped, whole_only, len(rows), sum(law_unresolved.values()),
           coverage_fail_total)
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
