#!/usr/bin/env python3
"""Canonical normative-unit core for Directive §1 (single source of truth).

This module is imported by task_queue.py, task_selector.py,
article_obligations.py and law_audit/phase_e/article_scope.py.  It implements:

  §1.1 collision-free identifiers covering law id, revision/history id,
       本則/附則/別表, article/paragraph/item/subitem/cell, norm kind, unit
       ordinal, exact source span and the pinned source digest (full SHA-256,
       never truncated);
  §1.2 decomposition of every provision into normative units;
  §1.3 undecidable text recorded as UNRESOLVED with a coverage audit;
  §1.4 completion derived ONLY from recorded evidence — numeric matches,
       file existence and theorem-name strings are weak hints at most;
  §1.5 per-unit evidence slots (source, spec, impl, proof, tests, unhandled
       conditions, review);
  §1.6 dependency extraction from law names, article refs, law numbers and
       enforcement versions — a 15-digit id is only one extractor;
  §1.7 durable per-unit state (owner, blockers, artifacts, attempts, review)
       in git-tracked files that survive regeneration and session restart.

Nothing in this module edits Lean sources or proof artifacts.
"""
from __future__ import annotations

import hashlib
import json
import re
from datetime import datetime, timezone
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
INVENTORY = REPO / "data" / "INVENTORY.json"
STATE_PATH = REPO / "data" / "task_state.json"
EVIDENCE_PATH = REPO / "data" / "verification_evidence.json"
QUEUE_JSON = REPO / "build" / "task_queue.json"

# --------------------------------------------------------------------------
# §1 — vocabulary
# --------------------------------------------------------------------------
NOT_STARTED = "NOT_STARTED"
PARTIAL = "PARTIAL"
PROVED_SCOPE = "PROVED_SCOPE"
FULLY_VERIFIED = "FULLY_VERIFIED"
BLOCKED = "BLOCKED"
STALE = "STALE"
STATUSES = (NOT_STARTED, PARTIAL, PROVED_SCOPE, FULLY_VERIFIED, BLOCKED, STALE)
ACTIVE_STATUSES = (NOT_STARTED, PARTIAL, PROVED_SCOPE, BLOCKED)
DONE_STATUSES = (PROVED_SCOPE, FULLY_VERIFIED)

LEGAL_REVIEW_PENDING = "LEGAL_REVIEW_PENDING"
LEGAL_REVIEWED = "LEGAL_REVIEWED_BY_HUMAN"
LEGAL_REVIEW_VALUES = (LEGAL_REVIEW_PENDING, LEGAL_REVIEWED, "NOT_APPLICABLE")

NORM_KINDS = (
    "APPLICATION_CONDITION", "LEGAL_EFFECT", "EXCEPTION", "DEEMING",
    "PRESUMPTION", "DELEGATION", "READING_SUBSTITUTION", "REFERENCE",
    "UNCLASSIFIED", "UNRESOLVED",
)
UNRESOLVED_KINDS = ("UNCLASSIFIED", "UNRESOLVED")

# Mechanical evidence axes.  FULLY_VERIFIED requires all of them.  The legal
# review axis is deliberately NOT in this tuple (§1 — separate axis).
MECHANICAL_AXES = (
    "SOURCE_POSITION",
    "DECOMPOSITION_AUDIT",
    "SOURCE_CORRESPONDENCE_AUDIT",
    "INDEPENDENT_SPEC",
    "IMPLEMENTATION",
    "KERNEL_PROOF",
    "TEST",
    "CONDITION_SCOPE",
    "EXCEPTION_SCOPE",
    "BOUNDARY_CONSISTENCY",
    "RULE_PRECEDENCE",
    "CROSS_LAW_RELATION",
    "REVISION_IMPACT",
    "DIMENSIONS_RECORDED",
    "ADVERSARIAL_REVIEW",
    "UNHANDLED_CONDITIONS_RESOLVED",
)
# Cross-law evidence is only required when a unit actually has dependencies.
CONDITIONAL_AXES = ("CROSS_LAW_RELATION",)

