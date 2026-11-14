"""Audit rules. Each rule returns a list of Finding objects.

Classification discipline (docs/METHODOLOGY.md):
  verified-anomaly  -> mechanical structural fact, certain within the pinned source
  candidate         -> possible defect; NOT a legal conclusion; requires human review
  info              -> counted, not assessed
  unsupported       -> rule deliberately not applied; out of scope by design

Nothing here asserts that the statute contains (or lacks) an error.
"""

from __future__ import annotations

import re
from dataclasses import dataclass, field, asdict

from .kansuji import kanji_to_int
from .model import LawDoc, ArticleRec


@dataclass
class Finding:
    rule_id: str
    severity: str            # verified-anomaly | candidate | info | unsupported
    law_id: str
    location: str
    line: int
    message: str
    evidence: str
    classification: str      # model-defect | legal-defect-candidate | tool-limitation | source-version | none

    def to_dict(self):
        return asdict(self)


@dataclass
class AuditStats:
    articles_checked: int = 0
    paragraphs_checked: int = 0
    items_checked: int = 0
    references_extracted: int = 0
    references_internal_checked: int = 0
    references_external_unverified: int = 0
    references_unsupported: int = 0
    findings: list[Finding] = field(default_factory=list)


# ---------- helpers ----------

def all_findings(doc: LawDoc, other_docs: dict[str, LawDoc] | None = None) -> tuple[list[Finding], AuditStats]:
    stats = AuditStats()
    findings: list[Finding] = []
    findings += rule_duplicate_articles(doc)
    findings += rule_article_sequence(doc)
    findings += rule_article_gaps(doc)
    findings += rule_paragraph_item_integrity(doc, stats)
    findings += rule_parentheses(doc, stats)
    findings += rule_references(doc, other_docs or {}, stats)
    findings += rule_toc_ranges(doc)
    findings += rule_deleted_placeholders(doc)
    for f in findings:
        f.law_id = doc.law_id
    stats.findings = findings
    stats.articles_checked = sum(len(s.articles) for s in doc.scopes)
    return findings, stats


def rule_duplicate_articles(doc: LawDoc) -> list[Finding]:
    out = []
    for scope in doc.scopes:
        seen: dict[tuple[int, int | None], ArticleRec] = {}
        for a in scope.articles:
            for k in a.keys:
                if k.sort_key() in seen:
                    prev = seen[k.sort_key()]
                    out.append(Finding(
                        "STRUCT.DUP.ARTICLE", "verified-anomaly", doc.law_id, a.path, a.line,
                        f"Article number {k.label()} appears more than once in scope {scope.name}",
                        f"first: {prev.path} (line {prev.line}); second: {a.path} (line {a.line})",
                        "legal-defect-candidate",
                    ))
                else:
                    seen[k.sort_key()] = a
    return out


def rule_article_sequence(doc: LawDoc) -> list[Finding]:
    """MAIN scope articles should appear in non-decreasing (int, branch) order."""
    out = []
    for scope in doc.scopes:
        keys = [(a.keys[0].sort_key() if a.keys else (0, -1), a) for a in scope.articles]
        for (prev_key, prev), (key, cur) in zip(keys, keys[1:]):
            if key < prev_key:
                out.append(Finding(
                    "STRUCT.SEQ.ARTICLE", "candidate", doc.law_id, cur.path, cur.line,
                    f"Article order decreases in scope {scope.name}: {prev.path} -> {cur.path}",
                    f"{prev.num_attr} (line {prev.line}) then {cur.num_attr} (line {cur.line})",
                    "legal-defect-candidate",
                ))
    return out


def rule_article_gaps(doc: LawDoc) -> list[Finding]:
    """Integer article numbers in MAIN should be gapless (deletions keep placeholders)."""
    out = []
    scope = doc.main
    ints = sorted({k.integer for a in scope.articles for k in a.keys})
    if not ints:
        return out
    missing = [n for n in range(1, max(ints) + 1) if n not in set(ints)]
    if missing:
        out.append(Finding(
            "STRUCT.GAP.ARTICLE", "candidate", doc.law_id, "MAIN", 1,
            f"Missing integer article numbers in MAIN scope: {missing}",
            f"present range 1..{max(ints)}",
            "legal-defect-candidate",
        ))
    return out


