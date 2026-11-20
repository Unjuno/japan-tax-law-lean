#!/usr/bin/env python3
"""Single source of truth for Directive §1 (queue + completion gate).

This module is stdlib-only, clock-free and I/O-free at import time.  It is
imported by task_queue.py, task_selector.py, article_obligations.py and
article_scope.py so that the four artifacts cannot drift apart.

It enforces:

  §1.1  collision-free IDs from law id, revision/history id, provision kind,
        article/paragraph/item/sub-item/table-cell coordinates, unit ordinal,
        norm kind and the exact source text (full SHA-256, length-prefixed join).
  §1.2  article decomposition into normative units with all markers recorded.
  §1.3  undecidable fragments are recorded as UNRESOLVED, never dropped.
  §1.4  completion derives from evidence; numeric/file/name matches are hints.
  §1.5  each unit carries source position, spec/impl/proof/test links, unhandled
        conditions and review evidence.
  §1.6  dependencies use law name + article + enforcement version; a bare
        15-character law id (e.g. 340AC0000000033) is underdetermined only.
  §1.7  durable state with owner / blockers / artifacts / history, merged on
        regeneration without losing manual work.

SKIP is never PASS.  A scoped proof is never an article proof.  A theorem-name
match is never a kernel proof.  Human legal review is a separate axis.
"""
from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path
from typing import Any, Iterator

REPO = Path(__file__).resolve().parents[2]
# Shared path constants consumed by task_queue / task_selector /
# article_obligations / article_scope.  Keeping them here gives the four
# completion tools a single source of truth (an absent constant previously
# made all four crash at import time).
INVENTORY = REPO / "data" / "INVENTORY.json"
STATE_PATH = REPO / "data" / "task_state.json"

STATUS_NOT_STARTED = "NOT_STARTED"
STATUS_PARTIAL = "PARTIAL"
STATUS_PROVED_SCOPE = "PROVED_SCOPE"
STATUS_FULLY_VERIFIED = "FULLY_VERIFIED"
STATUS_BLOCKED = "BLOCKED"
STATUS_VALUES = (
    STATUS_NOT_STARTED,
    STATUS_PARTIAL,
    STATUS_PROVED_SCOPE,
    STATUS_FULLY_VERIFIED,
    STATUS_BLOCKED,
)

UNRESOLVED = "UNRESOLVED"
LEGAL_REVIEW_PENDING = "LEGAL_REVIEW_PENDING"

WS_RE = re.compile(r"[\s\u3000]+")
# e-Gov ids are 15 CHARACTERS: 3 digits + 2 letters + 10 digits.  \d{15} alone
# never matches them; this is the legacy dependency-analysis defect.
LAW_ID_RE = re.compile(r"(?<![0-9A-Z])(?:\d{3}[A-Z]{2}\d{10}|\d{15})(?![0-9A-Z])")
ARTICLE_RE = re.compile(
    r"第([0-9０-９〇零一二三四五六七八九十百千]+(?:の[0-9０-９〇零一二三四五六七八九十百千]+)*)条"
)
DATE_RE = re.compile(
    r"(?:昭和|平成|令和)[0-9〇一二三四五六七八九十]+年[0-9〇一二三四五六七八九十]+月[0-9〇一二三四五六七八九十]+日"
    r"|[0-9]{4}年[0-9]{1,2}月[0-9]{1,2}日|[0-9]{4}-[0-9]{2}-[0-9]{2}"
)

