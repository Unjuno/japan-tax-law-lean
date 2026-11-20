#!/usr/bin/env python3
"""Shared normative-unit model for the Japanese tax-law verification queue.

Single source of truth for the rectification required by Sponsor Directive §1:

  §1.1  collision-free normative identifiers (law / history / provision /
        article-paragraph-item-subitem / appendix-cell + exact source span)
  §1.2  decomposition of an article into normative units
  §1.3  undecidable norms are recorded, never silently dropped
  §1.4  completion is evidence-based; numeric/file/name matches are hints only
  §1.5  every unit carries source position, spec, impl, proof, tests,
        unhandled conditions and review evidence
  §1.6  dependencies parsed from law names, articles and enforcement versions
        (15-digit ids are only ONE of several extractors)
  §1.7  durable ledger with owner / blockers / artifacts / attempts

Imported by the four queue scripts. No Lean dependency; no proof artifacts
are modified.
"""
from __future__ import annotations

import hashlib
import json
import re
from datetime import datetime, timezone
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
INVENTORY = REPO / "data" / "INVENTORY.json"
LEDGER_PATH = REPO / "data" / "verification_ledger.json"
QUEUE_JSON = REPO / "build" / "task_queue.json"
QUEUE_MD = REPO / "docs" / "TASK_QUEUE.md"
AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"

STATUS_NOT_STARTED = "NOT_STARTED"
STATUS_PARTIAL = "PARTIAL"
STATUS_PROVED_SCOPE = "PROVED_SCOPE"
STATUS_FULLY_VERIFIED = "FULLY_VERIFIED"
STATUS_BLOCKED = "BLOCKED"
STATUS_VALUES = (
    STATUS_NOT_STARTED, STATUS_PARTIAL, STATUS_PROVED_SCOPE,
    STATUS_FULLY_VERIFIED, STATUS_BLOCKED,
)
UNRESOLVED = "UNRESOLVED"

AXIS_KEYS = (
    "source_fixed", "structure_identified", "norm_decomposed",
    "formalized", "proved", "boundary_checked", "independent_audit",
)

OBLIGATION_SPECS = (
    ("source_position", "structural path + exact span + pinned source sha256"),
    ("source_correspondence_audit", "Lean-independent check: spec represents the original text"),
    ("independent_spec", "separate Spec module exists and is reviewed"),
    ("implementation", "implementation module exists and is mapped to this unit"),
    ("proof_kernel", "Lean kernel accepts the proof; no forbidden proof markers"),
    ("boundary_conditions", "boundary/period/amount/rounding obligations discharged"),
    ("tests", "regression tests for this unit pass"),
    ("unresolved_conditions", "all unhandled conditions resolved or explicitly scoped"),
    ("adversarial_review", "independent adversarial review recorded"),
)
FORBIDDEN_PROOF = re.compile(r"\b(sorry|admit|axiom|Classical\.choice)\b")


def now() -> str:
    return datetime.now(timezone.utc).replace(microsecond=0).isoformat()


def norm(s: str) -> str:
    return re.sub(r"[\s\u3000]+", "", s or "")


def flat(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat(c) for c in node.get("children", []))
    if isinstance(node, list):
        return "".join(flat(c) for c in node)
    return ""


# --- §1.1 source indexing and collision-free identifiers -------------------

KEEP_TAGS = {
    "MainProvision", "SupplProvision", "AppdxTable", "Appdx",
    "Article", "Paragraph", "Item", "SubItem", "Subitem",
    "TableRow", "TableCell", "Column", "Sentence",
}


def _head(node):
    tag = str(node.get("tag", "")) if isinstance(node, dict) else ""
    attr = node.get("attr") if isinstance(node, dict) else None
    num = str(attr.get("Num", "")) if isinstance(attr, dict) else ""
    return tag, num


