#!/usr/bin/env python3
"""Persistent normative work queue (Objective §1 / §3 / §5 / §7).

Generates a work unit for EVERY decomposed normative fragment of EVERY pinned
provision (本則 / 附則 / 別表セル) of the 2026-11-15 inventory.  A unit records:

  * collision-free 64-hex normative id (law, revision, provision id, 条項号細目,
    table cell, ordinal, norm type, source digest);
  * exact source position (structural path + normalized offsets + raw sha256);
  * independent specification / implementation / proof / test obligations;
  * unresolved conditions and a mechanical coverage audit (never a fidelity
    claim);
  * law/article/enforcement-version-aware dependencies;
  * durable status/owner/blockers/artifacts/review read from data/task_state.json.

`build/task_queue.json` is a derived projection. Human legal review is a
separate axis and never blocks formalization. Regenerate deterministically with
`python scripts/ci/task_queue.py` (optionally `--law-id <id>`).
"""
from __future__ import annotations

import hashlib
import importlib.util
import json
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
INVENTORY = REPO / "data" / "INVENTORY.json"
SWEEP = REPO / "build" / "audit_sweep.json"
AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"
OUT_JSON = REPO / "build" / "task_queue.json"
OUT_MD = REPO / "docs" / "TASK_QUEUE.md"

sys.path.insert(0, str(Path(__file__).resolve().parent))
import dependency_parser as dp  # noqa: E402
import norm_decomposer as nd  # noqa: E402
import normative_ids as ni  # noqa: E402
import task_state as st  # noqa: E402

TEXT_TAGS = {
    "Sentence", "ParagraphSentence", "ItemSentence",
    "Subitem1Sentence", "Subitem2Sentence", "Subitem3Sentence",
    "TableColumn", "TableRow", "Column",
}
LABEL_TAGS = {
    "ArticleTitle", "ArticleCaption", "ParagraphNum", "ParagraphCaption",
    "ItemTitle", "Subitem1Title", "Subitem2Title", "Subitem3Title",
    "AppdxTableTitle", "SupplProvisionLabel", "LawTitle", "LawNum",
}
PROVISION_TAGS = {
    "MainProvision", "SupplProvision", "AppdxTable", "Part", "Chapter",
    "Section", "Subsection", "Division", "Article", "Paragraph", "Item",
    "Subitem1", "Subitem2", "Subitem3", "TableStruct", "Table", "TableRow",
    "TableColumn", "Sentence", "ParagraphSentence", "ItemSentence",
    "Subitem1Sentence", "Subitem2Sentence", "Subitem3Sentence",
}
_NUM = r"[0-9０-９〇零一二三四五六七八九十百千]"


def flat(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat(c) for c in node.get("children", []))
    if isinstance(node, list):
        return "".join(flat(c) for c in node)
    return ""


def _component(node: dict, tag: str, index: int) -> str:
    attr = node.get("attr") or {}
    num = str(attr.get("Num", ""))
    if tag in ("MainProvision", "SupplProvision", "AppdxTable"):
        intrinsic = str(attr.get("AmendLawNum", "") or attr.get("Num", "") or tag)
        return f"{tag}:{intrinsic}" + (f"@{index}" if index else "")
    if num:
        # e-Gov files may contain deleted/branch provisions with a repeated Num.
        # The sibling ordinal keeps their intrinsic ids distinct.
        return f"{tag}:{num}" + (f"@{index}" if index else "")
    if tag in ("TableStruct", "Table", "TableRow", "TableColumn", "Sentence", "ParagraphSentence",
               "ItemSentence", "Subitem1Sentence", "Subitem2Sentence",
               "Subitem3Sentence", "Column"):
        return f"{tag}:{index:04d}"
    return tag


