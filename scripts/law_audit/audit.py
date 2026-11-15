"""CLI entry point for the structural audit.

Usage:
    python -m scripts.law_audit.audit [--out DIR] [--json]

Reads data/PROVENANCE.json, verifies SHA-256 of the pinned snapshots, runs the
structural audit on both laws, and writes:
    <out>/findings.json          machine-readable findings (all severities)
    <out>/summary.json           counts and verified/candidate breakdown
    <out>/findings.md            human-readable audit fragment (Japanese)
Exit code 0 iff no rule produced a verified-anomaly finding is NOT required:
the audit is informational; exit 0 on success. Findings are data, not failure.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2]))

from scripts.law_audit.model import load_law
from scripts.law_audit.rules import all_findings

REPO = Path(__file__).resolve().parents[2]
PROVENANCE = REPO / "data" / "PROVENANCE.json"


def _sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def load_pair():
    prov = json.loads(PROVENANCE.read_text(encoding="utf-8"))
    laws = prov["laws"]
    act_path = REPO / laws["income_tax_act"]["source_file"]
    order_path = REPO / laws["income_tax_order"]["source_file"]
    act = load_law(act_path)
    order = load_law(order_path)
    return prov, act, order


def verify_hashes(prov) -> list[str]:
    errors = []
    for key, spec in prov["laws"].items():
        f = REPO / spec["source_file"]
        h = _sha256(f)
        if h != spec["source_sha256"]:
            errors.append(f"SHA-256 mismatch for {key}: file {h} vs manifest {spec['source_sha256']}")
    return errors


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default=str(REPO / "build"))
    args = ap.parse_args()
    out_dir = Path(args.out)
    out_dir.mkdir(parents=True, exist_ok=True)

    prov = json.loads(PROVENANCE.read_text(encoding="utf-8"))
    hash_errors = verify_hashes(prov)
    if hash_errors:
        for e in hash_errors:
            print("HASH-MISMATCH:", e)
        return 2

    act = load_law(REPO / prov["laws"]["income_tax_act"]["source_file"])
    order = load_law(REPO / prov["laws"]["income_tax_order"]["source_file"])

    all_findings_out = []
    summaries = {}
    for name, doc, others in [
        ("2065-act", act, {"order": order}),
        ("2065-order", order, {"act": act}),
    ]:
        findings, stats = all_findings(doc, others)
        law_label = f"{doc.law_title} ({doc.law_id})"
        for f in findings:
            all_findings_out.append({
                "law": law_label,
                "rule_id": f.rule_id,
                "severity": f.severity,
                "location": f.location,
                "line": f.line,
                "message": f.message,
                "evidence": f.evidence,
                "classification": f.classification,
            })
        summaries[name] = {
            "law_title": doc.law_title,
            "law_id": doc.law_id,
            "law_revision_id": doc.revision_info.get("law_revision_id"),
            "articles_checked": stats.articles_checked,
            "paragraphs_checked": stats.paragraphs_checked,
            "items_checked": stats.items_checked,
            "references_extracted": stats.references_extracted,
            "references_internal_checked": stats.references_internal_checked,
            "references_external_unverified": stats.references_external_unverified,
            "references_unsupported": stats.references_unsupported,
            "sha256": doc.sha256,
            "counts_by_rule": _counts(findings),
        }

    findings_path = out_dir / "findings.json"
    findings_path.write_text(json.dumps(all_findings_out, ensure_ascii=False, indent=2), encoding="utf-8")
    (out_dir / "summary.json").write_text(json.dumps(summaries, ensure_ascii=False, indent=2), encoding="utf-8")

    md = _render_markdown(prov, summaries, all_findings_out)
    (out_dir / "findings.md").write_text(md, encoding="utf-8")

    n_verified = sum(1 for f in all_findings_out if f["severity"] == "verified-anomaly")
    n_candidate = sum(1 for f in all_findings_out if f["severity"] == "candidate")
    print(f"findings: total={len(all_findings_out)} verified-anomaly={n_verified} candidate={n_candidate}")
    for k, v in summaries.items():
        print(f"[{k}] articles={v['articles_checked']} refs: internal={v['references_internal_checked']} "
              f"external={v['references_external_unverified']} unsupported={v['references_unsupported']}")
    return 0


def _counts(findings):
    c = {}
    for f in findings:
        c[f.rule_id] = c.get(f.rule_id, 0) + 1
    return c


def _render_markdown(prov, summaries, all_findings_out):
    lines = []
    lines.append("# 構造監査レポート 抜粋 / Structural audit findings")
    lines.append("")
    lines.append(f"- 基準日: {prov['snapshot_date']} ({prov['timezone']})")
    lines.append("- 未確定の警告は法令の欠陥を意味しない (docs/METHODOLOGY.md 参照)")
    lines.append("")
    cand = [f for f in all_findings_out if f["severity"] == "candidate"]
    ver = [f for f in all_findings_out if f["severity"] == "verified-anomaly"]
    lines.append(f"## 検証済みの構造異常 (verified-anomaly): {len(ver)} 件")
    lines.append("")
    if ver:
        lines.append("| # | 法令 | 箇所 | 規則 | 内容 |")
        lines.append("|---|---|---|---|---|")
        for i, f in enumerate(ver, 1):
            lines.append(f"| {i} | {f['law']} | {f['location']} | {f['rule_id']} | {f['message']} |")
    else:
        lines.append("なし")
    lines.append("")
    lines.append(f"## 要確認候補 (candidate — 法令の欠陥を意味しない): {len(cand)} 件")
    lines.append("")
    if cand:
        lines.append("| # | 法令 | 箇所 | 規則 | 内容 |")
        lines.append("|---|---|---|---|---|")
        for i, f in enumerate(cand, 1):
            msg = f["message"].replace("|", "\\|")
            lines.append(f"| {i} | {f['law']} | {f['location']} | {f['rule_id']} | {msg} |")
    else:
        lines.append("なし")
    lines.append("")
    lines.append("## 統計")
    lines.append("")
    for k, v in summaries.items():
        lines.append(f"### {k}: {v['law_title']} ({v['law_id']})")
        lines.append(f"- 改正法令履歴ID: {v['law_revision_id']}")
        lines.append(f"- 条文数(枝番含む): {v['articles_checked']} / 項: {v['paragraphs_checked']} / 号: {v['items_checked']}")
        lines.append(f"- 参照抽出: {v['references_extracted']} 件 (内部検査: {v['references_internal_checked']} / 他律・未検査: {v['references_external_unverified']} / 未対応: {v['references_unsupported']})")
        lines.append(f"- ファイルSHA-256: `{v['sha256']}`")
        lines.append("")
    return "\n".join(lines) + "\n"


if __name__ == "__main__":
    raise SystemExit(main())
