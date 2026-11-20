#!/usr/bin/env python3
"""Shared primitives for evidence-based normative-unit verification.

This module is the single source of truth for the four queue/completion tools:

  * collision-resistant normative identifiers built from law id, history
    (revision) id, 本則/附則/別表 kind, 条項号細目/別表セル path, unit kind and
    a content hash -- never from a 16-digit truncations of a single string;
  * decomposition of a statutory block into normative units (application
    condition, legal effect, exception, fiction, presumption, delegation,
    reading-substitution, reference, definition, procedure, transitional,
    penalty) with an exact source locator;
  * an INDEPENDENT coverage audit that reports source characters that could
    not be decomposed as `unresolved` instead of silently dropping them;
  * structured dependency analysis (law name + article + enforcement version),
    where a bare 15-digit number is only raw evidence, never a dependency;
  * an explicit completion state machine (NOT_STARTED / UNRESOLVED / PARTIAL /
    PROVED_SCOPE / FULLY_VERIFIED / BLOCKED) whose terminal states require
    recorded, externally produced evidence.

Nothing in this module treats a needle match, a file's existence, or a
theorem-name string match as verification or completion.
"""
from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
STATE_PATH = REPO / "data" / "TASK_STATE.json"

# ---------------------------------------------------------------------------
# States and obligations
# ---------------------------------------------------------------------------

STATES = (
    "NOT_STARTED",
    "UNRESOLVED",
    "PARTIAL",
    "PROVED_SCOPE",
    "FULLY_VERIFIED",
    "BLOCKED",
)
DONE_STATES = ("PROVED_SCOPE", "FULLY_VERIFIED")
DEFAULT_STATE = "NOT_STARTED"

UNIT_KINDS = (
    "APPLICATION_CONDITION",
    "LEGAL_EFFECT",
    "EXCEPTION",
    "FICTION",
    "PRESUMPTION",
    "DELEGATION",
    "READING_SUBSTITUTION",
    "REFERENCE",
    "DEFINITION",
    "PROCEDURE",
    "TRANSITIONAL",
    "PENALTY",
    "UNRESOLVED",
)

# Evidence keys. A terminal state requires ALL of these to be present AND
# valid; partial evidence can only produce PARTIAL.
EVIDENCE_KEYS = (
    "source_pin",
    "decomposition_audit",
    "independent_spec",
    "implementation",
    "proof_result",
    "boundary_tests",
    "unhandled_conditions",
    "independent_audit",
)
# Human legal review is a SEPARATE axis (Directive §1) and is never folded into
# the machine-verification completion state.
REVIEW_KEY = "review_trail"

# Ordered: the first matching cue wins. Exceptions/fictions/presumptions are
# checked before generic effect/condition cues so that overlapping phrases are
# not misclassified as ordinary effects.
CUE_PATTERNS = (
    ("EXCEPTION", r"ただし|前項の規定にかかわらず|この項の規定にかかわらず|を除く|除き|例外的に"),
    ("FICTION", r"みなす|みなし|と見做す"),
    ("PRESUMPTION", r"推定する|推定し|推定す|の推定"),
    ("DELEGATION", r"政令で定める|省令で定める|内閣府令で定める|条例で定める|財務省令で定める|委任|定めるところによる"),
    ("READING_SUBSTITUTION", r"読み替え|読み替えて|準じて読み替"),
    ("REFERENCE", r"準用|引用|第[0-9０-９一二三四五六七八九十百千]+条の?[0-9０-９一二三四五六七八九十百千]*|この法律の規定|同条の規定"),
    ("PENALTY", r"過怠税|加算税|罰金|刑に処|罰する|科する"),
    ("TRANSITIONAL", r"施行日|経過措置|附則|この法律の施行"),
    ("DEFINITION", r"とは|をいう|定義する"),
    ("PROCEDURE", r"申告|届出|申請|通知|決定|徴収|滞納処分|更正|決定通知"),
    ("LEGAL_EFFECT", r"しなければならない|するものとする|課する|納める義務|控除|税率|税額|適用する|可以|できる|よい|効力"),
    ("APPLICATION_CONDITION", r"場合|とき|に該当|居住者|非居住者|内国法人|外国法人|事業者|納税者|個人|法人"),
)
_COMPILED_CUES = tuple((k, re.compile(p)) for k, p in CUE_PATTERNS)