OBLIGATIONS = MECHANICAL_AXES  # same identifiers, recorded per unit in the queue

FORBIDDEN_PROOF = re.compile(r"\b(sorry|admit|axiom|unsafe|Classical\.choice)\b")


def now() -> str:
    return datetime.now(timezone.utc).replace(microsecond=0).isoformat()


def norm_text(text: str) -> str:
    """Whitespace/ideographic-space normalization used for fidelity only."""
    return re.sub(r"[\s\u3000]+", "", text or "")


def flat(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat(c) for c in node.get("children", []))
    if isinstance(node, list):
        return "".join(flat(c) for c in node)
    return ""


def sha256_text(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


# --------------------------------------------------------------------------
# §1.1 — structural walking and collision-free identity
# --------------------------------------------------------------------------
KEEP_TAGS = (
    "MainProvision", "SupplProvision", "AppdxTable", "Appdx", "AppdxNote",
    "AppdxStyle", "Article", "Paragraph", "Item", "SubItem", "Subitem",
    "TableRow", "TableCell", "Column",
)


def walk_provisions(node, path=(), sibling_index=-1):
    """Yield (path_tuple, node) for every structural norm host in document order.

    The path carries the provision kind (Main/Supplementary/AppendixTable),
    every article/paragraph/item/subitem/table-row marker, and the sibling
    index of each container.  The index is essential: e-Gov snapshots contain
    dozens of unnumbered `SupplProvision` blocks that would otherwise collide
    on article number alone.  Locations remain stable across regeneration
    because the walk is deterministic document order.
    """
    if isinstance(node, dict):
        tag = node.get("tag", "")
        num = str((node.get("attr") or {}).get("Num", ""))
        locator = f"#{sibling_index}" if sibling_index >= 0 else ""
        newpath = path
        if tag == "MainProvision":
            newpath = path + ("Main" + locator,)
        elif tag == "SupplProvision":
            newpath = path + ("Supplementary" + ((":" + num) if num else "") + locator,)
        elif tag in ("AppdxTable", "Appdx", "AppdxNote", "AppdxStyle"):
            newpath = path + (tag + ((":" + num) if num else "") + locator,)
        elif tag in ("Article", "Paragraph", "Item", "SubItem", "Subitem",
                     "TableRow", "TableCell", "Column"):
            newpath = path + (tag + ((":" + num) if num else "") + locator,)
        yield newpath, node
        for index, child in enumerate(node.get("children", [])):
            yield from walk_provisions(child, newpath, index)
    elif isinstance(node, list):
        for index, child in enumerate(node):
            yield from walk_provisions(child, path, index)


def provision_of(path) -> str:
    parts = tuple(path or ())
    if any(p.startswith("Supplementary") for p in parts):
        return "Supplementary"
    if any(p.startswith(("AppdxTable", "Appdx")) for p in parts):
        return "AppdxTable"
    if "Main" in parts:
        return "Main"
    return "Unknown"


def path_parts(path) -> dict:
    out = {"article": "", "paragraph": "", "item": "", "subitem": "",
           "table": "", "cell": ""}
    for component in tuple(path or ()):
        tag, _, num = component.partition(":")
        num = num.split("#", 1)[0]  # drop the deterministic sibling locator
        if tag == "Article":
            out["article"] = num
        elif tag == "Paragraph":
            out["paragraph"] = num
        elif tag == "Item":
            out["item"] = num
        elif tag in ("SubItem", "Subitem"):
            out["subitem"] = num
        elif tag == "TableRow":
            out["cell"] = num
        elif tag.startswith("Appdx"):
            out["table"] = num
    return out


def canonical_norm_id(*, law_id, revision_id, history_id="", provision="Main",
                      article="", paragraph="", item="", subitem="", table="",
                      cell="", norm_kind="", unit_index=0, source_sha256="",
                      text_digest="", span_start=0, span_end=0,
                      structural_path="") -> str:
    """Return a full 64-hex SHA-256 identity over ALL distinguishing components.

    Truncation is never applied: the previous 16-hex prefix silently collided
    when a law had several norms in one article, several revisions, a
    supplementary provision, paragraph/item detail or an appendix cell.
    """
    key = {
        "norm-v2": True,
        "structural_path": str(structural_path or ""),
        "law_id": str(law_id or ""),
        "revision_id": str(revision_id or ""),
        "history_id": str(history_id or ""),
        "provision": str(provision or "Main"),
        "article": str(article or ""),
        "paragraph": str(paragraph or ""),
        "item": str(item or ""),
        "subitem": str(subitem or ""),
        "table": str(table or ""),
        "cell": str(cell or ""),
        "norm_kind": str(norm_kind or ""),
        "unit_index": int(unit_index),
        "source_sha256": str(source_sha256 or ""),
        "text_digest": str(text_digest or ""),
        "span": [int(span_start), int(span_end)],
    }
    return sha256_text(json.dumps(key, ensure_ascii=False, sort_keys=True,
                                  separators=(",", ":")))


def assert_unique(ids) -> None:
    seen = {}
    for ident in ids:
        if ident in seen:
            raise ValueError(f"norm id collision: {ident} (also {seen[ident]})")
        seen[ident] = True


# --------------------------------------------------------------------------
# §1.2 / §1.3 — decomposition and coverage accounting
# --------------------------------------------------------------------------
# Ordered: the most specific normative operator wins.  Every match is kept in
# `markers` so an auditor can see competing classifications.
KIND_PATTERNS = (
    ("EXCEPTION", r"ただし|但し|を除き|を除く|この限りでない|にかかわらず|例外"),
    ("DEEMING", r"みなす|みなし|見なす|見なし|擬制"),
    ("PRESUMPTION", r"推定"),
    ("READING_SUBSTITUTION", r"読み替|読替|準用して|準用し"),
    ("DELEGATION", r"委任|委ね|政令で定め|省令で定め|府令で定め|命令で定め|"
                   r"規則で定め|国税庁長官|厚生労働省令|財務省令|総務省令|"
                   r"別表に定め|定めるところによる"),
    ("LEGAL_EFFECT", r"課する|課税|徴収|控除|税率|百分|千分|割合|円|納付|還付|"
                     r"算出|加算|減算|確定|申告|義務|として|定める"),
    ("APPLICATION_CONDITION", r"場合|とき|限り|該当|適用|満たす|生じた|する者|"
                              r"を有する|を超え|以下|以上"),
    # Article numbers appear in almost every provision; a bare reference is the
    # least specific classification and must not mask a concrete effect.
    ("REFERENCE", r"準用|引用|この法律|前項|後項|同項|同条|に基づき|"
                  r"に掲げる|の規定による|第[〇零一二三四五六七八九十百千0-9]+条"),
)
COMPILED_PATTERNS = tuple((k, re.compile(p)) for k, p in KIND_PATTERNS)
CLAUSE_BOUNDARY = re.compile(r"[^。；]+[。；]?|。+；*")


def classify(text: str) -> tuple[str, list[str]]:
    markers = [kind for kind, rx in COMPILED_PATTERNS if rx.search(text or "")]
    return (markers[0] if markers else "UNCLASSIFIED"), markers


def decompose(text: str) -> list[dict]:
    """Split one provision into exact-span normative units.

    Any text that the mechanical splitter cannot reconstruct exactly becomes an
    explicit UNRESOLVED unit with `coverage_gap=True`; it is never dropped.
    """
    text = text or ""
    units = []
    pos = 0
    for match in CLAUSE_BOUNDARY.finditer(text):
        segment = match.group(0)
        start, end = match.start(), match.end()
        pos = end
        if not norm_text(segment):
            continue
        kind, markers = classify(segment)
        units.append({
            "text": segment.strip(),
            "norm_kind": kind,
            "markers": markers,
            "unit_index": len(units),
            "start": start,
            "end": end,
            "coverage_gap": False,
            "open_conditions": [],
        })
    reconstructed = "".join(u["text"] for u in units)
    if norm_text(reconstructed) != norm_text(text):
        units.append({
            "text": text,
            "norm_kind": "UNRESOLVED",
            "markers": [],
            "unit_index": len(units),
            "start": 0,
            "end": len(text),
            "coverage_gap": True,
            "open_conditions": ["MECHANICAL_DECOMPOSITION_INCOMPLETE"],
        })
    if not units:
        units.append({
            "text": text,
            "norm_kind": "UNRESOLVED",
            "markers": [],
            "unit_index": 0,
            "start": 0,
            "end": len(text),
            "coverage_gap": bool(text),
            "open_conditions": ["EMPTY_OR_UNDECOMPOSABLE_TEXT"],
        })
    return units


def audit_coverage(text: str, units: list[dict]) -> dict:
    """Mechanical coverage only — NOT an independent original-text audit."""
    total = len(norm_text(text))
    covered = sum(len(norm_text(u["text"])) for u in units)
    gaps = [u for u in units if u["coverage_gap"]]
    unresolved = [u for u in units if u["norm_kind"] in UNRESOLVED_KINDS]
    return {
        "method": "exact-span clause reconstruction v1",
        "total_chars": total,
        "covered_chars": covered,
        "reconstruction_ok": norm_text("".join(u["text"] for u in units)) == norm_text(text),
        "contiguous": all(units[i]["end"] == units[i + 1]["start"]
                          for i in range(len(units) - 1)) if units else False,
        "clause_count": len(units),
        "coverage_gap_count": len(gaps),
        "unresolved_count": len(unresolved),
        "independent_audit": NOT_STARTED,
        "claim": "mechanical reconstruction only; original-text fidelity is a separate evidence axis",
    }


# --------------------------------------------------------------------------
# §1.6 — dependency extraction beyond the 15-digit id
# --------------------------------------------------------------------------
# The inventory uses both numeric 15-digit identifiers and alphanumeric law
# ids (e.g. 143AC0000000054); neither is by itself a complete dependency graph.
ID15_RE = re.compile(r"\b(?:\d{15}|\d{3}[A-Z]{2}\d{10})\b")
ARTICLE_RE = re.compile(
    r"第[〇零一二三四五六七八九十百千万0-9]+条"
    r"(?:の[〇零一二三四五六七八九十百0-9]+)?"
    r"(?:第[〇零一二三四五六七八九十百0-9]+項)?"
    r"(?:第[〇零一二三四五六七八九十百0-9]+号)?"
)
LAW_NUMBER_RE = re.compile(r"(?:法律|政令|省令|命令|規則|条例)第[〇零一二三四五六七八九十百千万0-9]+号")
LAW_NAME_RE = re.compile(
    r"[一-龥々ヵヶぁ-んァ-ヶA-Za-z]{2,40}"
    r"(?:税法|租税特別措置法|関税法|法律|政令|省令|命令|規則|条例|条約|通達)"
)
VERSION_RE = re.compile(
    r"(?:施行日|施行期日|経過措置|令和[0-9〇一二三四五六七八九十]+年|"
    r"平成[0-9〇一二三四五六七八九十]+年|昭和[0-9〇一二三四五六七八九十]+年)"
)


def law_title_index(inv: dict) -> dict:
    return {norm_text(law.get("official_title", "")): law.get("law_id", "")
            for law in inv.get("laws", []) if law.get("official_title")}


def parse_dependencies(text: str, inv: dict | None = None,
                       title_index: dict | None = None) -> list[dict]:
    """Return structured dependency candidates with source spans and kinds.

    Four extractors are used: 15-digit ids, law names (which need not contain
    '税'), law numbers and article/paragraph/item references, plus enforcement
    version qualifiers.  A bare 15-digit hit is recorded, but it is only ONE
    signal and never counts as a complete dependency analysis.

    `title_index` may be precomputed once with `law_title_index(inv)`; rebuilding
    it per unit is quadratic over a large inventory.
    """
    titles = title_index if title_index is not None else (
        law_title_index(inv) if inv else {})
    deps = []

    def add(kind, value, match, resolved="", article="", version=""):
        deps.append({
            "kind": kind,
            "value": value,
            "span": [match.start(), match.end()],
            "resolved_law_id": resolved,
            "article": article,
            "version": version,
        })

    for m in ID15_RE.finditer(text or ""):
        add("law_id_15", m.group(0), m, resolved=m.group(0))
    for m in LAW_NAME_RE.finditer(text or ""):
        raw = m.group(0).replace("\u3000", "")
        add("law_name", raw, m, resolved=titles.get(norm_text(raw), ""))
    for m in LAW_NUMBER_RE.finditer(text or ""):
        add("law_number", m.group(0), m)
    for m in ARTICLE_RE.finditer(text or ""):
        add("article_reference", m.group(0), m, article=m.group(0))
    for m in VERSION_RE.finditer(text or ""):
        add("enforcement_version", m.group(0), m, version=m.group(0))

    deps.sort(key=lambda d: (d["span"][0], d["kind"]))
    return deps


def dependency_readiness(deps: list[dict], completed_ids: set[str]) -> dict:
    """Resolve dependencies; unresolvable ones are reported, never assumed."""
    ready, unresolved = [], []
    for dep in deps or []:
        rid = dep.get("resolved_law_id", "")
        if rid and rid in completed_ids:
            ready.append(dep)
        elif dep.get("kind") == "law_id_15" and rid:
            unresolved.append({"dependency": dep, "reason": "dependency_not_proved"})
        else:
            unresolved.append({"dependency": dep, "reason": "requires_source_resolution"})
    return {"ready": ready, "unresolved": unresolved,
            "satisfied": bool(deps) and not unresolved,
            "bare_id_only": bool(deps) and all(d.get("kind") == "law_id_15" for d in deps)}


# --------------------------------------------------------------------------
# §1.4 / §1.5 / §1.7 — durable evidence-based state
# --------------------------------------------------------------------------
def _read_json(path: Path, default: dict) -> dict:
    if not path.exists():
        return default
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
        return data if isinstance(data, dict) else default
    except (ValueError, OSError):
        return default


def load_state(path: Path = STATE_PATH) -> dict:
    state = _read_json(path, {})
    state.setdefault("schema", "task-state-v1")
    state.setdefault("units", {})
    return state


def save_state(state: dict, path: Path = STATE_PATH) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(state, ensure_ascii=False, indent=2, sort_keys=True),
                    encoding="utf-8")


