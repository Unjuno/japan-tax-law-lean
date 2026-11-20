#!/usr/bin/env python3
"""Norm identity, decomposition, dependency and persistence primitives.

Shared by scripts/ci/task_queue.py, scripts/ci/task_selector.py,
scripts/ci/article_obligations.py and
scripts/law_audit/phase_e/article_scope.py.

Why this module exists (Objective §1):

  1. A norm identifier must be collision-free across law id, revision id,
     main/supplementary/appendix provenance, article / paragraph / item /
     subitem, appendix-table cell and norm-unit index. A short hash of only
     ``law|revision|article`` (the previous scheme) cannot distinguish two
     paragraphs of the same article or two cells of the same table.
  2. A provision must be decomposed into normative units (conditions, legal
     effects, exceptions, deeming, presumptions, delegations, reading
     substitutions, references). Text that cannot be decomposed is recorded
     as UNRESOLVED, never silently dropped.
  3. Decomposition coverage must be audited independently: the units must
     partition the original text exactly (offsets + join + hash).
  4. Dependencies must be parsed from law names, article numbers and
     enforcement versions as well as bare 15-digit identifiers.
  5. Task state must survive regeneration: an explicit overlay keyed by norm
     id is merged into freshly generated units, never overwritten.

This module never marks anything COMPLETE. It only records identity, scope,
dependencies and evidence. Status derivation is deliberately conservative.
"""
from __future__ import annotations

import hashlib
import json
import re
import time
from typing import Any

SCHEMA_VERSION = "norm-id/2"
STATE_SCHEMA = "norm-state/2"

# ---------------------------------------------------------------------------
# Status vocabulary (Objective §1 — distinct states, not booleans)
# ---------------------------------------------------------------------------
NOT_STARTED = "NOT_STARTED"
PARTIAL = "PARTIAL"
PROVED_SCOPE = "PROVED_SCOPE"
FULLY_VERIFIED = "FULLY_VERIFIED"
BLOCKED = "BLOCKED"
STATUS_ORDER = [NOT_STARTED, PARTIAL, PROVED_SCOPE, FULLY_VERIFIED, BLOCKED]

# ---------------------------------------------------------------------------
# Norm-unit kinds (Objective §1.2)
# ---------------------------------------------------------------------------
CONDITION = "APPLICATION_CONDITION"
EFFECT = "LEGAL_EFFECT"
EXCEPTION = "EXCEPTION"
DEEMING = "DEEMING"
PRESUMPTION = "PRESUMPTION"
DELEGATION = "DELEGATION"
READING_SUBSTITUTION = "READING_SUBSTITUTION"
REFERENCE = "REFERENCE"
UNRESOLVED = "UNRESOLVED_NORM"

# Priority order matters: an exception clause inside a conditional sentence is
# classified as an exception, not as a condition.
_MARKERS = [
    (EXCEPTION, re.compile(r"(?:ただし|但し|を除き|を除く|にかかわらず|この限りではない)")),
    (READING_SUBSTITUTION, re.compile(r"(?:読み替え|読み替えて|と読み替える)")),
    (DEEMING, re.compile(r"(?:みなす|みなし|見なす|とみなす)")),
    (PRESUMPTION, re.compile(r"(?:推定し|推定する|推定される)")),
    (DELEGATION, re.compile(r"(?:政令で定める|省令で定める|内閣府令で定める|税務署長が定める|の定めるところにより|の定めるところに従い)")),
    (REFERENCE, re.compile(r"(?:準用する|この法律|同条|前条|本条|の規定による|に規定する|に定めるところ)")),
    (CONDITION, re.compile(r"(?:する場合|である場合|あるとき|したとき|するとき|限り|につき|においては|にあっては|に際し|に伴い)")),
    (EFFECT, re.compile(r"(?:しなければならない|するものとする|とする|を徴収する|を課する|を適用する|を控除する|を加算する|を免除する|を還付する)")),
]

_KANJI_NUM = r"[〇零一二三四五六七八九十百千萬]+"
_ARTICLE_RE = re.compile(r"第" + _KANJI_NUM + r"条(?:の" + _KANJI_NUM + r")?")
_DATE_RE = re.compile(
    r"(?:令和|平成|昭和|大正|明治)" + _KANJI_NUM + r"年" + _KANJI_NUM + r"月" + _KANJI_NUM + r"日"
)
_SENTENCE_END = "。"