CONTAINER_TAGS = frozenset(
    {"MainProvision", "SupplProvision", "AppdxTable", "Article",
     "Paragraph", "Item", "SubItem", "TableRow"}
)
_LAWISH = re.compile(r"[一-龥々〆ヶA-Za-z0-9（）()・]{2,60}")
_ARTICLE = re.compile(r"第\s*([0-9０-９一二三四五六七八九十百千]+)\s*条")
# e-Gov law ids look like 340AC0000000033 (3 digits + 2 letters + 11 digits).
# The old "15 digit" pattern did not even match those; it is kept only as raw
# evidence, never as authoritative dependency analysis.
_LEGACY_LAW_ID = re.compile(r"\d{3}[A-Z0-9]{2}\d{10}|\d{15}")


# ---------------------------------------------------------------------------
# Small helpers
# ---------------------------------------------------------------------------

def norm(text: str) -> str:
    return re.sub(r"[\s\u3000]+", "", text or "").strip()


def flat(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat(c) for c in node.get("children", []))
    if isinstance(node, list):
        return "".join(flat(c) for c in node)
    return ""


def sha256_text(text: str) -> str:
    return hashlib.sha256((text or "").encode("utf-8")).hexdigest()


def _lp(value) -> str:
    """Length-prefixed encoding: unambiguous even when components contain '|'."""
    s = str(value)
    return f"{len(s.encode('utf-8'))}:{s}"


def normative_id(law_id, revision_id, provision_path, unit_index, kind, text,
                 block_ordinal=0) -> str:
    """64-hex collision-resistant identifier for one normative unit.

    `block_ordinal` disambiguates repeated structural paths (e.g. several
    unnumbered appendix-table rows or 附則 sections sharing a number).
    """
    payload = "|".join(
        _lp(v) for v in (law_id, revision_id, "/".join(provision_path),
                         block_ordinal, unit_index, kind, sha256_text(text))
    )
    return hashlib.sha256(payload.encode("utf-8")).hexdigest()


def readable_ref(law_id, revision_id, provision_path, unit_index, block_ordinal=0) -> str:
    return (f"{law_id}@{revision_id}#{'/'.join(provision_path)}"
            f"#B{int(block_ordinal):04d}#U{int(unit_index):03d}")


# ---------------------------------------------------------------------------
# Structural walk: 本則 / 附則 / 別表 / 条 / 項 / 号 / 細目 / 別表セル
# ---------------------------------------------------------------------------

def _attr_num(node) -> str:
    return norm(str((node.get("attr") or {}).get("Num", ""))) if isinstance(node, dict) else ""


def _extend_path(tag, node, path):
    if tag == "MainProvision":
        return path + ("本則",)
    if tag == "SupplProvision":
        return path + (f"附則[{_attr_num(node) or '題'}内容]",)
    if tag == "AppdxTable":
        return path + (f"別表[{_attr_num(node) or 'unspecified'}]",)
    if tag == "Article":
        return path + (f"条[{_attr_num(node)}]",)
    if tag == "Paragraph":
        return path + (f"項[{_attr_num(node) or '1'}]",)
    if tag == "Item":
        return path + (f"号[{_attr_num(node)}]",)
    if tag == "SubItem":
        return path + (f"細目[{_attr_num(node)}]",)
    if tag == "TableRow":
        return path + (f"行[{_attr_num(node) or len(path)}]",)
    return path


def iter_blocks(node, path=()):
    """Yield (path_tuple, normalized_text, node) for each leaf normative block.

    Only structural containers (本則/附則/別表/条/項/号/細目/別表セル) are
    emitted, and only when they have no further container child. Non-container
    text nodes are traversed but never emitted, so one source sentence cannot
    appear as two blocks under the same locator.
    """
    if isinstance(node, list):
        for child in node:
            yield from iter_blocks(child, path)
        return
    if not isinstance(node, dict):
        return
    tag = node.get("tag")
    children = node.get("children", [])
    container_children = [
        c for c in children
        if isinstance(c, dict) and c.get("tag") in CONTAINER_TAGS
    ]
    if tag in CONTAINER_TAGS:
        p = _extend_path(tag, node, path)
        if not container_children:
            text = norm(flat(node))
            if text:
                yield p, text, node
        # Recurse into ALL children: a container may itself be a leaf while
        # still holding a deeper container (e.g. 項 > ParagraphText > 号).
        for child in children:
            yield from iter_blocks(child, p)
    else:
        for child in children:
            yield from iter_blocks(child, path)


