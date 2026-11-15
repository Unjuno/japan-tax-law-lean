"""In-memory model of an e-Gov standard-format statute (JSON tree).

The raw source JSON (law_full_text) is a tagged tree:
    {"tag": "Article", "attr": {"Num": "2"}, "children": [...]}
with leaf text carried as plain strings in children lists.

This module builds typed records used by the audit rules and keeps, for every
record, a stable location string (scope path + line in a canonical text
rendering) so findings can cite positions.
"""

from __future__ import annotations

import hashlib
import json
import re
from dataclasses import dataclass, field
from pathlib import Path


def text_of(node) -> str:
    """Concatenate all descendant leaf strings."""
    if isinstance(node, str):
        return node
    if not isinstance(node, dict):
        return ""
    return "".join(text_of(c) for c in node.get("children", []))


def children_of(node, tag):
    return [c for c in node.get("children", []) if isinstance(c, dict) and c.get("tag") == tag]


def find_all(node, tag):
    """Yield all descendant (including self) dicts with the given tag."""
    if not isinstance(node, dict):
        return
    if node.get("tag") == tag:
        yield node
    for c in node.get("children", []):
        if isinstance(c, dict):
            yield from find_all(c, tag)


_SENTENCE_TRIM = re.compile(r"\s+")


def clean_text(node) -> str:
    return _SENTENCE_TRIM.sub("", text_of(node))


@dataclass
class ItemRec:
    num: str            # raw attr, e.g. '3', '12', '3_2' or '1:4' (deleted range)
    level: int          # 0=Item, 1=Subitem1, 2=Subitem2, 3=Subitem3, 4=Subitem4
    title: str          # 一, 二 ...
    text: str
    line: int
    deleted: bool = False
    keys: list = field(default_factory=list)   # expanded (int, branch|None) keys
    parent: str | None = None   # raw num of the directly enclosing item (None at level 0)


@dataclass
class ParagraphRec:
    num: str | None     # attr Num as string; None if absent
    text: str
    caption: str | None
    items: list[ItemRec]
    line: int


@dataclass(frozen=True)
class ArticleKey:
    integer: int
    branch: tuple | None  # 枝番号 chain: (5,) の五, (5, 2) の五の二

    def sort_key(self):
        return (self.integer, () if not self.branch else tuple(self.branch))

    def label(self):
        if not self.branch:
            return str(self.integer)
        return f"{self.integer}_" + "_".join(str(b) for b in self.branch)


@dataclass
class ArticleRec:
    scope: str                  # 'MAIN' or 'SP:<n>' (n = SupplProvision attr Num or 'idx-<k>')
    num_attr: str               # raw Article attr Num, e.g. '2', '8_2', '96:101'
    keys: list[ArticleKey]      # expanded (deleted ranges expand to many)
    deleted: bool
    caption: str | None
    title: str                  # e.g. 第二条
    paragraphs: list[ParagraphRec]
    text: str
    line: int
    path: str                   # human readable location, e.g. MAIN/Chapter 2/Article 12
    context: dict | None = None # part/division/chapter/subsection/section nums
    ref_text: str = ""          # scannable text: Paragraph children only (titles/captions excluded)


@dataclass
class ScopeRec:
    name: str
    articles: list[ArticleRec] = field(default_factory=list)


@dataclass
class TocRangeRec:
    kind: str           # TOCChapter / TOCSection / TOCPart
    num: str
    range_text: str
    line: int
    context: dict | None = None  # enclosing TOCPart/Division/Chapter/Section nums


@dataclass
class LawDoc:
    path: Path
    raw_bytes: bytes
    sha256: str
    law_id: str
    law_num: str
    law_title: str
    revision_info: dict
    law_info: dict
    root: dict
    scopes: list[ScopeRec]
    toc_ranges: list[TocRangeRec]
    lines: list[str]             # canonical rendering, 1-indexed via line+1? we use 0-index internally
    findings_line_of: dict       # not used; placeholder kept minimal

    @property
    def main(self) -> ScopeRec:
        return next(s for s in self.scopes if s.name == "MAIN")

    def iter_articles(self):
        for s in self.scopes:
            yield from s.articles

    def article_index(self):
        """scope -> {integer: [ArticleRec]} for existence checks."""
        idx = {}
        for s in self.scopes:
            idx[s.name] = {}
            for a in s.articles:
                for k in a.keys:
                    idx[s.name].setdefault(k.integer, []).append(a)
        return idx


