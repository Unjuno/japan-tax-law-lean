"""Kanji numeral <-> int conversion for Japanese statute numbers.

Supports the range used by statute numbering: 1..9999 with optional branch
(枝番号, e.g. 第十二条の二). Statute text uses full-width digits in a few
places; ASCII digits are also accepted.
"""

from __future__ import annotations

_DIGIT = {
    "零": 0, "〇": 0, "一": 1, "二": 2, "三": 3, "四": 4, "五": 5,
    "六": 6, "七": 7, "八": 8, "九": 9,
}
_UNITS = {"十": 10, "百": 100, "千": 1000}
_FULLWIDTH_DIGITS = str.maketrans("０１２３４５６７８９", "0123456789")


def kanji_to_int(s: str) -> int:
    """Convert a kanji (or ASCII/fullwidth digit) numeral to int.

    Raises ValueError on empty or malformed input.
    """
    s = s.translate(_FULLWIDTH_DIGITS).strip()
    if not s:
        raise ValueError("empty numeral")
    if s.isdigit():
        return int(s)
    total = 0
    current = 0
    for ch in s:
        if ch in _DIGIT:
            current = _DIGIT[ch]
        elif ch in _UNITS:
            unit = _UNITS[ch]
            if current == 0:
                current = 1
            total += current * unit
            current = 0
        else:
            raise ValueError(f"unexpected character in numeral: {ch!r} (in {s!r})")
    total += current
    return total


def is_kanji_numeral(s: str) -> bool:
    try:
        kanji_to_int(s)
        return True
    except ValueError:
        return False