# ---------------------------------------------------------------------------
# Decomposition and its INDEPENDENT coverage audit
# ---------------------------------------------------------------------------

def split_spans(text: str):
    """Return spans that exactly partition [0, len(text)] (no gap/overlap)."""
    text = text or ""
    if not text:
        return []
    bounds = [0]
    for m in re.finditer(r"[。；;]", text):
        if m.end() > bounds[-1]:
            bounds.append(m.end())
    if bounds[-1] < len(text):
        bounds.append(len(text))
    spans = [(bounds[i], bounds[i + 1]) for i in range(len(bounds) - 1)]
    out = []
    for a, b in spans:
        if b - a <= 160:
            out.append((a, b))
            continue
        last = a
        for m in re.finditer(r"、", text[a:b]):
            e = a + m.end()
            if e - last >= 40:
                out.append((last, e))
                last = e
        if last < b:
            out.append((last, b))
    return out


def classify(text: str) -> tuple[str, str]:
    for kind, pattern in _COMPILED_CUES:
        m = pattern.search(text)
        if m:
            return kind, m.group(0)
    return "UNRESOLVED", ""


def decompose(path, text):
    """Split one block into normative units. Unclassifiable sentences are kept
    as `UNRESOLVED` units, never dropped."""
    units = []
    for i, (a, b) in enumerate(split_spans(text)):
        fragment = text[a:b]
        kind, cue = classify(fragment)
        units.append({
            "index": i,
            "kind": kind,
            "cue": cue,
            "char_start": a,
            "char_end": b,
            "text": fragment,
            "sha256": sha256_text(fragment),
            "locator": f"{'/'.join(path)}@{a}-{b}",
        })
    return units


def audit_decomposition(text, units):
    """Independent audit: recompute coverage from spans, never trust the
    decomposition's own claim. Reports unresolved source characters."""
    n = len(text or "")
    covered = 0
    unresolved = 0
    spans = []
    for u in units or []:
        a, b = int(u.get("char_start", -1)), int(u.get("char_end", -1))
        if a < 0 or b > n or b <= a:
            continue
        spans.append((a, b))
        if u.get("kind") == "UNRESOLVED":
            unresolved += b - a
        else:
            covered += b - a
    spans.sort()
    overlaps = []
    gaps = []
    cursor = 0
    for a, b in spans:
        if a > cursor:
            gaps.append((cursor, a))
        if a < cursor:
            overlaps.append((a, cursor))
        cursor = max(cursor, b)
    if cursor < n:
        gaps.append((cursor, n))
    return {
        "source_chars": n,
        "classified_chars": covered,
        "unresolved_chars": unresolved,
        "gap_chars": sum(b - a for a, b in gaps),
        "overlap_chars": sum(b - a for a, b in overlaps),
        "gaps": gaps,
        "overlaps": overlaps,
        "decomposition_ok": (not gaps and not overlaps and unresolved == 0 and n > 0),
    }


# ---------------------------------------------------------------------------
# Structured dependency analysis (law title + article + enforcement version)
# ---------------------------------------------------------------------------

def _laws_index(laws):
    by_title = {}
    by_id = {}
    for law in laws or []:
        lid = law.get("law_id", "")
        rev = (law.get("current_revision") or {}).get("law_revision_id", "")
        titles = {norm(law.get("official_title", "")), norm(law.get("law_num", ""))}
        for t in titles:
            if t:
                by_title.setdefault(t, (lid, rev))
        if lid:
            by_id[lid] = (lid, rev)
    return by_title, by_id


def _resolve_title(candidate, by_title):
    c = norm(candidate)
    if not c:
        return None
    if c in by_title:
        return by_title[c]
    # longest known title contained in the candidate (e.g. "所得税法" inside
    # "所得税法等の一部を改正する法律")
    best = None
    for title, pair in by_title.items():
        if len(title) >= 3 and title in c and (best is None or len(title) > len(best[0])):
            best = (title, pair)
    return best[1] if best else None


_SELF_REF = re.compile(r"この法律|この省令|この条例|前条|同条|次条|同項|前項|次項")


def current_article_from_path(path):
    """Extract the article number from a structural path such as 本則/条[42_4]/項[2]."""
    for component in reversed(path):
        if component.startswith("条[") and component.endswith("]"):
            return component[2:-1]
    return ""