def index_document(doc, source_sha256: str = "") -> dict:
    """Return full normalized text plus per-node spans in that text."""
    state = {"pos": 0}
    parts = []
    records = []

    def walk(node, path):
        if isinstance(node, str):
            s = norm(node)
            start = state["pos"]
            state["pos"] += len(s)
            parts.append(s)
            records.append({"kind": "text", "path": path, "start": start,
                            "end": state["pos"], "text": s, "num": ""})
            return s
        if isinstance(node, list):
            return "".join(walk(c, path) for c in node)
        if isinstance(node, dict):
            tag, num = _head(node)
            newpath = path
            if tag in KEEP_TAGS:
                newpath = path + (tag + ((":" + num) if num else ""),)
            start = state["pos"]
            out = "".join(walk(c, newpath) for c in node.get("children", []))
            if tag:
                records.append({"kind": tag, "path": newpath, "start": start,
                                "end": state["pos"], "text": out, "num": num})
            return out
        return ""

    full = walk(doc.get("law_full_text", doc), ())
    return {"full_text": full, "records": records, "source_sha256": source_sha256}


def target_nodes(idx: dict) -> list:
    """Article nodes plus appendix table rows (appendix cells are normative)."""
    return [r for r in idx["records"]
            if r["kind"] in ("Article", "TableRow") and r["end"] > r["start"]]


def provision_class(path) -> str:
    tags = {seg.split(":")[0] for seg in path}
    if "SupplProvision" in tags:
        return "Supplementary"
    if "AppdxTable" in tags or "Appdx" in tags:
        return "AppdxTable"
    if "MainProvision" in tags:
        return "Main"
    return "Unknown"


def make_norm_id(law_id, history_id, provision_key, article_no,
                 unit_index, span, source_sha256) -> str:
    """Full SHA-256 over the complete structural key (no truncation)."""
    key = "|".join(str(x) for x in (
        law_id, history_id, provision_key, article_no, unit_index,
        span[0], span[1], source_sha256,
    ))
    return "norm-" + hashlib.sha256(key.encode("utf-8")).hexdigest()


def make_norm_ref(law_id, history_id, provision_key, article_no, unit_index, kind):
    return "/".join(str(x) for x in (
        law_id, history_id, provision_key, article_no, f"U{unit_index}", kind,
    ))


# --- §1.2 / §1.3 normative decomposition with coverage accounting ----------

KIND_PATTERNS = (
    ("exception", r"(?:ただし|但し|この限り|を除き|を除く)"),
    ("deeming", r"(?:みなす|みなし|みなされ|見なす|見なし)"),
    ("presumption", r"(?:推定)"),
    ("reading_replacement", r"(?:読み替|読替)"),
    ("delegation", r"(?:委任|委ね|政令で定め|省令で定め|命令で定め|規則で定め|"
                   r"国税庁長官|厚生労働省令|財務省令|総務省令)"),
    ("reference", r"(?:準用|引用|適用する|従って|に基づき|により|よれば|の例による)"),
    ("legal_effect", r"(?:課する|課税する|控除する|還付する|加算する|減額する|"
                      r"徴収する|納付する|税率|百分の|千分の|割合|円|とする|定める)"),
    ("application_condition", r"(?:場合|とき|者|に係る|について|に対し|を超え|"
                               r"以下|以上|第[〇零一二三四五六七八九十百0-9]+条)"),
)
COMPILED_PATTERNS = tuple((k, re.compile(p)) for k, p in KIND_PATTERNS)


def split_clauses(text: str) -> list:
    out = []
    i = 0
    for m in re.finditer(r"[。；、]", text):
        seg = text[i:m.end()]
        if norm(seg):
            out.append((i, m.end(), seg))
        i = m.end()
    if i < len(text) and norm(text[i:]):
        out.append((i, len(text), text[i:]))
    return out


def classify(clause: str):
    markers = [k for k, rx in COMPILED_PATTERNS if rx.search(clause)]
    return (markers[0], markers) if markers else (UNRESOLVED, [])


def decompose(text: str) -> list:
    units = []
    for start, end, clause in split_clauses(text):
        kind, markers = classify(clause)
        units.append({
            "span": [start, end], "text": clause.strip(), "kind": kind,
            "marker": markers[0] if markers else "", "markers": markers,
            "confidence": "heuristic_v1", "decomposition_method": "clause_scan_v1",
        })
    return units


