"""Resolve parent act / parent order / parent rule for each inventory law.

Deterministic rule tree built from the pinned official titles:

  act  parent of order/rule  := the longest official Act title that is a prefix
                                 of this law's title (e.g. 所得税法施行令 → 所得税法).
  order parent of rule      := the order whose title matches
                                 `<act parent>施行令` exactly when present
                                 (e.g. 所得税法施行規則 → 所得税法施行令),
                                 else the longest order title that is a prefix.
  act parent of act          := None (Act is top-level).

Ambiguity: never guessed. When the title is ambiguous, the LONGEST prefix wins
(must be strictly longer than its own base name, i.e. >= 4 chars, and a real
prefix of the child title). When nothing matches, the parent is None and the
relationship is recorded as unsupported — never fabricated.
"""
from __future__ import annotations

_TYPE_CODES_ORDER = {"CO", "DM"}  # Cabinet-order-shaped ids (令和 cabinet orders etc.)
_TYPE_CODES_RULE = {"M"}          # 府省令-shaped ids (incl. 府令 / 省令 / 規則 / 通達)

_IMPLEMENTING_SUFFIXES = (
    "施行規則",
    "施行細則",
    "施行準則",
    "施行要綱",
    "施行事務規程",
    "施行令",
    "施行規則改正",
    "施行細則改正",
    "施行準則改正",
    "施行要綱改正",
)


def law_type_from_id(law_id: str) -> str:
    if "AC" in law_id or law_id.endswith("A"):
        return "act"
    if any(code in law_id for code in _TYPE_CODES_ORDER):
        return "order"
    if any(code in law_id for code in _TYPE_CODES_RULE):
        return "rule"
    return "other"


def _implementing_core(title: str) -> str | None:
    for sfx in _IMPLEMENTING_SUFFIXES:
        if title.endswith(sfx):
            return title[: -len(sfx)]
    return None


def _prefix_candidates(title: str, candidate: str) -> bool:
    return title.startswith(candidate) and candidate != title


def find_act_parent(title: str, act_titles: list[tuple[str, str]]) -> str | None:
    """Best (longest) official Act title that is a proper prefix of `title`."""
    best = None
    best_len = -1
    for lid, atitle in act_titles:
        if len(atitle) < 3 or len(atitle) >= len(title) + 1:
            continue
        if _prefix_candidates(title, atitle) and len(atitle) > best_len:
            best = lid
            best_len = len(atitle)
    return best


def find_order_parent(title: str, act_parent_title: str | None, order_titles: list[tuple[str, str]]) -> str | None:
    """Rule -> parent order: exact `<act>施行令` match, else longest order prefix."""
    if act_parent_title:
        exact = act_parent_title + "施行令"
        for lid, otitle in order_titles:
            if otitle == exact:
                return lid
    best = None
    best_len = -1
    for lid, otitle in order_titles:
        if len(otitle) < 4 or len(otitle) >= len(title) + 1:
            continue
        if _prefix_candidates(title, otitle) and len(otitle) > best_len:
            best = lid
            best_len = len(otitle)
    return best


def parent_map(records: list[dict]) -> dict[str, dict[str, str | None]]:
    """law_id -> {'act': law_id|None, 'order': law_id|None}."""
    titles = [(r["law_id"], r.get("official_title", "")) for r in records]
    act_titles = [t for t in titles if law_type_from_id(t[0]) == "act"]
    order_titles = [t for t in titles if law_type_from_id(t[0]) == "order"]
    act_by_title = {t: lid for lid, t in act_titles}

    out: dict[str, dict[str, str | None]] = {}
    for r in records:
        lid = r["law_id"]
        title = r.get("official_title", "")
        ktype = law_type_from_id(lid)

        # Act: no parent Act, but may reference its own Order.
        if ktype == "act":
            exact_order = title + "施行令"
            order_parent = None
            for oid, otitle in order_titles:
                if otitle == exact_order:
                    order_parent = oid
                    break
            out[lid] = {"act": None, "order": order_parent}
            continue

        # Order: parent Act from the longest Act prefix.
        if ktype == "order":
            act_parent = find_act_parent(title, act_titles)
            out[lid] = {"act": act_parent, "order": None}
            continue

        # Rule: parent Act AND parent Order (order may be the Act's 施行令).
        if ktype == "rule":
            act_parent = find_act_parent(title, act_titles)
            act_title = None
            if act_parent:
                act_title = next((t for l, t in act_titles if l == act_parent), None)
            order_parent = find_order_parent(title, act_title, order_titles)
            out[lid] = {"act": act_parent, "order": order_parent}
            continue

        out[lid] = {"act": None, "order": None}
    return out