def extract_dependencies(text, laws, index=None, context=None):
    """Return structured dependencies. A 15-digit id alone is NOT a dependency:
    it is recorded as `legacy_raw_ids` with `authoritative: false`.

    `index` may be a precomputed ``(by_title, by_id)`` pair so callers scanning
    hundreds of thousands of units build the law index only once.
    `context` is ``{law_id, revision_id, article}`` of the containing unit; it
    resolves self-references (この法律 / 前条 / 同条 / 次条) instead of falsely
    reporting them as external unresolved dependencies.
    """
    by_title, by_id = index if index is not None else _laws_index(laws)
    ctx = context or {}
    self_pair = (ctx.get("law_id"), ctx.get("revision_id")) if ctx.get("law_id") else None
    own_article = str(ctx.get("article") or "")
    deps = []
    seen = set()

    def _self_article(raw_article, prefix):
        """Resolve a self-reference to an article number, or '' for 'this law'."""
        if raw_article and raw_article.isdigit():
            return raw_article
        if "同条" in prefix or "同項" in prefix:
            return own_article
        if "前条" in prefix or "前項" in prefix:
            return str(int(own_article) - 1) if own_article.isdigit() and int(own_article) > 1 else ""
        if "次条" in prefix or "次項" in prefix:
            return str(int(own_article) + 1) if own_article.isdigit() else ""
        return ""
    for m in _ARTICLE.finditer(text or ""):
        article = m.group(1)
        prefix = text[max(0, m.start() - 40):m.start()]
        candidates = _LAWISH.findall(prefix)
        resolved = None
        raw_title = ""
        for cand in reversed(candidates):
            resolved = _resolve_title(cand, by_title)
            if resolved:
                raw_title = cand
                break
        if not resolved:
            tail = norm(prefix[-24:])
            if tail in by_id:
                resolved = by_id[tail]
                raw_title = tail
        basis = "named_law"
        if not resolved and self_pair:
            # A bare 第N条 in a statute refers to that statute unless a law
            # name was found in the local context. Record the basis so this
            # default is auditable rather than an invisible guess.
            resolved = self_pair
            raw_title = "自法（明文の法令名なし）"
            basis = "self_law_default" if not _SELF_REF.search(prefix) else "self_reference"
            article = _self_article(article, prefix) or article
        else:
            basis = "named_law"
        key = (resolved[0] if resolved else "", article, "REFERENCE")
        if key in seen:
            continue
        seen.add(key)
        deps.append({
            "kind": "REFERENCE",
            "raw": f"{raw_title}{m.group(0)}",
            "law_id": resolved[0] if resolved else None,
            "law_revision_id": resolved[1] if resolved else None,
            "article": article,
            "resolved": bool(resolved),
            "resolution_basis": basis,
            "unresolved_reason": None if resolved else "law_title_not_resolved_against_inventory",
        })
    # Bare relative self-references (前条 / 同条 / 次条) have no 第N条 form and
    # are otherwise wrongly reported as external unresolved dependencies.
    if self_pair:
        for m in re.finditer(r"前条|同条|次条", text or ""):
            art = _self_article("", m.group(0))
            if not art or art == own_article:
                continue
            key = (self_pair[0], art, "REFERENCE")
            if key in seen:
                continue
            seen.add(key)
            deps.append({
                "kind": "REFERENCE", "raw": m.group(0),
                "law_id": self_pair[0], "law_revision_id": self_pair[1],
                "article": art, "resolved": True,
                "resolution_basis": "self_relative_reference", "unresolved_reason": None,
            })
    for cue, kind in (
        (r"政令で定める|省令で定める|条例で定める", "DELEGATION"),
        (r"準用", "QUASI_APPLICATION"),
        (r"読み替え", "READING_SUBSTITUTION"),
    ):
        for m in re.finditer(cue, text or ""):
            prefix = text[max(0, m.start() - 40):m.start()]
            resolved = None
            raw_title = ""
            for cand in reversed(_LAWISH.findall(prefix)):
                resolved = _resolve_title(cand, by_title)
                if resolved:
                    raw_title = cand
                    break
            article_ref = None
            cue_basis = "named_law"
            if not resolved and self_pair and ("この法律" in prefix or _SELF_REF.search(prefix)):
                # A 準用/読替え of "this law"/前条 is a genuine dependency on
                # another article of the same statute, not an unresolvable one.
                resolved = self_pair
                raw_title = "この法律（自法）"
                article_ref = _self_article("", prefix) or own_article or None
                cue_basis = "self_reference"
            if resolved and article_ref == own_article and kind in ("QUASI_APPLICATION", "READING_SUBSTITUTION"):
                continue  # self-reference to the same article: no dependency
            key = (resolved[0] if resolved else norm(m.group(0)), kind, article_ref)
            if key in seen:
                continue
            seen.add(key)
            deps.append({
                "kind": kind,
                "raw": f"{raw_title}{m.group(0)}".strip(),
                "law_id": resolved[0] if resolved else None,
                "law_revision_id": resolved[1] if resolved else None,
                "article": article_ref,
                "resolved": bool(resolved),
                "resolution_basis": cue_basis,
                "unresolved_reason": None if resolved else "delegation_or_reference_target_not_pinned",
            })
    legacy = sorted(set(_LEGACY_LAW_ID.findall(text or "")))
    return {
        "dependencies": deps,
        "unresolved_dependency_count": sum(1 for d in deps if not d["resolved"]),
        "legacy_raw_ids": legacy,
        "legacy_ids_authoritative": False,
    }