def _collect(node, path: tuple[str, ...], out: list[tuple[str, tuple[str, ...]]]) -> None:
    """Collect normative text fragments in document order with structural paths."""
    if isinstance(node, str):
        text = ni.norm_text(node)
        if text:
            out.append((text, path))
        return
    if isinstance(node, list):
        for i, child in enumerate(node):
            _collect(child, path, out)
        return
    if not isinstance(node, dict):
        return
    tag = node.get("tag", "")
    if tag in LABEL_TAGS:
        return
    if tag == "Article" and path and path[-1].startswith("Article:"):
        pass  # nested article retained with its own component
    child_path = path
    if tag in PROVISION_TAGS or tag in TEXT_TAGS:
        idx = 0
        siblings = [c for c in (node.get("_siblings") or []) if isinstance(c, dict)]
        for s in siblings:
            if s is node:
                break
            if s.get("tag") == tag:
                idx += 1
        child_path = path + (_component(node, tag, idx),)
    for child in node.get("children", []):
        _collect(child, child_path, out)


def _walk(node, path: tuple[str, ...] = ()):
    """Yield (path, node) for every tagged node."""
    if isinstance(node, dict):
        tag = node.get("tag", "")
        here = path
        if tag:
            siblings = node.get("_siblings") or []
            idx = sum(1 for s in siblings if isinstance(s, dict) and s.get("tag") == tag)
            here = path + (_component(node, tag, idx),)
        yield here, node
        children = node.get("children", [])
        for i, child in enumerate(children):
            if isinstance(child, dict):
                child["_siblings"] = children[:i]
            yield from _walk(child, here)
    elif isinstance(node, list):
        for child in node:
            yield from _walk(child, path)


def _provision_path(path: tuple[str, ...]) -> tuple[str, ...]:
    keep = {"MainProvision", "SupplProvision", "AppdxTable", "Part", "Chapter",
            "Section", "Subsection", "Division", "Article", "Paragraph", "Item",
            "Subitem1", "Subitem2", "Subitem3", "TableStruct", "Table", "TableRow",
            "TableColumn"}
    return tuple(p for p in path if p.split(":")[0] in keep)


def _provision_info(path: tuple[str, ...]) -> tuple[str, str, str, str, str]:
    """Return (kind, provision_id, article_no, paragraph_no, table_cell_ref)."""
    kind = "MAIN"
    pid_parts: list[str] = []
    article = ""
    para = ""
    cell = ""
    for comp in path:
        tag, _, val = comp.partition(":")
        val = val.split("@")[0]
        if tag == "SupplProvision":
            kind = "SUPPLEMENTARY"
        if tag == "AppdxTable":
            kind = "APPENDIX_TABLE"
        if tag in ("MainProvision", "SupplProvision", "AppdxTable", "Part", "Chapter",
                   "Section", "Subsection", "Division", "Article", "Paragraph", "Item",
                   "Subitem1", "Subitem2", "Subitem3", "TableStruct", "Table",
                   "TableRow", "TableColumn"):
            pid_parts.append(comp)
        if tag == "Article":
            article = f"第{val}条"
        if tag == "Paragraph" and val:
            para = f"第{val}項"
        if tag in ("TableRow", "TableColumn"):
            cell = (cell + "/" if cell else "") + comp
    return kind, "/".join(pid_parts), article, para, cell


def _coords_from_path(path: tuple[str, ...]) -> tuple[str, str, str, str]:
    paragraph = item = subitem = cell = ""
    for comp in path:
        tag, _, val = comp.partition(":")
        val = val.split("@")[0]
        if tag == "Paragraph" and val:
            paragraph = f"第{val}項"
        elif tag == "Item" and val:
            item = f"第{val}号"
        elif tag.startswith("Subitem") and val:
            subitem = (subitem + "/" if subitem else "") + comp
        elif tag in ("TableRow", "TableColumn"):
            cell = (cell + "/" if cell else "") + comp
    return paragraph, item, subitem, cell


