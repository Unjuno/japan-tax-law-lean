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

   L7_DISCOVERED_SCOPE: recursively discovered laws outside L0 (pinned only).

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
DISCOVERED = REPO / "data" / "DISCOVERED_INVENTORY.json"
AUX_INDEX = REPO / "data" / "raw_circulars" / "nta_tsutatsu_index.meta.json"
HIST_PINNED = REPO / "data" / "HISTORICAL_PINNED.json"
CASE_PINNED = REPO / "data" / "CASELAW_PINNED.json"
ORDINANCE_PINNED = REPO / "data" / "ORDINANCE_PINNED.json"
BLOCKED = REPO / "docs" / "BLOCKED.md"
OUT_JSON = REPO / "data" / "SOURCE_LAYERS.json"
OUT_MD = REPO / "docs" / "SOURCE_LAYERS.md"
QUEUE = REPO / "build" / "task_queue.json"


def _read(p: Path) -> str:
    return p.read_text(encoding="utf-8") if p.exists() else ""


def _int(pattern: str, text: str, default: int = 0) -> int:
    m = re.search(pattern, text)
    return int(m.group(1)) if m else default


def queue_counts() -> dict:
    """Read only the payload head of the streamed queue (no 240 MB load).

    A missing queue is UNKNOWN (None), never zero: the object does not exist
    on some branches, and that is not the same as 'no normative units'.
    """
    if not QUEUE.exists():
        return {}
    with QUEUE.open("r", encoding="utf-8") as fh:
        head = fh.read(16384)
    m = re.search(r'"status_counts"\s*:\s*\{([^}]*)\}', head)
    if not m:
        return {}
    return {k: int(v) for k, v in re.findall(r'"([A-Z_]+)"\s*:\s*(\d+)', m.group(1))}


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

    discovered = json.loads(DISCOVERED.read_text(encoding="utf-8")) if DISCOVERED.exists() else {}
    disc_total = discovered.get("laws_total_discovered")
    disc_acquired = discovered.get("laws_acquired_total") or 0
    disc_snapshot = discovered.get("snapshot_date", "")
    aux_index = json.loads(AUX_INDEX.read_text(encoding="utf-8")) if AUX_INDEX.exists() else None
    l4_acquired = (aux_index or {}).get("documents_acquired_count", 0)
    l4_status = "ACQUIRED_PINNED_ONLY" if l4_acquired else "NOT_ACQUIRED"
    hist_ledger = json.loads(HIST_PINNED.read_text(encoding="utf-8")) if HIST_PINNED.exists() else None
    l6_acquired = (hist_ledger or {}).get("count_acquired", 0)
    l6_status = "ACQUIRED_PINNED_ONLY" if l6_acquired else "NOT_PINNED"
    case_ledger = json.loads(CASE_PINNED.read_text(encoding="utf-8")) if CASE_PINNED.exists() else None
    l5_acquired = (case_ledger or {}).get("count_acquired", 0)
    l5_status = "ACQUIRED_PINNED_ONLY" if l5_acquired else "NOT_ACQUIRED"
    ord_ledger = json.loads(ORDINANCE_PINNED.read_text(encoding="utf-8")) if ORDINANCE_PINNED.exists() else None
    l2_acquired = (ord_ledger or {}).get("count_acquired", 0)
    l2_status = "ACQUIRED_PINNED_ONLY" if l2_acquired else "NOT_ACQUIRED"

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
            "acquisition_status": l2_status,
            "scope_status": "DECLARED_UNSUPPORTED",
            "count": ordinances,
            "count_acquired": l2_acquired,
            "pinned_snapshot": "",
            "verification_status": "OUT_OF_SCOPE",
            "auxiliary": False,
            "notes": "一部の自治体条例を pin 取得のみ（第三者の横断索引経由、公式サイト本文を固定）。parse・形式化・証明・人間レビューは未実施。全自治体網羅は主張しない。L0 に合算しない。",
        },
        {
            "layer_id": "L3_TREATY",
            "label_ja": "租税条約",
            "legal_nature": "条約（国際法源）— 国内法とは効力発生の機構が異なる",
            "authority": "外務省 / 条約締結",
            "acquisition_status": "NOT_ACQUIRED",
            "scope_status": "AUXILIARY_LAYER",
            "count": None,
            "count_acquired": 0,
            "pinned_snapshot": "",
            "verification_status": "OUT_OF_SCOPE",
            "auxiliary": True,
            "notes": "法源上の性質が異なるため L0 に混ぜない。別層として管理する。",
        },
        {
            "layer_id": "L4_CIRCULAR",
            "label_ja": "通達",
            "legal_nature": "行政通達（法的拘束力は条文ではなく行政内部）",
            "authority": "国税庁 / 総務省",
            "acquisition_status": l4_status,
            "scope_status": "AUXILIARY_LAYER",
            "count": None,
            "count_acquired": l4_acquired,
            "pinned_snapshot": "",
            "verification_status": "OUT_OF_SCOPE",
            "auxiliary": True,
            "notes": "原文対応監査の対象外。解釈資料として別層に置く。",
        },
        {
            "layer_id": "L5_CASELAW",
            "label_ja": "裁判例",
            "legal_nature": "判決・裁定（法源ではなく判断例）",
            "authority": "裁判所",
            "acquisition_status": l5_status,
            "scope_status": "AUXILIARY_LAYER",
            "count": None,
            "count_acquired": l5_acquired,
            "pinned_snapshot": "",
            "verification_status": "OUT_OF_SCOPE",
            "auxiliary": True,
            "notes": "裁判例HTMLを pin 取得のみ（反例・対立解釈の補助資料）。parse・形式化・証明・法的拘束力・人間レビューは主張しない。L0 に合算しない。",
        },
        {
            "layer_id": "L6_HISTORICAL",
            "label_ja": "歴史的施行版",
            "legal_nature": "旧法・新法（同一法令の別施行版）",
            "authority": "e-Gov 歴史情報",
            "acquisition_status": l6_status,
            "scope_status": "HISTORICAL_LAYER",
            "count": hist_names,
            "count_acquired": l6_acquired,
            "pinned_snapshot": "",
            "verification_status": "OUT_OF_SCOPE",
            "auxiliary": False,
            "notes": "歴史的/未施行版を別途 pin 取得のみ。parse・形式化・証明・人間レビューは未実施。L0 に合算しない。",
        },
        {
            "layer_id": "L7_DISCOVERED_SCOPE",
            "label_ja": "再帰的探索で発見された関連法令",
            "legal_nature": "L0 外の参照・準用・委任から発見された国家法源（法令名に 税 を含まないものを含む）",
            "authority": "e-Gov 法令API（再帰的探索）",
            "acquisition_status": "ACQUIRED_PINNED_ONLY" if disc_acquired else "NOT_ACQUIRED",
            "scope_status": "DISCOVERED_CANDIDATE_LAYER",
            "count": disc_total,
            "count_acquired": disc_acquired,
            "pinned_snapshot": disc_snapshot,
            "verification_status": "OUT_OF_SCOPE",
            "auxiliary": True,
            "notes": "INVENTORY には含まれない。pin 取得のみで parse・形式化・証明・人間レビューは未実施。L0 に合算しない。",
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
            "discovered_law_candidates": disc_total,
            "discovered_laws_pinned": disc_acquired,
            "human_reviewers_recorded": reviewers,
        },
        "layer_separation_rule": "auxiliary layers are never merged into L0; counts are separate denominators",
        "auxiliary_index_acquisition": aux_index,
        "historical_acquisition": hist_ledger,
        "caselaw_acquisition": case_ledger,
        "ordinance_acquisition": ord_ledger,
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
        f"- discovered law candidates / pinned: {payload['discovery']['discovered_law_candidates']} / {payload['discovery']['discovered_laws_pinned']}",
        "",
        "## Auxiliary index acquisition (index page only, not underlying sources)",
        "",
    ]
    ai = payload["auxiliary_index_acquisition"]
    if ai is None:
        lines.append("- none acquired")
    else:
        lines += [
            f"- {ai['layer_id']}: {ai['source_url']}",
            f"  pinned {ai['raw_file']} sha256={ai['raw_sha256']} "
            f"bytes={ai['raw_bytes']} hrefs={ai['index_href_count']}",
            f"  content_acquired={ai['content_acquired']} (underlying circular texts NOT acquired)",
        ]
    ha = payload["historical_acquisition"]
    if ha is None:
        lines += ["", "## Historical revision acquisition", "", "- none acquired"]
    else:
        lines += [
            "", "## Historical revision acquisition", "",
            f"- revisions recorded: {ha.get('count_total')}; "
            f"ACQUIRED_PINNED: {ha.get('count_acquired')}",
            f"- verification_status: {ha.get('verification_status')} "
            "(pinned only; NOT parsed, formalized, proved or legally reviewed)",
        ]
    ca = payload["caselaw_acquisition"]
    if ca is None:
        lines += ["", "## Case-law acquisition", "", "- none acquired"]
    else:
        lines += [
            "", "## Case-law acquisition", "",
            f"- keyword: {ca.get('search_keyword')}; reported hits: "
            f"{(ca.get('index') or {}).get('reported_hit_count', 'unknown')}",
            f"- ACQUIRED_PINNED pages: {ca.get('count_acquired')} "
            f"({len(ca.get('judgments') or [])} judgments)",
            f"- verification_status: {ca.get('verification_status')} "
            "(pinned only; NOT parsed, formalized, proved, binding or legally reviewed)",
        ]
    oa = payload["ordinance_acquisition"]
    if oa is None:
        lines += ["", "## Ordinance acquisition", "", "- none acquired"]
    else:
        lines += [
            "", "## Ordinance acquisition", "",
            f"- index: {oa.get('index_source', '')} (third-party aggregator, NOT an official original)",
            f"- index reported hits: {oa.get('count_index_hits')}; "
            f"ACQUIRED_PINNED official pages: {oa.get('count_acquired')}",
            f"- verification_status: {oa.get('verification_status')} "
            "(pinned only; all-municipality coverage NOT claimed)",
        ]
    lines += [
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
        "No layer other than L0 has source texts PARSED, FORMALIZED or PROVED here.",
        "The pinned L4 item is an index page plus one circular page; the pinned L6",
        "items are historical revision snapshots. All are acquisition-only with",
        "verification OUT_OF_SCOPE. No completion claim is made.",
        "",
    ]
    OUT_MD.parent.mkdir(parents=True, exist_ok=True)
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print("layers:", len(payload["layers"]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
