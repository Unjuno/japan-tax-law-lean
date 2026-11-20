#!/usr/bin/env python3
"""Persistent, collision-free, norm-unit task queue (Objective §1).

Generates one durable work unit per *normative unit* of every pinned legal
provision.  Unlike the previous article-level queue, this module:

  * builds collision-resistant norm ids from law id, revision id,
    main/supplementary/appendix provenance, article/paragraph/item/subitem,
    appendix-table cell, unit index, kind and a content hash;
  * decomposes each provision into normative units (conditions, legal effects,
    exceptions, deeming, presumptions, delegations, reading substitutions,
    references) and records UNRESOLVED for text it cannot classify;
  * runs an *independent* coverage audit that the units partition the original
    text exactly;
  * parses dependencies from law names, article numbers and enforcement
    versions in addition to bare 15-digit identifiers;
  * merges a durable overlay keyed by norm id so status, ownership, blockers
    and artifacts survive regeneration and session restart;
  * derives a five-valued status instead of a single boolean.

Human legal review is a separate axis and is never auto-satisfied.

Regenerate with `python scripts/ci/task_queue.py`.
"""
from __future__ import annotations

import importlib.util
import json
import re
import sys
from pathlib import Path

from norm_identity import (
    ALL_OBLIGATIONS, EFFECT, LEGAL_REVIEW_OBLIGATION, NOT_STARTED,
    PENDING_HUMAN, SATISFIED, SKIPPED, TECHNICAL_OBLIGATIONS, UNRESOLVED,
    apply_overlay, decompose, derive_status, evidence, extract_dependencies,
    load_state, norm, overlay_from_units, save_state, sha256_text,
    verify_coverage,
)

REPO = Path(__file__).resolve().parents[2]
INVENTORY = REPO / "data" / "INVENTORY.json"
SWEEP = REPO / "build" / "audit_sweep.json"
AUDIT = REPO / "scripts" / "ci" / "transcription_audit.py"
OUT_JSON = REPO / "build" / "task_queue.json"
STATE = REPO / "state" / "norm_task_state.json"
OUT_MD = REPO / "docs" / "TASK_QUEUE.md"

NORM_BEARING_TAGS = ("Paragraph", "Item", "SubItem", "TableRow")


# ---------------------------------------------------------------------------
# Pinned-JSON tree helpers
# ---------------------------------------------------------------------------
def flat(node) -> str:
    if isinstance(node, str):
        return node
    if isinstance(node, dict):
        return "".join(flat(c) for c in node.get("children", []))
    if isinstance(node, list):
        return "".join(flat(c) for c in node)
    return ""


def attr_num(node) -> str:
    return norm(str((node.get("attr") or {}).get("Num", "")))


def _has_any_tag(node) -> bool:
    """True if the subtree contains any tagged e-Gov node."""
    if isinstance(node, list):
        return any(_has_any_tag(c) for c in node)
    if isinstance(node, dict):
        if "tag" in node:
            return True
        return any(_has_any_tag(c) for c in node.get("children", []))
    return False


def own_text(node) -> str:
    """Only text attached directly to this node, never a tagged child's text.

    e-Gov JSON wraps sentences in arbitrary tagged containers (Sentence,
    TableColumn, QuoteStruct, ...). A single rule — emit only untagged child
    subtrees — avoids both duplication and omission, and makes the offsets and
    the independent coverage audit exact for every wrapper shape.
    """
    parts = []
    for c in node.get("children", []):
        if isinstance(c, (dict, list)) and _has_any_tag(c):
            continue
        parts.append(flat(c))
    return "".join(parts)


def article_title(node) -> str:
    for c in node.get("children", []):
        if isinstance(c, dict) and c.get("tag") == "ArticleTitle":
            return norm(flat(c))
    return ""


def article_body_text(node) -> str:
    """Full article text in document order with only the title removed."""
    parts = []
    for c in node.get("children", []):
        if isinstance(c, dict) and c.get("tag") == "ArticleTitle":
            continue
        parts.append(flat(c))
    return norm("".join(parts))


