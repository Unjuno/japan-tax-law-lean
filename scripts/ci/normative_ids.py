#!/usr/bin/env python3
"""Collision-free normative identifiers (Objective §1, item 1).

A work unit is never identified by a law id and an article number alone.  The
identifier binds every component that distinguishes a normative unit:

  law_id            e-Gov law id (e.g. 340AC0000000033)
  history_id        enforced revision / law_revision_id (施行版・履歴ID)
  provision_id      intrinsic id of 本則 / 附則 / 別表 (Part/Chapter/Suppl.
                    AmendLawNum/AppdxTable label plus structural ordinal)
  article_no        条
  paragraph_no      項
  item_no           号
  subitem_path      枝番号・細目
  table_cell_ref    別表セル (row/cell locator)
  unit_index        ordinal of the decomposed unit inside the provision
  norm_type         CONDITION / LEGAL_EFFECT / EXCEPTION / ...
  fragment_sha256   SHA-256 of the exact normalized source fragment

`canonical_key()` is a one-to-one, JSON-encoded structured key (length/c escaping
makes delimiter injection impossible).  `identifier()` is the *full* SHA-256 of
that key and is the primary key.  A short `display()` exists for prose only and
is explicitly forbidden as a database key.

When a revision id is missing, a non-colliding placeholder derived from the
source SHA-256 is used, so two unknown revisions can never collapse to one id.
"""
from __future__ import annotations

import hashlib
import json
import re
from dataclasses import dataclass, replace

PROVISION_KINDS = ("MAIN", "SUPPLEMENTARY", "APPENDIX_TABLE", "UNKNOWN")

NORM_TYPES = (
    "CONDITION",
    "LEGAL_EFFECT",
    "EXCEPTION",
    "DEEMING",
    "PRESUMPTION",
    "DELEGATION",
    "READING_SUBSTITUTION",
    "REFERENCE",
    "DEFINITION",
    "PROCEDURE",
    "PENALTY",
    "TRANSITIONAL",
    "UNCLASSIFIED",
)

_WS = re.compile(r"[\s\u3000]+")


def sha256_text(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def norm_text(text: str) -> str:
    return _WS.sub("", text)


def canon(*parts) -> str:
    """Unambiguous structured encoding (not a naive '|'.join)."""
    return json.dumps(list(parts), ensure_ascii=False, separators=(",", ":"))


@dataclass(frozen=True)
class NormativeId:
    law_id: str
    history_id: str
    provision_kind: str
    provision_id: str = ""
    article_no: str = ""
    paragraph_no: str = ""
    item_no: str = ""
    subitem_path: str = ""
    table_cell_ref: str = ""
    unit_index: int = 0
    norm_type: str = "UNCLASSIFIED"
    fragment_sha256: str = ""

    def __post_init__(self) -> None:
        if self.provision_kind not in PROVISION_KINDS:
            raise ValueError(f"unknown provision_kind: {self.provision_kind!r}")
        if self.norm_type not in NORM_TYPES:
            raise ValueError(f"unknown norm_type: {self.norm_type!r}")
        if not self.law_id:
            raise ValueError("law_id is required")
        if not self.history_id:
            raise ValueError("history_id is required (use a placeholder if unknown)")
        if self.unit_index < 0:
            raise ValueError("unit_index must be >= 0")
        if not re.fullmatch(r"[0-9a-f]{64}", self.fragment_sha256):
            raise ValueError("fragment_sha256 must be a full 64-hex SHA-256 digest")

    def components(self) -> tuple:
        return (
            "norm-v2", self.law_id, self.history_id, self.provision_kind,
            self.provision_id, self.article_no, self.paragraph_no, self.item_no,
            self.subitem_path, self.table_cell_ref, self.unit_index,
            self.norm_type, self.fragment_sha256,
        )

    def canonical_key(self) -> str:
        return canon(*self.components())

    def identifier(self) -> str:
        return sha256_text(self.canonical_key())

    def display(self) -> str:
        return (f"{self.law_id}:{self.history_id}:{self.provision_kind}:"
                f"{self.provision_id}:{self.article_no}#{self.unit_index}:"
                f"{self.identifier()[:12]}")

    def as_dict(self) -> dict:
        d = {
            "law_id": self.law_id,
            "history_id": self.history_id,
            "provision_kind": self.provision_kind,
            "provision_id": self.provision_id,
            "article_no": self.article_no,
            "paragraph_no": self.paragraph_no,
            "item_no": self.item_no,
            "subitem_path": self.subitem_path,
            "table_cell_ref": self.table_cell_ref,
            "unit_index": self.unit_index,
            "norm_type": self.norm_type,
            "fragment_sha256": self.fragment_sha256,
        }
        d["canonical_key"] = self.canonical_key()
        d["normative_id"] = self.identifier()
        return d


def make_id(
    *,
    law_id: str,
    history_id: str = "",
    provision_kind: str = "MAIN",
    fragment: str,
    unit_index: int,
    norm_type: str,
    provision_id: str = "",
    article_no: str = "",
    paragraph_no: str = "",
    item_no: str = "",
    subitem_path: str = "",
    table_cell_ref: str = "",
    source_sha256: str = "",
) -> NormativeId:
    hist = history_id or f"HISTORY_UNKNOWN:{source_sha256 or sha256_text(fragment)}"
    return NormativeId(
        law_id=law_id,
        history_id=hist,
        provision_kind=provision_kind,
        provision_id=provision_id,
        article_no=article_no,
        paragraph_no=paragraph_no,
        item_no=item_no,
        subitem_path=subitem_path,
        table_cell_ref=table_cell_ref,
        unit_index=unit_index,
        norm_type=norm_type,
        fragment_sha256=sha256_text(norm_text(fragment)),
    )


def with_unit_index(nid: NormativeId, index: int, norm_type: str | None = None) -> NormativeId:
    return replace(nid, unit_index=index, norm_type=norm_type or nid.norm_type)


def assert_unique(ids) -> None:
    """Fail loudly on duplicate canonical keys or identifiers; never deduplicate."""
    seen_key: dict[str, str] = {}
    seen_id: dict[str, str] = {}
    for nid in ids:
        key, ident = nid.canonical_key(), nid.identifier()
        if key in seen_key:
            raise ValueError(f"canonical key collision: {key}")
        if ident in seen_id:
            raise ValueError(f"identifier collision: {ident}")
        seen_key[key] = ident
        seen_id[ident] = key


if __name__ == "__main__":
    raise SystemExit(0)