MARKER_PRIORITY = (
    "EXCEPTION", "DEEMING", "PRESUMPTION", "READING", "DELEGATION",
    "REFERENCE", "CONDITION", "EFFECT",
)
MARKERS: dict[str, tuple[str, ...]] = {
    "EXCEPTION": ("ただし", "但し", "この限りではない", "を除く", "除き", "例外", "にかかわらず"),
    "DEEMING": ("みなす", "みなし", "看做す", "擬制"),
    "PRESUMPTION": ("推定する", "推定し", "推定される", "推定"),
    "READING": ("読み替え", "読み替えて", "読み替えた", "準用"),
    "DELEGATION": ("政令で定める", "省令で定める", "命令で定める", "が定める", "委任", "定めるところによる"),
    "REFERENCE": ("この法律", "同法", "同条", "前条", "次条", "の規定による", "の規定に基づき", "に規定する"),
    "CONDITION": ("場合", "とき", "に該当", "該当する", "限度", "以下", "以上", "を超える", "超え", "限り"),
    "EFFECT": ("課する", "課税する", "控除する", "徴収する", "加算する", "減額する", "還付する", "とする", "するものとする"),
}
STRUCTURE_TAGS = {"ArticleTitle", "ParagraphTitle", "ItemTitle", "SubItemTitle", "Heading"}

# Evidence axes.  Mechanical presence facts are a subset of the proof axes.
PRESENCE_AXES = ("source_location", "independent_spec", "implementation", "tests")
EVIDENCE_AXES = (
    "source_location",
    "decomposition_audit",
    "source_correspondence_audit",
    "independent_spec",
    "implementation",
    "kernel_proof",
    "proof_scope",
    "boundary_proof",
    "cross_law_proof",
    "tests",
    "adversarial_review",
)
FORBIDDEN_PROOF = re.compile(r"\b(sorry|admit|axiom|Classical\.choice)\b")


_KANJI_DIGITS = {"零": 0, "〇": 0, "一": 1, "二": 2, "三": 3, "四": 4,
                 "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
_KANJI_UNITS = {"十": 10, "百": 100, "千": 1000}


def kanji_to_int(text: str) -> int:
    s = text.translate(str.maketrans("０１２３４５６７８９", "0123456789")).strip()
    if s.isdigit():
        return int(s)
    total = current = 0
    for ch in s:
        if ch in _KANJI_DIGITS:
            current = _KANJI_DIGITS[ch]
        elif ch in _KANJI_UNITS:
            total += (current or 1) * _KANJI_UNITS[ch]
            current = 0
        else:
            raise ValueError(f"unexpected numeral character {ch!r}")
    return total + current


def article_key(label: str) -> str:
    """Canonical article key: 第六十六条 -> 66, 第二十一条の七 -> 21_7.

    Pinned e-Gov JSON stores Arabic article numbers while transcription checks
    cite kanji labels.  Without this normalisation, scoped source matching and
    queue lookups silently fail (a false `whole_text_only` result).
    """
    s = norm(label)
    m = re.match(r"^第(.+?)条(?:の(.+))?$", s)
    if not m:
        return s.translate(str.maketrans("０１２３４５６７８９", "0123456789"))
    try:
        main = str(kanji_to_int(m.group(1)))
        branch = str(kanji_to_int(m.group(2))) if m.group(2) else ""
    except ValueError:
        return s
    return main + ("_" + branch if branch else "")


def norm(text: str) -> str:
    return WS_RE.sub("", text or "")


def flat(node: Any) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat(c) for c in node.get("children", []))
    if isinstance(node, list):
        return "".join(flat(c) for c in node)
    return ""


def canon(*parts: Any) -> str:
    """Length-prefixed join; no delimiter collision between components."""
    return "|".join(f"{len('' if p is None else str(p))}:{'' if p is None else str(p)}" for p in parts)