# Obligations tracked per norm unit. Legal review is a separate axis and is
# never satisfied by a mechanical check.
TECHNICAL_OBLIGATIONS = [
    "source_locator_fixed",
    "structure_identified",
    "norm_decomposed",
    "coverage_audited",
    "fidelity_pinned_needle",
    "independent_spec",
    "implementation_linked",
    "proof_obligations_defined",
    "kernel_proof_checked",
    "boundary_tests_recorded",
    "adversarial_audit_recorded",
    "unhandled_conditions_disclosed",
]
LEGAL_REVIEW_OBLIGATION = "legal_review"
ALL_OBLIGATIONS = TECHNICAL_OBLIGATIONS + [LEGAL_REVIEW_OBLIGATION]

SATISFIED = "SATISFIED"
UNSATISFIED = "UNSATISFIED"
SKIPPED = "SKIPPED"
PENDING_HUMAN = "PENDING_HUMAN"

# Evidence fields preserved across regeneration.
_PRESERVED_FIELDS = (
    "status", "evidence", "owner", "branch", "pr", "blocker",
    "artifacts", "history", "updated_at", "coverage_evidence",
)


# ---------------------------------------------------------------------------
# Basic helpers
# ---------------------------------------------------------------------------
def norm(text: str) -> str:
    """Remove all whitespace (including U+3000); keep punctuation."""
    return re.sub(r"[\s\u3000]+", "", text or "")


