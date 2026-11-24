#!/usr/bin/env python3
"""Per-unit Directive axis ledger — eight separately tracked obligations.

The old `52/52 COMPLETE / FULLY_VERIFIED` headline conflated file existence,
theorem names and kernel proof with the whole meaning of a statute. This tool
records, for every normative unit, EIGHT INDEPENDENT axes plus a separate human
legal-review axis:

  1. SOURCE_ACQUIRED          pinned original bytes exist and hash is recorded
  2. VERSION_PINNED           law id + history/revision + enforcement date fixed
  3. STRUCTURE_IDENTIFIED     article / paragraph / item / sub-item / table cell
  4. NORM_DECOMPOSED          normative content split into units (not structure)
  5. NORMS_FORMALIZED         conditions / exceptions / effects have an
                              independent spec and an implementation
  6. SPEC_IMPL_CORRESPONDENCE independent spec bridged to implementation by a
                              kernel-attested proof
  7. BOUNDARY_CHECKED         boundaries / conflicts / undefined states checked
  8. SOURCE_AUDITED           independent correspondence audit of the pinned
                              article/cell (never a whole-text needle match)
  + HUMAN_LEGAL_REVIEW        human decision; NEVER auto-satisfied by the above

A unit's `scope_kind` is either FULL_ARTICLE or COMPUTABLE_SLICE_ONLY. A slice
can reach FULLY_VERIFIED while the article remains incomplete; the ledger says
so explicitly instead of hiding it behind a single status word.

Derivation is deliberately conservative: an axis is advanced only by a
substantive reference already present in the committed evidence ledger. A
missing reference is recorded as such, never inferred from a theorem name.

Regenerate with `python scripts/ci/directive_axes.py`; deterministic gate.
"""
from __future__ import annotations

import hashlib
import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))
import normative_core as core  # noqa: E402

REPO = Path(__file__).resolve().parents[2]
EVIDENCE = REPO / "data" / "verification_evidence.json"
STATE = REPO / "data" / "task_state.json"
QUEUE = REPO / "build" / "task_queue.json"
QUEUE_DOC = REPO / "docs" / "TASK_QUEUE.md"
OUT_JSON = REPO / "data" / "DIRECTIVE_AXES.json"
OUT_MD = REPO / "docs" / "DIRECTIVE_AXES.md"

# Ordered exactly as the sponsor directive §2 lists them.
AXES = (
    "SOURCE_ACQUIRED",
    "VERSION_PINNED",
    "STRUCTURE_IDENTIFIED",
    "NORM_DECOMPOSED",
    "NORMS_FORMALIZED",
    "SPEC_IMPL_CORRESPONDENCE",
    "BOUNDARY_CHECKED",
    "SOURCE_AUDITED",
)
DEFAULTS = {a: "NOT_STARTED" for a in AXES}
# Only these terminal values count as achieved. Failure states (missing pin,
# hash mismatch, unhandled conditions, article-only identification) are never
# silently rounded up to "achieved".
ACHIEVED = {
    "SOURCE_ACQUIRED": "PINNED",
    "VERSION_PINNED": "PINNED",
    "STRUCTURE_IDENTIFIED": "IDENTIFIED",
    "NORM_DECOMPOSED": "DECOMPOSED",
    "NORMS_FORMALIZED": "SCOPE_FORMALIZED",
    "SPEC_IMPL_CORRESPONDENCE": "KERNEL_BRIDGED",
    "BOUNDARY_CHECKED": "CHECKED",
    "SOURCE_AUDITED": "AUDITED",
}
# Directive §4: unhandled parts must be recorded BY CATEGORY, not merged into
# one generic "unhandled conditions" blob.
NORM_DETAIL_KEYS = ("conditions", "exceptions", "effects", "delegations",
                   "periods", "amounts", "rounding", "enforcement_dates")