def sha256_text(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def make_normative_id(
    law_id: str,
    history_id: str,
    provision: str,
    article: str,
    paragraph: str,
    item: str,
    subitem: str,
    table: str,
    row: str,
    cell: str,
    ordinal: int,
    kind: str,
    text: str,
    provision_no: str = "",
    source_path: str = "",
) -> str:
    """Full 64-hex identifier; changing any component changes the id.

    `provision_no` is the unique id of the main/supplementary provision (or
    appendix table) and `source_path` is the exact structural location. Both
    are REQUIRED by Objective §1.1. They are appended as optional parameters
    for backward compatibility with callers that predate this fix; omitting
    them is exactly what made repeated STRUCTURE units collide.
    """
    body = canon(
        law_id, history_id, provision, provision_no, article, paragraph, item,
        subitem, table, row, cell, source_path, str(ordinal), kind, norm(text),
    )
    return "NORM|" + sha256_text(body)


def iter_text_units(node: Any, ctx: dict[str, Any] | None = None) -> Iterator[dict[str, Any]]:
    """Yield every text leaf with full structural coordinates and raw offsets."""
    c = ctx or {
        "provision": "", "provision_no": "", "table": "", "article": "",
        "paragraph": "", "item": "", "subitem": "", "row": "", "cell": "",
        "path": (), "ordinals": {},
    }

    def rec(n: Any, cur: dict[str, Any]) -> Iterator[dict[str, Any]]:
        if isinstance(n, str):
            if not n.strip():
                return
            key = cur["path"]
            ordinal = cur["ordinals"].get(key, 0)
            cur["ordinals"][key] = ordinal + 1
            out = {k: v for k, v in cur.items() if k != "ordinals"}
            out.update({"text": n, "ordinal": ordinal})
            yield out
            return
        if isinstance(n, list):
            for i, ch in enumerate(n):
                yield from rec(ch, {**cur, "path": cur["path"] + (f"[{i}]",)})
            return
        if not isinstance(n, dict):
            return
        tag = str(n.get("tag") or "NODE")
        num = str((n.get("attr") or {}).get("Num", ""))
        path = cur["path"] + (tag + (f"#{num}" if num else ""),)
        nxt = dict(cur)
        nxt["path"] = path
        nxt["tags"] = cur.get("tags", ()) + (tag,)
        if tag == "MainProvision":
            nxt["provision"] = "MAIN"
        elif tag == "SupplProvision":
            nxt["provision"] = "SUPPLEMENTARY"
            nxt["provision_no"] = num
        elif tag in ("AppdxTable", "Appdx", "AppdxNote"):
            nxt["provision"] = "APPDX_TABLE"
            nxt["table"] = num
        elif tag == "Article":
            nxt["article"] = num
        elif tag == "Paragraph":
            nxt["paragraph"] = num
        elif tag == "Item":
            nxt["item"] = num
        elif tag == "SubItem":
            nxt["subitem"] = num
        elif tag == "TableRow":
            nxt["row"] = num
        elif tag in ("TableColumn", "TableCell"):
            nxt["cell"] = num or str(len(cur["path"]))
        for i, ch in enumerate(n.get("children", [])):
            child = dict(nxt)
            if tag == "TableRow" and not child["cell"]:
                child["cell"] = str(i)
            yield from rec(ch, child)

    yield from rec(node, c)


def classify(text: str, tags: tuple[str, ...] = ()) -> dict[str, Any]:
    n = norm(text)
    kinds = [k for k in MARKER_PRIORITY if any(m in n for m in MARKERS[k])]
    if kinds:
        primary = kinds[0]
    elif any(t in STRUCTURE_TAGS for t in tags):
        primary, kinds = "STRUCTURE", ["STRUCTURE"]
    else:
        primary, kinds = UNRESOLVED, [UNRESOLVED]
    return {
        "kind": primary,
        "kinds": kinds,
        "decomposed": primary != UNRESOLVED,
        "unhandled_conditions": [] if primary != UNRESOLVED else [text[:160]],
    }


def audit_coverage(original: str, units: list[dict[str, Any]]) -> dict[str, Any]:
    """Independent reconstruction check; classification does not affect it."""
    a = norm(original)
    b = norm("".join(u.get("text", "") for u in units))
    ids = [u.get("id", "") for u in units]
    return {
        "original_length": len(a),
        "reconstructed_length": len(b),
        "exact": a == b,
        "unique_ids": len(ids) == len(set(ids)) and all(ids),
        "unresolved": sum(1 for u in units if u.get("kind") == UNRESOLVED),
        "status": "COVERED" if a == b and len(ids) == len(set(ids)) and all(ids) else "PARTIAL",
    }


def decompose_article(
    node: Any,
    law_id: str,
    history_id: str,
    article_no: str,
    enforcement_date: str,
    law_index: dict[str, str],
    outer_path: tuple = (),
) -> dict[str, Any]:
    units: list[dict[str, Any]] = []
    # The article node alone cannot tell Main from Supplementary/Appendix.
    # The caller's outer path supplies the provision class and its unique id
    # (§1.1); without it those units collide in the normative identifier.
    scope, scope_no = "", ""
    for seg in outer_path:
        if seg.startswith("MainProvision"):
            scope = "MAIN"
        elif seg.startswith("SupplProvision"):
            scope = "SUPPLEMENTARY"
            scope_no = seg.split("#", 1)[1] if "#" in seg else ""
        elif seg.startswith("AppdxTable") or seg.startswith("Appdx"):
            scope = "APPDX_TABLE"
            scope_no = seg.split("#", 1)[1] if "#" in seg else ""
    prefix = "/".join(outer_path)
    for span in iter_text_units(node):
        cls = classify(span["text"], span.get("tags", ()))
        unit = {
            "law_id": law_id,
            "history_id": history_id,
            "enforcement_date": enforcement_date,
            "provision": scope or span["provision"],
            "provision_no": scope_no or span["provision_no"],
            "table": span["table"],
            "article": span["article"] or article_no,
            "paragraph": span["paragraph"],
            "item": span["item"],
            "subitem": span["subitem"],
            "row": span["row"],
            "cell": span["cell"],
            "source_path": (prefix + "/" if prefix else "") + "/".join(span["path"]),
            "ordinal": span["ordinal"],
            "text": span["text"],
            **cls,
        }
        unit["id"] = make_normative_id(
            law_id, history_id, unit["provision"], unit["article"],
            unit["paragraph"], unit["item"], unit["subitem"], unit["table"],
            unit["row"], unit["cell"], unit["ordinal"], unit["kind"], unit["text"],
            provision_no=unit["provision_no"], source_path=unit["source_path"],
        )
        unit["dependencies"] = parse_dependencies(unit["text"], law_index)
        units.append(unit)
    audit = audit_coverage(flat(node), units)
    return {"article": article_no, "units": units, "coverage": audit}


def build_law_index(laws: list[dict[str, Any]]) -> dict[str, str]:
    idx: dict[str, str] = {}
    for law in laws:
        lid = str(law.get("law_id", ""))
        for key in (law.get("official_title"), law.get("law_title"), lid):
            if isinstance(key, str) and key:
                idx[key] = lid
    return idx


def parse_dependencies(text: str, law_index: dict[str, str]) -> list[dict[str, Any]]:
    """Structured deps: law name + article + enforcement version.

    Bare 15-character identifiers are reported with resolution
    ``unresolved_underdetermined`` and are never satisfied dependencies.
    """
    deps: list[dict[str, Any]] = []
    names = sorted((k for k in law_index if not LAW_ID_RE.fullmatch(k)), key=len, reverse=True)
    for m in ARTICLE_RE.finditer(text or ""):
        article = m.group(0)
        window = text[max(0, m.start() - 120): m.end() + 40]
        name = next((n for n in names if n in window), "")
        deps.append({
            "type": "law_article",
            "law_name": name,
            "law_id": law_index.get(name, ""),
            "article": article,
            "enforcement_version": "",
            "resolution": "resolved_by_name" if name else "unresolved_underdetermined",
            "sufficient": bool(name),
        })
    for lid in sorted(set(LAW_ID_RE.findall(text or ""))):
        resolved_name = law_index.get(lid, "")
        has_name = bool(resolved_name) and resolved_name in text
        deps.append({
            "type": "law_id",
            "law_id": lid,
            "law_name": law_index.get(lid, ""),
            "resolution": "resolved_by_inventory" if has_name else "unresolved_underdetermined",
            "sufficient": False,  # a bare id is never dependency analysis
        })
    for d in sorted(set(DATE_RE.findall(text or ""))):
        deps.append({"type": "enforcement_version", "value": d, "resolution": "textual", "sufficient": False})
    return deps


def default_state(uid: str) -> dict[str, Any]:
    return {
        "unit_id": uid,
        "status": STATUS_NOT_STARTED,
        "owner": "",
        "blockers": [],
        "artifacts": {
            "source_pin": "", "spec": "", "implementation": "", "kernel_proof": "",
            "tests": "", "source_audit": "", "adversarial_review": "",
        },
        "evidence": {k: "" for k in EVIDENCE_AXES},
        "unhandled_conditions": [],
        "legal_review": LEGAL_REVIEW_PENDING,
        "history": [],
    }


def load_state(path: Path = STATE_PATH) -> dict[str, Any]:
    if not path.exists():
        return {"schema": "task_state/v1", "units": {}}
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, ValueError):
        return {"schema": "task_state/v1", "units": {}}
    if data.get("schema") != "task_state/v1" or not isinstance(data.get("units"), dict):
        return {"schema": "task_state/v1", "units": {}}
    return data