def sha256_text(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def evidence(state: str, **detail: Any) -> dict:
    rec = {"state": state}
    rec.update(detail)
    return rec


def make_norm_id(
    *,
    law_id: str,
    revision_id: str,
    provision_kind: str,
    article_no: str,
    paragraph_no: str = "",
    item_no: str = "",
    subitem_no: str = "",
    table_cell: str = "",
    provision_path: str = "",
    unit_index: int = 0,
    kind: str = "",
    text: str = "",
) -> str:
    """Collision-resistant normative identifier.

    The canonical key includes every locality discriminator plus a content
    hash. 96 bits (24 hex chars) are used; a collision is not plausible, and
    changing any source fragment produces a different id.
    """
    key = {
        "schema": SCHEMA_VERSION,
        "law_id": str(law_id),
        "revision_id": str(revision_id),
        "provision_kind": str(provision_kind),
        "article_no": str(article_no),
        "paragraph_no": str(paragraph_no),
        "item_no": str(item_no),
        "subitem_no": str(subitem_no),
        "table_cell": str(table_cell),
        "provision_path": str(provision_path),
        "unit_index": int(unit_index),
        "kind": str(kind),
        "text_sha256": sha256_text(norm(text)),
    }
    canonical = json.dumps(key, ensure_ascii=False, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(canonical.encode("utf-8")).hexdigest()[:24]


# ---------------------------------------------------------------------------
# Decomposition
# ---------------------------------------------------------------------------
def _sentence_spans(text: str):
    spans = []
    start = 0
    for i, ch in enumerate(text):
        if ch == _SENTENCE_END:
            spans.append((start, i + 1))
            start = i + 1
    if start < len(text):
        spans.append((start, len(text)))
    return spans


def _exception_spans(fragment: str, offset: int):
    """Split a sentence at ただし / 但し, preserving absolute offsets."""
    bounds = [m.start() for m in re.finditer(r"ただし|但し", fragment)]
    if not bounds:
        return [(offset, offset + len(fragment))]
    spans = []
    last = offset
    for b in bounds:
        if offset + b > last:
            spans.append((last, offset + b))
        last = offset + b
    if offset + len(fragment) > last:
        spans.append((last, offset + len(fragment)))
    return spans


def classify(fragment: str):
    """Return (primary kind, secondary kinds) for a normative fragment.

    A bare article number is a *weak* reference signal: it must not override a
    stronger effect/exception marker in the same sentence. It is recorded as a
    secondary kind instead.
    """
    hits = [(kind, bool(pat.search(fragment))) for kind, pat in _MARKERS]
    matched = [kind for kind, ok in hits if ok]
    if _ARTICLE_RE.search(fragment) and REFERENCE not in matched:
        matched.append(REFERENCE)  # weak signal, never first
    if not matched:
        return UNRESOLVED, []
    return matched[0], matched[1:]


def decompose(
    provision_text: str,
    *,
    law_id: str,
    revision_id: str,
    provision_kind: str,
    article_no: str,
    paragraph_no: str = "",
    item_no: str = "",
    subitem_no: str = "",
    table_cell: str = "",
    provision_path: str = "",
) -> list:
    """Partition a provision into normative units with exact offsets."""
    text = norm(provision_text)
    spans = []
    for s, e in _sentence_spans(text):
        for a, b in _exception_spans(text[s:e], s):
            if b > a:
                spans.append((a, b))

    units = []
    for idx, (a, b) in enumerate(spans):
        fragment = text[a:b]
        if not fragment:
            continue
        kind, secondary = classify(fragment)
        units.append({
            "norm_id": make_norm_id(
                law_id=law_id,
                revision_id=revision_id,
                provision_kind=provision_kind,
                article_no=article_no,
                paragraph_no=paragraph_no,
                item_no=item_no,
                subitem_no=subitem_no,
                table_cell=table_cell,
                provision_path=provision_path,
                unit_index=idx,
                kind=kind,
                text=fragment,
            ),
            "law_id": law_id,
            "revision_id": revision_id,
            "provision_kind": provision_kind,
            "article_no": article_no,
            "paragraph_no": paragraph_no,
            "item_no": item_no,
            "subitem_no": subitem_no,
            "table_cell": table_cell,
            "provision_path": provision_path,
            "unit_index": idx,
            "kind": kind,
            "secondary_kinds": secondary,
            "text": fragment,
            "char_start": a,
            "char_end": b,
            "source_sha256": sha256_text(fragment),
            "unhandled_conditions": [],
        })
    return units


def verify_coverage(original_text: str, units: list) -> dict:
    """Independently audit that units partition the original text exactly."""
    original = norm(original_text)
    ordered = sorted(units, key=lambda u: (u["char_start"], u["char_end"]))
    problems = []
    pos = 0
    for u in ordered:
        a, b = u["char_start"], u["char_end"]
        if a != pos:
            problems.append("offset gap/overlap: expected %d got %d" % (pos, a))
        if b <= a:
            problems.append("empty span at %d" % a)
        if u["text"] != original[a:b]:
            problems.append("text/offset mismatch at %d-%d" % (a, b))
        pos = b
    if pos != len(original):
        problems.append("tail not covered: %d != %d" % (pos, len(original)))
    rejoined = "".join(u["text"] for u in ordered)
    if rejoined != original:
        problems.append("reconstruction mismatch")
    if sha256_text(rejoined) != sha256_text(original):
        problems.append("reconstruction hash mismatch")
    return {
        "covered": not problems,
        "problems": problems,
        "original_sha256": sha256_text(original),
        "rejoined_sha256": sha256_text(rejoined),
        "original_length": len(original),
        "unit_count": len(ordered),
    }


# ---------------------------------------------------------------------------
# Dependencies (Objective §1.6 — not just 15-digit search)
# ---------------------------------------------------------------------------
def extract_dependencies(text: str, law_index: dict | None = None) -> dict:
    """Parse references from law names, article numbers, versions and ids."""
    t = norm(text)
    index = law_index or {}
    deps = {
        "law_id_15digit": [],        # weak signal only
        "law_id_bound_by_title": [], # law name -> law id
        "law_titles": [],
        "article_numbers": [],
        "enforcement_dates": [],
    }
    deps["law_id_15digit"] = sorted(set(re.findall(r"\d{15}", t)))
    deps["article_numbers"] = sorted(set(m.group(0) for m in _ARTICLE_RE.finditer(t)))
    deps["enforcement_dates"] = sorted(set(m.group(0) for m in _DATE_RE.finditer(t)))
    deps["law_titles"] = sorted(set(title for title in index if title and title in t))
    for title in deps["law_titles"]:
        bound = index.get(title)
        if bound:
            deps["law_id_bound_by_title"].append(bound)
    deps["law_id_bound_by_title"] = sorted(set(deps["law_id_bound_by_title"]))
    deps["resolution_channels"] = sorted(
        ch for ch in (
            "title" if deps["law_id_bound_by_title"] else "",
            "article" if deps["article_numbers"] else "",
            "version" if deps["enforcement_dates"] else "",
            "raw15digit" if deps["law_id_15digit"] else "",
        ) if ch
    )
    return deps


def dependencies_satisfied(unit: dict, status_by_id: dict) -> dict:
    """Check internal dependencies; report unresolved ones explicitly."""
    unresolved = []
    for dep_id in unit.get("dependency_norm_ids", []):
        if status_by_id.get(dep_id) not in (PROVED_SCOPE, FULLY_VERIFIED):
            unresolved.append(dep_id)
    return {"satisfied": not unresolved, "unresolved": unresolved}


# ---------------------------------------------------------------------------
# Durable state overlay (Objective §1.7)
# ---------------------------------------------------------------------------
def default_state() -> dict:
    return {
        "schema": STATE_SCHEMA,
        "records": {},
        "orphaned_norm_ids": [],
        "metadata": {"created_by": "scripts/ci/norm_identity.py"},
    }


def load_state(path) -> dict:
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, ValueError):
        return default_state()
    if not isinstance(data, dict) or data.get("schema") != STATE_SCHEMA:
        return default_state()
    data.setdefault("records", {})
    data.setdefault("orphaned_norm_ids", [])
    data.setdefault("metadata", {})
    return data


def apply_overlay(generated: list, state: dict) -> list:
    """Merge durable overlay into freshly generated units (never overwrite)."""
    overlay = state.get("records", {})
    for unit in generated:
        uid = unit["norm_id"]
        unit.setdefault("history", [])
        old = overlay.get(uid)
        if old and old.get("source_sha256") == unit.get("source_sha256"):
            for field in _PRESERVED_FIELDS:
                if field in old:
                    unit[field] = old[field]
            unit.setdefault("history", []).append({
                "event": "STATE_RESTORED",
                "source_sha256": unit["source_sha256"],
                "time": time.time(),
            })
        elif old:
            # Source changed: previous verification no longer applies.
            unit["status"] = NOT_STARTED
            unit["evidence"] = {}
            unit["blocker"] = "SOURCE_FRAGMENT_CHANGED"
            unit.setdefault("history", []).append({
                "event": "PRIOR_STATE_QUARANTINED",
                "old_source_sha256": old.get("source_sha256"),
                "new_source_sha256": unit.get("source_sha256"),
                "time": time.time(),
            })
        else:
            unit.setdefault("status", NOT_STARTED)
            unit.setdefault("evidence", {})
    return generated


def overlay_from_units(generated: list, state: dict) -> dict:
    """Build the sparse overlay to persist (only non-default records)."""
    records = {}
    for u in generated:
        # Sparse overlay: a unit is persisted only if a human/agent actually
        # changed its state. Empty history is generated for every unit and is
        # therefore NOT a meaningful discriminator.
        meaningful = (
            u.get("status") in (PROVED_SCOPE, FULLY_VERIFIED, BLOCKED)
            or bool(u.get("owner"))
            or bool(u.get("branch"))
            or bool(u.get("pr"))
            or bool(u.get("blocker"))
            or bool(u.get("artifacts"))
            or bool(u.get("evidence"))
        )
        if not meaningful:
            continue
        records[u["norm_id"]] = {
            "source_sha256": u.get("source_sha256"),
            "status": u.get("status", NOT_STARTED),
            "evidence": u.get("evidence", {}),
            "owner": u.get("owner", ""),
            "branch": u.get("branch", ""),
            "pr": u.get("pr", ""),
            "blocker": u.get("blocker", ""),
            "artifacts": u.get("artifacts", {}),
            "history": u.get("history", []),
            "updated_at": u.get("updated_at", ""),
            "law_id": u.get("law_id", ""),
            "article_no": u.get("article_no", ""),
        }
    generated_ids = set(records)
    for oid, old in state.get("records", {}).items():
        if oid not in generated_ids:
            records[oid] = old
    state["records"] = records
    state["orphaned_norm_ids"] = sorted(
        set(state.get("orphaned_norm_ids", []))
        | (set(state.get("records", {})) - {u["norm_id"] for u in generated})
    )
    state["metadata"]["last_regeneration_units"] = len(generated)
    state["metadata"]["last_regeneration_time"] = time.time()
    return state


def save_state(path, state: dict) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(
        json.dumps(state, ensure_ascii=False, separators=(",", ":"), indent=None),
        encoding="utf-8",
    )


# ---------------------------------------------------------------------------
# Status derivation (conservative — never infer completion from file names)
# ---------------------------------------------------------------------------
def derive_status(unit: dict) -> str:
    if unit.get("blocker"):
        return BLOCKED
    ev = unit.get("evidence", {})
    technical_ok = all(
        isinstance(ev.get(k), dict) and ev.get(k, {}).get("state") == SATISFIED
        for k in TECHNICAL_OBLIGATIONS
    )
    review = (ev.get(LEGAL_REVIEW_OBLIGATION) or {}).get("state")
    if technical_ok and review == SATISFIED:
        return FULLY_VERIFIED
    if technical_ok:
        return PROVED_SCOPE
    any_technical = any(
        isinstance(ev.get(k), dict) and ev.get(k, {}).get("state") == SATISFIED
        for k in TECHNICAL_OBLIGATIONS
    )
    return PARTIAL if any_technical else NOT_STARTED