def rule_paragraph_item_integrity(doc: LawDoc, stats: AuditStats) -> list[Finding]:
    out = []
    for a in doc.iter_articles():
        for p in a.paragraphs:
            stats.paragraphs_checked += 1
            # paragraph number duplicates within article
            seen_p = {}
            for p2 in a.paragraphs:
                if p2.num is None:
                    continue
                seen_p.setdefault(p2.num, []).append(p2)
            # items: duplicates (verified) and gaps in integer sequence (candidate)
            by_level: dict[int, list] = {}
            for it in p.items:
                by_level.setdefault(it.level, []).append(it)
                stats.items_checked += 1
            for level, items in by_level.items():
                # duplicate check on expanded keys (deleted ranges included)
                seen_key = {}
                for it in items:
                    for key in it.keys:
                        seen_key.setdefault(key, []).append(it)
                for key, group in seen_key.items():
                    distinct = {id(g) for g in group}
                    if len(distinct) > 1:
                        lines = ", ".join(str(i.line) for i in group)
                        out.append(Finding(
                            "STRUCT.DUP.ITEM", "verified-anomaly", doc.law_id, a.path, group[0].line,
                            f"Duplicate item number {key[0]}{''.join('の' + str(b) for b in (key[1] or ()))} (level {level}) in {a.path} paragraph {p.num}",
                            f"lines: {lines}",
                            "legal-defect-candidate",
                        ))
                ints = sorted({k[0] for it in items for k in it.keys})
                if ints:
                    missing = [n for n in range(1, max(ints) + 1) if n not in set(ints)]
                    if missing:
                        out.append(Finding(
                            "STRUCT.GAP.ITEM", "candidate", doc.law_id, a.path, p.line,
                            f"Item numbering gap in {a.path} paragraph {p.num}: missing {missing}",
                            f"present: {ints}",
                            "legal-defect-candidate",
                        ))
                sortkey = lambda k: (k[0], () if not k[1] else k[1])
                for x, y in zip(items, items[1:]):
                    if x.keys and y.keys and sortkey(y.keys[0]) < sortkey(x.keys[-1]):
                        out.append(Finding(
                            "STRUCT.SEQ.ITEM", "candidate", doc.law_id, a.path, y.line,
                            f"Item order decreases in {a.path} paragraph {p.num}: {x.num} -> {y.num}",
                            f"lines {x.line} -> {y.line}",
                            "legal-defect-candidate",
                        ))
        seen_pnum: dict[str, int] = {}
        for p in a.paragraphs:
            if p.num is None:
                continue
            if p.num in seen_pnum:
                out.append(Finding(
                    "STRUCT.DUP.PARAGRAPH", "verified-anomaly", doc.law_id, a.path, p.line,
                    f"Duplicate paragraph number {p.num} in {a.path}",
                    f"first line {seen_pnum[p.num]}; second line {p.line}",
                    "legal-defect-candidate",
                ))
            else:
                seen_pnum[p.num] = p.line
    return out


_LINK_RE = re.compile(r"(?:から|まで|の|を|又は|若しくは|及び|及|並びに|、|・|（|）|「|」|『|』|[0-9０-９]+|[一二三四五六七八九十百千〇零]+)+$")
_PAIRS = {"(": ")", "（": "）", "「": "」", "『": "』", "【": "】"}
_CLOSERS = set(_PAIRS.values())


def _is_link(window: str) -> bool:
    """True when `window` contains only connective particles/numerals/brackets,
    i.e. nothing that would introduce a new antecedent."""
    if not window:
        return True
    return _LINK_RE.fullmatch(window) is not None


def _mask_quoted(text: str) -> str:
    """Replace characters inside 「...」 / 『...』 with a neutral marker.

    Quoted fragments in 読替え (and similar) provisions deliberately carry
    unbalanced brackets; they are literal quotations, not this statute's own
    bracketing. Returns a same-length string where masked chars become '\x00'.
    """
    out = list(text)
    stack = []
    unterminated = []
    unmatched_close = []
    for i, ch in enumerate(text):
        if ch in ("「", "『"):
            stack.append((ch, i))
            out[i] = "\x00"
            continue
        if ch in ("」", "』"):
            expected = "「" if ch == "」" else "『"
            if stack and stack[-1][0] == expected:
                stack.pop()
                out[i] = "\x00"
                continue
            unmatched_close.append((ch, i))
            out[i] = "\x00"
            continue
        if stack:
            out[i] = "\x00"
    unterminated = [(ch, i) for ch, i in stack]
    return "".join(out), unterminated, unmatched_close


