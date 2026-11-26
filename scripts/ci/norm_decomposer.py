#!/usr/bin/env python3
"""Decompose a pinned provision into normative units (Objective §1 items 2/3).

Every sentence (and every ただし書 exception clause) becomes a separate,
position-tracked unit classified as CONDITION / LEGAL_EFFECT / EXCEPTION /
DEEMING / PRESUMPTION / DELEGATION / READING_SUBSTITUTION / REFERENCE / ... .
Text with no recognizable marker is recorded as UNCLASSIFIED and needs_review;
it is never silently dropped and never counted as a verified norm.

Decomposition is purely mechanical.  `audit_coverage()` proves only that the
original characters are reconstructed exactly; it NEVER certifies that the
classification is legally correct (that requires the independent-audit axis).
"""
from __future__ import annotations

import re
from dataclasses import dataclass

from normative_ids import NORM_TYPES, norm_text

# Operative/qualifying kinds outrank REFERENCE: a provision that both refers to
# another article and imposes tax must be labelled by its legal effect, with
# REFERENCE retained in `kinds`. A pure reference still gets REFERENCE.
KIND_PRIORITY = (
    "EXCEPTION",
    "TRANSITIONAL",
    "DEEMING",
    "PRESUMPTION",
    "DELEGATION",
    "READING_SUBSTITUTION",
    "DEFINITION",
    "PROCEDURE",
    "PENALTY",
    "LEGAL_EFFECT",
    "CONDITION",
    "REFERENCE",
)

PATTERNS = {
    "EXCEPTION": re.compile(r"ただし|但し|この限りでない|を除く|除き|適用しない|この場合に限り"),
    "DEEMING": re.compile(r"みなす|みなし|看成す"),
    "PRESUMPTION": re.compile(r"推定する|推定し|推定"),
    "DELEGATION": re.compile(
        r"(政令|省令|内閣府令|大蔵省令|国税庁長官|財務大臣|条例|規則|告示|命令)"
        r"(で|に|が)(定める|定め|規定する|委任)"
    ),
    "READING_SUBSTITUTION": re.compile(r"読み替え|読替え"),
    "REFERENCE": re.compile(
        r"第[0-9０-９〇零一二三四五六七八九十百千]+条|この法律|同法|前条|"
        r"準用|に基づき|に定めるところによる"
    ),
    "DEFINITION": re.compile(r"とは、|とは|をいう|という"),
    "PROCEDURE": re.compile(r"申告|届出|申請|納付|徴収|決定|通知|書面|手続"),
    "PENALTY": re.compile(r"罰金|科料|拘禁|罰則|刑事罰"),
    # 経過措置の明示: 旧法の適用を残す規定は TRANSITIONAL として分類する。
    "TRANSITIONAL": re.compile(r"従前の例による|なおその効力を有する"),
    "LEGAL_EFFECT": re.compile(
        r"課する|課税|控除|加算|減額|還付|税率|課税標準|算出|計算|適用|"
        r"納める義務|算入|確定|必要経費"
    ),
    "CONDITION": re.compile(r"場合|とき|際し|に係る|に対する|を有する|ができる|しなければならない"),
}

BREAKS = frozenset("。；;\n")
EXCEPTION_MARK = re.compile(r"ただし|但し")
_ALIASES = {"FICTION": "DEEMING", "REWRITE": "READING_SUBSTITUTION", "EFFECT": "LEGAL_EFFECT"}
for _alias, _canonical in _ALIASES.items():
    PATTERNS.setdefault(_alias, PATTERNS[_canonical])


@dataclass(frozen=True)
class NormUnit:
    index: int
    norm_type: str
    kinds: tuple[str, ...]
    text: str
    norm_text: str
    raw_start: int
    raw_end: int
    source_path: str = ""
    is_exception: bool = False
    needs_review: bool = False
    reason: str = ""
    hypothesis: str = ""
    uncertainty: str = ""

    def as_dict(self) -> dict:
        return {
            "index": self.index,
            "norm_type": self.norm_type,
            "kinds": list(self.kinds),
            "text": self.text,
            "char_start": self.raw_start,
            "char_end": self.raw_end,
            "source_path": self.source_path,
            "is_exception": self.is_exception,
            "needs_review": self.needs_review,
            "reason": self.reason,
            "hypothesis": self.hypothesis,
            "uncertainty": self.uncertainty,
        }


def classify(segment: str) -> dict:
    """Primary kind plus every matching kind; UNRESOLVED when no marker matched."""
    nt = norm_text(segment)
    kinds = [k for k, pat in PATTERNS.items() if pat.search(nt)]
    if not kinds:
        return {"primary": "UNCLASSIFIED", "kinds": [], "reason": "NO_NORMATIVE_MARKER"}
    canonical = [_ALIASES.get(k, k) for k in kinds]
    # de-duplicate while preserving match order
    canonical = list(dict.fromkeys(canonical))
    primary = next((k for k in KIND_PRIORITY if k in canonical), canonical[0])
    return {"primary": primary, "kinds": canonical, "reason": ""}