def save_state(state: dict[str, Any], path: Path = STATE_PATH) -> None:
    """Persist only non-default unit records (durable but committable).

    The full queue has ~400k generated units; writing all of them produced a
    331 MB ledger that cannot be committed or independently reviewed.
    ``merge_state`` reconstructs default records on the next regeneration, so
    owner / blockers / artifacts / evidence / review trail still survive
    (Directive §1 item 7) while the ledger stays small enough to audit.
    """
    template = default_state("")
    kept = {}
    for uid, rec in state.get("units", {}).items():
        if any(rec.get(k) != v for k, v in template.items() if k != "unit_id"):
            kept[uid] = rec
    compact = {"schema": state.get("schema", "task_state/v1"), "units": kept}
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_suffix(".json.tmp")
    tmp.write_text(json.dumps(compact, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
                   encoding="utf-8")
    tmp.replace(path)


def merge_state(state: dict[str, Any], units: list[dict[str, Any]]) -> tuple[dict[str, Any], list[str]]:
    """Register new units; preserve owner/blockers/artifacts of existing ones."""
    notes: list[str] = []
    for u in units:
        uid = u.get("id") or u.get("unit_id") or u.get("normative_id")
        if not uid:
            notes.append("unit without id skipped")
            continue
        if uid not in state["units"]:
            state["units"][uid] = default_state(uid)
            notes.append(f"new:{uid}")
        elif (u.get("source_digest") and state["units"][uid].get("source_digest")
              and state["units"][uid]["source_digest"] != u["source_digest"]):
            state["units"][uid]["status"] = STATUS_NOT_STARTED
            state["units"][uid]["evidence"] = {k: "" for k in EVIDENCE_AXES}
            notes.append(f"source-changed:{uid}")
    return state, notes


def derive_status(unit: dict[str, Any], evidence: dict[str, Any]) -> tuple[str, list[str]]:
    """Evidence-based status.  Never derives completion from names or existence."""
    errors: list[str] = []
    blockers = [b for b in unit.get("blockers", []) if not b.get("resolved", False)]
    if blockers or unit.get("status") == STATUS_BLOCKED:
        return STATUS_BLOCKED, ["unresolved blocker"]
    if unit.get("unhandled_conditions"):
        errors.append("unhandled conditions remain")
    ev = {k: bool(evidence.get(k)) for k in EVIDENCE_AXES}
    if not ev["source_location"]:
        return STATUS_NOT_STARTED, ["no source location evidence"]
    if not ev["decomposition_audit"]:
        return STATUS_PARTIAL, ["decomposition audit missing"]
    if not all(ev[k] for k in PRESENCE_AXES):
        return STATUS_PARTIAL, ["presence facts incomplete"]
    if not ev["kernel_proof"]:
        return STATUS_PARTIAL, ["no kernel proof"]
    # Cross-law proof is an obligation only when the unit actually has a
    # cross-law dependency. Requiring it universally makes isolated provisions
    # permanently unverifiable for a reason unrelated to the provision.
    scope_axes = ["source_correspondence_audit", "proof_scope", "boundary_proof",
                  "adversarial_review"]
    # Only an explicitly established EMPTY list waives the axis. A caller that
    # omits the key (e.g. article_obligations.py) supplies no evidence about
    # dependencies and must not silently downgrade the requirement.
    if "dependencies" not in unit or unit.get("dependencies"):
        scope_axes.append("cross_law_proof")
    if not all(ev[a] for a in scope_axes):
        return STATUS_PROVED_SCOPE, ["scope / boundary / cross-law / audit evidence incomplete"]
    if errors:
        return STATUS_PROVED_SCOPE, errors
    return STATUS_FULLY_VERIFIED, []


def dependency_readiness(units: list[dict[str, Any]]) -> dict[str, bool]:
    """Readiness by law name + article + enforced revision, not id string alone.

    A dependency that carries only a law id (whatever its casing / spelling),
    or that is explicitly flagged unresolved / insufficient, is
    *underdetermined*: it cannot discharge a dependency on its own
    (Directive §1 item 6). Every unit of a law reached only through such a hint
    is also held back, so an ambiguous reference cannot make downstream work
    look ready.
    """
    verified = {
        (u.get("law_id"), u.get("article"), u.get("enforcement_date", ""))
        for u in units if u.get("status") in (STATUS_PROVED_SCOPE, STATUS_FULLY_VERIFIED)
    }

    def underdetermined(d: dict) -> bool:
        typ = str(d.get("type", "")).upper().replace("_", "").replace("-", "")
        bare_id = typ in {"LAWID", "LAWIDHINT", "LAWIDONLY", "ID", "IDHINT"}
        return (bare_id
                or bool(d.get("unresolved"))
                or d.get("sufficient") is False
                or str(d.get("resolution", "")).lower() == "unresolved_underdetermined")

    tainted_laws = {
        str(d.get("law_id"))
        for u in units for d in u.get("dependencies", [])
        if underdetermined(d) and d.get("law_id")
    }
    out: dict[str, bool] = {}
    for u in units:
        ok = str(u.get("law_id", "")) not in tainted_laws
        for d in u.get("dependencies", []):
            if underdetermined(d):
                ok = False
                continue
            did = d.get("law_id", "")
            if not did or did == u.get("law_id"):
                continue
            if not d.get("sufficient"):
                ok = False
                continue
            key = (did, d.get("article", ""), u.get("enforcement_date", ""))
            if key not in verified:
                ok = False
        out[u.get("id", "")] = ok
    return out


def select_tasks(units: list[dict[str, Any]], limit: int, claims: dict[str, str] | None = None) -> dict[str, Any]:
    claims = claims or {}
    readiness = dependency_readiness(units)
    selected = []
    blocked = []
    for u in units:
        uid = u.get("id", "")
        status = u.get("status", STATUS_NOT_STARTED)
        if status in (STATUS_FULLY_VERIFIED, STATUS_BLOCKED):
            continue
        if claims.get(uid) or u.get("owner"):
            continue
        if not readiness[uid]:
            blocked.append({"id": uid, "reason": "BLOCKED_BY_DEPENDENCY"})
            continue
        remaining = [k for k in EVIDENCE_AXES if not u.get("evidence", {}).get(k)]
        selected.append({
            "id": uid,
            "law_id": u.get("law_id", ""),
            "article": u.get("article", ""),
            "status": status,
            "remaining_axes": remaining,
        })
        if len(selected) >= limit:
            break
    return {"selected": selected, "blocked": blocked, "ready": len(selected)}