ROUNDING_MARKERS = ("端数", "切捨", "切上げ", "切り上げ", "四捨五入", "未満の端数")
PERIOD_MARKERS = ("期間", "年月", "日以内", "月以内", "年以内", "経過", "施行日")
AMOUNT_RE = re.compile(r"[0-9０-９〇一二三四五六七八九十百千万億]{1,20}円")
HUMAN_REVIEW_DEFAULT = "LEGAL_REVIEW_PENDING"
LEGAL_REVIEW_RE = re.compile(r"LEGAL_REVIEW_(?:PENDING|APPROVED|REJECTED)|REVIEWED_BY_\S+")
REVISION_RE = re.compile(r"enforced revision=([0-9A-Za-z_]+)")
RAW_RE = re.compile(r"(data/raw/[0-9A-Za-z_]+\.law\.json)")
PIN_HASH_RE = re.compile(r"sha256=([0-9a-fA-F]{64})")
SCOPE_VALUES = ("FULL_ARTICLE", "COMPUTABLE_SLICE_ONLY")


def _read_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8")) if path.exists() else {}


def queue_doc_counts() -> dict:
    """Use the COMMITTED queue document for totals (CI-stable)."""
    text = QUEUE_DOC.read_text(encoding="utf-8") if QUEUE_DOC.exists() else ""
    m = re.search(r"normative units:\s*(\d+)", text)
    total = int(m.group(1)) if m else 0
    statuses = dict(re.findall(
        r"^\|\s*(NOT_STARTED|PARTIAL|PROVED_SCOPE|FULLY_VERIFIED|BLOCKED)\s*\|\s*(\d+)\s*\|",
        text, re.M))
    return {"total": total, "statuses": {k: int(v) for k, v in statuses.items()}}


def queue_units() -> dict:
    """Optional generated projection: coordinates/scope for known units only.

    The build file is git-ignored, so this enrichment is never the source of a
    completion claim; the committed evidence ledger is. Absence of the file
    yields UNKNOWN coordinates and COMPUTABLE_SLICE_ONLY (the conservative
    default) rather than a guessed FULL_ARTICLE claim.
    """
    if not QUEUE.exists():
        return {}
    data = _read_json(QUEUE)
    out = {}
    for t in data.get("tasks", []):
        uid = t.get("id") or t.get("normative_id")
        if not uid:
            continue
        out[uid] = t
    return out


def _has(value) -> bool:
    """Substantive evidence only; template tokens such as __SPEC__ are absent."""
    if not isinstance(value, str) or not value.strip():
        return False
    return not re.fullmatch(r"__[A-Z][A-Z0-9_]*__", value.strip())


def norm_details(task: dict | None) -> dict:
    """Categorised normative facts from the pinned unit text (never a claim)."""
    text = str((task or {}).get("text") or "")
    out = {k: [] for k in NORM_DETAIL_KEYS}
    if not text:
        return out
    marker_map = {
        "conditions": core.MARKERS["CONDITION"],
        "exceptions": core.MARKERS["EXCEPTION"],
        "effects": core.MARKERS["EFFECT"],
        "delegations": core.MARKERS["DELEGATION"],
    }
    for key, markers in marker_map.items():
        for m in markers:
            if m in text:
                out[key].append(m)
    for key, markers in (("periods", PERIOD_MARKERS), ("rounding", ROUNDING_MARKERS)):
        for m in markers:
            if m in text:
                out[key].append(m)
    out["amounts"] = sorted(set(AMOUNT_RE.findall(text)))
    out["enforcement_dates"] = sorted(set(core.DATE_RE.findall(text)))
    return {k: v[:16] for k, v in out.items()}


