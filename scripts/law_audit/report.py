"""Generate docs/AUDIT_REPORT.md from the machine-readable findings.

The report is intentionally conservative: every open item is labelled
**未確定 (unconfirmed)** and the model-defect/legal-defect distinction is kept
structural. The report never asserts that a statute is defective.
"""

from __future__ import annotations

import argparse
import json
import sys
from collections import Counter
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO))

from scripts.law_audit.audit import verify_hashes, load_pair


def _fmt_finding(f, idx):
    return (
        f"### {idx}. [{f['rule_id']}] {f['location']}\n\n"
        f"- 法令: {f['law']}\n"
        f"- 行 (正規化テキスト): {f['line']}\n"
        f"- 重要度: {f['severity']}\n"
        f"- 分類: {f['classification']}\n"
        f"- 検出規則: {f['rule_id']}\n"
        f"- 内容: {f['message']}\n"
        f"- 証跡: {f['evidence']}\n"
        f"- 検証状態: **未確定 — 独立レビュー未実施**\n"
    )


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default=str(REPO / "docs" / "AUDIT_REPORT.md"))
    args = ap.parse_args()

    summary_path = REPO / "build" / "summary.json"
    findings_path = REPO / "build" / "findings.json"
    if not summary_path.exists() or not findings_path.exists():
        print("run `python -m scripts.law_audit.audit` first", file=sys.stderr)
        return 2

    prov_path = REPO / "data" / "PROVENANCE.json"
    prov = json.loads(prov_path.read_text(encoding="utf-8"))
    hash_errors = verify_hashes(prov)
    assert not hash_errors, "pinned snapshot hashes do not match PROVENANCE.json!"

    summary = json.loads(summary_path.read_text(encoding="utf-8"))
    findings = json.loads(findings_path.read_text(encoding="utf-8"))
    verified = [f for f in findings if f["severity"] == "verified-anomaly"]
    candidates = [f for f in findings if f["severity"] == "candidate"]
    infos = [f for f in findings if f["severity"] == "info"]

    lines: list[str] = []
    lines.append("# 構造監査レポート — 日本税法 R1 (2026-11-15)\n")
    lines.append(f"- 基準日: {prov['snapshot_date']} ({prov['timezone']})\n")
    lines.append("- 対象: 所得税法 (340AC0000000033) ・ 所得税法施行令 (340CO0000000096)\n")
    lines.append("- 方法: e-Gov 法令検索 API v2 (law_revisions / law_data) から適用版XMLを取得し、正規化後に機械検査。\n")
    lines.append("- 判定: 候補 (candidate) は**独立レビューを受けていない**。法的欠陥の確定は本レポートではない。\n")
    lines.append("\n## 1. 適用法令版 (pinned provenance)\n")
    for key, spec in prov["laws"].items():
        rev = spec["current_revision"]
        lines.append(f"\n### {spec['law_title']} ({spec['law_num']})\n")
        lines.append(f"- Law ID: `{spec['law_id']}`\n")
        lines.append(f"- 公布: {spec['promulgation_date']}\n")
        lines.append(f"- 適用 revision ID: `{rev['law_revision_id']}`\n")
        lines.append(f"- 改正法令: {rev.get('amendment_law_title')} ({rev.get('amendment_law_num')}, 施行 {rev.get('amendment_enforcement_date')})\n")
        lines.append(f"- 公式ページ: {spec['law_page']}\n")
        lines.append(f"- API URL: {spec['api_url']}\n")
        lines.append(f"- ファイル: `{spec['source_file']}`\n")
        lines.append(f"- SHA-256: `{spec['source_sha256']}`\n")
    lines.append("\n## 2. 検査の統計\n")
    for k, v in summary.items():
        lines.append(f"\n### {v['law_title']}\n")
        lines.append(f"- 条文数(枝番号含む): {v['articles_checked']}\n")
        lines.append(f"- 項: {v['paragraphs_checked']} / 号(含細目): {v['items_checked']}\n")
        lines.append(f"- 参照抽出: {v['references_extracted']} / 内部検査: {v['references_internal_checked']} / 他律・未検査: {v['references_external_unverified']} / 未対応: {v['references_unsupported']}\n")
        lines.append(f"- ファイルSHA-256: `{v['sha256']}`\n")
    lines.append("\n## 3. 検証状態サマリ\n")
    lines.append(f"- 検証済み構造異常 (verified-anomaly): **{len(verified)}**\n")
    lines.append(f"- 要確認候補 (candidate): **{len(candidates)}**\n")
    lines.append(f"- 情報 (info): **{len(infos)}**\n")
    lines.append("\n## 4. 構造異常 (verified-anomaly)\n")
    if verified:
        for i, f in enumerate(verified, 1):
            lines.append(_fmt_finding(f, i))
    else:
        lines.append("検出なし。\n")
    lines.append("\n## 5. 要確認候補 (candidate — 欠陥を意味しない)\n")
    lines.append("\n独立レビュー未実施・別解釈あり・モデル由来の可能性を含む。\n\n")
    for i, f in enumerate(candidates, 1):
        lines.append(_fmt_finding(f, i))
    lines.append("\n## 6. 未対応範囲 (明示)\n")
    lines.append("""\
- 別表の内容意味検査 (tables) は未対応。
- 条文間の意味的矛盾検査 (意味検証) は Lean モデル (JapanTaxLaw/ResidencySpec) 側で限定的に実施。
- 参照のうち**他律** (例: 法人税法第○条) は一括として未検証 (unverified)。
- 参照のうち、改正経過規定中の「附則第○条」参照は `refugee_external` として扱い未検証。
- 非永住者 (Act art. 2(1)(iv)) は R1 の対象外。
- 法令の欠陥確定には法的専門家による独立レビューが必要であり、本レポートはその代替ではない。
""")
    lines.append("\n## 7. モデルの欠陥と法律の欠陥の区別\n")
    lines.append("""\
| 現象 | 帰属 |
|---|---|
| Lean モデルが意図通りに動かない | モデル欠陥 (実装側の修正対象) |
| 参照先が他律で未検証 | 未対応範囲 (ツールの制約) |
| 条文間の意味的矛盾が検出された | 候補 (検討対象; 確定は独立レビュー後) |
| 原文ハッシュ不一致 | ソース版不一致 (データ修正対象) |
""")
    out = Path(args.out)
    out.write_text("".join(lines), encoding="utf-8")
    print("wrote", out)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