def rule_parentheses(doc: LawDoc, stats: AuditStats) -> list[Finding]:
    out = []
    for a in doc.iter_articles():
        stack = []
        masked, unterm, unmatched_close = _mask_quoted(a.text)
        for ch, ioff in unterm:
            out.append(Finding(
                "PAREN.UNBALANCED", "candidate", doc.law_id, a.path, a.line,
                f"Unterminated quote {ch!r} in {a.path}",
                f"offset {ioff} in article text",
                "legal-defect-candidate",
            ))
        for ch, ioff in unmatched_close:
            out.append(Finding(
                "PAREN.UNBALANCED", "candidate", doc.law_id, a.path, a.line,
                f"Unmatched closing quote {ch!r} in {a.path}",
                f"offset {ioff} in article text",
                "legal-defect-candidate",
            ))
        for idx, ch in enumerate(masked):
            if ch in _PAIRS:
                stack.append((ch, idx))
            elif ch in _CLOSERS:
                if not stack:
                    out.append(Finding(
                        "PAREN.UNBALANCED", "candidate", doc.law_id, a.path, a.line,
                        f"Unmatched closing bracket {ch!r} in {a.path}",
                        f"offset {idx} in article text",
                        "legal-defect-candidate",
                    ))
                    continue
                opener, _ = stack.pop()
                if _PAIRS[opener] != ch:
                    out.append(Finding(
                        "PAREN.UNBALANCED", "candidate", doc.law_id, a.path, a.line,
                        f"Mismatched brackets {opener!r} ... {ch!r} in {a.path}",
                        f"offset {idx} in article text",
                        "legal-defect-candidate",
                    ))
        for opener, idx in stack:
            out.append(Finding(
                "PAREN.UNBALANCED", "candidate", doc.law_id, a.path, a.line,
                f"Unclosed bracket {opener!r} in {a.path}",
                f"offset {idx} in article text",
                "legal-defect-candidate",
            ))
    return out


# ---------- references ----------

_K = r"[一二三四五六七八九十百千零〇０-９0-9]+"
ARTICLE_RE = re.compile(rf"第({_K})条(?:の({_K}))?")
PARA_RE = re.compile(rf"第({_K})項")
ITEM_RE = re.compile(rf"第({_K})号(?:の({_K}))?")
BRANCH_TAIL = rf"(?:の{_K})*"
CHAIN_RE = re.compile(
    rf"(附則)?第({_K})条({BRANCH_TAIL})(?:第({_K})項)?(?:第({_K})号(?:の({_K}))?)?"
)
BRANCH_SINGLE = re.compile(rf"の({_K})")
RELATIVE_RE = re.compile(r"(同条|本条|前条|次条|同項|前項)")
SUPP_ARTICLE_RE = re.compile(rf"附則第({_K})条(?:の({_K}))?")
APPENDIX_RE = re.compile(rf"別表(?:第({_K}))?")
LAW_CITATION_RE = re.compile(r"(?:法律|政令|勅令|府令|省令|規則|要領|通達)第[0-9０-９一二三四五六七八九十百千]+号|（(?:明治|大正|昭和|平成|令和)[0-9０-９]+年[^）]{0,40}?第[0-9０-９]+号）")
DELETED_RANGE_NUM_RE = re.compile(r"^(\d+):(\d+)$")

# Law names that, when immediately preceding 第N条, indicate a foreign (non-self) law reference.
KNOWN_LAW_NAMES = [
    "所得税法", "法人税法", "相続税法", "贈与税", "消費税法", "地方税法", "国税通則法",
    "租税特別措置法", "国税徴収法", "印紙税法", "登録免許税法", "関税法", "関税定率法",
    "民法", "商法", "会社法", "不動産登記法", "金融商品取引法", "投資信託及び投資法人に関する法律",
    "法人税法施行令", "所得税法施行令", "所得税法施行規則", "国税通則法施行令", "地方税法施行令",
    "租税特別措置法施行令", "財産評価基本通達", "国税通則法の施行に伴う経過措置",
    "行政手続法", "行政不服審査法", "国税不服審判所法", "行政事件訴訟法", "民事訴訟法",
    "労働基準法", "健康保険法", "国民年金法", "厚生年金保険法", "雇用保険法", "失業保険法",
    "学校教育法", "私立学校法", "児童福祉法", "老人福祉法", "国立学校設置法",
    "地方自治法", "公務員懲戒法", "国家公務員法", "地方公務員法", "国家公務員退職手当法",
    "公益通報者保護法", "独占禁止法", "下請法", "製造物責任法", "景品表示法", "不正競争防止法",
    "著作権法", "特許法", "実用新案法", "意匠法", "商標法", "弁理士法", "行政書士法", "司法書士法",
    "土地収用法", "不動産取得税", "固定資産税", "自動車取得税", "都市計画税",
    "平成十七年", "昭和", "令和",  # era-prefixed law titles in附則 amendments
    "改正法", "旧法", "新法", "改正前", "改正後",
]

