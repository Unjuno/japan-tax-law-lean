#!/usr/bin/env python3
"""Separate-source-layer registry (Objective §2, Sponsor Directive §1/§5).

The current 327-law ledger is a PROVISIONAL population, not the whole of
Japanese tax law.  This tool makes the other source families explicit and
keeps them in separate layers, with their own legal nature, acquisition status
and verification status.  It NEVER folds an auxiliary layer into the statutory
ledger and NEVER claims content that has not been acquired.

Directive §1/§5 correction: an unacquired or unimplemented source family is a
BACKLOG item, not a permanent scope exclusion.  `DECLARED_UNSUPPORTED` only
ever described the current implementation state; it is now represented as
`IN_SCOPE_BACKLOG` with an explicit `backlog` record so a task queue can pick
it up later.  Municipal ordinances and tax treaties stay IN SCOPE (as separate
layers); circulars and case law stay in scope as interpretation layers.  None
of them is ever silently dropped from the target population.

Layers:
  L0_STATUTE      法律・政令・省令 (the pinned 2026-11-15 snapshot)
  L1_PROVISION    附則・別表・経過措置 inside L0 snapshots
  L2_ORDINANCE    地方税条例 (municipality by municipality) — IN SCOPE, backlog
  L3_TREATY       租税条約 — IN SCOPE, separate legal layer, backlog
  L4_CIRCULAR     通達 — IN SCOPE interpretation layer, backlog
  L5_CASELAW      裁判例 — IN SCOPE interpretation layer, backlog
  L6_HISTORICAL   歴史的施行版 (旧法/新法 references) — IN SCOPE, unpinned backlog

Regenerate with `python scripts/ci/source_layers.py`; deterministic gate.
"""
from __future__ import annotations

import hashlib
import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
INVENTORY = REPO / "data" / "INVENTORY.json"
DISCOVERY = REPO / "docs" / "RECURSIVE_DISCOVERY.md"
BLOCKED = REPO / "docs" / "BLOCKED.md"
ACQUISITIONS = REPO / "data" / "SOURCE_ACQUISITIONS.json"
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


def verified_acquisitions(layer_id: str) -> list[dict]:
    """Acquisitions whose pinned bytes are actually present and hash-matching.

    A registry claim alone is never evidence.  The local file must exist and
    its SHA-256 (and byte count, when declared) must match the recorded pin.
    Unverified entries are ignored, never counted as acquired.
    """
    if not ACQUISITIONS.exists():
        return []
    data = json.loads(ACQUISITIONS.read_text(encoding="utf-8"))
    out = []
    for entry in data.get("acquisitions", []):
        if entry.get("layer_id") != layer_id:
            continue
        path = REPO / str(entry.get("local_path", ""))
        if not path.is_file():
            continue
        raw = path.read_bytes()
        digest = re.sub(r"[^0-9a-f]", "", hashlib.sha256(raw).hexdigest())
        if digest != str(entry.get("sha256", "")).lower():
            continue
        if entry.get("bytes") is not None and len(raw) != int(entry["bytes"]):
            continue
        out.append(entry)
    return out