def axis_states(uid: str, ev: dict, task: dict | None, state_unit: dict) -> dict:
    """Derive eight axes; the human axis is handled separately and never here."""
    axes = dict(DEFAULTS)
    task = task or {}

    raw = RAW_RE.search(ev.get("source_location", ""))
    if _has(ev.get("source_location")) and raw:
        raw_path = REPO / raw.group(1)
        pin_hash = PIN_HASH_RE.search(ev.get("source_location", ""))
        if not raw_path.exists():
            axes["SOURCE_ACQUIRED"] = "PIN_FILE_MISSING"
        elif not pin_hash:
            axes["SOURCE_ACQUIRED"] = "PIN_HASH_MISSING"
        else:
            digest = hashlib.sha256(raw_path.read_bytes().replace(b"\r\n", b"\n")).hexdigest()
            axes["SOURCE_ACQUIRED"] = ("PINNED" if digest == pin_hash.group(1).lower()
                                       else "PIN_HASH_MISMATCH")

    revision = REVISION_RE.search(ev.get("cross_law_proof", ""))
    if revision or task.get("revision"):
        axes["VERSION_PINNED"] = "PINNED"

    coords = [task.get(k) for k in ("paragraph", "item", "subitem", "row", "cell")]
    if task.get("article") and any(c not in (None, "") for c in coords):
        axes["STRUCTURE_IDENTIFIED"] = "IDENTIFIED"
    elif task.get("article"):
        axes["STRUCTURE_IDENTIFIED"] = "ARTICLE_ONLY"

    decomposition = ev.get("decomposition_audit", "")
    kind = str(task.get("kind") or "")
    if _has(decomposition) and kind not in ("STRUCTURE", "UNRESOLVED", ""):
        axes["NORM_DECOMPOSED"] = "DECOMPOSED"

    if _has(ev.get("independent_spec")) and _has(ev.get("implementation")):
        axes["NORMS_FORMALIZED"] = "SCOPE_FORMALIZED"

    if all(_has(ev.get(k)) for k in
           ("kernel_proof", "proof_scope", "independent_spec", "implementation")):
        axes["SPEC_IMPL_CORRESPONDENCE"] = "KERNEL_BRIDGED"

    unhandled = list(state_unit.get("unhandled_conditions") or task.get("unhandled_conditions") or [])
    if (_has(ev.get("boundary_proof")) and _has(ev.get("cross_law_proof"))
            and not unhandled):
        axes["BOUNDARY_CHECKED"] = "CHECKED"
    elif unhandled:
        axes["BOUNDARY_CHECKED"] = "UNHANDLED_CONDITIONS"

    if _has(ev.get("source_correspondence_audit")) and _has(ev.get("adversarial_review")):
        axes["SOURCE_AUDITED"] = "AUDITED"
    return axes


def scope_kind_for(task: dict | None) -> str:
    """Conservative FULL_ARTICLE claim: exact reconstruction AND no coordinates."""
    task = task or {}
    scope = str(task.get("scope") or "")
    coordinates = [task.get(k) for k in ("paragraph", "item", "subitem", "row", "cell")]
    whole = (scope == "FULL_ARTICLE"
             and not any(c not in (None, "") for c in coordinates)
             and not task.get("table")
             and task.get("provision", "MAIN") == "MAIN")
    return "FULL_ARTICLE" if whole else "COMPUTABLE_SLICE_ONLY"


