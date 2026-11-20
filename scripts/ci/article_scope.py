#!/usr/bin/env python3
"""Article-scope helpers: exact source location, clause decomposition,
dependency analysis and H/T/D/C/U finding records (Directive §1/§5).

Pure functions, no repository I/O.  The mechanical coverage audit is a
NECESSARY but NOT SUFFICIENT condition: it never sets a semantic `audited`
flag.  A theorem-name match, a numeric match and file existence are never
completion evidence.
"""
from __future__ import annotations

import hashlib
import json
import re
from typing import Any


def flat(node: Any) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat(c) for c in node.get("children", []))
    if isinstance(node, list):
        return "".join(flat(c) for c in node)
    return ""


def norm(text: str) -> str:
    return re.sub(r"[\s\u3000]+", "", text or "")


def normalize_with_map(text: str) -> tuple[str, list[int]]:
    out: list[str] = []
    index: list[int] = []
    for i, ch in enumerate(text):
        if ch.isspace() or ch == "\u3000":
            continue
        out.append(ch)
        index.append(i)
    return "".join(out), index


def article_location(node: dict[str, Any]) -> dict[str, Any]:
    attr = node.get("attr") or {}
    paragraphs: list[dict[str, Any]] = []
    title = ""
    for child in node.get("children", []) or []:
        if not isinstance(child, dict):
            continue
        tag = child.get("tag")
        if tag == "ArticleTitle":
            title = norm(flat(child))
        elif tag == "Paragraph":
            items = [norm(str((d.get("attr") or {}).get("Num", "")))
                     for d in child.get("children", []) or []
                     if isinstance(d, dict) and d.get("tag") == "Item"]
            paragraphs.append({"no": norm(str((child.get("attr") or {}).get("Num", ""))),
                               "items": items})
    return {"article_no": norm(str(attr.get("Num", ""))), "title": title,
            "paragraphs": paragraphs}