def backlog_record(layer_id: str, task_class: str, next_action: str) -> dict:
    """A durable, non-dropping task placeholder for an in-scope source family.

    A backlog record is NOT evidence of acquisition, parsing, proof or legal
    review.  It only states that the layer remains a target and names the next
    executable step, so a Coordinator can pick it up without re-deciding scope.
    """
    return {
        "layer_id": layer_id,
        "task_class": task_class,
        "status": "NOT_ACQUIRED" if layer_id != "L6_HISTORICAL" else "NOT_PINNED",
        "legal_review": "LEGAL_REVIEW_PENDING",
        "next_action": next_action,
        "acquisition_evidence": "",
        "formalization_evidence": "",
    }


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

    ordinance_pins = verified_acquisitions("L2_ORDINANCE")
    treaty_pins = verified_acquisitions("L3_TREATY")
    circular_pins = verified_acquisitions("L4_CIRCULAR")
    caselaw_pins = verified_acquisitions("L5_CASELAW")
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
            "acquisition_status": "ACQUIRED_PARTIAL" if ordinance_pins else "NOT_ACQUIRED",
            "scope_status": "IN_SCOPE_BACKLOG",
            "count": ordinances,
            "count_acquired": len(ordinance_pins),
            "pinned_snapshot": ", ".join(x["source_id"] for x in ordinance_pins),
            "verification_status": "PINNED_BYTES_ONLY" if ordinance_pins else "BACKLOG_NOT_ACQUIRED",
            "auxiliary": False,
            "notes": ("自治体ごとの版付き条例を一部 pin 済み（全自治体は未取得、形式化・レビュー未実施）。"
                      "対象に保持し、UNSUPPORTED は実装状態であって恒久除外ではない。"
                      if ordinance_pins else
                      "対象に保持する（スポンサー指令§1/§5）。自治体単位の版付き収集は未実施でバックログ。UNSUPPORTED は実装状態であり恒久除外ではない。"),
            "acquisitions": ordinance_pins,
            "backlog": backlog_record(
                "L2_ORDINANCE", "MUNICIPAL_ORDINANCE_ACQUISITION",
                "自治体ごとに版を固定した条例原文を取得し、規範単位に分解する"),
        },
        {
            "layer_id": "L3_TREATY",
            "label_ja": "租税条約",
            "legal_nature": "条約（国際法源）— 国内法とは効力発生の機構が異なる",
            "authority": "財務省 / 外務省（条約締結）",
            "acquisition_status": "ACQUIRED_PARTIAL" if treaty_pins else "NOT_ACQUIRED",
            "scope_status": "IN_SCOPE_AUXILIARY_BACKLOG",
            "count": len(treaty_pins) if treaty_pins else None,
            "count_acquired": len(treaty_pins),
            "pinned_snapshot": ", ".join(x["source_id"] for x in treaty_pins),
            "verification_status": "PINNED_BYTES_ONLY" if treaty_pins else "BACKLOG_NOT_ACQUIRED",
            "auxiliary": True,
            "notes": ("対象に保持し、原文 bytes を版付きで pin 済み（形式化・人間レビューは未実施）。"
                      "統合条文は法的根拠ではなく、原条約・改正議定書の正文のみが法的文書。"
                      if treaty_pins else
                      "対象に保持する。法源上の性質が異なるため L0 に混ぜず別層で管理。未取得はバックログであり除外ではない。"),
            "acquisitions": treaty_pins,
            "backlog": backlog_record(
                "L3_TREATY", "TREATY_ACQUISITION",
                "租税条約を版付きで取得し、国内法との効力発生の違いを別層で形式化する"
                + ("（-pin 済み条约の規範分解を継続）" if treaty_pins else "")),
        },
        {
            "layer_id": "L4_CIRCULAR",
            "label_ja": "通達",
            "legal_nature": "行政通達（法的拘束力は条文ではなく行政内部）",
            "authority": "国税庁 / 総務省",
            "acquisition_status": "ACQUIRED_PARTIAL" if circular_pins else "NOT_ACQUIRED",
            "scope_status": "IN_SCOPE_INTERPRETATION_BACKLOG",
            "count": len(circular_pins) if circular_pins else None,
            "count_acquired": len(circular_pins),
            "pinned_snapshot": ", ".join(x["source_id"] for x in circular_pins),
            "verification_status": "PINNED_BYTES_ONLY" if circular_pins else "BACKLOG_NOT_ACQUIRED",
            "auxiliary": True,
            "notes": ("解釈資料レイヤーとして原文 bytes を pin 済み（形式化・人間レビュー未実施）。"
                      "法源規範ではなく行政内部の取扱いとして L0 と分離。"
                      if circular_pins else
                      "法令本文とは区別した解釈資料レイヤーとして段階的に収録する。未取得はバックログであり除外ではない。"),
            "acquisitions": circular_pins,
            "backlog": backlog_record(
                "L4_CIRCULAR", "CIRCULAR_ACQUISITION",
                "通達を解釈資料レイヤーとして版付き収集し、本文規範と分離して記録する"),
        },
        {
            "layer_id": "L5_CASELAW",
            "label_ja": "裁判例",
            "legal_nature": "判決・裁定（法源ではなく判断例）",
            "authority": "裁判所",
            "acquisition_status": "ACQUIRED_PARTIAL" if caselaw_pins else "NOT_ACQUIRED",
            "scope_status": "IN_SCOPE_INTERPRETATION_BACKLOG",
            "count": len(caselaw_pins) if caselaw_pins else None,
            "count_acquired": len(caselaw_pins),
            "pinned_snapshot": ", ".join(x["source_id"] for x in caselaw_pins),
            "verification_status": "PINNED_BYTES_ONLY" if caselaw_pins else "BACKLOG_NOT_ACQUIRED",
            "auxiliary": True,
            "notes": ("判断例として原文 bytes を pin 済み（法源ではなく解釈資料、形式化・レビュー未実施）。"
                      "規範そのものとは混ぜない。"
                      if caselaw_pins else
                      "反例・対立解釈の資料として別層に置き、規範そのものとは混ぜない。段階的収録のバックログ。"),
            "acquisitions": caselaw_pins,
            "backlog": backlog_record(
                "L5_CASELAW", "CASELAW_ACQUISITION",
                "裁判例を解釈資料レイヤーとして収集し、反例・対立解釈を規範と分離して記録する"),
        },
        {
            "layer_id": "L6_HISTORICAL",
            "label_ja": "歴史的施行版",
            "legal_nature": "旧法・新法（同一法令の別施行版）",
            "authority": "e-Gov 歴史情報",
            "acquisition_status": "NOT_PINNED",
            "scope_status": "HISTORICAL_LAYER",
            "count": hist_names,
            "count_acquired": 0,
            "pinned_snapshot": "",
            "verification_status": "BACKLOG_NOT_PINNED",
            "auxiliary": False,
            "notes": "附則・経過措置の新旧参照。施行版を別途固定するまで未検証。対象に保持し、未固定はバックログ。",
            "backlog": backlog_record(
                "L6_HISTORICAL", "HISTORICAL_REVISION_PINNING",
                "歴史的施行版を e-Gov 歴史情報から版付きで pin し、経過措置の参照を解決する"),
        },
    ]
    for pins in (ordinance_pins, treaty_pins, circular_pins, caselaw_pins):
        if not pins:
            continue
        layer = next(l for l in layers if l["layer_id"] == pins[0]["layer_id"])
        layer["backlog"]["acquisition_evidence"] = ", ".join(
            f"{x['source_id']} sha256={x['sha256']}" for x in pins)
        layer["backlog"]["status"] = "PARTIAL"
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
        "backlog_rule": "in-scope source families that are not yet acquired/pinned stay in the task backlog; UNSUPPORTED is a current implementation state, never a permanent scope exclusion",
        "backlog": {
            "task_count": sum(1 for l in layers if l.get("backlog")),
            "tasks": [l["backlog"] for l in layers if l.get("backlog")],
            "note": "Backlog placeholders are not evidence of acquisition, proof or legal review.",
        },
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
        ("Pinned source bytes exist in: " + ", ".join(
            l["layer_id"] for l in payload["layers"]
            if l.get("verification_status") == "PINNED_BYTES_ONLY")
          + " (formalization and legal review still pending); remaining layers"
            " stay unacquired backlog."
          if any(l.get("verification_status") == "PINNED_BYTES_ONLY"
                 for l in payload["layers"])
          else "No layer other than L0 has acquired content in this repository."),
        "No completion claim is made for any layer.",
        "",
        "## In-scope backlog (Sponsor Directive §1/§5)",
        "",
        "Unacquired/unimplemented source families are NOT permanent exclusions.",
        "Each remains a target and has a named next executable step:",
        "",
        "| layer | task class | status | next action |",
        "|---|---|---|---|",
    ]
    for task in payload["backlog"]["tasks"]:
        lines.append("| %s | %s | %s | %s |" % (
            task["layer_id"], task["task_class"], task["status"], task["next_action"]))
    lines += [
        "",
        payload["backlog"]["note"],
        "",
    ]
    OUT_MD.parent.mkdir(parents=True, exist_ok=True)
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")
    print("layers:", len(payload["layers"]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