def load_evidence(path: Path = EVIDENCE_PATH) -> dict:
    evidence = _read_json(path, {})
    evidence.setdefault("schema", "verification-evidence-v1")
    evidence.setdefault("units", {})
    return evidence


def save_evidence(evidence: dict, path: Path = EVIDENCE_PATH) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(evidence, ensure_ascii=False, indent=2, sort_keys=True),
                    encoding="utf-8")


def default_unit_state() -> dict:
    return {
        "status": NOT_STARTED,
        "owner_agent": "",
        "blockers": [],
        "artifacts": [],
        "attempts": [],
        "review_evidence": [],
        "legal_review": LEGAL_REVIEW_PENDING,
        "notes": "",
        "updated_at": "",
    }


def merge_state(state: dict, generated_units: list[dict]) -> dict:
    """Keep durable fields for live units; move vanished units to stale_units.

    Regeneration never resets an owner, blocker, artifact, attempt, review or
    status override (§1.7).
    """
    live = state.setdefault("units", {})
    fresh = {u["norm_id"] for u in generated_units}
    stale = state.setdefault("stale_units", {})
    for uid in list(live):
        if uid not in fresh:
            stale[uid] = live.pop(uid)
            stale[uid]["status"] = STALE
    for unit in generated_units:
        uid = unit["norm_id"]
        if uid not in live:
            entry = default_unit_state()
            entry["updated_at"] = now()
            live[uid] = entry
        else:
            for key, value in default_unit_state().items():
                live[uid].setdefault(key, value)
    state["schema"] = "task-state-v1"
    return state