# ---------------------------------------------------------------------------
# Persistent task state (survives regeneration and session restarts)
# ---------------------------------------------------------------------------

def load_state():
    if not STATE_PATH.exists():
        return {"schema": 1, "tasks": {}}
    data = json.loads(STATE_PATH.read_text(encoding="utf-8"))
    if not isinstance(data, dict) or not isinstance(data.get("tasks"), dict):
        return {"schema": 1, "tasks": {}}
    return data


def save_state(state):
    STATE_PATH.parent.mkdir(parents=True, exist_ok=True)
    tmp = STATE_PATH.with_suffix(".json.tmp")
    tmp.write_text(
        json.dumps(state, ensure_ascii=False, separators=(",", ":"), sort_keys=True),
        encoding="utf-8",
    )
    tmp.replace(STATE_PATH)


def blank_record(task):
    """Deterministic default record (no timestamps: regeneration-safe)."""
    return {
        "completion_state": DEFAULT_STATE,
        "owner": "",
        "attempts": 0,
        "claimed_at": "",
        "blockers": [],
        "artifacts": {},
        "evidence": {},
        "history": [],
        "review": {"reviewer": "", "review_date": "", "verdict": ""},
        "source_sha256": task.get("source_sha256", ""),
    }


def _valid_evidence(value) -> bool:
    if not isinstance(value, dict):
        return False
    if not value.get("sha256"):
        return False
    if value.get("kind") == "proof_result":
        return bool(value.get("kernel_checked")) and not any(
            value.get(k) for k in ("sorry_count", "admit_count", "unexpected_axiom_count")
        )
    if value.get("kind") == "boundary_tests":
        return int(value.get("passed", 0)) > 0 and bool(value.get("test_names"))
    return True


def derive_state(record, task):
    """Evidence-driven state. Needles, file existence and theorem-name string
    matches can never produce a terminal state here."""
    ev = record.get("evidence") or {}
    if record.get("blockers"):
        return "BLOCKED"
    if task.get("unresolved_units"):
        return "UNRESOLVED"
    missing = [k for k in EVIDENCE_KEYS if not _valid_evidence(ev.get(k))]
    if missing:
        return "PARTIAL" if any(_valid_evidence(v) for v in ev.values()) else DEFAULT_STATE
    if (task.get("decomposition") or {}).get("audit", {}).get("decomposition_ok") is not True:
        return "PARTIAL"
    return "FULLY_VERIFIED" if task.get("scope") == "FULL_ARTICLE" else "PROVED_SCOPE"


def merge_state(state, tasks):
    """Preserve manually recorded state; create deterministic defaults only."""
    changed = False
    for t in tasks:
        tid = t["task_id"]
        if tid not in state["tasks"]:
            state["tasks"][tid] = blank_record(t)
            changed = True
            continue
        rec = state["tasks"][tid]
        for key, default in blank_record(t).items():
            rec.setdefault(key, default)
        # Source content changed under the same id cannot happen (id includes a
        # content hash); if it does, mark stale rather than silently reusing.
        if rec.get("source_sha256") and rec["source_sha256"] != t.get("source_sha256"):
            rec.setdefault("blockers", []).append("source_content_changed")
            changed = True
        computed = derive_state(rec, t)
        if rec.get("computed_state") != computed:
            rec["computed_state"] = computed
            changed = True
    return changed
