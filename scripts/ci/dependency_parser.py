#!/usr/bin/env python3
"""Law/article/enforcement-version-aware dependency parsing (Objective §1 item 6).

A bare 15-character id is only ONE signal and is NEVER a resolved dependency.
A resolved dependency binds: law name, law id, article/paragraph/item number and
the enforced revision/date from the inventory.  Historical references
(改正前/旧法), delegated orders absent from the inventory, and bare ids are kept
as explicitly unresolved categories rather than dropped or silently satisfied.
"""
from __future__ import annotations

import re
from dataclasses import dataclass

# e-Gov ids are 3 digits + 2 uppercase letters + 10 digits; older ledgers use a
# 15-digit bare number. Both are accepted, both remain unresolved on their own.
LAW_ID_RE = re.compile(r"(?<![0-9A-Z])(?:\d{3}[A-Z]{2}\d{10}|\d{15})(?![0-9A-Z])")
_NUM = r"[0-9０-９〇零一二三四五六七八九十百千]"
ARTICLE_RE = re.compile(rf"第({_NUM}+)(?:の({_NUM}+))?条")
PARA_RE = re.compile(rf"第({_NUM}+)項")
ITEM_RE = re.compile(rf"第({_NUM}+)号")
LAW_NAME_RE = re.compile(
    r"([\u4e00-\u9fffA-Za-z0-9]{2,28}?(?:施行令|施行規則|法律|条例|規則|通達|条約|令|法))"
)

RELATION_CUES = (
    ("QUASI_APPLICATION", ("準用", "例による")),
    ("READING_SUBSTITUTION", ("読み替え", "読替え")),
    ("DELEGATION", ("政令で定める", "省令で定める", "内閣府令で定める", "大臣が定める", "条例で定める")),
    ("AMENDMENT", ("改正", "削除", "附則")),
    ("REFERENCE", ("この法律", "に規定する", "に基づき", "適用する")),
)


@dataclass
class Dependency:
    raw: str
    law_name: str = ""
    law_id: str = ""
    article_no: str = ""
    paragraph_no: str = ""
    item_no: str = ""
    revision_id: str = ""
    enforcement_date: str = ""
    relation: str = "REFERENCE"
    resolution: str = "UNRESOLVED"
    note: str = ""

    @property
    def resolved(self) -> bool:
        return self.resolution == "RESOLVED_IN_LEDGER"

    def as_dict(self) -> dict:
        return {
            "raw": self.raw, "law_name": self.law_name, "law_id": self.law_id,
            "article_no": self.article_no, "paragraph_no": self.paragraph_no,
            "item_no": self.item_no, "revision_id": self.revision_id,
            "enforcement_date": self.enforcement_date, "relation": self.relation,
            "resolution": self.resolution, "note": self.note,
            "resolved": self.resolved,
        }


def _norm(title: str) -> str:
    return re.sub(r"[\s\u3000]+", "", title)


def _relation_for(fragment: str) -> str:
    for relation, cues in RELATION_CUES:
        if any(cue in fragment for cue in cues):
            return relation
    return "REFERENCE"


def build_title_index(laws: list[dict]) -> dict[str, dict]:
    """Normalized title -> law, with ambiguity recorded for duplicate titles."""
    index: dict[str, dict] = {}
    for law in laws:
        titles = [law.get("official_title", ""),
                  (law.get("current_revision") or {}).get("law_title", "")]
        for title in titles:
            key = _norm(str(title))
            if not key:
                continue
            if key in index and index[key].get("law_id") != law.get("law_id"):
                # Never silently bind an ambiguous title to the first law.
                index[key] = {**index[key], "_ambiguous_title": True}
            else:
                index.setdefault(key, law)
    return index


def _find_law(name: str, laws: list[dict], title_index: dict[str, dict] | None = None) -> dict | None:
    target = _norm(name)
    if not target:
        return None
    if title_index is not None:
        if target in title_index:
            return title_index[target]
        # Longest contained title wins; exact prefix matches are preferred over
        # incidental substrings.
        matches = [t for t in title_index if len(t) >= 3 and t in target]
        if matches:
            return title_index[max(matches, key=len)]
    for law in laws:
        title = _norm(str(law.get("official_title", "")))
        revision_title = _norm(str((law.get("current_revision") or {}).get("law_title", "")))
        if target == title or target == revision_title or (len(target) >= 3 and target in title):
            return law
    return None


