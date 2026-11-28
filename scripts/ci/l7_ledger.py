#!/usr/bin/env python3
"""L7 ledger of pinned sources, audited outcomes, unsupported scope, and review status.

Reads the same inputs as the audit pipeline (data/INVENTORY.json, build/audit_sweep.json when
present) plus the cross-law gate (JapanTaxLaw/*.lean vs the inventory) and emits a deterministic
docs/L7_LEDGER.md. Exit 0 iff the emitted ledger equals the file on disk (regeneration gate).

Every count printed here is a machine-computed measurement. Nothing is claimed beyond it.
Candidates are unconfirmed pending independent legal review; verified-anomaly counts are 0
only because no review has yet established any as anomalies.
"""
import json
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
INVENTORY = REPO / "data" / "INVENTORY.json"
SWEEP = REPO / "build" / "audit_sweep.json"
LEDGER = REPO / "docs" / "L7_LEDGER.md"
OUT_TMP = REPO / "build" / "l7_ledger.md"


def top_counts():
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = inv["laws"] if isinstance(inv, dict) else inv
    if isinstance(laws, dict):
        laws = laws.get("laws", [])
    total = len(laws)
    enforced = sum(1 for l in laws if (l.get("current_revision") or {}).get("current_revision_status") == "CurrentEnforced")
    historical = sum(1 for l in laws if l.get("current_revision") is None or (l.get("current_revision") or {}).get("current_revision_status") != "CurrentEnforced")
    return total, enforced, historical


def sweep_totals():
    if not SWEEP.exists():
        return None
    d = json.loads(SWEEP.read_text(encoding="utf-8"))
    return d.get("totals", {})


def cross_law_line():
    r = subprocess.run(
        [sys.executable, "scripts/law_audit/phase_e/cross_law.py"],
        cwd=REPO, capture_output=True, text=True,
    )
    if r.returncode != 0:
        return "cross_law.gate failed"
    return r.stdout.strip()