def coverage_audit(text: str, units: list) -> dict:
    """Mechanical coverage only — NOT an independent original-text audit."""
    covered = sum(max(0, u["span"][1] - u["span"][0]) for u in units)
    spans = sorted(u["span"] for u in units)
    contiguous = bool(spans) and spans[0][0] == 0 and spans[-1][1] == len(text) and all(
        spans[i][1] == spans[i + 1][0] for i in range(len(spans) - 1)
    )
    return {
        "method": "mechanical_clause_coverage_v1",
        "total_chars": len(text), "covered_chars": covered,
        "uncovered_chars": max(0, len(text) - covered),
        "contiguous": contiguous, "clause_count": len(units),
        "unresolved_count": sum(1 for u in units if u["kind"] == UNRESOLVED),
        "independent_audit": "PENDING",
        "claim": "mechanical coverage only; original-text fidelity is a separate obligation",
    }


# --- §1.6 dependency analysis beyond the 15-digit id -----------------------

ID15_RE = re.compile(r"(?<![0-9A-Z])\d{3}[A-Z]{2}\d{10}(?![0-9A-Z])")
ARTICLE_RE = re.compile(
    r"第[〇零一二三四五六七八九十百千万0-9０-９]+条"
    r"(?:の[〇零一二三四五六七八九十百0-9０-９]+)?"
    r"(?:第[〇零一二三四五六七八九十百0-9０-９]+項)?"
    r"(?:第[〇零一二三四五六七八九十百0-9０-９]+号)?"
)
LAW_NUM_RE = re.compile(r"(?:法律|政令|省令|命令|条例)第[〇零一二三四五六七八九十百千万0-9０-９]+号")
LAW_NAME_RE = re.compile(
    r"[一-龥A-Za-z]{2,28}(?:税法|租税特別措置法|関税法|法律|政令|省令|命令|規則|条例|条約)"
)
VERSION_RE = re.compile(
    r"(?:施行日|施行期日|経過措置|令和[0-9０-９〇一二三四五六七八九十]+年|"
    r"平成[0-9０-９〇一二三四五六七八九十]+年|昭和[0-9０-９〇一二三四五六七八九十]+年)"
)


def law_title_index(inv: dict) -> dict:
    return {norm(l.get("official_title", "")): l.get("law_id", "")
            for l in inv.get("laws", []) if l.get("official_title")}


def analyze_dependencies(text: str, title_index: dict) -> list:
    deps = []

    def add(kind, value, m, resolved="", article="", version=""):
        deps.append({"kind": kind, "value": value, "span": [m.start(), m.end()],
                     "resolved_law_id": resolved, "article": article, "version": version})

    for m in ID15_RE.finditer(text):
        add("law_id_15", m.group(0), m, resolved=m.group(0))
    for m in LAW_NAME_RE.finditer(text):
        add("law_name", m.group(0), m, resolved=title_index.get(norm(m.group(0)), ""))
    for m in LAW_NUM_RE.finditer(text):
        add("law_number", m.group(0), m)
    for m in ARTICLE_RE.finditer(text):
        add("article_reference", m.group(0), m, article=m.group(0))
    for m in VERSION_RE.finditer(text):
        add("enforcement_version", m.group(0), m, version=m.group(0))
    deps.sort(key=lambda d: (d["span"][0], d["kind"]))
    return deps


# --- §1.4 / §1.5 / §1.7 durable ledger and evidence-based status -----------

def default_axes(source_fixed=True, structure_identified=True) -> dict:
    axes = {k: False for k in AXIS_KEYS}
    axes["source_fixed"] = bool(source_fixed)
    axes["structure_identified"] = bool(structure_identified)
    axes["legal_review"] = "LEGAL_REVIEW_PENDING"
    return axes


def default_obligations() -> list:
    return [{"id": oid, "requirement": req, "satisfied": False,
             "evidence": [], "sufficient_alone": False}
            for oid, req in OBLIGATION_SPECS]


def derive_status(unit: dict) -> str:
    """Derive status from recorded evidence only (§1.4)."""
    if unit.get("blockers"):
        return STATUS_BLOCKED
    axes = unit.get("axes", {})
    technical = [axes.get(k) is True for k in AXIS_KEYS]
    evidence_axes = ("norm_decomposed", "formalized", "proved",
                     "boundary_checked", "independent_audit")
    if all(technical) and unit.get("unresolved_count", 0) == 0:
        return STATUS_FULLY_VERIFIED
    if axes.get("proved") is True:
        return STATUS_PROVED_SCOPE
    # Structural facts (source_fixed / structure_identified) are pre-filled by
    # the generator and must NOT make an untouched unit PARTIAL (§1.4).
    if (any(axes.get(k) is True for k in evidence_axes)
            or any(o.get("satisfied") for o in unit.get("obligations", []))):
        return STATUS_PARTIAL
    return STATUS_NOT_STARTED