def make_unit_id(law_id: str, history_id: str, provision_kind: str,
                 provision_id: str, location: dict[str, Any], norm_type: str,
                 unit_index: int, table_cell_ref: str = "") -> str:
    canonical = json.dumps([law_id, history_id, provision_kind, provision_id,
                            location, norm_type, unit_index, table_cell_ref],
                           ensure_ascii=False, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(canonical.encode("utf-8")).hexdigest()


CUE_RULES = (
    ("EXCEPTION", ("ただし", "但し", "この限りでない", "を除く")),
    ("DEEMING", ("みなす", "みなし", "と見なす")),
    ("PRESUMPTION", ("推定する", "推定し", "推定され")),
    ("READING_SUBSTITUTION", ("読み替え", "読替え", "準用する")),
    ("DELEGATION", ("政令で定める", "省令で定める", "大臣が定める",
                    "条例で定める", "規則で定める", "定めるところにより")),
    ("PENALTY", ("拘禁", "罰金", "罰する", "過怠税")),
    ("TRANSITIONAL", ("経過措置", "施行日", "施行の際", "施行前", "改正前", "附則")),
    ("REFERENCE", ("に規定する", "の規定による", "に基づき", "この法律", "同法")),
    ("DEFINITION", ("とは", "をいう", "定義する")),
    ("LEGAL_EFFECT", ("課する", "控除", "納付", "還付", "加算", "免除",
                      "軽減", "徴収", "交付", "適用する")),
    ("CONDITION", ("場合", "とき", "者", "限り", "該当")),
    ("PROCEDURE", ("申告", "届出", "申請", "通知", "更正")),
)
BOUNDARIES = ("。", "；", "\n")
NEW_CUES = ("ただし、", "但し、", "ただし書", "但し書き")


def classify(text: str) -> dict[str, Any]:
    for kind, cues in CUE_RULES:
        for cue in cues:
            if cue in text:
                open_conditions: list[str] = []
                if any(c in text for c in ("場合", "とき")):
                    open_conditions.append("applicability_fact_external")
                if any(c in text for c in ("政令で定める", "省令で定める",
                                           "定めるところにより")):
                    open_conditions.append("delegated_fact_unresolved")
                if "みなす" in text or "推定する" in text:
                    open_conditions.append("deeming_presumption_scope")
                return {"kind": kind, "cue": cue,
                        "needs_review": bool(open_conditions),
                        "open_conditions": open_conditions}
    return {"kind": "UNRESOLVED", "cue": "", "needs_review": True,
            "open_conditions": ["AUTO_DECOMPOSITION_UNRESOLVED"]}


def _segment(text: str) -> list[tuple[str, int, int]]:
    out: list[tuple[str, int, int]] = []
    start = i = 0
    n = len(text)
    while i < n:
        forced = i > start and any(text.startswith(c, i) for c in NEW_CUES)
        if text[i] in BOUNDARIES or forced:
            end = i + 1 if text[i] in BOUNDARIES else i
            if end > start:
                out.append((text[start:end], start, end))
            start = end
            if not forced:
                i = end
            continue
        i += 1
    if start < n:
        out.append((text[start:n], start, n))
    return out


def decompose(law_id: str, history_id: str, provision_kind: str,
              provision_id: str, node: dict[str, Any]) -> list[dict[str, Any]]:
    raw = flat(node)
    normalized, imap = normalize_with_map(raw)
    location = article_location(node)
    units: list[dict[str, Any]] = []
    for index, (clause, start, end) in enumerate(_segment(normalized)):
        info = classify(clause)
        if start >= len(imap) or end - 1 >= len(imap):
            continue
        raw_start, raw_end = imap[start], imap[end - 1] + 1
        cell = f"row-{index:04d}" if provision_kind == "APPDX_TABLE" else ""
        units.append({
            "unit_id": make_unit_id(law_id, history_id, provision_kind,
                                    provision_id, location, info["kind"],
                                    index, cell),
            "law_id": law_id, "history_id": history_id,
            "provision_kind": provision_kind, "provision_id": provision_id,
            "article_no": location["article_no"], "unit_index": index,
            "kind": info["kind"], "cue": info["cue"],
            "needs_review": info["needs_review"],
            "open_conditions": list(info["open_conditions"]),
            "span": [start, end], "source_text": clause,
            "raw_start": raw_start, "raw_end": raw_end,
            "raw_text": raw[raw_start:raw_end], "table_cell": cell,
            "structural_path": location,
        })
    return units


def audit_coverage(text: str, units: list[dict[str, Any]]) -> dict[str, Any]:
    normalized = norm(text)
    total = len(normalized)
    ordered = sorted(units, key=lambda u: (u.get("span") or [0, 0])[0])
    spans: list[tuple[int, int]] = []
    uncovered: list[tuple[int, int]] = []
    cursor = 0
    for unit in ordered:
        span = unit.get("span")
        if not isinstance(span, (list, tuple)) or len(span) != 2:
            continue
        start, end = int(span[0]), int(span[1])
        if start < 0 or end > total or end < start:
            continue
        if start > cursor:
            uncovered.append((cursor, start))
        spans.append((start, end))
        cursor = max(cursor, end)
    if cursor < total:
        uncovered.append((cursor, total))
    reconstruction_ok = norm("".join(str(u.get("source_text", "")) for u in ordered)) == normalized
    contiguous = all(spans[i][1] == spans[i + 1][0] for i in range(len(spans) - 1))
    problems: list[str] = []
    if uncovered:
        problems.append(f"uncovered spans: {uncovered}")
    if not contiguous:
        problems.append("spans are not contiguous")
    if not reconstruction_ok:
        problems.append("independent reconstruction mismatch")
    return {
        "ok": not uncovered and contiguous and reconstruction_ok,
        "independent_reconstruction_ok": reconstruction_ok,
        "contiguous": contiguous,
        "total_chars": total,
        "covered_chars": min(sum(b - a for a, b in spans), total),
        "uncovered_chars": sum(b - a for a, b in uncovered),
        "uncovered_spans": [list(s) for s in uncovered],
        "unresolved_count": sum(1 for u in ordered
                                if u.get("kind") == "UNRESOLVED" or u.get("needs_review")),
        "unit_count": len(units), "audited": False, "problems": problems,
        "claim": "MECHANICAL_COVERAGE_ONLY_NOT_SEMANTIC_AUDIT",
    }


REVISION_RE = re.compile(r"(?<!\d)(\d{15})_(\d{8})_(\d{15})(?!\d)")
LAW_ID_RE = re.compile(r"(?<![\d_])(\d{15})(?![\d_])")
ARTICLE_RE = re.compile(
    r"第([0-9０-9〇零一二三四五六七八九十百千]+(?:の[0-9０-9〇零一二三四五六七八九十百千]+)*)条")


def build_inventory_index(inv: dict) -> tuple[dict[str, dict], dict[str, dict]]:
    by_id: dict[str, dict] = {}
    by_title: dict[str, dict] = {}
    for law in inv.get("laws", []):
        if law.get("law_id"):
            by_id[law["law_id"]] = law
        rev = law.get("current_revision") or {}
        for title in (law.get("official_title"), law.get("law_title"),
                      rev.get("law_title"), rev.get("amendment_law_title")):
            if isinstance(title, str) and title:
                by_title.setdefault(title, law)
    return by_id, by_title


def analyze_dependencies(text: str, by_id: dict[str, dict],
                         by_title: dict[str, dict]) -> list[dict[str, Any]]:
    deps: list[dict[str, Any]] = []
    seen: set[str] = set()
    revision_spans = [m.span() for m in REVISION_RE.finditer(text)]

    def add(raw: str, dtype: str, law: dict | None, **extra) -> None:
        if raw in seen:
            return
        seen.add(raw)
        rev = (law or {}).get("current_revision") or {}
        deps.append({"type": dtype, "raw": raw,
                     "law_id": (law or {}).get("law_id", ""),
                     "law_title": (law or {}).get("official_title", ""),
                     "history_id": rev.get("law_revision_id", ""),
                     "enforcement_date": rev.get("enforcement_date", ""),
                     "unresolved": law is None, **extra})

    for m in REVISION_RE.finditer(text):
        add(m.group(0), "REVISION_ID", by_id.get(m.group(1)), history_id=m.group(0))
    for m in LAW_ID_RE.finditer(text):
        if any(a <= m.start() < b for a, b in revision_spans):
            continue
        add(m.group(0), "LAW_ID_HINT", by_id.get(m.group(1)),
            note="bare 15-digit id is a weak signal only")
    for title, law in sorted(by_title.items(), key=lambda kv: -len(kv[0])):
        if title in text:
            add(title, "LAW_NAME", law)
    for m in ARTICLE_RE.finditer(text):
        add(m.group(0), "ARTICLE_REF", None, article_no=m.group(1))
    return deps


def finding(code: str, H: str, T: str, D: str, C: str, U: str) -> dict[str, str]:
    """H = refutable hypothesis, T = reproduction test, D = decision,
    C = competing interpretation, U = residual uncertainty."""
    return {"code": code, "H": H, "T": T, "D": D, "C": C, "U": U}
