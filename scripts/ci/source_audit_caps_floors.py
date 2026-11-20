#!/usr/bin/env python3
"""Independent source-to-spec audit for art.72_21 month floors and art.37-2/314-7 caps."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
REV = "325AC0000000226_20261101_508AC0000000002"
RAW = REPO / "data" / "raw" / f"{REV}.law.json"
OUT = REPO / "data" / "source_correspondence_caps_floors.json"
MONTH = "この場合における月数は、暦に従い計算し、一月に満たないときは一月とし、一月に満たない端数を生じたときは切り捨てる。"
CAP = "この場合において、当該控除額が当該所得割の額を超えるときは、当該控除額は、当該所得割の額に相当する金額とする。"
GROUPS = {
    "months": {
        "ids": [
            "b265abf7c2b4e33c782f4055eb76a1ec9e31315f8414dc18975bf5cfc557f45d",
            "4766be9dfaf10e556f4ed4cb7d6af089b31b80033ddc1bf9eced7b5ebabf9358",
            "d919c1cfd701bc31f46bba8157aa17f8c8e7ffeb44373aa3e06766cbb31379af",
            "9fecbf01077eb295abda6fb3642b131e924d44a9ab1fc5da66daeab67a03f4f2",
            "d17de64a90bac7642362d85bb81c102bd8a8283e55d2138816c87358de956de7",
            "41f91dd46644996c45e9737d8525079191e51089a85237de2d555f5b9187f4a3",
        ],
        "text": MONTH,
        "paths": [
            "LawBody[2]/MainProvision/MainProvision[1]/Article:72_21/Article#72_21/Paragraph#%d/ParagraphSentence/Sentence#2" % n
            for n in (3, 4, 5, 8, 9, 10)
        ],
    },
    "caps": {
        "ids": [
            "20d49c979fc8fe33d62b4df93ab315db2ba8197e7028c57f89a19ff460cd231d",
            "48b7651e23d266a10bf4c44c1c812ad3b7278fd45ecc34060a9c835485d2d923",
        ],
        "text": CAP,
        "paths": [
            "LawBody[2]/MainProvision/MainProvision[1]/Article:37_2/Article#37_2/Paragraph#1/ParagraphSentence/Sentence#2",
            "LawBody[2]/MainProvision/MainProvision[2]/Article:314_7/Article#314_7/Paragraph#1/ParagraphSentence/Sentence#2",
        ],
    },
}
FILES = ["JapanTaxLaw/DeductionCapsAndMonthFloors.lean",
         "JapanTaxLaw/DeductionCapsAndMonthFloorsSpec.lean",
         "JapanTaxLaw/DeductionCapsAndMonthFloorsTests.lean"]


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def main():
    raw = RAW.read_bytes()
    payload = json.loads(raw)
    all_texts = "".join(text_of(payload["law_full_text"]))
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    checks = {
        "month_text_verbatim": MONTH in all_texts,
        "cap_text_verbatim": CAP in all_texts,
        "month_occurrences_at_least_six": all_texts.count(MONTH) >= 6,
        "cap_occurrences_at_least_two": all_texts.count(CAP) >= 2,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.DeductionCapsAndMonthFloors\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_caps_floors.py",
        "revision": REV,
        "raw_sha256": hashlib.sha256(raw).hexdigest(),
        "groups": {
            name: {"normative_ids": ["NORM|" + i for i in g["ids"]],
                   "text": g["text"], "source_paths": g["paths"],
                   "verbatim_occurrences": all_texts.count(g["text"])}
            for name, g in GROUPS.items()
        },
        "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks,
                      "occurrences": {k: v["verbatim_occurrences"] for k, v in rec["groups"].items()}},
                     ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