def _parse_item_num(num_attr: str) -> tuple[bool, list]:
    """Expand an item/subitem attr Num.

    '3'     -> (False, [(3, None)])
    '33_2'  -> (False, [(33, 2)])
    '1:4'   -> (True,  [(1, None), (2, None), (3, None), (4, None)])   # deleted range
    '3_2:4' -> (True,  [(3, 2), (4, None)])                             # deleted range w/ branch start
    '6:8_2' -> (True,  [(6, None), (7, None), (8, None), (8, 2)])       # deleted range w/ branch end
    """
    num_attr = num_attr.strip()

    def parse_part(x):
        parts = x.split("_")
        return int(parts[0]), (tuple(int(q) for q in parts[1:]) or None)

    if ":" not in num_attr:
        integer, branch = parse_part(num_attr)
        return False, [(integer, branch)]
    start_s, end_s = num_attr.split(":", 1)
    si, sb = parse_part(start_s)
    ei, eb = parse_part(end_s)
    keys = []
    for i in range(si, ei + 1):
        keys.append((i, None))
    if sb is not None:
        keys[0] = (si, sb)
    if eb is not None:
        keys.append((ei, eb))
    return True, keys


def _parse_article_num(num_attr: str) -> list[ArticleKey]:
    """Expand Article attr Num into one or more keys.

    '2'        -> [ArticleKey(2, None)]
    '8_2'      -> [ArticleKey(8, 2)]
    '96:101'   -> [ArticleKey(96, None), ..., ArticleKey(101, None)]  (deleted range)
    '71_23:71_24' -> [ArticleKey(71, (23,)), ArticleKey(71, (24,))]   (branch range, sane when both ints equal)
    '485_7:485_12' -> [ArticleKey(485, (7,)), ..., ArticleKey(485, (12,))]

    e-Gov notation アニメ削除は原文中の単一の削除標記であり、数値の連続ではない。
    前後の条文を結ぶために枝番号内の範囲展開のみを正規に行い、整数部が異なる場合や
    枝番号の解釈が難しい場合は端点のみを返す（推測で展開しない）。
    """
    num_attr = num_attr.strip()
    if ":" in num_attr:
        a, b = num_attr.split(":", 1)

        def parse_part(x):
            parts = x.split("_")
            integer = int(parts[0])
            branch = tuple(int(q) for q in parts[1:]) or None
            return integer, branch

        si, sb = parse_part(a)
        ei, eb = parse_part(b)
        if si == ei:
            if sb is not None and eb is not None and len(sb) == len(eb) == 1:
                return [ArticleKey(si, (bb,)) for bb in range(sb[0], eb[0] + 1)]
            return [ArticleKey(si, sb), ArticleKey(ei, eb)]
        # 整数部をまたぐ場合は端点のみ（安全側）。ギャップ監査は STRUCT.GAP が別途担う。
        if eb is None:
            return [ArticleKey(i, None) for i in range(si, ei + 1)]
        if sb is None:
            return [ArticleKey(si, None), ArticleKey(ei, eb)]
        return [ArticleKey(si, sb), ArticleKey(ei, eb)]
    parts = num_attr.split("_")
    integer = int(parts[0])
    branch = tuple(int(q) for q in parts[1:]) or None
    return [ArticleKey(integer, branch)]


def _is_deleted_article(paragraphs: list[ParagraphRec], has_items: bool) -> bool:
    if has_items:
        return False
    joined = "".join(p.text for p in paragraphs).strip()
    if not joined:
        return False
    return joined.endswith("削除") and len(joined) <= 40


class _LineBuilder:
    def __init__(self):
        self.lines: list[str] = []

    def add(self, text: str) -> int:
        self.lines.append(text)
        return len(self.lines)  # 1-based line number