def record_evidence(evidence: dict, norm_id: str, axis: str, *,
                    evidence_ref: str, attestation: str = "") -> dict:
    """Record one evidence item.  A reference alone is NOT a proof."""
    if axis not in MECHANICAL_AXES:
        raise ValueError(f"unknown evidence axis: {axis}")
    units = evidence.setdefault("units", {})
    entry = units.setdefault(norm_id, {})
    entry[axis] = {
        "recorded_at": now(),
        "evidence_ref": evidence_ref,
        "attestation": attestation,
        "reviewed": False,
    }
    evidence["schema"] = "verification-evidence-v1"
    return evidence


def validate_status(unit: dict, state: dict, evidence: dict) -> dict:
    """Check a claimed status against evidence; return a verdict with reasons."""
    uid = unit["norm_id"]
    claimed = state.get("units", {}).get(uid, {}).get("status", NOT_STARTED)
    derived = derive_status(unit, state, evidence)
    if claimed == derived["status"]:
        return {"valid": True, "claimed": claimed, "derived": derived}
    return {
        "valid": False,
        "claimed": claimed,
        "derived": derived,
        "reasons": ["status not supported by recorded evidence; downgraded"],
    }


def derive_status(unit: dict, state: dict, evidence: dict) -> dict:
    """Derive status from recorded evidence ONLY (Directive §1.4).

    No numeric match, file existence check or theorem-name string is an input.
    """
    uid = unit["norm_id"]
    stored = state.get("units", {}).get(uid, {})
    if stored.get("blockers"):
        return {"status": BLOCKED, "reasons": ["explicit blocker recorded"],
                "axes": {}, "missing": []}

    axes = evidence.get("units", {}).get(uid, {})
    recorded = {axis: bool(axes.get(axis, {}).get("evidence_ref"))
                for axis in MECHANICAL_AXES}
    required = [a for a in MECHANICAL_AXES if a not in CONDITIONAL_AXES
                or unit.get("dependencies")]
    missing = [a for a in required if not recorded.get(a)]
    unresolved = list(unit.get("unresolved_conditions", []))

    if unresolved:
        return {"status": PARTIAL if any(recorded.values()) else NOT_STARTED,
                "reasons": ["unhandled conditions remain"] + unresolved[:5],
                "axes": recorded, "missing": missing + ["UNHANDLED_CONDITIONS_RESOLVED"]}

    if not missing:
        return {"status": FULLY_VERIFIED, "reasons": ["all required evidence recorded"],
                "axes": recorded, "missing": []}

    proofish = ("KERNEL_PROOF", "INDEPENDENT_SPEC", "IMPLEMENTATION", "TEST")
    if all(recorded.get(a) for a in proofish):
        return {"status": PROVED_SCOPE,
                "reasons": ["proof scope recorded; remaining evidence pending"],
                "axes": recorded, "missing": missing}

    if any(recorded.values()):
        return {"status": PARTIAL, "reasons": ["partial evidence recorded"],
                "axes": recorded, "missing": missing}
    return {"status": NOT_STARTED, "reasons": ["no evidence recorded"],
            "axes": recorded, "missing": missing}


def completion_claim(units: list[dict], state: dict, evidence: dict) -> dict:
    """Aggregate measured completion state without over-claiming."""
    counts = {s: 0 for s in STATUSES}
    for unit in units:
        status = derive_status(unit, state, evidence)["status"]
        counts[status] = counts.get(status, 0) + 1
    return {
        "counts": counts,
        "total": len(units),
        "fully_verified": counts[FULLY_VERIFIED],
        "legal_review_pending": sum(
            1 for u in units
            if state.get("units", {}).get(u["norm_id"], {}).get("legal_review")
            == LEGAL_REVIEW_PENDING),
        "claim": "counts from recorded evidence only; no global completion asserted",
    }


def clean_proof(text: str) -> bool:
    text = re.sub(r"/-.*?-/", "", text or "", flags=re.S)
    text = re.sub(r"--[^\n]*", "", text)
    return not FORBIDDEN_PROOF.search(text)