SELF_TOKEN_RE = re.compile(
    r"この法律|この政令|この規則|この通達|この附則|この令|本則"
)
# Law-name-like token ending in a law-type suffix, immediately preceding 第N条.
# Stem: kanji, hiragana, katakana, prolonged sound mark, repetition marks,
# fullwidth digits and ASCII digits (covers e.g. 投資事業有限責任組合契約に関する法律).
_CJK_CLASS = r"[\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFF\u3400-\u4DBF\u3005\u30FCヽ0-9０-９一二三四五六七八九十百千]"
LAW_NAME_SUFFIX_RE = re.compile(
    _CJK_CLASS + r"{1,40}(?:施行規則|施行令|法律|政令|勅令|府令|省令|規則|要領|通達|法|令)(?=第)"
)
LAW_CITATION2_RE = re.compile(
    r"(?:法律|政令|勅令|府令|省令|規則|要領|通達)第[0-9０-９一二三四五六七八九十百千]+号|"
    r"（(?:明治|大正|昭和|平成|令和)[0-9０-９]+年[^）]{0,60}?第[0-9０-９]+号）"
)
# Standalone 法 / 令 tokens (not part of a longer law name).
STANDALONE_LAW_RE = re.compile(r"(?<![\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFF\u3400-\u4DBF])法(?=第)")
STANDALONE_ORDER_RE = re.compile(r"(?<![\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFF\u3400-\u4DBF])令(?=第)")
# Carry tokens: these refer back to the law/provision already in effect and do
# not by themselves introduce a new referent.
CARRY_RE = re.compile(r"同法|同令|同規則|同省令|同通達|同条|同項|同号|同各号|前条|次条|本条")
SELF_ACT_NAME = "所得税法"
SELF_ORDER_NAME = "所得税法施行令"


def _classify_law_name(name: str, doc: LawDoc) -> str:
    """Classify a law-name token preceding a reference."""
    if name == SELF_ACT_NAME:
        return "internal" if doc.law_id.startswith("340AC") else "act"
    if name == SELF_ORDER_NAME:
        return "internal" if doc.law_id.startswith("340CO") else "order"
    return "external"


def _switches(doc: LawDoc, sentence: str) -> list:
    """Context-switching events of a sentence: (start, end, cls), left to right."""
    switches = []
    for m in LAW_NAME_SUFFIX_RE.finditer(sentence):
        switches.append((m.start(), m.end(), _classify_law_name(m.group(0), doc)))
    for m in LAW_CITATION2_RE.finditer(sentence):
        switches.append((m.start(), m.end(), "external"))
    for m in SELF_TOKEN_RE.finditer(sentence):
        switches.append((m.start(), m.end(), "internal"))
    if doc.law_id.startswith("340CO"):
        for m in STANDALONE_LAW_RE.finditer(sentence):
            switches.append((m.start(), m.end(), "act"))
    if doc.law_id.startswith("340AC"):
        for m in STANDALONE_ORDER_RE.finditer(sentence):
            switches.append((m.start(), m.end(), "order"))
    switches.sort(key=lambda e: (e[0], 0 if e[2] == "internal" else 1))
    return switches


def _ctx_at(switches: list, is_sp: bool, pos: int, sentence: str) -> str:
    """Context for a bare reference at pos.

    Default: internal (MAIN scope) / unsupported (SP scope). A bare reference is
    checked against that default only when the sentence contains no cross-law
    introduction before it, or the last introduced law was the self law. If the
    last switch introduced a *different* law, a bare reference carries that
    referent only through carry tokens (同法/同条 etc.) or through punctuation
    directly after the introduction's name; otherwise the referent is ambiguous
    and the reference is reported as unsupported (not checked).
    """
    default = "unsupported" if is_sp else "internal"
    last = None
    for s_pos, s_end, s_cls in switches:
        if s_pos >= pos:
            break
        last = (s_pos, s_end, s_cls)
    if last is None:
        return default
    if last[2] == "internal":
        return default
    window = sentence[last[1]:pos]
    stripped = CARRY_RE.sub("", window)
    stripped = re.sub(r"[\s、。（）「」・]", "", stripped)
    if stripped == "":
        return last[2]
    return "unsupported"


LAW_NAME_AT_PREFIX_RE = re.compile(
    r"[\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFF\u3400-\u4DBF\u3005\u30FCヽ0-9０-９一二三四五六七八九十百千]{1,40}(?:施行規則|施行令|法律|政令|勅令|府令|省令|規則|要領|通達|法|令)附則$"
)


_CURRENT_DOC = None


def _supp_ctx(switches: list, is_sp: bool, pos: int, sentence: str) -> str:
    """Classify an 附則 reference at pos.

    'internal' -> the self law's own 附則 (search self SP blocks);
    'act'/'order' -> the other compiled law's 附則 (search its SP blocks);
    'external' -> 附則 of another law not compiled here (skip);
    'unsupported' -> cannot attribute (skip).
    """
    prefix = sentence[:pos + 2]  # include 附則 itself
    m = LAW_NAME_AT_PREFIX_RE.search(prefix)
    if m:
        return _classify_law_name(m.group(0)[:-2], _CURRENT_DOC)
    last = None
    for s_pos, s_end, s_cls in switches:
        if s_pos >= pos:
            break
        last = (s_pos, s_end, s_cls)
    if last is not None and last[2] == "internal":
        return "internal"
    if is_sp:
        # In an incorporated 附則 of an amending law, an unqualified 附則
        # reference is almost always to that amending law itself, whose full
        # text is not part of this compilation. Do not guess.
        return "unsupported"
    return "internal" if last is None else "unsupported"