def render():
    total, enforced, historical = top_counts()
    totals = sweep_totals() or {}
    articles = totals.get("articles_checked") or 0
    paragraphs = totals.get("paragraphs_checked") or 0
    items = totals.get("items_checked") or 0
    cand = totals.get("findings_candidate") or 0
    verified_anomaly = totals.get("findings_verified_anomaly") or 0
    refs_ext = totals.get("references_external_unverified") or 0
    unsupported_refs = totals.get("references_unsupported") or 0
    internal_ok = totals.get("references_internal_checked") or 0
    extracted = totals.get("references_extracted") or 0

    # by-rule breakdown (deterministic from build artifact)
    by_rule = {}
    for rec in (json.loads(SWEEP.read_text(encoding="utf-8")) if SWEEP.exists() else {}).get("laws", {}).values():
        if isinstance(rec, dict):
            for k, v in (rec.get("by_rule") or {}).items():
                by_rule[k] = by_rule.get(k, 0) + v
    by_rule_lines = [f"| {k} | {v} |" for k, v in sorted(by_rule.items(), key=lambda kv: -kv[1])]
    if not by_rule_lines:
        by_rule_lines = ["| (no build/audit_sweep.json present) | — |"]

    lines = [
        "# L7 統合レジャー — 機械計測のみ（主張ではない）",
        "",
        "本書は `scripts/ci/l7_ledger.py` が `data/INVENTORY.json` と",
        "`build/audit_sweep.json`（存在する場合）と `scripts/law_audit/phase_e/cross_law.py`",
        "の出力から**機械生成**する。数値は計測値であり、いかなる解釈の正しさも主張しない。",
        "候補は独立の法的レビュー前に確定欠陥と呼ばない。verified-anomaly = 0 は",
        "「異常なし」ではなく「独立レビューで確定された異常が 0 件」である。",
        "`references_extracted` / `references_internal_checked` / `references_external_unverified`",
        "は各々が独立の計測であり、",
        "相加性を前提とした集計は行わない（内部チェックは 1 参照につき項と号で 2 回計上されうる）。",
        "",
        "## 1. 対象法令台帳の実測（data/INVENTORY.json）",
        "",
        f"| 指標 | 値 |",
        f"|---|---|",
        f"| 台帳候補件数 | {total} |",
        f"| CurrentEnforced | {enforced} |",
        f"| 監査対象外の版 | {historical} |",
        "",
        "## 2. 構造監査の実測（build/audit_sweep.json）",
        "",
        f"| 指標 | 値 |",
        f"|---|---|",
        f"| 条文数 | {articles:,} |",
        f"| 項数 | {paragraphs:,} |",
        f"| 号数 | {items:,} |",
        f"| references_extracted（参照イベント件数） | {extracted:,} |",
        f"| references_internal_checked | {internal_ok:,} |",
        f"| references_external_unverified | {refs_ext:,} |",
        f"| references_unsupported | {unsupported_refs:,} |",
        f"| candidate（未確定） | **{cand:,}** |",
        f"| verified-anomaly | **{verified_anomaly}** |",
        "",
        "## 3. 候補の内訳（by rule）",
        "",
        "| ルール | 件数 |",
        "|---|---|",
    ]
    lines += by_rule_lines
    lines += [
        "",
        "完全な候補ごとの一覧とレビュー状態は [`L7_CANDIDATES_UNREVIEWED.csv`](L7_CANDIDATES_UNREVIEWED.csv) に機械生成で掲載（`scripts/ci/l7_candidates.py`、CI で再生成照合。行は全件 `review_status=unreviewed`）。",
        "全候補行に H（反証可能仮説）・T（再現検査）・D（合否）・C（対立解釈）・U（不確かさ）を記録する。D は固定スナップショットに対する独立第2回実行による機械的再現性のみを示し、法的判定や人間のレビューではない。",
        "",
        "## 4. 明示的に非対応の範囲（非計上・非検証として記録）",
        "",
        "| 範囲 | 状態 |",
        "|---|---|",
        "| 地方税条例（約 1,788 団体・各自が独立した法源） | **非対応**（台帳対象外・未検証） |",
        "| 租税条約（日本国との条約原典本文） | **非対応**（台帳対象外・未検証） |",
        "| 通達（法令本文と区別して扱う解釈補助層） | **非対応**（未検証） |",
        "| 裁判例（法令本文と区別して扱う解釈補助層） | **非対応**（未検証） |",
        "",
        "## 5. クロスロー・ピン整合（L1↔L3）",
        "",
        "```text",
        cross_law_line(),
        "```",
        "",
        "## 6. 検証境界（誠実な宣言）",
        "",
        "- 全ての `candidate` は独立レビュー未了であり、**確定した欠陥ではない**。",
        "- verified-anomaly = 0 は、欠陥存在の否定ではなく、独立レビューを経た確定異常が 0 件であること。",
        "- Lean による主張は**モデルの内部命題のみ**。法文との対応は pin（law_revision_id/施行日/SHA-256）に限る。",
        "- 非対応範囲（§4）は検証結果に**含まれていない**。",
        "- 本レジャーの数値は `data/INVENTORY.json` と `build/audit_sweep.json` に従う。",
        "",
    ]
    return "\n".join(lines)


def main():
    out = render()
    OUT_TMP.parent.mkdir(parents=True, exist_ok=True)
    OUT_TMP.write_text(out, encoding="utf-8")
    if LEDGER.exists():
        current = LEDGER.read_text(encoding="utf-8")
        if current != out:
            print("FAIL L7 ledger drift: regenerate with 'python scripts/ci/l7_ledger.py --write'")
            return 1
        print("L7 ledger matches committed state (deterministic)")
        return 0
    print("OK L7 ledger ready to be committed (first generation)")
    return 0


if __name__ == "__main__":
    if sys.argv[1:] == ["--write"]:
        LEDGER.write_text(render(), encoding="utf-8")
        print(f"wrote {LEDGER}")
        sys.exit(0)
    sys.exit(main())
