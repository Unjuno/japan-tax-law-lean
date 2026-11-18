#!/usr/bin/env python3
"""Cross-article rate consistency check (Objective §5 — semantic consistency).

For a set of semantically identical tax rates modelled from DIFFERENT articles,
this checker verifies two independent things for each source:

  1. FIDELITY — the pinned raw text of the cited article contains a verbatim
     needle stating the rate (normalised for whitespace / U+3000).
  2. MODEL   — the cited Lean module defines a TaxRate with the expected
     numerator / denominator.

It then compares all sources of a semantic key. Divergence is reported as a
CANDIDATE INCONSISTENCY requiring independent legal review — it is NEVER
auto-classified as a confirmed defect. Agreement is reported as CONSISTENT
under the stated pinned revisions, not as legal equivalence.

Regenerate with `python scripts/law_audit/phase_e/rate_consistency.py`;
deterministic regeneration gate.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
INVENTORY = REPO / "data" / "INVENTORY.json"
OUT = REPO / "docs" / "RATE_CONSISTENCY.md"

# (law_id, article, verbatim needle, Lean module, def name, num, den)
SOURCES: dict[str, list[tuple[str, str, str, str, str, int, int]]] = {
    "利子等 源泉徴収税率 15%": [
        ("340AC0000000033", "第百八十二条", "利子等その金額に百分の十五の税率を乗じて計算した金額",
         "IncomeMiscDeductions.lean", "interestWithholdingRate", 15, 100),
        ("340AC0000000033", "第百七十五条", "利子等又は同条第三号から第八号までに掲げる給付補てん金、利息、利益若しくは差益その金額に百分の十五の税率を乗じて計算した金額",
         "IncomeWithholdingRates.lean", "annuityWithholdingRate", 15, 100),
    ],
    "配当等 源泉徴収税率 20%": [
        ("340AC0000000033", "第百八十二条", "配当等その金額に百分の二十の税率を乗じて計算した金額",
         "IncomeMiscDeductions.lean", "dividendWithholdingRate", 20, 100),
        ("340AC0000000033", "第百七十五条", "配当等又は同条第九号に掲げる利益の分配その金額に百分の二十の税率を乗じて計算した金額",
         "IncomeWithholdingRates.lean", "dividendWithholdingRate", 20, 100),
    ],
}


def flat(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat(c) for c in node.get("children", []))
    return ""


def norm(text: str) -> str:
    return re.sub(r"[\s\u3000]+", "", text)


def build() -> str:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = {l["law_id"]: l for l in inv.get("laws", [])}
    texts: dict[str, str] = {}
    lines = [
        "# Cross-article / cross-law rate consistency (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `scripts/law_audit/phase_e/rate_consistency.py`.",
        "",
        "Objective §5: verify definitional/rate consistency between articles and laws.",
        "Each source is checked independently against (a) pinned raw text (verbatim",
        "needle, whitespace-normalised) and (b) the cited Lean TaxRate constant.",
        "A divergence is a CANDIDATE INCONSISTENCY requiring independent legal review;",
        "it is NOT auto-classified as a confirmed defect. Agreement is only under the",
        "stated pinned revisions and does not establish legal equivalence.",
        "",
    ]
    total_sources = 0
    total_fidelity_ok = 0
    total_model_ok = 0
    candidates = 0

    for key, sources in SOURCES.items():
        rows = []
        observed = set()
        for law_id, article, needle, module, def_name, num, den in sources:
            total_sources += 1
            if law_id not in texts:
                rec = laws.get(law_id)
                sf = (rec or {}).get("raw_snapshot", {}).get("source_file")
                p = REPO / sf if sf else None
                texts[law_id] = norm(flat(json.loads(p.read_text(encoding="utf-8")).get("law_full_text"))) if p and p.exists() else ""
            fidelity = needle in texts[law_id]
            if fidelity:
                total_fidelity_ok += 1

            mp = REPO / "JapanTaxLaw" / module
            mtext = mp.read_text(encoding="utf-8") if mp.exists() else ""
            mm = re.search(
                r"^def " + re.escape(def_name) + r"\s*:\s*TaxRate\s*:=\s*⟨\s*(\d+)\s*,\s*(\d+)",
                mtext, re.M,
            )
            model = bool(mm) and (int(mm.group(1)), int(mm.group(2))) == (num, den)
            if model:
                total_model_ok += 1
            seen = (int(mm.group(1)), int(mm.group(2))) if mm else None
            observed.add(seen)
            rows.append(
                f"| `{law_id}` | {article} | {module}::{def_name} | "
                f"{num}/{den} | {'FOUND' if fidelity else 'MISS'} | "
                f"{'OK' if model else 'MISMATCH'} |"
            )

        ok = len(observed) == 1 and None not in observed
        if not ok:
            candidates += 1
        lines += [
            f"## {key}",
            "",
            "| law_id | article | Lean def | expected | pinned needle | Lean model |",
            "|---|---|---|---|---|---|",
            *rows,
            "",
            f"Result: {'CONSISTENT under pinned revisions' if ok else 'CANDIDATE INCONSISTENCY — independent legal review required'}",
            "",
        ]

    lines += [
        "## Totals",
        "",
        f"- semantic keys checked: {len(SOURCES)}",
        f"- source articles checked: {total_sources}",
        f"- pinned needles FOUND: {total_fidelity_ok}/{total_sources}",
        f"- Lean rate constants matching expected: {total_model_ok}/{total_sources}",
        f"- candidate inconsistencies: {candidates}",
        "",
        "candidate inconsistencies are NOT confirmed defects: they require the same",
        "independent human legal review tracked in docs/BLOCKED.md.",
        "",
    ]
    return "\n".join(lines)


def main() -> int:
    text = build()
    if OUT.exists() and OUT.read_text(encoding="utf-8") == text:
        print("rate consistency ledger matches committed state (deterministic)")
        return 0
    OUT.write_text(text, encoding="utf-8")
    print("wrote", OUT)
    return 1


if __name__ == "__main__":
    sys.exit(main())