def parse_dependencies(text: str, laws: list[dict] | None = None,
                       current_law_id: str = "",
                       title_index: dict[str, dict] | None = None) -> list[Dependency]:
    laws = laws or []
    deps: list[Dependency] = []

    for match in LAW_NAME_RE.finditer(text):
        name = match.group(1)
        tail = text[match.end(): match.end() + 90]
        before = text[max(0, match.start() - 24): match.end()]
        art = ARTICLE_RE.search(tail)
        law = _find_law(name, laws, title_index)
        historical = any(c in before for c in ("改正前", "旧法", "従前"))
        rev = (law or {}).get("current_revision") or {}
        status = str((law or {}).get("current_revision_status", ""))
        if law:
            resolution = "HISTORICAL" if historical else (
                "RESOLVED_IN_LEDGER" if status == "CurrentEnforced" else "UNENFORCED"
            )
            revision_id = str(rev.get("law_revision_id", ""))
            enforcement = "" if historical else str(
                rev.get("amendment_enforcement_date") or rev.get("enforcement_date") or "")
            law_id = str(law.get("law_id", ""))
            note = "ambiguous_law_title" if law.get("_ambiguous_title") else ""
        else:
            resolution = "HISTORICAL" if historical else "UNRESOLVED"
            revision_id = enforcement = law_id = ""
            note = "law_name_not_in_inventory"
        para = PARA_RE.search(tail)
        item = ITEM_RE.search(tail)
        deps.append(Dependency(
            raw=text[match.start(): match.end() + (art.end() if art else 0)],
            law_name=name,
            law_id=law_id,
            article_no=(f"第{art.group(1)}条" + (f"の{art.group(2)}" if art.group(2) else "")) if art else "",
            paragraph_no=f"第{para.group(1)}項" if para else "",
            item_no=f"第{item.group(1)}号" if item else "",
            revision_id=revision_id,
            enforcement_date=enforcement,
            relation=_relation_for(text[max(0, match.start() - 20): match.end() + 40]),
            resolution=resolution,
            note=note,
        ))

    seen = {d.law_id for d in deps if d.law_id}
    for match in LAW_ID_RE.finditer(text):
        ident = match.group(0)
        if ident in seen:
            continue
        in_ledger = any(str(l.get("law_id")) == ident for l in laws)
        deps.append(Dependency(
            raw=ident,
            law_id=ident if in_ledger else "",
            resolution="UNRESOLVED",
            relation="REFERENCE",
            note="bare_id_only" + ("" if in_ledger else "_not_in_ledger"),
        ))
        seen.add(ident)

    for match in re.finditer(r"この(法律|政令|条例)第", text):
        art = ARTICLE_RE.search(text[match.start():])
        if art:
            deps.append(Dependency(
                raw=text[match.start(): match.start() + art.end()],
                law_name="この" + match.group(1),
                law_id=current_law_id,
                article_no=f"第{art.group(1)}条" + (f"の{art.group(2)}" if art.group(2) else ""),
                relation="REFERENCE",
                resolution="SAME_LAW" if current_law_id else "UNRESOLVED",
                note="internal_reference",
            ))

    if any(c in text for c in ("政令で定める", "省令で定める", "内閣府令で定める", "条例で定める")):
        deps.append(Dependency(
            raw="delegated_order", relation="DELEGATION",
            resolution="EXTERNAL_UNVERIFIED", note="delegated_order_not_in_inventory",
        ))
    return deps


def dependencies_satisfied(deps: list[Dependency], completed) -> tuple[bool, list[str]]:
    """Satisfied = ledger-resolved AND completed at the exact law/article/revision.

    `completed` is an iterable of (law_id, article_no, enforcement_date) tuples;
    a plain set of law ids is still accepted for legacy callers, but then the
    coordinate check is deliberately unavailable and a blocker is recorded.
    """
    coordinate_mode = bool(completed) and isinstance(next(iter(completed)), tuple)
    blockers: list[str] = []
    for d in deps:
        if d.resolution == "RESOLVED_IN_LEDGER" and d.law_id:
            if coordinate_mode:
                key = (d.law_id, d.article_no, d.enforcement_date)
                if key not in completed:
                    blockers.append(f"dependency_not_proved_at_coordinates:{key}")
            elif d.law_id not in completed:
                blockers.append(f"{d.law_id}@{d.article_no or '-'}")
        elif d.resolution in ("UNRESOLVED", "UNENFORCED", "EXTERNAL_UNVERIFIED", "HISTORICAL"):
            blockers.append(f"{d.resolution}:{d.raw[:40]}")
    return (not blockers), blockers


if __name__ == "__main__":
    raise SystemExit(0)
