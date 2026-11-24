#!/usr/bin/env python3
"""In-scope acquisition/formalization backlog (Sponsor Directive §1/§5).

The sponsor directive keeps local ordinances, treaties, circulars and case law
IN SCOPE. `UNSUPPORTED` / `NOT_IMPLEMENTED` is current implementation state,
never a permanent exclusion. This tool turns every declared-but-unacquired
source family into a versioned, reviewable backlog item with explicit
verification obligations, so the Coordinator can work on them without asking
anyone to narrow the target.

Nothing here is a completion claim and nothing here stops another unit.

Regenerate with `python scripts/ci/source_backlog.py`; deterministic gate.
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
LAYERS = REPO / "data" / "SOURCE_LAYERS.json"
REFS = REPO / "data" / "reference_stats.json"
HIST = REPO / "data" / "HISTORICAL_DISCOVERY.json"
OUT_JSON = REPO / "data" / "SOURCE_BACKLOG.json"
OUT_MD = REPO / "docs" / "SOURCE_BACKLOG.md"

OBLIGATIONS = (
    "acquire pinned bytes with SHA-256",
    "record law/municipality id and enforced revision",
    "identify article / paragraph / item / table cell",
    "decompose normative content including exceptions and effects",
    "independent spec + implementation bridged by a kernel proof",
    "source correspondence audit scoped to that article/cell",
    "independent adversarial review (never a human legal approval)",
)


def item(item_id: str, layer: str, title: str, count, source_kind: str,
         version_rule: str, status: str, note: str) -> dict:
    return {
        "item_id": item_id,
        "layer_id": layer,
        "title": title,
        "declared_count": count,
        "source_kind": source_kind,
        "version_requirement": version_rule,
        "acquisition_status": status,
        "formalization_status": "NOT_IMPLEMENTED",
        "not_a_permanent_exclusion": True,
        "blocks_other_units": False,
        "legal_review_axis": "LEGAL_REVIEW_PENDING",
        "verification_obligations": list(OBLIGATIONS),
        "note": note,
    }


def build() -> dict:
    layers = json.loads(LAYERS.read_text(encoding="utf-8"))
    refs = json.loads(REFS.read_text(encoding="utf-8"))
    hist = json.loads(HIST.read_text(encoding="utf-8"))
    by = {l["layer_id"]: l for l in layers["layers"]}
    disc = layers["discovery"]
    rt = refs.get("totals", {})

    items = [
        item(
            "L2-ORDINANCE-ACQUISITION", "L2_ORDINANCE", "地方税条例（自治体別）",
            by["L2_ORDINANCE"]["count"], "自治体条例",
            "自治体 id + 制定/改正版 + 施行日ごとに版固定", "NOT_ACQUIRED",
            "自治体ごとの版付き法源として段階的に収集する。対象から除外しない。"),
        item(
            "L3-TREATY-ACQUISITION", "L3_TREATY", "租税条約",
            by["L3_TREATY"]["count"], "条約（国際法源）",
            "条約名 + 締結/発効日 + 国内実施法令との対応を版固定", "NOT_ACQUIRED",
            "L0 に混ぜず別層として対象に保持する。"),
        item(
            "L4-CIRCULAR-STAGING", "L4_CIRCULAR", "通達（解釈資料レイヤー）",
            by["L4_CIRCULAR"]["count"], "行政通達",
            "発出日 + 改正版 + 参照条文を版固定", "NOT_ACQUIRED",
            "法令本文と区別した解釈資料として段階的に収録する。"),
        item(
            "L5-CASELAW-STAGING", "L5_CASELAW", "裁判例（解釈資料レイヤー）",
            by["L5_CASELAW"]["count"], "判決・裁定",
            "事件番号 + 判決日 + 参照条文を版固定", "NOT_ACQUIRED",
            "反例・対立解釈の資料として段階的に収録する。"),
        item(
            "L6-HISTORICAL-PINNING", "L6_HISTORICAL", "歴史的施行版（旧法・新法）",
            hist["totals"]["distinct_names"], "e-Gov 歴史情報",
            "旧法/新法の law_revision_id + 施行日を版固定", "NOT_PINNED",
            "附則・経過措置の参照を解決するため版付きで収集する。"),
        item(
            "REF-EXTERNAL-BINDING", "L0_STATUTE", "外部法令参照の候補解決",
            rt.get("references_external_unverified", 0), "他法令参照",
            "参照先 law id + 条 + 施行版の候補を UNVERIFIED として記録", "UNVERIFIED",
            "保守的な分類を弱めず、レビュー可能な name→law-id 解決層を追加する。"),
        item(
            "REF-UNMATCHED-NAMES", "L0_STATUTE", "未対応法令名",
            disc.get("distinct_unmatched_reference_names", 0), "法令名",
            "候補 law id を UNVERIFIED で提示し、人間の法的判断を待つ", "UNMATCHED",
            "架空の法令 ID を割り当てず、継続的に発見する。"),
        item(
            "TAX-NAME-CANDIDATES", "L0_STATUTE", "台帳外の税名候補",
            disc.get("tax_name_candidates_outside_ledger", 0), "税名候補",
            "法源 ID + 版を確定してから台帳に追加", "CANDIDATE",
            "327 法令は暫定母集団であり最終母集団ではない。"),
    ]
    return {
        "schema": "source_backlog/v1",
        "tool": "scripts/ci/source_backlog.py",
        "note": (
            "All items remain IN SCOPE. UNSUPPORTED/NOT_IMPLEMENTED is the "
            "current implementation state; no item is a permanent exclusion "
            "and no item stops other formalization work."
        ),
        "human_review_axis": "LEGAL_REVIEW_PENDING",
        "human_review_is_never_auto_satisfied": True,
        "items": items,
        "totals": {
            "items": len(items),
            "unacquired_or_unverified": sum(1 for i in items
                                             if i["acquisition_status"] != "ACQUIRED"),
            "blocks_other_units": 0,
        },
    }


def render(data: dict) -> str:
    lines = [
        "# In-scope acquisition / formalization backlog (machine-generated)", "",
        "Do not hand-edit. Regenerate with `python scripts/ci/source_backlog.py`.",
        "", data["note"], "",
        "| item | layer | declared count | acquisition | formalization |",
        "|---|---|---:|---|---|",
    ]
    for i in data["items"]:
        lines.append("| %s | %s | %s | %s | %s |" % (
            i["item_id"], i["layer_id"],
            i["declared_count"] if i["declared_count"] is not None else "-",
            i["acquisition_status"], i["formalization_status"]))
    lines += [
        "", "Every item carries the same verification obligations: " +
        ", ".join(OBLIGATIONS) + ".", "",
        "Human legal review stays LEGAL_REVIEW_PENDING and is never satisfied by",
        "acquisition, Lean proof or mechanical review. No item blocks another unit.",
        "",
    ]
    return "\n".join(lines)


def main() -> int:
    data = build()
    blob = json.dumps(data, ensure_ascii=False, indent=2, sort_keys=True) + "\n"
    text = render(data)
    changed = False
    for path, content in ((OUT_JSON, blob), (OUT_MD, text)):
        if not path.exists() or path.read_text(encoding="utf-8") != content:
            path.write_text(content, encoding="utf-8")
            changed = True
    if changed:
        print("wrote", OUT_JSON, "and", OUT_MD)
        return 1
    print("source backlog matches committed state (deterministic)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