def _sentence_split(text: str) -> list[tuple[int, str]]:
    """Split into sentences, returning (offset, sentence).

    A '。' inside parentheses or quotes does not end the sentence: statute
    text routinely embeds full asides (e.g. law citations) in（…）blocks, and
    splitting there detaches references from their introducing law names.
    """
    out = []
    start = 0
    depth = 0
    quote = 0
    for i, ch in enumerate(text):
        if ch in "（(":
            depth += 1
        elif ch in "）)":
            depth = max(0, depth - 1)
        elif ch in "「『":
            quote += 1
        elif ch in "」』":
            quote = max(0, quote - 1)
        elif ch == "。" and depth == 0 and quote == 0:
            out.append((start, text[start:i + 1]))
            start = i + 1
    if start < len(text):
        out.append((start, text[start:]))
    return out


def _parse_branch_tail(tail: str):
    """Parse 'の五の二' -> (5, 2); '' -> None."""
    if not tail:
        return None
    vals = tuple(kanji_to_int(g) for g in BRANCH_SINGLE.findall(tail))
    return vals or None


def _resolve_article(idx: dict, scope: str, integer: int, branch):
    cands = idx.get(scope, {}).get(integer, [])
    if branch:
        exact = [a for a in cands if any(k.branch == branch for k in a.keys)]
        if exact:
            return exact
        return cands if cands else None
    return cands or None


def _consumed_spans(matches):
    return [(m.start(), m.end()) for m in matches]


def _in_spans(pos, spans):
    return any(s <= pos < e for s, e in spans)


def _item_in_article(article: ArticleRec, inum: int, ibranch: int | None) -> bool:
    for p in article.paragraphs:
        for it in p.items:
            if it.level != 0:
                continue
            for (n, b) in it.keys:
                if (n, b) == (inum, ibranch):
                    return True
                # bare reference matches base item with no branch
                if ibranch is None and b is None and n == inum:
                    return True
    return False


def _item_level0_nums(article: ArticleRec) -> list[str]:
    return [it.num for p in article.paragraphs for it in p.items if it.level == 0]


def _para_nums(article: ArticleRec) -> list[int]:
    out = []
    for p in article.paragraphs:
        if p.num and p.num.isdigit():
            out.append(int(p.num))
    return sorted(out)


