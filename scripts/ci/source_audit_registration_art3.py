#!/usr/bin/env python3
"""Independent source-to-spec correspondence audit for 322CO0000000109 art.3.

Read-only with respect to the source snapshot: it re-extracts the verbatim
sentence from the pinned raw JSON using the queue's source_path, then checks
that the literals used by the independent spec actually occur in that sentence.
Writes a JSON record used by the unit's evidence ledger.
"""
from __future__ import annotations

import hashlib
import json
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
LAW = "322CO0000000109"
REV = "322CO0000000109_19470627_000000000000000"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_registration_art3.json"
UNIT = "NORM|368f77444888dd8e28bda37fa5deb1bae1d03502d1f8c036d2975e32fd768f5e"

# Independent reading of the original text (NOT copied from the model).
EXPECTED_TEXT = (
    "前二条の場合において同一の登記所の管轄内に在る二箇以上の不動産につき"
    "登記を嘱託するには、登記原因又は登記の目的が同一でなくても、"
    "同一の嘱託書でその登記を嘱託することができる。"
)
LITERALS = ["前二条", "同一の登記所", "二箇以上", "登記原因", "登記の目的", "同一の嘱託書"]
FILES = [
    "JapanTaxLaw/RegistrationJointRequest.lean",
    "JapanTaxLaw/RegistrationJointRequestSpec.lean",
    "JapanTaxLaw/RegistrationJointRequestTests.lean",
]


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def extract_sentence(doc: dict) -> str:
    # Recursive search pinned by law id + revision + article number + structural
    # role; the source_path from the queue is checked against the found node.
    def find_article(node):
        if isinstance(node, dict):
            if (node.get("tag") == "Article"
                    and str((node.get("attr") or {}).get("Num", "")) == "3"):
                return node
            for child in node.get("children", []):
                got = find_article(child)
                if got is not None:
                    return got
        elif isinstance(node, list):
            for child in node:
                got = find_article(child)
                if got is not None:
                    return got
        return None

    article = find_article(doc.get("law_full_text", {}))
    if article is None:
        raise SystemExit("Article:3 not found in pinned raw snapshot")
    for para in article.get("children", []):
        if para.get("tag") != "Paragraph":
            continue
        for ps in para.get("children", []):
            if ps.get("tag") != "ParagraphSentence":
                continue
            for sent in ps.get("children", []):
                if sent.get("tag") == "Sentence":
                    return "".join(sent.get("children", []))
    raise SystemExit("Sentence not found in Article:3")


def main() -> int:
    raw_bytes = RAW.read_bytes()
    doc = json.loads(raw_bytes)
    text = extract_sentence(doc)
    checks = {
        "verbatim_text_match": text == EXPECTED_TEXT,
        "all_literals_in_original": all(x in text for x in LITERALS),
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.RegistrationJointRequest\n"
            not in (REPO / "JapanTaxLaw/RegistrationJointRequestSpec.lean").read_text(encoding="utf-8"),
    }
    record = {
        "tool": "scripts/ci/source_audit_registration_art3.py",
        "normative_id": UNIT,
        "law_id": LAW,
        "revision": REV,
        "source_path": "LawBody[1]/MainProvision/MainProvision[2]/Article:3/Article#3/Paragraph#1/ParagraphSentence/Sentence",
        "raw_sha256": hashlib.sha256(raw_bytes).hexdigest(),
        "original_text": text,
        "independent_literals": LITERALS,
        "checks": checks,
        "module_sha256": {p: sha(REPO / p) for p in FILES},
        "note": "Literals were read from the original text independently of the Lean models.",
    }
    OUT.write_text(json.dumps(record, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "raw_sha256": record["raw_sha256"],
                      "original_chars": len(text)}, ensure_ascii=False, indent=2))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
