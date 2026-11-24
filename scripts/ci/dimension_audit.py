#!/usr/bin/env python3
"""Dimensional / unit annotation audit (Directive §3, Objective §5).

"The meaning, unit, domain and type of every variable must be recorded, and
dimensional consistency checked." A Lean proof cannot establish that a
model's constant carries the same unit as the statute. This tool does that
check INDEPENDENTLY of Lean:

  * read each evidenced normative unit's original text from the pinned queue;
  * detect the statutory unit markers (円 / 百分 / 千分 / 月 / 年 / 回 / 人 /
    平方メートル / トン / キロメートル / 度 ...);
  * read the implementation and spec modules and require that the detected
    unit is documented (unit tag in a constant name or an explicit note);
  * emit H/T/D/C/U findings plus counts per unit, never a completeness claim.

Usage:
  python scripts/ci/dimension_audit.py            # check/regenerate
  python scripts/ci/dimension_audit.py --strict   # exit 1 on FAIL
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
EVIDENCE = REPO / "data" / "verification_evidence.json"
QUEUE = REPO / "build" / "task_queue.json"
OUT_JSON = REPO / "data" / "DIMENSION_AUDIT.json"
OUT_MD = REPO / "docs" / "DIMENSION_AUDIT.md"

# Statutory unit marker -> regex in Lean source that documents the same unit.
UNITS = {
    "円": {
        "pattern": r"円|Yen|yen|_man|Man|万円",
        "H": "the statute states an amount in yen but the model does not document a monetary unit",
    },
    "百分": {
        "pattern": r"百分|Rate|rate|Percent|percent|/ ?100|/100|100\)|千分",
        "H": "the statute states a percentage but the model does not document a rate unit",
    },
    "千分": {
        "pattern": r"千分|Rate|rate|/ ?1000|/1000|PerMille|perMille",
        "H": "the statute states a per-mille rate but the model does not document a rate unit",
    },
    "月": {
        "pattern": r"月|Month|month|Months",
        "H": "the statute states months but the model does not document a month domain",
    },
    "年": {
        "pattern": r"年|Year|year|Years",
        "H": "the statute states years but the model does not document a year domain",
    },
    "回": {
        "pattern": r"回|perDeparture|departure|Times|times|Count|count",
        "H": "the statute states a per-occurrence unit but the model does not document it",
    },
    "人": {
        "pattern": r"人|Person|person|persons|People|people| heirs?|Heir",
        "H": "the statute states a person count but the model does not document it",
    },
    "平方メートル": {
        "pattern": r"平方|Sqm|sqm|Area|area|面積",
        "H": "the statute states an area but the model does not document an area unit",
    },
    "トン": {
        "pattern": r"トン|Ton|ton|Tonnage|tonnage",
        "H": "the statute states a tonnage but the model does not document a ton unit",
    },
    "キロメートル": {
        "pattern": r"キロメートル|Km|km|Distance|distance|距離",
        "H": "the statute states a distance but the model does not document a distance unit",
    },
}


def unit_markers(text: str) -> list[str]:
    return [u for u in UNITS if u in (text or "")]


def lean_texts(axes: dict) -> str:
    out = []
    for axis in ("implementation", "independent_spec", "tests"):
        m = re.search(r"JapanTaxLaw/[\w.]+\.lean", str(axes.get(axis, "")))
        if not m:
            continue
        p = REPO / m.group(0)
        if p.exists():
            out.append(p.read_text(encoding="utf-8"))
    return "\n".join(out)


def main() -> int:
    ev = json.loads(EVIDENCE.read_text(encoding="utf-8")) if EVIDENCE.exists() else {"units": {}}
    # Map normative_id -> original norm text by regex over the streamed queue.
    # json.load() of the ~240 MB queue is memory-heavy; a regex pair scan is
    # sufficient because each task stores "normative_id" before its "text".
    queue_text = ""
    if QUEUE.exists():
        queue_text = QUEUE.read_text(encoding="utf-8")
    id_text = {}
    for m in re.finditer(
        r'"normative_id"\s*:\s*"(NORM\|[0-9a-f]{64})"', queue_text
    ):
        tail = queue_text[m.end():m.end() + 6000]
        tm = re.search(r'"text"\s*:\s*"((?:[^"\\]|\\.)*)"', tail)
        if tm:
            try:
                id_text[m.group(1)] = json.loads('"' + tm.group(1) + '"')
            except (ValueError, TypeError):
                pass

    findings = []
    per_unit = {}
    for uid, axes in ev.get("units", {}).items():
        if not isinstance(axes, dict):
            continue
        src = str(axes.get("source_location", ""))
        original = id_text.get(uid, "")
        # Prefer the exact original norm text; fall back to the evidence note.
        units = unit_markers(original) or unit_markers(src)
        lt = lean_texts(axes)
        if not lt:
            continue
        documented = []
        for u in units:
            ok = re.search(UNITS[u]["pattern"], lt) is not None
            documented.append({"unit": u, "documented": ok})
            findings.append({
                "unit_id": uid, "statutory_unit": u,
                "D": "PASS" if ok else "FAIL",
                "H": UNITS[u]["H"],
                "T": "scan the pinned unit's original text for unit markers and the Lean impl/spec/tests for a matching unit tag",
                "C": "a unit may be caller-established at the boundary rather than encoded in this module",
                "U": "checks documentation of units only; no proof of legal correctness or numeric equality",
            })
        per_unit[uid] = documented

    fails = [f for f in findings if f["D"] == "FAIL"]
    by_unit = {}
    for f in findings:
        by_unit.setdefault(f["statutory_unit"], [0, 0])
        by_unit[f["statutory_unit"]][0 if f["D"] == "PASS" else 1] += 1
    payload = {
        "tool": "scripts/ci/dimension_audit.py",
        "schema": "dimension-audit/v1",
        "units_checked": len(per_unit),
        "findings": len(findings),
        "documented": len(findings) - len(fails),
        "undocumented": len(fails),
        "by_statutory_unit": by_unit,
        "all_complete_claimable": False,
        "findings_detail": findings,
    }
    OUT_JSON.write_text(json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")

    lines = [
        "# Dimension / unit annotation audit (machine-generated)", "",
        "Do not hand-edit. Regenerate with `scripts/ci/dimension_audit.py`.", "",
        "Independent of Lean: checks that a statutory unit appearing in the",
        "original text is documented in the corresponding Lean model.",
        "This is documentation/consistency only, NOT a proof and NOT a claim of",
        "legal correctness.", "",
        f"- units checked: {payload['units_checked']}",
        f"- unit findings: {payload['findings']}",
        f"- documented: {payload['documented']} / undocumented: {payload['undocumented']}",
        f"- all-complete claimable: False", "",
        "| statutory unit | documented | undocumented |", "|---|---:|---:|",
    ]
    for u, (ok, bad) in sorted(by_unit.items()):
        lines.append(f"| {u} | {ok} | {bad} |")
    lines += ["", "## Undocumented findings (H/T/D/C/U in JSON)", ""]
    for f in fails[:30]:
        lines.append(f"- `{f['unit_id'][:20]}` unit `{f['statutory_unit']}` — {f['H']}")
    if len(fails) > 30:
        lines.append(f"- ... and {len(fails) - 30} more")
    lines.append("")
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print(f"dimension audit: {payload['documented']}/{payload['findings']} documented, "
          f"{payload['undocumented']} undocumented")
    return 1 if ("--strict" in sys.argv and fails) else 0


if __name__ == "__main__":
    sys.exit(main())