def merge_obligations(old: list, new: list) -> list:
    by_id = {o.get("id"): o for o in old}
    out = []
    for o in new:
        prev = by_id.get(o.get("id"), {})
        merged = dict(o)
        merged["satisfied"] = bool(prev.get("satisfied", False))
        merged["evidence"] = list(prev.get("evidence", []))
        out.append(merged)
    return out


PRESERVED_FIELDS = (
    "status", "axes", "owner", "blockers", "artifacts", "attempts",
    "review_evidence", "updated_at", "legal_review_note", "notes",
)


class Ledger:
    def __init__(self, path=LEDGER_PATH):
        self.path = Path(path)

    def load(self) -> dict:
        if self.path.exists():
            try:
                data = json.loads(self.path.read_text(encoding="utf-8"))
                if data.get("schema_version") == 2 and isinstance(data.get("units"), dict):
                    return data
            except (ValueError, OSError):
                pass
        return {"schema_version": 2, "tool": "norm_core.Ledger",
                "created_at": now(), "units": {}, "runs": []}

    @staticmethod
    def fresh_unit(unit: dict) -> dict:
        u = dict(unit)
        u["status"] = STATUS_NOT_STARTED
        u["axes"] = default_axes(unit.get("source_fixed", True),
                                 unit.get("structure_identified", True))
        u["obligations"] = default_obligations()
        u["owner"] = None
        u["blockers"] = []
        u["artifacts"] = {}
        u["attempts"] = []
        u["review_evidence"] = []
        u["unhandled_conditions"] = list(unit.get("unhandled_conditions", []))
        u["unresolved_count"] = len(u["unhandled_conditions"])
        u["updated_at"] = now()
        return u

    def upsert(self, ledger: dict, unit: dict) -> dict:
        units = ledger.setdefault("units", {})
        nid = unit["norm_id"]
        existing = units.get(nid)
        if existing is None:
            units[nid] = self.fresh_unit(unit)
            return units[nid]
        merged = dict(unit)
        for key in PRESERVED_FIELDS:
            if key in existing:
                merged[key] = existing[key]
        merged["obligations"] = merge_obligations(
            existing.get("obligations", []), unit.get("obligations", default_obligations()))
        merged["unhandled_conditions"] = list(unit.get("unhandled_conditions", []))
        merged["unresolved_count"] = len(merged["unhandled_conditions"])
        units[nid] = merged
        return merged

    def record_run(self, ledger: dict, tool: str, summary: dict) -> None:
        ledger.setdefault("runs", []).append({"at": now(), "tool": tool, "summary": summary})
        ledger["runs"] = ledger["runs"][-200:]

    def save(self, ledger: dict) -> None:
        self.path.parent.mkdir(parents=True, exist_ok=True)
        self.path.write_text(json.dumps(ledger, ensure_ascii=False, indent=2, sort_keys=True),
                             encoding="utf-8")

    @staticmethod
    def stats(ledger: dict) -> dict:
        out = {s: 0 for s in STATUS_VALUES}
        for u in ledger.get("units", {}).values():
            st = u.get("status", STATUS_NOT_STARTED)
            out[st] = out.get(st, 0) + 1
        out["total"] = len(ledger.get("units", {}))
        out["legal_review_pending"] = sum(
            1 for u in ledger.get("units", {}).values()
            if u.get("axes", {}).get("legal_review") == "LEGAL_REVIEW_PENDING")
        return out


def strip_comments(text: str) -> str:
    text = re.sub(r"/-.*?-/", "", text, flags=re.S)
    return re.sub(r"--[^\n]*", "", text)


def clean_proof(text: str) -> bool:
    return not FORBIDDEN_PROOF.search(strip_comments(text))


def load_audit_checks() -> list:
    import importlib.util
    spec = importlib.util.spec_from_file_location("nc_ta", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return list(mod.checks())