def iter_articles(node, path=(), counters=None):
    """Yield (path, article) with indexed section and article ordinals.

    A law can contain several 附則 (Supplementary provisions), each with its
    own 第一条. Section index + article ordinal are part of the path so norm
    ids cannot collide across amendment sections.
    """
    if counters is None:
        counters = {}
    if isinstance(node, dict):
        tag = node.get("tag")
        label = {
            "MainProvision": "Main",
            "SupplProvision": "Supplementary",
            "AppdxTable": "AppdxTable",
        }.get(tag)
        if label:
            counters[label] = counters.get(label, 0) + 1
            path = path + ("%s#%d" % (label, counters[label]),)
        if tag == "Article":
            key = label or "Main"
            counters[key + "_article"] = counters.get(key + "_article", 0) + 1
            yield path + ("Article#%d" % counters[key + "_article"],), node
            return
        for c in node.get("children", []):
            yield from iter_articles(c, path, counters)
    elif isinstance(node, list):
        for c in node:
            yield from iter_articles(c, path, counters)


def iter_appendix_rows(node, path=(), counters=None):
    """Yield appendix table rows with a stable, section-indexed cell locator."""
    if counters is None:
        counters = {}
    if isinstance(node, dict):
        tag = node.get("tag")
        if tag == "AppdxTable":
            counters["AppdxTable"] = counters.get("AppdxTable", 0) + 1
            path = path + ("AppdxTable#%d" % counters["AppdxTable"],)
        if tag == "TableRow":
            counters["row"] = counters.get("row", 0) + 1
            yield path + ("TableRow#%d" % counters["row"],), node
            return
        for c in node.get("children", []):
            yield from iter_appendix_rows(c, path, counters)
    elif isinstance(node, list):
        for c in node:
            yield from iter_appendix_rows(c, path, counters)


def _walk_article(node, *, law_id, rev, kind, article_no, path=(), table_cell=""):
    """Yield normative units from an article, preserving exact locality."""
    provision_path = "/".join(path)

    def visit(n, p="", it="", sub="", cell=table_cell):
        if not isinstance(n, dict):
            return
        tag = n.get("tag")
        if tag == "ArticleTitle":
            return
        if tag == "Paragraph":
            p = attr_num(n)
        elif tag == "Item":
            if not it:
                it = attr_num(n)
            elif not sub:
                sub = attr_num(n)
        elif tag == "SubItem":
            sub = attr_num(n)
        elif tag == "TableRow":
            cell = attr_num(n) or cell

        # Emit text strictly in document order: accumulate untagged children,
        # flush before each tagged child, then recurse into that child. This
        # makes the concatenation of unit texts equal the pinned article body
        # for any wrapper shape (Sentence, TableColumn, QuoteStruct, ...).
        buf = []

        def emit():
            if not buf:
                return []
            return decompose(
                "".join(buf), law_id=law_id, revision_id=rev,
                provision_kind=kind, article_no=article_no,
                paragraph_no=p, item_no=it, subitem_no=sub,
                table_cell=cell, provision_path=provision_path,
            )

        for c in n.get("children", []):
            if isinstance(c, (dict, list)) and _has_any_tag(c):
                for u in emit():
                    u["title"] = ""
                    yield u
                buf.clear()
                yield from visit(c, p, it, sub, cell)
            else:
                buf.append(flat(c))
        for u in emit():
            u["title"] = ""
            yield u

    yield from visit(node)