def _pin_needles() -> dict[str, list[str]]:
    spec = importlib.util.spec_from_file_location("tq_ta", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    out: dict[str, list[str]] = {}
    for _name, law_id, _kind, _art, needles in mod.checks():
        out.setdefault(law_id, []).extend(needles)
    return out


def _digits_sha(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def build_queue(law_filter: str = "") -> tuple[dict, dict]:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = inv.get("laws", [])
    state = st.load_state()
    original_units = json.loads(json.dumps(state["units"], sort_keys=True))
    evidence = st.load_evidence()
    title_index = dp.build_title_index(laws)
    needles = _pin_needles()
    tasks: list[dict] = []
    coverage_stats = {"provisions": 0, "reconstructed": 0, "unresolved_units": 0}

    for law in laws:
        lid = law["law_id"]
        if law_filter and lid != law_filter:
            continue
        rev = (law.get("current_revision") or {}).get("law_revision_id", "")
        sf = (law.get("raw_snapshot") or {}).get("source_file", "")
        source_sha = str((law.get("raw_snapshot") or {}).get("source_sha256", ""))
        if not sf or not (REPO / sf).exists():
            continue
        doc = json.loads((REPO / sf).read_text(encoding="utf-8"))
        full = doc.get("law_full_text") or {}

        provisions: list[tuple[tuple[str, ...], dict]] = []
        walk = list(_walk(full))
        for path, node in walk:
            if node.get("tag") == "Article":
                provisions.append((_provision_path(path), node))
            elif node.get("tag") == "TableRow" and any(
                p.startswith("AppdxTable") for p in path
            ):
                provisions.append((_provision_path(path), node))
        # A 附則 may contain ParagraphSentence directly, with no Article child.
        # Such a provision must still become work units, not silently vanish.
        for path, node in walk:
            if node.get("tag") != "SupplProvision":
                continue
            if any(child.get("tag") == "Article" for _p, child in _walk(node)):
                continue
            provisions.append((_provision_path(path), node))

        for path, node in provisions:
            segments: list[tuple[str, tuple[str, ...]]] = []
            _collect(node, (), segments)
            text = "".join(s for s, _ in segments)
            char_paths: list[tuple[str, ...]] = []
            for seg, seg_path in segments:
                char_paths.extend([seg_path] * len(seg))
            if not text:
                continue
            kind, pid, article, _para, cell = _provision_info(path)
            hint = any(ni.norm_text(n) in text for n in needles.get(lid, []))
            units = nd.decompose(text, source_path="/".join(path))
            provision_coverage = nd.audit_coverage(text, units)
            coverage_stats["provisions"] += 1
            coverage_stats["reconstructed"] += 1 if provision_coverage["reconstruction_ok"] else 0
            coverage_stats["unresolved_units"] += provision_coverage["unresolved_count"]
            for unit in units:
                start, end = unit.raw_start, unit.raw_end
                coord_path = char_paths[min(start, len(char_paths) - 1)] if char_paths else ()
                paragraph, item, subitem, cell_coord = _coords_from_path(coord_path)
                table_cell = cell_coord or cell
                nid = ni.make_id(
                    law_id=lid, history_id=rev, provision_kind=kind,
                    fragment=unit.text, unit_index=unit.index,
                    norm_type=unit.norm_type, provision_id=pid,
                    article_no=article, paragraph_no=paragraph, item_no=item,
                    subitem_path=subitem, table_cell_ref=table_cell,
                    source_sha256=source_sha,
                )
                ident = nid.identifier()
                deps = dp.parse_dependencies(unit.norm_text, laws, lid, title_index) if (
                    "第" in unit.norm_text or "法" in unit.norm_text or "令" in unit.norm_text
                ) else []
                unresolved = []
                if unit.needs_review:
                    unresolved.append("UNCLASSIFIED_NORMATIVE_UNIT")
                for d in deps:
                    if d.resolution in ("UNRESOLVED", "UNENFORCED", "EXTERNAL_UNVERIFIED", "HISTORICAL"):
                        unresolved.append(f"DEPENDENCY_{d.resolution}")
                projection = {
                    "normative_id": ident,
                    "law_id": lid,
                    "law_title": law.get("official_title", ""),
                    "revision": rev,
                    "enforcement_date": (law.get("current_revision") or {}).get(
                        "amendment_enforcement_date", ""),
                    "source_file": sf,
                    "source_sha256": source_sha,
                    "path": "/".join(path),
                    "provision_kind": kind,
                    "provision_id": pid,
                    "article": article,
                    "article_title": "",
                    "paragraphs": [paragraph] if paragraph else [],
                    "items": [item] if item else [],
                    "subitem_path": subitem,
                    "table_cell_ref": table_cell,
                    "norm_fragment": unit.text[:80],
                    "norm_type": unit.norm_type,
                    "kinds": list(unit.kinds),
                    "source_span": {
                        "norm_start": start, "norm_end": end,
                        "span_sha256": _digits_sha(unit.text),
                        "structural_path": "/".join(coord_path),
                    },
                    "scope": "FULL_ARTICLE",
                    "priority": 1 if hint else 2,
                    "dependencies": [
                        {"law_id": d.law_id, "law_name": d.law_name,
                         "article_no": d.article_no, "paragraph_no": d.paragraph_no,
                         "enforcement_date": d.enforcement_date,
                         "resolution": d.resolution, "relation": d.relation,
                         "raw": d.raw[:60]}
                        for d in deps[:6]
                    ],
                    "dependency_ids": [d.law_id for d in deps
                                       if d.resolution == "RESOLVED_IN_LEDGER" and d.law_id],
                    "unresolved_conditions": sorted(set(unresolved)),
                    "coverage": {
                        "reconstruction_ok": provision_coverage["reconstruction_ok"],
                        "independent_reconstruction_ok": provision_coverage[
                            "independent_reconstruction_ok"],
                        "contiguous": provision_coverage["contiguous"],
                        "uncovered_chars": provision_coverage["uncovered_chars"],
                        "provision_unresolved_count": provision_coverage["unresolved_count"],
                        "unit_unresolved": unit.needs_review,
                        "audited": False,
                        "claim": provision_coverage["claim"],
                    },
                    "verification": {
                        "satisfied_axes": [],
                        "missing_axes": list(st.MECHANICAL_AXES),
                        "kernel_proof_required": True,
                    },
                }
                projection["projection_digest"] = _digits_sha(json.dumps(
                    projection, ensure_ascii=False, sort_keys=True, separators=(",", ":")))
                tasks.append(projection)

    ids = [t["normative_id"] for t in tasks]
    if len(set(ids)) != len(ids):
        seen: dict[str, dict] = {}
        dup = None
        for t in tasks:
            if t["normative_id"] in seen:
                dup = (seen[t["normative_id"]], t)
                break
            seen[t["normative_id"]] = t
        raise ValueError(f"normative id collision in generated queue: "
                         f"{dup[0] if dup else '?'} vs {dup[1] if dup else '?'}")
    st.merge_state(state, tasks)
    for t in tasks:
        derived = st.derive_status(t, state, evidence)
        ustate = state["units"].get(t["normative_id"], st.default_unit_state())
        t["status"] = derived["status"]
        t["owner"] = ustate.get("owner", "")
        t["blockers"] = ustate.get("blockers", [])
        t["artifacts"] = ustate.get("artifacts", [])
        t["review_evidence"] = ustate.get("review_evidence", [])
        t["notes"] = ustate.get("notes", "")
        t["legal_review"] = ustate.get("legal_review", st.LEGAL_REVIEW_PENDING)
        t["verification"]["satisfied_axes"] = derived["satisfied_axes"]
        t["verification"]["missing_axes"] = derived["missing_axes"]
        # Per-unit links to the independent spec / implementation / proof / test,
        # the proof obligations, unresolved conditions and review evidence.
        artifacts = ustate.get("artifacts", []) or []
        t["artifact_links"] = {
            role: next((a for a in artifacts if role in str(a).lower()), "")
            for role in ("spec", "impl", "proof", "test")
        }
        t["obligations"] = list(st.MECHANICAL_AXES) + (
            ["PROOF_CROSS_LAW"] if t.get("dependency_ids") else [])
        t["evidence_refs"] = [
            r.get("evidence_ref", "") for r in evidence["records"].get(t["normative_id"], [])
            if r.get("evidence_ref")
        ]
    payload = {
        "tool": "scripts/ci/task_queue.py",
        "schema": "normative-queue-v2",
        "inventory_snapshot_date": inv.get("snapshot_date", ""),
        "laws_total": len(laws),
        "units_total": len(tasks),
        "coverage_stats": coverage_stats,
        "status_vocabulary": list(st.STATUSES),
        "mechanical_axes": list(st.MECHANICAL_AXES),
        "tasks": tasks,
    }
    st.prune_defaults(state, evidence)
    if state["units"] != original_units:
        st.save_state(state)
    if not st.EVIDENCE_PATH.exists():
        st.save_evidence(evidence)
    return payload, state


def write_report(payload: dict) -> str:
    counts = {s: 0 for s in st.STATUSES}
    for t in payload["tasks"]:
        counts[t["status"]] = counts.get(t["status"], 0) + 1
    unresolved = sum(1 for t in payload["tasks"] if t["unresolved_conditions"])
    lines = [
        "# Persistent normative task queue (machine-generated)",
        "",
        "Do not hand-edit. Regenerate: `python scripts/ci/task_queue.py`.",
        "",
        "Every pinned provision (本則 / 附則 / 別表) is decomposed into",
        "position-tracked normative units. A numeric match, a file name or a",
        "theorem-name string can never make a unit verified; status is derived",
        "only from recorded evidence in `data/verification_evidence.json`.",
        "",
        f"- inventory snapshot: {payload['inventory_snapshot_date']}",
        f"- laws in inventory: {payload['laws_total']}",
        f"- normative work units: {payload['units_total']}",
        f"- units with unresolved conditions: {unresolved}",
        f"- provisions mechanically reconstructed: "
        f"{payload.get('coverage_stats', {}).get('reconstructed', 0)}"
        f"/{payload.get('coverage_stats', {}).get('provisions', 0)}",
        "",
        "## Status counts (distinct axes — not a completion claim)",
        "",
        "| status | units |",
        "|---|---:|",
    ]
    lines += [f"| {s} | {counts[s]} |" for s in st.STATUSES]
    lines += [
        "",
        "## Verification axes required for FULLY_VERIFIED",
        "",
        ", ".join(st.MECHANICAL_AXES),
        "",
        "Conditional (only when resolved dependencies exist): PROOF_CROSS_LAW.",
        "Human legal review is a separate axis (`LEGAL_REVIEW_PENDING` by default).",
        "Coverage audit is mechanical only: `MECHANICAL_COVERAGE_ONLY_NOT_SEMANTIC_AUDIT`.",
        "",
        "The machine-readable projection is `build/task_queue.json` (derived).",
        "Durable ownership/status/blockers are in `data/task_state.json`.",
        "",
    ]
    return "\n".join(lines)


def main() -> int:
    law_filter = ""
    if "--law-id" in sys.argv:
        i = sys.argv.index("--law-id")
        law_filter = sys.argv[i + 1] if i + 1 < len(sys.argv) else ""
    payload, _state = build_queue(law_filter)
    text = json.dumps(payload, ensure_ascii=False, separators=(",", ":"))
    OUT_JSON.parent.mkdir(parents=True, exist_ok=True)
    deterministic = OUT_JSON.exists() and OUT_JSON.read_text(encoding="utf-8") == text
    OUT_JSON.write_text(text, encoding="utf-8")
    report = write_report(payload)
    OUT_MD.parent.mkdir(parents=True, exist_ok=True)
    OUT_MD.write_text(report, encoding="utf-8")
    print(f"task queue: {payload['units_total']} units across {payload['laws_total']} laws "
          f"(deterministic projection: {deterministic})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
