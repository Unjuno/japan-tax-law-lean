#!/usr/bin/env python3
"""Lean-independent source ↔ spec check (Directive §3).

Re-extracts the pinned article, parses Japanese numerals and verifies that the
amount in the norm unit appears as a constant in the independent spec and the
implementation. This does not read Lean proofs and is not a legal review.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
DIGITS = {"零": 0, "〇": 0, "一": 1, "二": 2, "三": 3, "四": 4,
          "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
UNITS = {"十": 10, "百": 100, "千": 1000, "万": 10000, "億": 100000000}
AMOUNT_RE = re.compile(r"([〇零一二三四五六七八九十千百万億]+)円")


def kanji_number(s: str) -> int:
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
            raise ValueError(f"not a numeral: {ch}")
    return total + section + digit


def flat(n) -> str:
    if isinstance(n, str):
        return n
    if isinstance(n, dict):
        return "".join(flat(c) for c in n.get("children", []))
    return ""


def article_text(doc: dict, no: str) -> str:
    out = []

    def walk(n):
        if isinstance(n, dict):
            if n.get("tag") == "Article" and str((n.get("attr") or {}).get("Num", "")) == no:
                out.append(flat(n))
            for c in n.get("children", []):
                walk(c)
        elif isinstance(n, list):
            for c in n:
                walk(c)
    walk(doc.get("law_full_text"))
    return "\n".join(out)


def unquote(s: str) -> str:
    s = s.strip()
    return s[1:-1] if len(s) >= 2 and s[0] == s[-1] and s[0] in "\"'" else s


def main() -> int:
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("--source-file", required=True)
    ap.add_argument("--article", required=True)
    ap.add_argument("--verbatim", required=True)
    ap.add_argument("--spec", required=True)
    ap.add_argument("--impl", required=True)
    a = ap.parse_args()
    sf, art, verb = unquote(a.source_file), unquote(a.article), unquote(a.verbatim)
    doc = json.loads((REPO / sf).read_text(encoding="utf-8"))
    text = article_text(doc, art)
    norm = lambda s: re.sub(r"[\s\u3000]+", "", s)
    located = norm(verb) in norm(text)
    # Scope the amounts to THIS normative unit's verbatim sentence, not the
    # whole article (other bands are separate units with their own evidence).
    amounts = sorted({kanji_number(m.group(1)) for m in AMOUNT_RE.finditer(verb)})
    spec = (REPO / unquote(a.spec)).read_text(encoding="utf-8")
    impl = (REPO / unquote(a.impl)).read_text(encoding="utf-8")
    missing = [x for x in amounts if f"{x:_}" not in spec + impl and str(x) not in spec + impl]
    ok = located and bool(amounts) and not missing
    print(json.dumps({
        "rule": "source_correspondence", "verbatim_located": located,
        "amounts_in_source": amounts, "missing_in_spec_or_impl": missing,
        "D": "PASS" if ok else "FAIL",
        "H": "the spec does not represent the pinned amount",
        "T": "re-extract pinned article, parse 漢数字, compare Lean constants",
        "C": "numeral match is necessary but not sufficient for semantic fidelity",
        "U": "scope/applicability require human review",
        "note": "source-fidelity decision only; not a proof or legal review",
    }, ensure_ascii=False, indent=2))
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
