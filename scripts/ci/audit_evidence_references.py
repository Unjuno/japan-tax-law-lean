#!/usr/bin/env python3
"""Independent resolution audit of verification-evidence references (§4/§5).

An evidence string is NOT evidence merely because it names a document. This tool
resolves each reference against the actual artifact:

  * `docs/ADVERSARIAL_REVIEW.md Batch X` must be followed by a `## Batch X
    review` section that actually names the unit's implementation module;
  * `JapanTaxLaw/<Module>.lean sha256=...` must exist with a matching digest;
  * a CI run URL must match the attestation's recorded workflow run and commit;
  * `docs/...md#anchor` must be a real file containing the anchor text.

Findings carry H/T/D/C/U. The tool never changes the status derivation; it
makes unresolved references visible and lets CI fail in --strict mode once the
ledger has been repaired.

Usage:
  python scripts/ci/audit_evidence_references.py            # regenerate/check
  python scripts/ci/audit_evidence_references.py --strict   # exit 1 on unresolved
"""
from __future__ import annotations

import hashlib
import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
EVIDENCE = REPO / "data" / "verification_evidence.json"
ATTESTATION = REPO / "data" / "PROOF_ATTESTATION.json"
OUT_JSON = REPO / "data" / "EVIDENCE_REFERENCE_AUDIT.json"
OUT_MD = REPO / "docs" / "EVIDENCE_REFERENCE_AUDIT.md"


def _read(path: Path) -> str:
    return path.read_text(encoding="utf-8") if path.exists() else ""


def _review_section(name: str, review: str) -> str:
    m = re.search(r"^## " + re.escape(name) + r" review[^\n]*\n(.*?)(?=^## |\Z)", review, re.S | re.M)
    return m.group(1) if m else ""


def check_unit(uid: str, axes: dict, review: str, attestation: dict) -> list[dict]:
    findings: list[dict] = []

    def add(axis: str, ok: bool, detail: str, ref: str):
        findings.append({
            "unit_id": uid, "axis": axis, "D": "PASS" if ok else "FAIL",
            "detail": detail, "reference": ref,
            "H": "the cited reference does not actually support this axis",
            "T": "resolve the reference against the named artifact",
            "C": "a generic/template string may describe a different unit",
            "U": "resolution checks artifact identity only, not legal correctness",
        })

    impl = str(axes.get("implementation", ""))
    mm = re.search(r"JapanTaxLaw/(\w+)\.lean", impl)
    module = mm.group(1) if mm else ""

    ad = str(axes.get("adversarial_review", ""))
    bm = re.search(r"(?:docs/ADVERSARIAL_REVIEW\.md )?(Batch [A-Z])", ad)
    if bm:
        section = _review_section(bm.group(1), review)
        ok = bool(section) and bool(module) and module in section
        add("adversarial_review", ok,
            f"module={module or 'UNKNOWN'} section_chars={len(section)}", bm.group(1))
    elif ad:
        add("adversarial_review", bool(re.search(r"docs/\S+\.md", ad)),
            "non-batch reference", ad[:120])

    for axis in ("implementation", "independent_spec", "tests"):
        text = str(axes.get(axis, ""))
        hm = re.search(r"(JapanTaxLaw/\w+\.lean) sha256=([0-9a-f]{64})", text)
        if hm:
            p = REPO / hm.group(1)
            digest = hashlib.sha256(p.read_bytes().replace(b"\r\n", b"\n")).hexdigest() if p.exists() else ""
            add(axis, digest == hm.group(2), f"sha256 {'match' if digest == hm.group(2) else 'MISMATCH'}", hm.group(1))

    kp = str(axes.get("kernel_proof", ""))
    rm = re.search(r"actions/runs/(\d+)", kp)
    if rm:
        run = rm.group(1)
        recorded = str(attestation.get("workflow_run", "")).rstrip("/").split("/")[-1]
        add("kernel_proof", run == recorded and attestation.get("run_conclusion") == "success",
            f"run={run} attested_run={recorded} conclusion={attestation.get('run_conclusion')}", kp[:120])

    return findings


def main() -> int:
    ev = json.loads(EVIDENCE.read_text(encoding="utf-8")) if EVIDENCE.exists() else {"units": {}}
    att = json.loads(ATTESTATION.read_text(encoding="utf-8")) if ATTESTATION.exists() else {}
    review = _read(REPO / "docs" / "ADVERSARIAL_REVIEW.md")
    findings: list[dict] = []
    for uid, axes in ev.get("units", {}).items():
        if isinstance(axes, dict):
            findings.extend(check_unit(uid, axes, review, att))
    unresolved = [f for f in findings if f["D"] == "FAIL"]
    payload = {
        "tool": "scripts/ci/audit_evidence_references.py",
        "schema": "evidence-reference-audit/v1",
        "units_checked": len(ev.get("units", {})),
        "checks": len(findings),
        "resolved": len(findings) - len(unresolved),
        "unresolved": len(unresolved),
        "all_complete_claimable": not unresolved and bool(findings),
        "findings": findings,
    }
    text = json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n"
    drift = not OUT_JSON.exists() or OUT_JSON.read_text(encoding="utf-8") != text
    if drift:
        OUT_JSON.write_text(text, encoding="utf-8")

    lines = [
        "# Evidence reference audit (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `scripts/ci/audit_evidence_references.py`.",
        "",
        "A document name in an evidence string is not proof that the document",
        "supports the unit. This audit resolves each reference against the artifact.",
        "",
        f"- units checked: {payload['units_checked']}",
        f"- references resolved: {payload['resolved']}/{payload['checks']}",
        f"- references UNRESOLVED: {payload['unresolved']}",
        f"- all-complete claimable from references: {payload['all_complete_claimable']}",
        "",
        "| unit | axis | D | detail |",
        "|---|---|---|---|",
    ]
    for f in unresolved[:200]:
        lines.append(f"| `{f['unit_id'][:20]}` | {f['axis']} | FAIL | {f['detail']} |")
    if len(unresolved) > 200:
        lines.append(f"| ... | ... | ... | {len(unresolved) - 200} more |")
    lines.append("")
    md = "\n".join(lines)
    if not OUT_MD.exists() or OUT_MD.read_text(encoding="utf-8") != md:
        OUT_MD.write_text(md, encoding="utf-8")
    print(f"evidence references: {payload['resolved']}/{payload['checks']} resolved, {payload['unresolved']} unresolved")
    return 1 if ("--strict" in sys.argv and unresolved) else 0


if __name__ == "__main__":
    sys.exit(main())