def rule_references(doc: LawDoc, other_docs: dict[str, LawDoc], stats: AuditStats) -> list[Finding]:
    global _CURRENT_DOC
    _CURRENT_DOC = doc
    out = []
    idx = doc.article_index()
    index_cache: dict[str, dict] = {"self": idx}

    def _other_id(key):
        other = other_docs.get(key)
        return other.law_id if other is not None else f"<{key} not loaded>"

    def other_index(key):
        if key not in index_cache:
            other = other_docs.get(key)
            index_cache[key] = other.article_index() if other is not None else None
        return index_cache[key]

    def classify(switches, a, sentence, pos):
        return _ctx_at(switches, a.scope.startswith("SP"), pos, sentence)

    def resolve_for(a, cls, integer, branch):
        if cls == "internal":
            if a.scope == "MAIN":
                return _resolve_article(idx, "MAIN", integer, branch), "MAIN", doc
            hits = _resolve_article(idx, "MAIN", integer, branch)
            if hits:
                return hits, "MAIN", doc
            for scope in doc.scopes:
                if scope.name.startswith("SP"):
                    hits = _resolve_article(idx, scope.name, integer, branch)
                    if hits:
                        return hits, scope.name, doc
            return None, None, doc
        if cls in ("act", "order"):
            o_idx = other_index(cls)
            if o_idx is None:
                return (), "MAIN", None
            return _resolve_article(o_idx, "MAIN", integer, branch), "MAIN", other_docs[cls]
        return None, None, None

    def check_para_item(a, target_article, t_id, raw, branch_note, sentence, raw_para, raw_item, raw_item_branch):
        local = []
        if raw_para:
            try:
                pnum = kanji_to_int(raw_para)
                stats.references_internal_checked += 1
                ref_art = target_article if target_article is not None else a
                ref_id = t_id if target_article is not None else doc.law_id
                if pnum not in _para_nums(ref_art):
                    local.append(Finding(
                        "REF.PARA.MISSING", "candidate", doc.law_id, a.path, a.line,
                        f"Reference to paragraph {pnum} but {ref_id} article {raw}{branch_note} has paragraphs {_para_nums(ref_art)}",
                        f"sentence: {sentence.strip()[:160]}",
                        "legal-defect-candidate",
                    ))
            except ValueError:
                stats.references_unsupported += 1
        if raw_item:
            try:
                inum = kanji_to_int(raw_item)
                ibranch = (kanji_to_int(raw_item_branch),) if raw_item_branch else None
                stats.references_internal_checked += 1
                ref_art = target_article if target_article is not None else a
                ref_id = t_id if target_article is not None else doc.law_id
                if not _item_in_article(ref_art, inum, ibranch):
                    local.append(Finding(
                        "REF.ITEM.MISSING", "candidate", doc.law_id, a.path, a.line,
                        f"Reference to item {inum}{('の' + raw_item_branch) if raw_item_branch else ''} but {ref_id} article {raw}{branch_note} has items {_item_level0_nums(ref_art)}",
                        f"sentence: {sentence.strip()[:160]}",
                        "legal-defect-candidate",
                    ))
            except ValueError:
                stats.references_unsupported += 1
        return local

    for a in doc.iter_articles():
        scope_articles = [x for s in doc.scopes if s.name == a.scope for x in s.articles]
        pos_i = scope_articles.index(a)
        bound = None            # (ArticleRec, target_doc) the current list binds to
        prev_end = -1
        for sent_off, sentence in _sentence_split(a.ref_text):
            switches = _switches(doc, sentence)
            # Quoted fragments are literal quotations of other provisions; refs
            # inside them are not references of this document and cannot be
            # verified here. Scan a masked copy (positions are preserved).
            scan_text, _, _ = _mask_quoted(sentence)
            switches = _switches(doc, scan_text)
            events = []
            for m in CHAIN_RE.finditer(scan_text):
                events.append((m.start(), "chain", m))
            for m in RELATIVE_RE.finditer(scan_text):
                events.append((m.start(), "rel", m))
            for m in PARA_RE.finditer(scan_text):
                events.append((m.start(), "para", m))
            for m in ITEM_RE.finditer(scan_text):
                events.append((m.start(), "item", m))
            events.sort(key=lambda e: e[0])
            chain_spans = []

            def bind_target():
                return bound

            def para_item_target(pos):
                window = scan_text[prev_end:pos] if prev_end != -1 else ""
                if bound is not None and _is_link(window):
                    return bound
                return (a, doc)

            for pos, kind, m in events:
                if kind == "chain":
                    is_supp, raw, raw_branch, raw_para, raw_item, raw_item_branch = m.groups()
                    chain_spans.append((m.start(), m.end()))
                    stats.references_extracted += 1
                    cls = classify(switches, a, scan_text, m.start())
                    try:
                        integer = kanji_to_int(raw)
                        branch = _parse_branch_tail(raw_branch)
                    except ValueError:
                        stats.references_unsupported += 1
                        bound = None
                        prev_end = m.end()
                        continue
                    branch_note = raw_branch if raw_branch else ""
                    if is_supp:
                        supp_cls = _supp_ctx(switches, a.scope.startswith("SP"), m.start(), scan_text)
                        if supp_cls == "unsupported":
                            stats.references_unsupported += 1
                            bound = None
                            prev_end = m.end()
                            continue
                        if supp_cls == "external":
                            stats.references_external_unverified += 1
                            bound = None
                            prev_end = m.end()
                            continue
                        if supp_cls in ("act", "order"):
                            o_idx = other_index(supp_cls)
                            hits = None
                            t_doc = None
                            if o_idx is not None:
                                t_doc = other_docs[supp_cls]
                                for scope in t_doc.scopes:
                                    if scope.name.startswith("SP"):
                                        hits = _resolve_article(o_idx, scope.name, integer, branch)
                                        if hits:
                                            break
                            stats.references_internal_checked += 1
                            if not hits:
                                out.append(Finding(
                                    "REF.SUPP.MISSING", "candidate", doc.law_id, a.path, a.line,
                                    f"Reference to {'act' if supp_cls == 'act' else 'order'} 附則第{raw}条{branch_note} not found in any SupplProvision of {_other_id(supp_cls)}",
                                    f"sentence: {sentence.strip()[:160]}",
                                    "legal-defect-candidate",
                                ))
                                bound = None
                            else:
                                bound = (hits[0], t_doc)
                            prev_end = m.end()
                            continue
                        # 附則 of the self law: search all SP blocks of this doc
                        hits = None
                        t_doc = doc
                        for scope in doc.scopes:
                            if scope.name.startswith("SP"):
                                hits = _resolve_article(idx, scope.name, integer, branch)
                                if hits:
                                    break
                        stats.references_internal_checked += 1
                        if not hits:
                            out.append(Finding(
                                "REF.SUPP.MISSING", "candidate", doc.law_id, a.path, a.line,
                                f"Reference to 附則第{raw}条{branch_note} not found in any SupplProvision of {doc.law_id}",
                                f"sentence: {sentence.strip()[:160]}",
                                "legal-defect-candidate",
                            ))
                            bound = None
                        else:
                            bound = (hits[0], t_doc)
                        prev_end = m.end()
                        continue
                    if cls in ("external",):
                        stats.references_external_unverified += 1
                        bound = None
                        prev_end = m.end()
                        continue
                    if cls == "unsupported":
                        stats.references_unsupported += 1
                        bound = None
                        prev_end = m.end()
                        continue
                    hits, t_scope, t_doc = resolve_for(a, cls, integer, branch)
                    if t_doc is None:
                        stats.references_external_unverified += 1
                        bound = None
                        prev_end = m.end()
                        continue
                    stats.references_internal_checked += 1
                    if not hits:
                        out.append(Finding(
                            "REF.ARTICLE.MISSING", "candidate", doc.law_id, a.path, a.line,
                            f"Reference to nonexistent article 第{raw}条{branch_note} in {t_doc.law_id}",
                            f"sentence: {sentence.strip()[:160]}",
                            "legal-defect-candidate",
                        ))
                        bound = None
                        target_article = None
                    else:
                        if all(h.deleted for h in hits):
                            out.append(Finding(
                                "REF.ARTICLE.DELETED", "candidate", doc.law_id, a.path, a.line,
                                f"Reference to deleted article 第{raw}条{branch_note} in {t_doc.law_id}",
                                f"sentence: {sentence.strip()[:160]}",
                                "legal-defect-candidate",
                            ))
                        bound = (hits[0], t_doc)
                        target_article = hits[0]
                    out.extend(check_para_item(a, target_article, t_doc.law_id, raw, branch_note, sentence, raw_para, raw_item, raw_item_branch))
                    prev_end = m.end()
                elif kind == "rel":
                    stats.references_extracted += 1
                    tok = m.group(1)
                    cls = classify(switches, a, scan_text, m.start())
                    if cls == "external":
                        stats.references_external_unverified += 1
                        prev_end = m.end()
                        continue
                    if cls == "unsupported":
                        stats.references_unsupported += 1
                        prev_end = m.end()
                        continue
                    if tok in ("同条", "本条"):
                        stats.references_internal_checked += 1
                    elif tok in ("同項", "同号"):
                        # 同項/同号 refer to the SAME paragraph/item of the antecedent,
                        # i.e. keep the current binding (vs 前項 = enclosing article).
                        stats.references_unsupported += 1
                    elif tok == "前項":
                        stats.references_unsupported += 1
                        bound = (a, doc)
                    else:  # 前条 / 次条
                        if a.scope.startswith("SP"):
                            stats.references_unsupported += 1
                            bound = None
                            prev_end = m.end()
                            continue
                        stats.references_internal_checked += 1
                        if tok == "前条":
                            target_rel = scope_articles[pos_i - 1] if pos_i > 0 else None
                        else:
                            target_rel = scope_articles[pos_i + 1] if pos_i + 1 < len(scope_articles) else None
                        if target_rel is None:
                            out.append(Finding(
                                "REF.RELATIVE.MISSING", "candidate", doc.law_id, a.path, a.line,
                                f"{tok} has no target in scope {a.scope}",
                                f"sentence: {sentence.strip()[:160]}",
                                "legal-defect-candidate",
                            ))
                            bound = None
                        else:
                            bound = (target_rel, doc)
                    prev_end = m.end()
                elif kind == "para":
                    if chain_spans and any(s <= m.start() < e for s, e in chain_spans):
                        continue
                    stats.references_extracted += 1
                    cls = classify(switches, a, scan_text, m.start())
                    if cls == "external":
                        stats.references_external_unverified += 1
                        prev_end = m.end()
                        continue
                    if cls == "unsupported":
                        stats.references_unsupported += 1
                        prev_end = m.end()
                        continue
                    try:
                        pnum = kanji_to_int(m.group(1))
                    except ValueError:
                        stats.references_unsupported += 1
                        prev_end = m.end()
                        continue
                    stats.references_internal_checked += 1
                    enclosing_ok = pnum in _para_nums(a)
                    antecedent_ok = bound is not None and pnum in _para_nums(bound[0])
                    if not enclosing_ok and not antecedent_ok:
                        out.append(Finding(
                            "REF.PARA.MISSING", "candidate", doc.law_id, a.path, a.line,
                            f"Reference to paragraph {pnum} but neither enclosing article {a.num_attr} (paragraphs {_para_nums(a)}) nor antecedent article {bound[0].num_attr if bound else '-'} (paragraphs {_para_nums(bound[0]) if bound else '-'}) contains it",
                            f"sentence: {sentence.strip()[:160]}",
                            "legal-defect-candidate",
                        ))
                    prev_end = m.end()
                elif kind == "item":
                    if chain_spans and any(s <= m.start() < e for s, e in chain_spans):
                        continue
                    stats.references_extracted += 1
                    cls = classify(switches, a, scan_text, m.start())
                    if cls == "external":
                        stats.references_external_unverified += 1
                        prev_end = m.end()
                        continue
                    if cls == "unsupported":
                        stats.references_unsupported += 1
                        prev_end = m.end()
                        continue
                    try:
                        inum = kanji_to_int(m.group(1))
                        ibranch = (kanji_to_int(m.group(2)),) if m.group(2) else None
                    except ValueError:
                        stats.references_unsupported += 1
                        prev_end = m.end()
                        continue
                    if True:
                        stats.references_internal_checked += 1
                        enclosing_ok = _item_in_article(a, inum, ibranch)
                        antecedent_ok = bound is not None and _item_in_article(bound[0], inum, ibranch)
                        target_article = bound[0] if bound else a
                        target_id = bound[1].law_id if bound else doc.law_id
                        if not enclosing_ok and not antecedent_ok:
                            out.append(Finding(
                                "REF.ITEM.MISSING", "candidate", doc.law_id, a.path, a.line,
                                f"Reference to item {inum}{('の' + m.group(2)) if m.group(2) else ''} but neither enclosing article {a.num_attr} (items {_item_level0_nums(a)}) nor antecedent article {bound[0].num_attr if bound else '-'} (items {_item_level0_nums(bound[0]) if bound else '-'}) contains it",
                                f"sentence: {sentence.strip()[:160]}",
                                "legal-defect-candidate",
                            ))
                    prev_end = m.end()
    return out