def load_law(path: str | Path) -> LawDoc:
    path = Path(path)
    raw = path.read_bytes()
    sha = hashlib.sha256(raw).hexdigest().upper()
    data = json.loads(raw)
    info = data["law_info"]
    rev = data["revision_info"]
    root = data["law_full_text"]

    builder = _LineBuilder()
    scopes: list[ScopeRec] = []
    toc_ranges: list[TocRangeRec] = []

    body = next(c for c in root.get("children", []) if c.get("tag") == "LawBody")

    def walk_toc(node, kind, depth=0, ctx=None):
        if not isinstance(node, dict):
            return
        t = node.get("tag")
        ctx = dict(ctx or {})
        if t in ("TOCPart", "TOCDivision", "TOCChapter", "TOCSection", "TOCArticle"):
            num = str(node.get("attr", {}).get("Num", ""))
            if t == "TOCPart":
                ctx["part"] = num
            elif t == "TOCDivision":
                ctx["division"] = num
            elif t == "TOCChapter":
                ctx["chapter"] = num
            elif t == "TOCSection":
                ctx["section"] = num
            rng = None
            has_children = False
            for c in node.get("children", []):
                if isinstance(c, dict):
                    if c.get("tag") == "ArticleRange":
                        rng = text_of(c)
                    if c.get("tag") in ("TOCPart", "TOCChapter", "TOCSection"):
                        has_children = True
            if rng and not has_children:
                line = builder.add(f"[TOC {t} {num}] {rng}")
                toc_ranges.append(TocRangeRec(t, num, rng, line, dict(ctx)))
            for c in node.get("children", []):
                if isinstance(c, dict):
                    walk_toc(c, None, depth + 1, ctx)

    def add_article(node, scope, ctx):
        num_attr = str(node.get("attr", {}).get("Num", ""))
        keys = _parse_article_num(num_attr)
        caption_node = next(iter(children_of(node, "ArticleCaption")), None)
        caption = text_of(caption_node).strip() if caption_node is not None else None
        title = text_of(next(iter(children_of(node, "ArticleTitle")), {"children": []})).strip()
        paragraphs: list[ParagraphRec] = []
        has_items = False
        item_tags = {"Item": 0, "Subitem1": 1, "Subitem2": 2, "Subitem3": 3, "Subitem4": 4}
        for p in children_of(node, "Paragraph"):
            pnum = str(p.get("attr", {}).get("Num", "")) or None
            pcaption_node = next(iter(children_of(p, "ParagraphCaption")), None)
            pcaption = text_of(pcaption_node).strip() if pcaption_node is not None else None
            ptext = clean_text(p)
            items: list[ItemRec] = []

            def _add_items(current, prefix):
                nonlocal has_items
                for sub in current.get("children", []):
                    if not isinstance(sub, dict):
                        continue
                    tag = sub.get("tag")
                    if tag not in item_tags:
                        _add_items(sub, prefix)
                        continue
                    has_items = True
                    level = item_tags[tag]
                    ititle_node = next(iter(children_of(sub, f"{tag}Title")), None)
                    ititle = text_of(ititle_node).strip() if ititle_node is not None else ""
                    inum = str(sub.get("attr", {}).get("Num", ""))
                    ideleted, ikeys = _parse_item_num(inum)
                    my_key = f"{prefix}.{inum}" if prefix else inum
                    line = builder.add(f"[{scope}] Article {num_attr} Paragraph {pnum} {'  ' * level}{ititle} {clean_text(sub)}")
                    items.append(ItemRec(inum, level, ititle, clean_text(sub), line, ideleted, ikeys, prefix or None))
                    _add_items(sub, my_key)

            _add_items(p, "")
            if not items:
                line = builder.add(f"[{scope}] Article {num_attr} Paragraph {pnum} {ptext}")
            else:
                line = min(i.line for i in items)
            paragraphs.append(ParagraphRec(pnum, ptext, pcaption, items, line))
        if not paragraphs:
            line = builder.add(f"[{scope}] Article {num_attr} {title}")
        else:
            line = min(p.line for p in paragraphs)
        deleted = _is_deleted_article(paragraphs, has_items)
        text = clean_text(node)
        scope_rec = next(s for s in scopes if s.name == scope)
        ref_text = "".join(clean_text(p) for p in children_of(node, "Paragraph"))
        scope_rec.articles.append(
            ArticleRec(scope, num_attr, keys, deleted, caption, title, paragraphs, text, line, f"{scope}/Article {num_attr}", dict(ctx), ref_text)
        )

    def walk_body(node, scope, ctx=None):
        if not isinstance(node, dict):
            return
        t = node.get("tag")
        ctx = dict(ctx or {})
        if t in ("Part", "Division", "Chapter", "Subsection", "Section"):
            ctx[t.lower()] = str(node.get("attr", {}).get("Num", ""))
        if t == "Article":
            add_article(node, scope, ctx)
            return
        if t == "SupplProvision":
            sp_num = str(node.get("attr", {}).get("Num", "")) or f"idx-{len(scopes)}"
            sp_scope = f"SP:{sp_num}"
            scopes.append(ScopeRec(sp_scope))
            builder.add(f"=== SupplProvision {sp_num} ===")
            for c in node.get("children", []):
                walk_body(c, sp_scope, ctx)
            return
        for c in node.get("children", []):
            walk_body(c, scope, ctx)

    # TOC first (for line offsets), then body scopes
    toc = next((c for c in body.get("children", []) if c.get("tag") == "TOC"), None)
    if toc is not None:
        builder.add("[TOC]")
        for c in toc.get("children", []):
            walk_toc(c, None)

    scopes.append(ScopeRec("MAIN"))
    main = next(c for c in body.get("children", []) if c.get("tag") == "MainProvision")
    walk_body(main, "MAIN")
    for c in body.get("children", []):
        if isinstance(c, dict) and c.get("tag") == "SupplProvision":
            walk_body(c, "SP")

    law_title = text_of(next(c for c in body.get("children", []) if c.get("tag") == "LawTitle")).strip()

    return LawDoc(
        path=path, raw_bytes=raw, sha256=sha,
        law_id=str(info.get("law_id", "")), law_num=str(info.get("law_num", "")),
        law_title=law_title, revision_info=rev, law_info=info,
        root=root, scopes=scopes, toc_ranges=toc_ranges, lines=builder.lines,
        findings_line_of={},
    )
