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
LOCAL_JURISDICTIONS = REPO / "data" / "LOCAL_JURISDICTIONS.json"
TAX_TREATIES = REPO / "data" / "TAX_TREATIES.json"
HISTORICAL_PINS = REPO / "data" / "HISTORICAL_REVISION_PINS.json"
AUXILIARY_SOURCES = REPO / "data" / "AUXILIARY_SOURCES.json"
OUT_JSON = REPO / "data" / "SOURCE_LAYERS.json"
OUT_MD = REPO / "docs" / "SOURCE_LAYERS.md"


def _read(p: Path) -> str:
    return p.read_text(encoding="utf-8") if p.exists() else ""


def _int(pattern: str, text: str, default: int = 0) -> int:
    m = re.search(pattern, text)
    return int(m.group(1)) if m else default


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
    declared_ordinances = int(m_ord.group(1).replace(",", "")) if m_ord else 0
    # Prefer the official jurisdiction enumeration when present. It records
    # authority units, NOT ordinance text — acquisition remains zero.
    local_enum = None
    if LOCAL_JURISDICTIONS.exists():
        try:
            local_enum = int(json.loads(
                LOCAL_JURISDICTIONS.read_text(encoding="utf-8")).get("jurisdictions_total") or 0)
        except (ValueError, OSError):
            local_enum = None
    ordinances = local_enum if local_enum is not None else declared_ordinances
    circular_count = None
    if AUXILIARY_SOURCES.exists():
        try:
            kc = json.loads(AUXILIARY_SOURCES.read_text(encoding="utf-8")).get("kind_counts") or {}
            circular_count = int(kc.get("CIRCULAR_FAMILY") or 0)
        except (ValueError, OSError):
            circular_count = None
    hist_pinned = 0
    if HISTORICAL_PINS.exists():
        try:
            hist_pinned = int(json.loads(
                HISTORICAL_PINS.read_text(encoding="utf-8")).get("pinned_candidates") or 0)
        except (ValueError, OSError):
            hist_pinned = 0
    treaty_count = None
    if TAX_TREATIES.exists():
        try:
            treaty_count = int(json.loads(
                TAX_TREATIES.read_text(encoding="utf-8")).get("partners_total") or 0)
        except (ValueError, OSError):
            treaty_count = None
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
            "scope_status": ("ENUMERATED_NOT_ACQUIRED" if local_enum is not None
                             else "DECLARED_UNSUPPORTED"),
            "count": ordinances,
            "count_acquired": 0,
            "pinned_snapshot": "",
            "verification_status": "OUT_OF_SCOPE",
            "auxiliary": False,
            "notes": ("総務省の公式団体コード一覧から自治体単位を列挙済み"
                      "（data/LOCAL_JURISDICTIONS.json）。条例本文・施行版・証明は未取得。"
                      "対象を勝手に縮小せず、未取得として明示する。"),
        },
        {
            "layer_id": "L3_TREATY",
            "label_ja": "租税条約",
            "legal_nature": "条約（国際法源）— 国内法とは効力発生の機構が異なる",
            "authority": "外務省 / 条約締結",
            "acquisition_status": "NOT_ACQUIRED",
            "scope_status": ("ENUMERATED_NOT_ACQUIRED" if treaty_count is not None
                             else "AUXILIARY_LAYER"),
            "count": treaty_count,
            "count_acquired": 0,
            "pinned_snapshot": "",
            "verification_status": "OUT_OF_SCOPE",
            "auxiliary": True,
            "notes": ("財務省の公式一覧から相手国・協定種別を列挙済み"
                      "（data/TAX_TREATIES.json）。条約本文・施行版・証明は未取得。"
                      "法源上の性質が異なるため L0 に混ぜない。"),
        },
        {
            "layer_id": "L4_CIRCULAR",
            "label_ja": "通達",
            "legal_nature": "行政通達（法的拘束力は条文ではなく行政内部）",
            "authority": "国税庁 / 総務省",
            "acquisition_status": "NOT_ACQUIRED",
            "scope_status": ("ENUMERATED_NOT_ACQUIRED" if circular_count is not None
                             else "AUXILIARY_LAYER"),
            "count": circular_count,
            "count_acquired": 0,
            "pinned_snapshot": "",
            "verification_status": "OUT_OF_SCOPE",
            "auxiliary": True,
            "notes": ("国税庁の公式一覧から通達の税目区分を列挙"
                      "（data/AUXILIARY_SOURCES.json）。通達本文・施行版・証明は未取得。"
                      "原文対応監査の対象外。"),
        },
        {
            "layer_id": "L5_CASELAW",
            "label_ja": "裁判例",
            "legal_nature": "判決・裁定（法源ではなく判断例）",
            "authority": "裁判所",
            "acquisition_status": "NOT_ACQUIRED",
            "scope_status": "AUXILIARY_LAYER",
            "count": None,
            "count_acquired": 0,
            "pinned_snapshot": "",
            "verification_status": "OUT_OF_SCOPE",
            "auxiliary": True,
            "notes": "反例・対立解釈の資料として別層に置き、規範そのものとは混ぜない。",
        },
        {
            "layer_id": "L6_HISTORICAL",
            "label_ja": "歴史的施行版",
            "legal_nature": "旧法・新法（同一法令の別施行版）",
            "authority": "e-Gov 歴史情報",
            "acquisition_status": ("PREDECESSOR_CANDIDATES_PINNED" if hist_pinned
                                   else "NOT_PINNED"),
            "scope_status": "HISTORICAL_LAYER",
            "count": hist_names,
            "count_acquired": hist_pinned,
            "pinned_snapshot": "",
            "verification_status": "OUT_OF_SCOPE",
            "auxiliary": False,
            "notes": ("附則・経過措置の新旧参照。直前の施行版を候補として固定"
                      "（data/HISTORICAL_REVISION_PINS.json）。具体的な新/旧参照との"
                      "対応は未解決。"),
        },
    ]
    return {
        "tool": "scripts/ci/source_layers.py",
        "schema": 1,
        "inventory_snapshot": snapshot,
        "discovery": {
            "distinct_unmatched_reference_names": unmatched,
            "tax_name_candidates_outside_ledger": tax_candidates,
            "historical_names": hist_names,
            "historical_occurrences": hist_occ,
            "human_reviewers_recorded": reviewers,
        },
        "layer_separation_rule": "auxiliary layers are never merged into L0; counts are separate denominators",
        "layers": layers,
    }


def main() -> int:
    payload = build()
    text = json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n"
    if OUT_JSON.exists() and OUT_JSON.read_text(encoding="utf-8") == text:
        print("source layer registry matches committed state (deterministic)")
    else:
        OUT_JSON.write_text(text, encoding="utf-8")
        print("wrote", OUT_JSON)

    lines = [
        "# Source layers (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/source_layers.py`.",
        "",
        "The 327-law snapshot is a PROVISIONAL population. The following layers",
        "are kept separate by legal nature and verification status; an auxiliary",
        "layer is never folded into the statutory ledger.",
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
    lines += [
        "",
        "No layer other than L0 has acquired content in this repository. No",
        "completion claim is made for any layer.",
        "",
    ]
    OUT_MD.parent.mkdir(parents=True, exist_ok=True)
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print("layers:", len(payload["layers"]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