def rule_toc_ranges(doc: LawDoc) -> list[Finding]:
    """Compare leaf TOC ArticleRange bounds with the body article span of the
    same Part/Division/Chapter/Section. Mismatch is a candidate, not proof of
    a defect; unparseable ranges are reported as info."""
    from .model import ArticleKey

    out = []

    def ctx_key(ctx):
        key = []
        for kind in ("part", "division", "chapter", "subsection", "section"):
            if ctx and kind in ctx:
                key.append((kind, ctx[kind]))
        return tuple(key)

    body_spans: dict[tuple, list[ArticleRec]] = {}
    for a in doc.main.articles:
        body_spans.setdefault(ctx_key(a.context), []).append(a)
    kind_map = {"TOCPart": "part", "TOCDivision": "division", "TOCChapter": "chapter",
                "TOCSection": "section"}
    body_kind_of = {"TOCPart": "part", "TOCDivision": "division", "TOCChapter": "chapter",
                    "TOCSection": "section"}
    for rec in doc.toc_ranges:
        txt = rec.range_text
        refs = []
        for m in CHAIN_RE.finditer(txt):
            is_supp, raw, raw_branch = m.group(1), m.group(2), m.group(3)
            if is_supp:
                refs = None
                break
            try:
                refs.append(ArticleKey(kanji_to_int(raw), _parse_branch_tail(raw_branch)))
            except ValueError:
                refs = None
                break
        if refs is None:
            out.append(Finding(
                "TOC.RANGE.UNPARSED", "info", doc.law_id, f"TOC {rec.kind} {rec.num}", rec.line,
                f"TOC range not parsed: {txt}", txt, "tool-limitation",
            ))
            continue
        if not refs:
            out.append(Finding(
                "TOC.RANGE.UNPARSED", "info", doc.law_id, f"TOC {rec.kind} {rec.num}", rec.line,
                f"TOC range contains no article reference: {txt}", txt, "tool-limitation",
            ))
            continue
        body_kind = kind_map.get(rec.kind)
        if body_kind is None:
            continue
        arts = body_spans.get(ctx_key(rec.context))
        if not arts:
            out.append(Finding(
                "TOC.BODY.MISSING", "candidate", doc.law_id, f"TOC {rec.kind} {rec.num}", rec.line,
                f"TOC {rec.kind} {rec.num} has no corresponding body {body_kind} {rec.num}",
                f"range text: {txt}",
                "legal-defect-candidate",
            ))
            continue
        keys = [k for art in arts for k in art.keys]
        bmin = min(k.sort_key() for k in keys)
        bmax = max(k.sort_key() for k in keys)
        want = (refs[0].sort_key(), refs[-1].sort_key())
        if want != (bmin, bmax):
            out.append(Finding(
                "TOC.RANGE.MISMATCH", "candidate", doc.law_id, f"TOC {rec.kind} {rec.num}", rec.line,
                f"TOC range {txt} does not match body span of {body_kind} {rec.num}",
                f"TOC claims ({refs[0].sort_key()}..{refs[-1].sort_key()}); body has ({bmin}..{bmax})",
                "legal-defect-candidate",
            ))
    return out


def rule_deleted_placeholders(doc: LawDoc) -> list[Finding]:
    out = []
    for a in doc.iter_articles():
        m = DELETED_RANGE_NUM_RE.match(a.num_attr)
        if m:
            a0, b0 = int(m.group(1)), int(m.group(2))
            if a0 > b0:
                out.append(Finding(
                    "STRUCT.DELETED.RANGE", "verified-anomaly", doc.law_id, a.path, a.line,
                    f"Deleted-article range reverses: {a0}:{b0}", a.num_attr,
                    "legal-defect-candidate",
                ))
    return out