# ---------------------------------------------------------------------------
# Pinned needles (fidelity evidence) — one signal, never sufficient alone
# ---------------------------------------------------------------------------
def pinned_needles():
    spec = importlib.util.spec_from_file_location("tq_ta", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    out = {}
    for _name, law_id, _kind, _art, needles in mod.checks():
        out.setdefault(law_id, []).extend(needles)
    return out


def compact_coverage(cov: dict) -> dict:
    """Keep the audit verdict and a bounded diagnostic, not verbose hashes."""
    return {
        "covered": bool(cov.get("covered")),
        "problems": (cov.get("problems") or [])[:10],
        "original_sha256": cov.get("original_sha256", ""),
        "unit_count": cov.get("unit_count", 0),
        "body_match": cov.get("body_match"),
    }


def law_index(laws) -> dict:
    idx = {}
    for law in laws:
        if law.get("official_title"):
            idx[law["official_title"]] = law["law_id"]
        if law.get("law_num"):
            idx[law["law_num"]] = law["law_id"]
    return idx


# ---------------------------------------------------------------------------
# Generation
# ---------------------------------------------------------------------------
def generate_units(only_laws=None):
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    laws = inv.get("laws", [])
    index = law_index(laws)
    needles = pinned_needles()
    generated = []
    law_reports = []

    for law in laws:
        law_id = law["law_id"]
        if only_laws is not None and law_id not in only_laws:
            continue
        rev = (law.get("current_revision") or {}).get("law_revision_id", "")
        sf = (law.get("raw_snapshot") or {}).get("source_file")
        if not sf or not (REPO / sf).exists():
            continue
        doc = json.loads((REPO / sf).read_text(encoding="utf-8"))
        root = doc.get("law_full_text")
        law_needles = [norm(n) for n in needles.get(law_id, []) if n]
        n_units = 0
        n_unresolved = 0
        n_coverage_fail = 0

        # Main and Supplementary articles
        for path, node in iter_articles(root):
            parts = [p for p in path if p.startswith(("Main#", "Supplementary#", "AppdxTable#"))]
            kind = parts[0].split("#")[0] if parts else "Main"
            article_no = attr_num(node)
            if not article_no:
                continue
            units = list(_walk_article(
                node, law_id=law_id, rev=rev, kind=kind, article_no=article_no,
                path=path,
            ))
            for u in units:
                u["path"] = "/".join(path)
                u["article_title"] = article_title(node)
                u["source_file"] = sf
            # Rebase each unit's offsets from its own fragment onto the whole
            # article body. Without this, units from different paragraphs each
            # start at offset 0 and the partition audit sees false overlaps.
            base = 0
            fragment_end = 0
            for u in units:
                a, b = u["char_start"], u["char_end"]
                if a == 0:  # first unit of a new source fragment
                    base = fragment_end
                u["char_start"] = base + a
                u["char_end"] = base + b
                fragment_end = max(fragment_end, base + b)

            # Independent coverage audit: the original body is taken from the
            # pinned JSON in document order (title removed), NOT from the units.
            body = article_body_text(node)
            cov = (
                verify_coverage(body, units) if units
                else {"covered": False, "problems": ["no norm units generated"],
                      "original_sha256": sha256_text(body), "unit_count": 0}
            )
            joined = norm("".join(u["text"] for u in units))
            cov["body_match"] = (joined == body)
            cov["body_sha256"] = sha256_text(body)
            cov["covered"] = bool(cov.get("covered")) and cov["body_match"]
            cov = compact_coverage(cov)
            if not cov["covered"]:
                n_coverage_fail += 1
            for u in units:
                u["coverage_evidence"] = cov
                finalize_unit(u, law, law_needles, index, sf)
            generated.extend(units)
            n_units += len(units)
            n_unresolved += sum(1 for u in units if u["kind"] == UNRESOLVED)

        # Appendix tables: one cell locator per row.
        for row_index, (path, row) in enumerate(iter_appendix_rows(root)):
            text = norm(flat(row))
            if not text:
                continue
            cell = attr_num(row) or str(row_index + 1)
            units = decompose(
                text, law_id=law_id, revision_id=rev, provision_kind="AppdxTable",
                article_no="", paragraph_no="", item_no="", subitem_no="",
                table_cell=cell, provision_path="/".join(path),
            )
            cov = compact_coverage(verify_coverage(text, units))
            for u in units:
                u["path"] = "/".join(path)
                u["article_title"] = ""
                u["article_no"] = "(appdx)"
                u["source_file"] = sf
                u["coverage_evidence"] = cov
                finalize_unit(u, law, law_needles, index, sf)
            generated.extend(units)
            n_units += len(units)
            n_unresolved += sum(1 for u in units if u["kind"] == UNRESOLVED)
            if not cov["covered"]:
                n_coverage_fail += 1

        law_reports.append({
            "law_id": law_id,
            "official_title": law.get("official_title", ""),
            "revision": rev,
            "norm_units": n_units,
            "unresolved_units": n_unresolved,
            "coverage_failures": n_coverage_fail,
        })

    return generated, law_reports, inv


def finalize_unit(unit, law, law_needles, index, sf):
    """Attach dependencies, evidence, status and obligation records."""
    unit["law_title"] = law.get("official_title", "")
    text = unit["text"]
    unit["dependencies"] = extract_dependencies(text, index)
    # Internal dependencies are resolved at law level; article/version channels
    # are retained in `dependencies` for the SOURCE agent to bind precisely.
    unit["dependency_law_ids"] = sorted(set(
        unit["dependencies"]["law_id_bound_by_title"]
        + unit["dependencies"]["law_id_15digit"]
    ))
    unit["dependency_norm_ids"] = []

    hits = [n for n in law_needles if n and n in text]
    unit["pinned_needles"] = hits

    cov = unit.get("coverage_evidence", {})
    locator_ok = bool(
        unit.get("source_file") and unit.get("char_start") is not None
        and unit.get("char_end") is not None and unit.get("source_sha256")
    )
    structure_ok = bool(
        unit.get("law_id") and unit.get("revision_id")
        and (unit.get("article_no") or unit.get("table_cell"))
        and unit.get("provision_kind")
    )
    ev = {}
    ev["source_locator_fixed"] = evidence(
        SATISFIED if locator_ok else "UNSATISFIED",
        source_file=sf, char_start=unit["char_start"], char_end=unit["char_end"],
        source_sha256=unit["source_sha256"],
    )
    ev["structure_identified"] = evidence(
        SATISFIED if structure_ok else "UNSATISFIED",
        provision_kind=unit["provision_kind"], article_no=unit["article_no"],
        paragraph_no=unit["paragraph_no"], item_no=unit["item_no"],
        subitem_no=unit["subitem_no"], table_cell=unit["table_cell"],
    )
    ev["norm_decomposed"] = evidence(
        "UNSATISFIED" if unit["kind"] == UNRESOLVED else SATISFIED,
        kind=unit["kind"], secondary_kinds=unit["secondary_kinds"],
    )
    ev["coverage_audited"] = evidence(
        SATISFIED if cov.get("covered") else "UNSATISFIED",
        coverage=cov,
    )
    ev["fidelity_pinned_needle"] = evidence(
        SATISFIED if hits else SKIPPED,
        needles=hits,
        note="SKIPPED is not PASS: no pinned needle covers this unit",
    )
    for obligation in (
        "independent_spec", "implementation_linked", "proof_obligations_defined",
        "kernel_proof_checked", "boundary_tests_recorded",
        "adversarial_audit_recorded", "unhandled_conditions_disclosed",
    ):
        ev[obligation] = evidence("UNSATISFIED", note="no recorded evidence yet")
    ev[LEGAL_REVIEW_OBLIGATION] = evidence(
        PENDING_HUMAN, note="human legal review is a separate axis"
    )
    # Keep only compact states in the generated unit. Detailed evidence is
    # recomputed by article_obligations.py from the evidence/ artifacts, and
    # the durable overlay stores only units whose state actually changed.
    unit["evidence_states"] = {k: v["state"] for k, v in ev.items()}
    unit["obligations"] = list(ALL_OBLIGATIONS)
    unit["status"] = derive_status({"evidence": ev})
    unit["owner"] = ""
    unit["branch"] = ""
    unit["pr"] = ""
    unit["blocker"] = ""
    unit["artifacts"] = {}


def write_markdown(payload, law_reports, state, generated):
    by_status = {s: 0 for s in ("NOT_STARTED", "PARTIAL", "PROVED_SCOPE",
                                "FULLY_VERIFIED", "BLOCKED")}
    by_kind = {}
    for u in generated:
        st = u["status"]
        by_status[st] = by_status.get(st, 0) + 1
        by_kind[u["kind"]] = by_kind.get(u["kind"], 0) + 1
    unresolved = by_kind.get("UNRESOLVED_NORM", 0)
    cov_fail = sum(1 for u in generated if not u["coverage_evidence"].get("covered"))
    lines = [
        "# Norm-unit task queue (machine-generated)",
        "",
        "Do not hand-edit. Regenerate with `python scripts/ci/task_queue.py`.",
        "",
        "Objective §1: every normative unit of every pinned provision is a",
        "durable work unit with a collision-free id, exact source locator,",
        "independent decomposition, dependency channels and a five-valued status.",
        "Human legal review is a separate axis and is never auto-satisfied.",
        "",
        "## Totals",
        "",
        f"- laws in inventory: {payload['laws_total']}",
        f"- law snapshots with provisions: {len(law_reports)}",
        f"- norm units generated: {payload['units_total']}",
        f"- unresolved norm units: {unresolved}",
        f"- units failing independent coverage audit: {cov_fail}",
        f"- persisted state records: {len(state.get('records', {}))}",
        f"- orphaned state records (source redesigned): {len(state.get('orphaned_norm_ids', []))}",
        "",
        "## Status distribution (distinct states, not a completion percentage)",
        "",
        "| status | units |",
        "|---|---:|",
    ]
    for st, n in by_status.items():
        lines.append(f"| {st} | {n} |")
    lines += [
        "",
        "## Norm-unit kinds",
        "",
        "| kind | units |",
        "|---|---:|",
    ]
    for k, n in sorted(by_kind.items()):
        lines.append(f"| {k} | {n} |")
    lines += [
        "",
        "## Status vocabulary and completion rule",
        "",
        "- `NOT_STARTED`: no obligation satisfied.",
        "- `PARTIAL`: at least one technical obligation satisfied, but not all.",
        "- `PROVED_SCOPE`: all technical obligations satisfied, human review pending.",
        "- `FULLY_VERIFIED`: all technical obligations AND recorded human legal review.",
        "- `BLOCKED`: an explicit blocker is recorded (e.g. source changed).",
        "",
        "A numeric needle match, a file's existence or a theorem-name string match",
        "alone can never produce `FULLY_VERIFIED`. `SKIPPED` is never counted as PASS.",
        "",
        "## Sample units (first 20 by generation order)",
        "",
        "| norm_id | law_id | article | kind | status |",
        "|---|---|---|---|---|",
    ]
    for u in generated[:20]:
        lines.append(
            f"| `{u['norm_id']}` | {u['law_id']} | {u['article_no'] or u['table_cell']} "
            f"| {u['kind']} | {u['status']} |"
        )
    lines.append("")
    OUT_MD.write_text("\n".join(lines), encoding="utf-8")


def main() -> int:
    generated, law_reports, inv = generate_units()
    state = load_state(STATE)
    apply_overlay(generated, state)
    for unit in generated:
        unit["status"] = derive_status(unit)
    state = overlay_from_units(generated, state)
    save_state(STATE, state)

    # The queue file is a compact manifest, not a 370k-unit dump. Units are
    # regenerated deterministically from pinned snapshots by consumers
    # (task_selector.py, article_obligations.py) and merged with the durable
    # state overlay. This keeps a regeneration cheap and the git-tracked state
    # small while preserving all work.
    status_counts = {}
    kind_counts = {}
    for u in generated:
        status_counts[u["status"]] = status_counts.get(u["status"], 0) + 1
        kind_counts[u["kind"]] = kind_counts.get(u["kind"], 0) + 1
    payload = {
        "tool": "scripts/ci/task_queue.py",
        "schema": "norm-unit-queue/2",
        "inventory_snapshot_date": inv.get("snapshot_date", ""),
        "laws_total": len(inv.get("laws", [])),
        "units_total": len(generated),
        "obligations": list(ALL_OBLIGATIONS),
        "state_file": "state/norm_task_state.json",
        "status_counts": status_counts,
        "kind_counts": kind_counts,
        "unresolved_units": kind_counts.get("UNRESOLVED_NORM", 0),
        "coverage_failures": sum(
            1 for u in generated if not u["coverage_evidence"].get("covered")
        ),
        "persisted_state_records": len(state["records"]),
        "law_reports": law_reports,
    }
    OUT_JSON.parent.mkdir(parents=True, exist_ok=True)
    OUT_JSON.write_text(
        json.dumps(payload, ensure_ascii=False, separators=(",", ":")),
        encoding="utf-8",
    )
    write_markdown(payload, law_reports, state, generated)
    unresolved = sum(1 for u in generated if u["kind"] == UNRESOLVED)
    cov_fail = sum(1 for u in generated if not u["coverage_evidence"].get("covered"))
    print(
        "norm-unit queue: %d units across %d law snapshots; unresolved=%d; "
        "coverage_failures=%d; persisted_records=%d"
        % (len(generated), len(law_reports), unresolved, cov_fail, len(state["records"]))
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