def build() -> dict:
    evidence = _read_json(EVIDENCE).get("units", {})
    state = _read_json(STATE).get("units", {})
    tasks = queue_units()
    counts = queue_doc_counts()

    records = {}
    for uid in sorted(evidence):
        ev = evidence[uid] or {}
        task = tasks.get(uid)
        state_unit = state.get(uid, {})
        review = str(state_unit.get("legal_review") or HUMAN_REVIEW_DEFAULT)
        if not LEGAL_REVIEW_RE.fullmatch(review):
            review = HUMAN_REVIEW_DEFAULT
        scope = scope_kind_for(task)
        records[uid] = {
            "law_id": (task or {}).get("law_id", ""),
            "article": (task or {}).get("article", ""),
            "revision": (task or {}).get("revision", ""),
            "technical_status": state_unit.get("status", "NOT_STARTED"),
            "scope_kind": scope,
            "axes": axis_states(uid, ev, task, state_unit),
            "norm_details": norm_details(task),
            "unhandled_conditions": list(state_unit.get("unhandled_conditions") or []),
            "human_legal_review": review,
        }

    axis_totals = {}
    for axis in AXES:
        achieved = sum(1 for r in records.values()
                       if r["axes"][axis] == ACHIEVED[axis])
        axis_totals[axis] = {
            "achieved_units": achieved,
            "remaining_units": counts["total"] - achieved,
            "achieved_is_not_completion": True,
        }

    return {
        "schema": "directive_axes/v1",
        "tool": "scripts/ci/directive_axes.py",
        "note": (
            "Eight technical axes are tracked separately; full technical evidence "
            "does NOT establish human legal review or whole-article coverage. "
            "COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms."
        ),
        "axes": list(AXES),
        "human_review_axis": HUMAN_REVIEW_DEFAULT,
        "human_review_is_never_auto_satisfied": True,
        "units_total": counts["total"],
        "technical_status_counts": counts["statuses"],
        "axis_totals": axis_totals,
        "scope_counts": {
            "FULL_ARTICLE": sum(1 for r in records.values() if r["scope_kind"] == "FULL_ARTICLE"),
            "COMPUTABLE_SLICE_ONLY": sum(
                1 for r in records.values() if r["scope_kind"] == "COMPUTABLE_SLICE_ONLY"),
        },
        "legal_review_counts": {
            HUMAN_REVIEW_DEFAULT: counts["total"]
            - sum(1 for r in records.values()
                  if r["human_legal_review"] != HUMAN_REVIEW_DEFAULT),
        },
        "norm_detail_categories": list(NORM_DETAIL_KEYS),
        "norm_detail_counts": {
            k: sum(1 for r in records.values() if r["norm_details"][k])
            for k in NORM_DETAIL_KEYS
        },
        "detail_units": records,
        "detail_note": (
            "Only units with substantive committed evidence are expanded; all other "
            "units take the NOT_STARTED / LEGAL_REVIEW_PENDING defaults, reproducible "
            "by regenerating build/task_queue.json with scripts/ci/task_queue.py."
        ),
    }


def render(data: dict) -> str:
    lines = [
        "# Directive §2 — separately tracked verification axes (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.",
        "",
        data["note"],
        "",
        f"- normative units: {data['units_total']}",
        f"- expanded units (with committed evidence): {len(data['detail_units'])}",
        f"- independent human legal review axis: `{data['human_review_axis']}` "
        "(never auto-satisfied)",
        "",
        "| axis | achieved units | remaining units |",
        "|---|---:|---:|",
    ]
    for axis in AXES:
        t = data["axis_totals"][axis]
        lines.append(f"| {axis} | {t['achieved_units']} | {t['remaining_units']} |")
    lines += [
        "",
        "## Normative detail categories recorded separately",
        "",
        "Conditions, exceptions, effects, delegations, periods, amounts,",
        "rounding and enforcement dates are recorded in independent fields",
        "(data/DIRECTIVE_AXES.json), never merged into one generic blob.",
        "",
    ]
    for k in NORM_DETAIL_KEYS:
        lines.append(f"- {k}: {data['norm_detail_counts'][k]} units")
    lines += [
        "",
        "## Reading this ledger",
        "",
        "A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all "
        "eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` "
        "model of a single clause. That is NOT a whole-article or whole-law claim.",
        "",
        "Human legal review is a distinct axis. Technical proof, kernel attestation and "
        "mechanical source re-extraction cannot advance it; only a recorded human "
        "decision can.",
        "",
        "Detailed per-unit rows (law id, revision, article, coordinates, scope kind and "
        "all nine states) are in `data/DIRECTIVE_AXES.json`.",
        "",
    ]
    return "\n".join(lines)


def main() -> int:
    data = build()
    text = render(data)
    blob = json.dumps(data, ensure_ascii=False, indent=2, sort_keys=True) + "\n"
    changed = False
    for path, content in ((OUT_JSON, blob), (OUT_MD, text)):
        if not path.exists() or path.read_text(encoding="utf-8") != content:
            path.write_text(content, encoding="utf-8")
            changed = True
    if changed:
        print("wrote", OUT_JSON, "and", OUT_MD)
        return 1
    print("directive axis ledger matches committed state (deterministic)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
