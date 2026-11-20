#!/usr/bin/env python3
"""Independent original-text audit for 国税通則法 art. 118(3) (附帯税の計算基礎).

Independent of the Lean kernel proof: reads the pinned e-Gov JSON, verifies the
SHA-256 pin, locates the verbatim fragment in the article/paragraph tree,
independently parses the kanji numeral 一万円 = 10,000, and records an H/T/D/C/U
finding. No completion status is promoted by this script.

Regenerate with `python scripts/ci/source_audit_ancillary_base_1183.py`.
"""
from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
SNAPSHOT = REPO / "data/raw/337AC0000000066_20261101_507AC0000000013.law.json"
EXPECTED_SHA = "6F8B43E168652D228066CDA3389A3BF6823900A9268E6BF97297CB6B25189DEE"
NEEDLE = "附帯税の額を計算する場合において、その計算の基礎となる税額に一万円未満の端数があるとき"
KANJI_NEEDLE = "一万円"
EXPECTED_YEN = 10000
OUT = REPO / "docs/SOURCE_AUDIT_ANCILLARY_BASE_118_3.md"


def flat(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat(c) for c in node.get("children", []))
    if isinstance(node, list):
        return "".join(flat(c) for c in node)
    return ""


def norm(t: str) -> str:
    return re.sub(r"[\s\u3000]+", "", t or "")


def kanji_to_int(s: str) -> int:
    digits = {"零": 0, "〇": 0, "一": 1, "二": 2, "三": 3, "四": 4,
              "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
    units = {"十": 10, "百": 100, "千": 1000, "万": 10000}
    total = current = 0
    for ch in s:
        if ch in digits:
            current = digits[ch]
        elif ch in units:
            u = units[ch]
            if u == 10000:
                total = (total + current) * 10000
            else:
                total += (current or 1) * u
            current = 0
        else:
            raise ValueError("unexpected numeral: " + ch)
    return total + current


def paragraphs_with(node, target: str):
    hits = []
    if isinstance(node, dict):
        if node.get("tag") == "Article":
            art = str((node.get("attr") or {}).get("Num", ""))
            def walk_par(n, para=""):
                if isinstance(n, dict):
                    tag = n.get("tag")
                    if tag == "Paragraph":
                        para = str((n.get("attr") or {}).get("Num", ""))
                    if target in norm(flat(n)) and tag == "Paragraph":
                        hits.append((art, para))
                    for c in n.get("children", []):
                        walk_par(c, para)
                elif isinstance(n, list):
                    for c in n:
                        walk_par(c, para)
            walk_par(node)
            return hits
        for c in node.get("children", []):
            hits.extend(paragraphs_with(c, target))
    elif isinstance(node, list):
        for c in node:
            hits.extend(paragraphs_with(c, target))
    return hits


def main() -> int:
    raw = SNAPSHOT.read_bytes()
    digest = hashlib.sha256(raw).hexdigest().upper()
    doc = json.loads(raw)
    root = doc.get("law_full_text")
    target = norm(NEEDLE)
    full = norm(flat(root))
    hits = sorted(set(paragraphs_with(root, target)))
    article118 = None
    for node in [root]:
        def walk(n):
            nonlocal article118
            if isinstance(n, dict):
                if n.get("tag") == "Article" and str((n.get("attr") or {}).get("Num", "")) == "118":
                    article118 = norm(flat(n))
                for c in n.get("children", []):
                    walk(c)
            elif isinstance(n, list):
                for c in n:
                    walk(c)
        walk(node)
    art1_excludes = "国税（印紙税及び附帯税を除く" in (article118 or "")
    parsed = kanji_to_int(KANJI_NEEDLE.replace("円", ""))
    finding = {
        "rule": "SRC-ATC-1",
        "must": True,
        "H": "The verbatim fragment locates 附帯税の計算基礎 in art. 118(3), and 一万円 means 10,000 yen.",
        "T": "SHA-256 pin check; search all Article/Paragraph nodes in the pinned snapshot; independent kanji parse of 一万円.",
        "D": ("CONFIRMED" if (hits == [("118", "3")] and parsed == EXPECTED_YEN
                              and art1_excludes and digest == EXPECTED_SHA)
              else "REFUTED"),
        "C": "The same 10,000-yen unit also appears in art. 120(4) (`RefundRounding.baseForAddition`); art. 118(1) explicitly EXCLUDES 附帯税, so this is a distinct rule, not art. 118(1) with a different constant.",
        "U": "Transcription fidelity only. The kinds/rate of 附帯税 and the determination of the base tax amount require separate modelling and human legal review.",
    }
    result = {
        "snapshot": str(SNAPSHOT.relative_to(REPO)),
        "sha256": digest,
        "sha256_pin_ok": digest == EXPECTED_SHA,
        "needle": NEEDLE,
        "needle_in_full_text": target in full,
        "located_article_paragraphs": hits,
        "kanji_amount": KANJI_NEEDLE,
        "parsed_yen": parsed,
        "art118_1_excludes_ancillary_tax": art1_excludes,
        "finding": finding,
        "completion_status_promoted": False,
    }
    OUT.write_text(
        "\n".join([
            "# Source audit — 国税通則法 art. 118(3) (附帯税の計算基礎)",
            "",
            "Machine-generated by `scripts/ci/source_audit_ancillary_base_1183.py`.",
            "Independent of the Lean kernel proof; no completion status promoted.",
            "",
            f"- snapshot: `{result['snapshot']}`",
            f"- sha256: `{digest}` (pin ok: {result['sha256_pin_ok']})",
            f"- needle located in (article, paragraph): {hits}",
            f"- independent kanji parse: `{KANJI_NEEDLE}` = {parsed} yen",
            f"- art. 118(1) excludes 附帯税: {art1_excludes}",
            "",
            "## H / T / D / C / U",
            "",
            f"- **H**: {finding['H']}",
            f"- **T**: {finding['T']}",
            f"- **D**: {finding['D']}",
            f"- **C**: {finding['C']}",
            f"- **U**: {finding['U']}",
            "",
        ]),
        encoding="utf-8",
    )
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
