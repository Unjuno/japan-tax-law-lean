#!/usr/bin/env python3
"""Machine-readable source-layer ledger (Objective §2 and §5).

The provisional 327-law '税' ledger is NOT the whole Japanese tax-law
universe. This script keeps every source layer in one auditable place and
records, per layer, whether it is enumerated, acquired, counted as a target,
and counted as verified. Auxiliary layers (local ordinances, treaties,
circulars, case law) are explicitly SEPARATE and are never folded into the
statutory denominator.

The ledger is derived from committed inputs only:
  data/INVENTORY.json           — 327 pinned national tax laws
  data/DISCOVERED_INVENTORY.json— recursively discovered related statutes
  docs/BLOCKED.md               — declared (non-authoritative) estimates

Usage:
  python scripts/law_audit/inventory/source_layers.py            # check
  python scripts/law_audit/inventory/source_layers.py --write    # regenerate
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[3]
INVENTORY = REPO / "data" / "INVENTORY.json"
DISCOVERED = REPO / "data" / "DISCOVERED_INVENTORY.json"
BLOCKED = REPO / "docs" / "BLOCKED.md"
OUT_JSON = REPO / "data" / "SOURCE_LAYERS.json"
OUT_MD = REPO / "docs" / "SOURCE_LAYERS.md"

UNENUMERATED = "UNENUMERATED"
ACQUIRED = "ACQUIRED"


def queue_status_counts() -> dict:
    """Read only the payload head of the streamed queue (no full 240 MB load)."""
    q = REPO / "build" / "task_queue.json"
    if not q.exists():
        return {}
    with q.open("r", encoding="utf-8") as fh:
        head = fh.read(16384)
    m = re.search(r'"status_counts"\s*:\s*\{([^}]*)\}', head)
    if not m:
        return {}
    out = {}
    for k, v in re.findall(r'"([A-Z_]+)"\s*:\s*(\d+)', m.group(1)):
        out[k] = int(v)
    return out


def estimate_ordinances() -> int | None:
    """Non-authoritative declared estimate; never promoted to a count."""
    if not BLOCKED.exists():
        return None
    m = re.search(r"地方税条例[^0-9]{0,40}([0-9,]+)\s*municipal", BLOCKED.read_text(encoding="utf-8"))
    return int(m.group(1).replace(",", "")) if m else None


def build() -> dict:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = inv.get("laws", [])
    pinned = sum(1 for l in laws if (l.get("raw_snapshot") or {}).get("source_file"))
    if DISCOVERED.exists():
        disc = json.loads(DISCOVERED.read_text(encoding="utf-8"))
        discovered = disc.get("laws", {})
        discovered_total = int(disc.get("laws_total_discovered") or len(discovered))
        acquired = int(disc.get("laws_acquired_total")
                       or sum(1 for v in discovered.values() if v.get("acquisition_status") == ACQUIRED))
        discovered_status = "ENUMERATED_PARTIAL"
    else:
        # "No ledger on this branch" is UNKNOWN, not zero.
        discovered_total = None
        acquired = None
        discovered_status = UNENUMERATED

    layers = [
        {
            "id": "NATIONAL_TAX_STATUTE",
            "legal_nature": "国法上の法源（法律・政令・省令・規則）",
            "source": "e-Gov 法令一覧（'税' キーワード暂定母集団）",
            "enumeration_status": "ENUMERATED_PINNED",
            "declared_count": len(laws),
            "enumerated_count": len(laws),
            "acquired_count": pinned,
            "snapshot_date": inv.get("snapshot_date", ""),
            "counted_in_target": True,
            "counted_in_verified": False,
            "evidence": ["data/INVENTORY.json"],
            "note": "暂定母集団。全日本税法ではない（§2）。未取得2件、未施行2件は別扱い。",
        },
        {
            "id": "RELATED_STATUTE_DISCOVERED",
            "legal_nature": "国法上の法源（名称に '税' を含まない関連法令）",
            "source": "参照・準用・委任・改正関係の再帰探索",
            "enumeration_status": discovered_status,
            "declared_count": None,
            "enumerated_count": discovered_total,
            "acquired_count": acquired,
            "snapshot_date": inv.get("snapshot_date", ""),
            "counted_in_target": True,
            "counted_in_verified": False,
            "evidence": ["data/DISCOVERED_INVENTORY.json", "docs/RECURSIVE_DISCOVERY_RESOLVED.md"],
            "note": "取得済みでも未解析・未形式化・未証明。解析対象への組込みは別途の作業。",
        },
        {
            "id": "LOCAL_TAX_ORDINANCE",
            "legal_nature": "自治体ごとに独立した法源（条例）",
            "source": "地方公共団体の例規集（e-Gov 国家法令一覧には含まれない）",
            "enumeration_status": UNENUMERATED,
            "declared_count": estimate_ordinances(),
            "enumerated_count": None,
            "acquired_count": 0,
            "snapshot_date": "",
            "counted_in_target": True,
            "counted_in_verified": False,
            "evidence": ["docs/BLOCKED.md", "docs/L7_LEDGER.md"],
            "note": "自治体単位の列挙が未実装。declared_count は参考値であり取得数ではない。",
        },
        {
            "id": "TAX_TREATY",
            "legal_nature": "条約（国内法令とは法源の性質が異なる）",
            "source": "租税条約原典（別層管理）",
            "enumeration_status": UNENUMERATED,
            "declared_count": None,
            "enumerated_count": None,
            "acquired_count": 0,
            "snapshot_date": "",
            "counted_in_target": False,
            "counted_in_verified": False,
            "evidence": ["docs/L7_LEDGER.md"],
            "note": "解釈補助層。法定要件の直接の根拠として本台帳に混入させない。",
        },
        {
            "id": "ADMINISTRATIVE_CIRCULAR",
            "legal_nature": "通達（解釈補助層、法源ではない）",
            "source": "国税庁・自治体の通達／解釈指針",
            "enumeration_status": UNENUMERATED,
            "declared_count": None,
            "enumerated_count": None,
            "acquired_count": 0,
            "snapshot_date": "",
            "counted_in_target": False,
            "counted_in_verified": False,
            "evidence": ["docs/L7_LEDGER.md"],
            "note": "原文との対応は別層で管理し、LEAN 証明の根拠に転用しない。",
        },
        {
            "id": "CASE_LAW",
            "legal_nature": "裁判例（解釈補助層、法源ではない）",
            "source": "判決・裁決例",
            "enumeration_status": UNENUMERATED,
            "declared_count": None,
            "enumerated_count": None,
            "acquired_count": 0,
            "snapshot_date": "",
            "counted_in_target": False,
            "counted_in_verified": False,
            "evidence": ["docs/L7_LEDGER.md"],
            "note": "法的妥当性は人間の独立レビューを要する。未確定のまま保持。",
        },
    ]
    statuses = queue_status_counts()
    verified_units = statuses.get("FULLY_VERIFIED")
    proved_scope_units = statuses.get("PROVED_SCOPE")
    pipeline = {
        "normative_units_total": statuses.get("units_total"),
        "fully_verified_units": verified_units,
        "proved_scope_units": proved_scope_units,
        "not_started_units": statuses.get("NOT_STARTED"),
        "blocked_units": statuses.get("BLOCKED"),
        "unacquired_statutes": (discovered_total - acquired)
        if discovered_total is not None and acquired is not None else None,
        "human_legal_reviews": 0,
        "note": "Separate denominators. Unknown means the input is absent on this branch; never zero.",
    }
    resolved = REPO / "data" / "RECURSIVE_DISCOVERY_RESOLVED.json"
    historical = None
    if resolved.exists():
        historical = int(json.loads(resolved.read_text(encoding="utf-8")).get(
            "historical_version_occurrences", 0))
    return {
        "schema": "source-layers/v1",
        "tool": "scripts/law_audit/inventory/source_layers.py",
        "snapshot_date": inv.get("snapshot_date", ""),
        "historical_reference_occurrences": historical,
        "verification_pipeline": pipeline,
        "all_complete_claimable": False,
        "layers": layers,
        "finding": {
            "H": "The 327-law ledger covers the whole Japanese tax-law universe.",
            "T": "Compare INVENTORY, recursively discovered ids and the declared auxiliary layers.",
            "D": "FAIL — the statutory ledger is a provisional subset; four layers remain separate/unenumerated.",
            "C": "A discovered related statute may be merely a cross-reference rather than an independent norm source.",
            "U": "Counts for unenumerated layers are unknown; no legal conclusion is drawn.",
        },
    }


def render(data: dict) -> str:
    lines = [
        "# Source layers (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `scripts/law_audit/inventory/source_layers.py`.",
        "",
        "The 327-law ledger is a provisional subset, not the whole Japanese tax",
        "universe. Every layer is kept separate; auxiliary layers are never counted",
        "as statutory targets or as verified obligations (Objective §2/§5).",
        "",
        f"- snapshot: {data['snapshot_date']}",
        "- historical-version reference occurrences (kept separate): "
        + ("unknown (discovery ledger absent on this branch)"
           if data["historical_reference_occurrences"] is None
           else str(data["historical_reference_occurrences"])),
        "- all-complete claimable: False",
        "",
        "| layer | legal nature | enumeration | declared | enumerated | acquired | target | verified |",
        "|---|---|---|---:|---:|---:|:--:|:--:|",
    ]
    for l in data["layers"]:
        def fmt(v):
            return "-" if v is None else str(v)
        lines.append(
            f"| {l['id']} | {l['legal_nature']} | {l['enumeration_status']} | "
            f"{fmt(l['declared_count'])} | {fmt(l['enumerated_count'])} | "
            f"{fmt(l['acquired_count'])} | {'yes' if l['counted_in_target'] else 'no'} | "
            f"{'yes' if l['counted_in_verified'] else 'no'} |"
        )
    p = data["verification_pipeline"]
    lines += ["", "## Obligation counts (separate denominators)", ""]

    def pval(v):
        return "unknown" if v is None else str(v)

    for key in ("normative_units_total", "fully_verified_units", "proved_scope_units",
                "not_started_units", "blocked_units", "unacquired_statutes", "human_legal_reviews"):
        lines.append(f"- {key}: {pval(p[key])}")
    lines += ["", p["note"], "", "## Finding (H/T/D/C/U)", ""]
    for k in ("H", "T", "D", "C", "U"):
        lines.append(f"- **{k}**: {data['finding'][k]}")
    lines.append("")
    return "\n".join(lines)


def main() -> int:
    data = build()
    json_text = json.dumps(data, ensure_ascii=False, indent=2, sort_keys=True) + "\n"
    md_text = render(data)
    write = "--write" in sys.argv
    if write:
        OUT_JSON.parent.mkdir(parents=True, exist_ok=True)
        OUT_JSON.write_text(json_text, encoding="utf-8")
        OUT_MD.write_text(md_text, encoding="utf-8")
        print("wrote source-layer ledger")
        return 0
    bad = []
    for path, text in ((OUT_JSON, json_text), (OUT_MD, md_text)):
        if not path.exists() or path.read_text(encoding="utf-8") != text:
            bad.append(str(path))
    if bad:
        print("source-layer ledger drift:", ", ".join(bad), "(run with --write)")
        return 1
    print("source-layer ledger matches committed state")
    return 0


if __name__ == "__main__":
    sys.exit(main())
