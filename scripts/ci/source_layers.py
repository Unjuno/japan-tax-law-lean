#!/usr/bin/env python3
"""Separate-source-layer registry (Objective §2).

The current 327-law ledger is a PROVISIONAL population, not the whole of
Japanese tax law.  This tool makes the other source families explicit and
keeps them in separate layers, with their own legal nature, acquisition status
and verification status.  It NEVER folds an auxiliary layer into the statutory
ledger and NEVER claims content that has not been acquired.

Layers:
  L0_STATUTE      法律・政令・省令 (the pinned 2026-11-15 snapshot)
  L1_PROVISION    附則・別表・経過措置 inside L0 snapshots
  L2_ORDINANCE    地方税条例 (municipality by municipality) — not acquired
  L3_TREATY       租税条約 — auxiliary legal source, not modelled
  L4_CIRCULAR     通達 — auxiliary legal source, not modelled
  L5_CASELAW      裁判例 — auxiliary legal source, not modelled
  L6_HISTORICAL   歴史的施行版 (旧法/新法 references) — not pinned

Regenerate with `python scripts/ci/source_layers.py`; deterministic gate.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
INVENTORY = REPO / "data" / "INVENTORY.json"
DISCOVERY = REPO / "docs" / "RECURSIVE_DISCOVERY.md"
BLOCKED = REPO / "docs" / "BLOCKED.md"
OUT_JSON = REPO / "data" / "SOURCE_LAYERS.json"
OUT_MD = REPO / "docs" / "SOURCE_LAYERS.md"
QUEUE_DOC = REPO / "docs" / "TASK_QUEUE.md"


def _read(p: Path) -> str:
    return p.read_text(encoding="utf-8") if p.exists() else ""


def _int(pattern: str, text: str, default: int = 0) -> int:
    m = re.search(pattern, text)
    return int(m.group(1)) if m else default


def queue_counts() -> dict:
    """Read counts from the COMMITTED task-queue document.

    build/task_queue.json is git-ignored and differs between local runs and CI,
    so deriving a committed ledger from it made source-layer determinism
    depend on an uncommitted artifact and caused repeated CI drift. The
    committed docs/TASK_QUEUE.md is the authoritative, reproducible source.
    """
    text = _read(QUEUE_DOC)
    if not text:
        return {}
    out = {}
    m = re.search(r"normative units:\s*(\d+)", text)
    if m:
        out["units_total"] = int(m.group(1))
    for name, value in re.findall(
        r"^\|\s*(NOT_STARTED|PARTIAL|PROVED_SCOPE|FULLY_VERIFIED|BLOCKED)\s*\|\s*(\d+)\s*\|",
        text, re.M,
    ):
        out[name] = int(value)
    return out


def build() -> dict:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = inv.get("laws", [])
    snapshot = inv.get("snapshot_date", "")
    acquired = sum(
        1 for l in laws
        if (l.get("raw_snapshot") or {}).get("source_file")
        and (REPO / (l.get("raw_snapshot") or {}).get("source_file", "")).exists()
    )
    enforced = sum(1 for l in laws
                   if (l.get("current_revision") or {}).get("status") == "enforced"
                   or (l.get("current_revision") or {}).get("amendment_enforcement_date"))

    disc = _read(DISCOVERY)
    blocked = _read(BLOCKED)
    hist_names = _int(r"tax-name candidates prefixed.*?: (\d+) names", disc)
    hist_occ = _int(r"tax-name candidates prefixed.*?/ (\d+) occurrences", disc)
    unmatched = _int(r"distinct unmatched reference names: (\d+)", disc)
    tax_candidates = _int(r"Tax-name candidates \(contain '税'.*?\) — (\d+) names", disc)
    m_ord = re.search(r"地方税条例 \(~([\d,]+) municipal ordinances\)", blocked)
    ordinances = int(m_ord.group(1).replace(",", "")) if m_ord else 0
    reviewers = _int(r"candidates with recorded reviewer: (\d+)", blocked)

    layers = [
        {
            "layer_id": "L0_STATUTE",
            "label_ja": "法律・政令・省令",
            "legal_nature": "国家法源（法律・政令・省令）",
            "authority": "e-Gov 法令API",
            "acquisition_status": "ACQUIRED_PARTIAL",
            "scope_status": "PROVISIONAL_POPULATION",
            "count": len(laws),
            "count_acquired": acquired,
            "pinned_snapshot": snapshot,
            "verification_status": "PARTIAL",
            "auxiliary": False,
            "notes": "327件は暫定母集団。全日本税法を意味しない。未取得2件は BLOCKED として記録。",
        },
        {
            "layer_id": "L1_PROVISION",
            "label_ja": "附則・別表・経過措置",
            "legal_nature": "L0 内の一部を構成する規範",
            "authority": "L0 の pin 済み bytes",
            "acquisition_status": "ACQUIRED_WITHIN_L0",
            "scope_status": "INCLUDED_IN_L0",
            "count": None,
            "count_acquired": acquired,
            "pinned_snapshot": snapshot,
            "verification_status": "PARTIAL",
            "auxiliary": False,
            "notes": "別表セル・附則IDは規範識別子に含める。L0 から分離して数えない。",
        },
        {
            "layer_id": "L2_ORDINANCE",
            "label_ja": "地方税条例",
            "legal_nature": "自治体条例（地方自治法に基づく法源）",
            "authority": "各自治体",
            "acquisition_status": "NOT_ACQUIRED",
            "scope_status": "IN_SCOPE_BACKLOG",
            "count": ordinances,
            "count_acquired": 0,
            "pinned_snapshot": "",
            "verification_status": "NOT_IMPLEMENTED",
            "auxiliary": False,
            "notes": "対象に保持。自治体・版付きで段階的に収集する。UNSUPPORTED は実装状態であり恒久除外ではない。",
        },
        {
            "layer_id": "L3_TREATY",
            "label_ja": "租税条約",
            "legal_nature": "条約（国際法源）— 国内法とは効力発生の機構が異なる",
            "authority": "外務省 / 条約締結",
            "acquisition_status": "NOT_ACQUIRED",
            "scope_status": "IN_SCOPE_BACKLOG",
            "count": None,
            "count_acquired": 0,
            "pinned_snapshot": "",
            "verification_status": "NOT_IMPLEMENTED",
            "auxiliary": True,
            "notes": "対象に保持。法源上の性質が異なるため L0 に混ぜず、別層・版付きで管理する。",
        },
        {
            "layer_id": "L4_CIRCULAR",
            "label_ja": "通達",
            "legal_nature": "行政通達（法的拘束力は条文ではなく行政内部）",
            "authority": "国税庁 / 総務省",
            "acquisition_status": "NOT_ACQUIRED",
            "scope_status": "IN_SCOPE_INTERPRETATION_LAYER",
            "count": None,
            "count_acquired": 0,
            "pinned_snapshot": "",
            "verification_status": "NOT_IMPLEMENTED",
            "auxiliary": True,
            "notes": "対象に保持。法令本文とは区別した解釈資料レイヤーとして段階的に収録する。",
        },
        {
            "layer_id": "L5_CASELAW",
            "label_ja": "裁判例",
            "legal_nature": "判決・裁定（法源ではなく判断例）",
            "authority": "裁判所",
            "acquisition_status": "NOT_ACQUIRED",
            "scope_status": "IN_SCOPE_INTERPRETATION_LAYER",
            "count": None,
            "count_acquired": 0,
            "pinned_snapshot": "",
            "verification_status": "NOT_IMPLEMENTED",
            "auxiliary": True,
            "notes": "対象に保持。反例・対立解釈の資料として別層に置き、規範そのものとは混ぜない。",
        },
        {
            "layer_id": "L6_HISTORICAL",
            "label_ja": "歴史的施行版",
            "legal_nature": "旧法・新法（同一法令の別施行版）",
            "authority": "e-Gov 歴史情報",
            "acquisition_status": "NOT_PINNED",
            "scope_status": "IN_SCOPE_BACKLOG",
            "count": hist_names,
            "count_acquired": 0,
            "pinned_snapshot": "",
            "verification_status": "NOT_PINNED",
            "auxiliary": False,
            "notes": "附則・経過措置の新旧参照。対象に保持し、施行版を版付きで固定する作業を継続する。",
        },
    ]
    q = queue_counts()
    pipeline = {
        "normative_units_total": q.get("units_total"),
        "fully_verified_units": q.get("FULLY_VERIFIED"),
        "proved_scope_units": q.get("PROVED_SCOPE"),
        "not_started_units": q.get("NOT_STARTED"),
        "blocked_units": q.get("BLOCKED"),
        "human_legal_reviews": reviewers,
        "note": "Separate denominators; unknown (None) means the input is absent, never zero.",
    }
    return {
        "tool": "scripts/ci/source_layers.py",
        "schema": 1,
        "inventory_snapshot": snapshot,
        "verification_pipeline": pipeline,
        "discovery": {
            "distinct_unmatched_reference_names": unmatched,
            "tax_name_candidates_outside_ledger": tax_candidates,
            "historical_names": hist_names,
            "historical_occurrences": hist_occ,
            "human_reviewers_recorded": reviewers,
        },
        "layer_separation_rule": "auxiliary layers are never merged into L0; counts are separate denominators",
        "sponsor_directive_2026_11_24": {
            "human_review_is_a_completion_condition_not_a_start_condition": True,
            "local_ordinances_and_treaties_remain_in_scope": True,
            "circulars_and_case_law_are_separate_interpretation_layers": True,
            "unsupported_is_implementation_state_not_permanent_exclusion": True,
            "formalization_continues_while_backlogs_are_pending": True,
        },
        "layers": layers,
    }


def main() -> int:
    payload = build()
    text = json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n"
    changed = False
    if not OUT_JSON.exists() or OUT_JSON.read_text(encoding="utf-8") != text:
        OUT_JSON.write_text(text, encoding="utf-8")
        print("wrote", OUT_JSON)
        changed = True
    else:
        print("source layer registry matches committed state (deterministic)")

    lines = [
        "# Source layers (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/source_layers.py`.",
        "",
        "The 327-law snapshot is a PROVISIONAL population. The following layers",
        "are kept separate by legal nature and verification status; an auxiliary",
        "layer is never folded into the statutory ledger.",
        "",
        "Sponsor directive 2026-11-24: every layer below remains IN SCOPE.",
        "Human review is a final-determination condition, not a start condition;",
        "UNSUPPORTED/NOT_IMPLEMENTED is current implementation state, not exclusion.",
        "Circulars and case law are staged as interpretation layers separate from 法令本文.",
        "",
        f"- snapshot: {payload['inventory_snapshot']}",
        f"- distinct unmatched reference names: {payload['discovery']['distinct_unmatched_reference_names']}",
        f"- tax-name candidates outside ledger: {payload['discovery']['tax_name_candidates_outside_ledger']}",
        f"- historical names / occurrences: {payload['discovery']['historical_names']} / {payload['discovery']['historical_occurrences']}",
        "",
        "| layer | label | legal nature | acquisition | scope | count | verification |",
        "|---|---|---|---|---|---:|---|",
    ]
    for l in payload["layers"]:
        lines.append("| %s | %s | %s | %s | %s | %s | %s |" % (
            l["layer_id"], l["label_ja"], l["legal_nature"], l["acquisition_status"],
            l["scope_status"], l["count"] if l["count"] is not None else "-",
            l["verification_status"]))
    p = payload["verification_pipeline"]
    lines += ["", "## Obligation counts (separate denominators)", ""]
    for key in ("normative_units_total", "fully_verified_units", "proved_scope_units",
                "not_started_units", "blocked_units", "human_legal_reviews"):
        value = p[key]
        lines.append(f"- {key}: {value if value is not None else 'unknown'}")
    lines += [
        "",
        p["note"],
        "",
        "No layer other than L0 has acquired content in this repository. No",
        "completion claim is made for any layer.",
        "",
    ]
    md_text = "\n".join(lines)
    if not OUT_MD.exists() or OUT_MD.read_text(encoding="utf-8") != md_text:
        OUT_MD.parent.mkdir(parents=True, exist_ok=True)
        OUT_MD.write_text(md_text, encoding="utf-8")
        print("wrote", OUT_MD)
        changed = True
    print("layers:", len(payload["layers"]))
    # A regeneration gate must fail when the committed ledger was stale:
    # silently rewriting it made a green gate meaningless (SKIP != PASS).
    return 1 if changed else 0


if __name__ == "__main__":
    sys.exit(main())
