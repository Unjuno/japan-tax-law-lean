#!/usr/bin/env python3
"""Lean-independent source <-> specification correspondence audit (Directive §3).

Re-extracts the verbatim sentence from the pinned raw snapshot using the
unit's structural coordinates, parses Japanese numerals in it, and checks that
every amount appears in the independently written Spec module. A PASS is a
source-fidelity decision only: it is not a Lean proof and not a legal-correctness
claim. Each result records H/T/D/C/U (Objective §5).

Usage:
  python scripts/ci/source_correspondence.py --unit NORM|... \
      --source-file data/raw/....law.json --article 74_5 \
      --verbatim "..." --spec JapanTaxLaw/XSpec.lean [--impl JapanTaxLaw/X.lean]
"""
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
DIGITS = {"零": 0, "〇": 0, "一": 1, "二": 2, "三": 3, "四": 4,
          "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
UNITS = {"十": 10, "百": 100, "千": 1000, "万": 10000, "億": 100000000}


def kanji_number(s: str) -> int:
    s = s.strip()
    if s.isdigit():
        return int(s)
    total = section = digit = 0
    for ch in s:
        if ch in DIGITS:
            digit = DIGITS[ch]
        elif ch in UNITS:
            u = UNITS[ch]
            if u >= 10000:
                section = (section + digit) * u
                total += section
                section = digit = 0
            else:
                section += (digit or 1) * u
                digit = 0
        else:
            raise ValueError(f"not a numeral: {ch!r} in {s!r}")
    return total + section + digit


AMOUNT_RE = re.compile(r"([〇零一二三四五六七八九十千百万億]+)円")
STRIP = re.compile(r"[\s\u3000]+")


def flat(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat(c) for c in node.get("children", []))
    if isinstance(node, list):
        return "".join(flat(c) for c in node)
    return ""


def find_article_text(doc: dict, article: str) -> str:
    found = []

    def walk(n):
        if isinstance(n, dict):
            if n.get("tag") == "Article" and str((n.get("attr") or {}).get("Num", "")) == article:
                found.append(flat(n))
            for c in n.get("children", []):
                walk(c)
        elif isinstance(n, list):
            for c in n:
                walk(c)

    walk(doc.get("law_full_text", doc))
    return " ".join(found)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--unit", required=True)
    ap.add_argument("--source-file", required=True)
    ap.add_argument("--article", required=True)
    ap.add_argument("--verbatim", required=True)
    ap.add_argument("--spec", required=True)
    ap.add_argument("--impl", default="")
    args = ap.parse_args()

    doc = json.loads((REPO / args.source_file).read_text(encoding="utf-8"))
    article_text = find_article_text(doc, args.article)
    located = STRIP.sub("", args.verbatim) in STRIP.sub("", article_text)
    amounts = []
    for m in AMOUNT_RE.finditer(article_text):
        try:
            amounts.append(kanji_number(m.group(1)))
        except ValueError:
            continue
    amounts = sorted(set(amounts))

    spec_text = (REPO / args.spec).read_text(encoding="utf-8")
    impl_text = (REPO / args.impl).read_text(encoding="utf-8") if args.impl else ""
    missing_spec = [a for a in amounts if f"{a:_}" not in spec_text and str(a) not in spec_text]
    missing_impl = [a for a in amounts if f"{a:_}" not in impl_text and str(a) not in impl_text]
    ok = located and bool(amounts) and not missing_spec and not missing_impl

    finding = {
        "rule": "source_correspondence",
        "H": "the independent spec does not represent the amounts in the pinned original",
        "T": "re-extract article from pinned JSON, parse kanji numerals, compare with Lean constants",
        "D": "PASS" if ok else "FAIL",
        "C": "a matching numeral is necessary but not sufficient for semantic fidelity",
        "U": "variable meaning, units and scope require separate review",
        "unit_id": args.unit,
        "source_file": args.source_file,
        "article": args.article,
        "verbatim_located": located,
        "amounts_in_source": amounts,
        "missing_in_spec": missing_spec,
        "missing_in_impl": missing_impl,
        "note": "source-fidelity decision only; not a Lean proof, not legal correctness",
    }
    print(json.dumps(finding, ensure_ascii=False, indent=2))
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