def _sentence_spans(text: str) -> list[tuple[int, int, str]]:
    spans: list[tuple[int, int, str]] = []
    start = 0
    for i, ch in enumerate(text):
        if ch in BREAKS:
            spans.append((start, i + 1, text[start:i + 1]))
            start = i + 1
    if start < len(text):
        spans.append((start, len(text), text[start:]))
    return spans


def decompose(text: str, source_path: str = "") -> list[NormUnit]:
    """Split into characters-exact normative units, recording unresolved text."""
    units: list[NormUnit] = []

    def emit(start: int, end: int, chunk: str, is_exception: bool) -> None:
        if not chunk.strip():
            # whitespace-only chunks are attached to the preceding unit so that
            # the concatenation of unit texts reproduces the source exactly.
            if units:
                prev = units[-1]
                units[-1] = NormUnit(
                    prev.index, prev.norm_type, prev.kinds, prev.text + chunk,
                    prev.norm_text, prev.raw_start, end, prev.source_path,
                    prev.is_exception, prev.needs_review, prev.reason,
                    prev.hypothesis, prev.uncertainty,
                )
            return
        cl = classify(chunk)
        primary = cl["primary"]
        unresolved = primary == "UNCLASSIFIED"
        units.append(NormUnit(
            index=len(units),
            norm_type=primary if primary in NORM_TYPES else "UNCLASSIFIED",
            kinds=tuple(k for k in cl["kinds"] if k in NORM_TYPES),
            text=chunk,
            norm_text=norm_text(chunk),
            raw_start=start,
            raw_end=end,
            source_path=source_path,
            is_exception=is_exception or "EXCEPTION" in cl["kinds"],
            needs_review=unresolved,
            reason=cl["reason"],
            hypothesis="H_EXCEPTION" if is_exception else "H_SPLIT",
            uncertainty="U_MULTI_KIND" if len(cl["kinds"]) > 1 else "",
        ))

    for start, end, chunk in _sentence_spans(text):
        m = EXCEPTION_MARK.search(chunk)
        if m and m.start() > 0:
            emit(start, start + m.start(), chunk[:m.start()], False)
            emit(start + m.start(), end, chunk[m.start():], True)
        else:
            emit(start, end, chunk, bool(m))

    # Leading whitespace with no preceding unit: prepend to the first unit.
    if units and units[0].raw_start > 0:
        prefix = text[:units[0].raw_start]
        first = units[0]
        units[0] = NormUnit(
            first.index, first.norm_type, first.kinds, prefix + first.text,
            first.norm_text, 0, first.raw_end, first.source_path,
            first.is_exception, first.needs_review, first.reason,
            first.hypothesis, first.uncertainty,
        )
    return units


def audit_coverage(source: str, units: list[NormUnit]) -> dict:
    """Mechanical coverage audit — necessary, never sufficient, for fidelity."""
    reconstruction = "".join(u.text for u in units)
    reconstruction_ok = reconstruction == source
    contiguous = all(units[i].raw_start == units[i - 1].raw_end
                     for i in range(1, len(units)))
    independent_ok = reconstruction_ok and all(
        source[u.raw_start:u.raw_end] == u.text for u in units
    )
    covered = sum(u.raw_end - u.raw_start for u in units)
    uncovered = max(0, len(source) - covered) if contiguous and reconstruction_ok else len(source) - covered
    unclassified = [u.index for u in units if u.norm_type == "UNCLASSIFIED"]
    unresolved = [u.index for u in units if u.needs_review]
    problems: list[str] = []
    if not reconstruction_ok:
        problems.append("reconstruction_mismatch")
    if not contiguous:
        problems.append("non_contiguous_spans")
    if not independent_ok:
        problems.append("offset_slice_mismatch")
    if uncovered:
        problems.append(f"uncovered_chars={uncovered}")
    if unresolved:
        problems.append(f"unresolved_units={unresolved}")
    return {
        "ok": reconstruction_ok and contiguous and independent_ok and uncovered == 0,
        "reconstruction_ok": reconstruction_ok,
        "independent_reconstruction_ok": independent_ok,
        "contiguous": contiguous,
        "total_chars": len(source),
        "covered_chars": covered,
        "uncovered_chars": uncovered,
        "unclassified_units": unclassified,
        "unresolved_units": unresolved,
        "unresolved_count": len(unresolved),
        "problems": problems,
        "audited": False,
        "claim": "MECHANICAL_COVERAGE_ONLY_NOT_SEMANTIC_AUDIT",
    }


if __name__ == "__main__":
    raise SystemExit(0)
