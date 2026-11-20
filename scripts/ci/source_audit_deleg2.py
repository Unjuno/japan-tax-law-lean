#!/usr/bin/env python3
"""Independent source-to-spec audit for the 1573 delegation/ref/waiver units."""
from __future__ import annotations
import hashlib, json
from pathlib import Path
REPO = Path(__file__).resolve().parents[2]
QUEUE = REPO / "build" / "task_queue.json"
OUT = REPO / "data" / "source_correspondence_deleg2.json"
FILES = ["JapanTaxLaw/DelegationRefsAndWaivers.lean",
         "JapanTaxLaw/DelegationRefsAndWaiversSpec.lean",
         "JapanTaxLaw/DelegationRefsAndWaiversTests.lean"]
NEEDLES = [
    ("delegation", ["必要な事項は、政令で定める", "必要な経過措置は、政令で定める"]),
    ("dual", ["法人の代表者又は法人若しくは人の代理人、使用人その他の従業者がその法人又は人の業務又は財産に関して"]),
    ("enforcement", ["ただし、次条の規定は、経済社会の構造の変化",
                     "この法律は、公布の日から施行し、平成元年四月一日",
                     "前項の規定にかかわらず、この法律のうち次の各号に掲げる規定は",
                     "この法律は、郵政民営化法の施行の日から施行する"]),
    ("ref_fragment", ["（同法", "（以下この条", "（2）（ii）に掲げる場合に該当する場合",
                      "同項の規定による納税の猶予に係る期限", "その他財務省令で定める要件",
                      "に準ずるものとする。", "政令で定める場所",
                      "当該公益法人等に該当することとなつた日"]),
    ("waiver", ["ただし、税務署長においてやむを得ない事情があると認める場合には、当該書類を添付することを要しない。"]),
]


def classify(f):
    for fam, needles in NEEDLES:
        if any(n in f for n in needles):
            return fam
    return None


def text_of(node):
    if isinstance(node, str): return node
    if isinstance(node, dict): return "".join(text_of(c) for c in node.get("children", []))
    if isinstance(node, list): return "".join(text_of(c) for c in node)
    return ""


def main():
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    selected = []
    for t in q["tasks"]:
        if t.get("status") != "NOT_STARTED" or t.get("dependencies") or t.get("unhandled_conditions"):
            continue
        fam = classify((t.get("norm_fragment") or "").strip())
        if fam:
            selected.append((t, fam))
    cache = {}
    records = []
    for t, fam in selected:
        sf = t.get("source_file", "")
        if sf not in cache:
            rawp = REPO / sf
            if rawp.exists():
                raw = rawp.read_bytes()
                cache[sf] = (hashlib.sha256(raw).hexdigest(),
                             "".join(text_of(json.loads(raw)["law_full_text"])))
            else:
                cache[sf] = ("", "")
        sha, all_text = cache[sf]
        frag = (t.get("norm_fragment") or "").strip()
        records.append({"normative_id": t.get("normative_id", ""),
                        "verbatim": bool(frag) and frag in all_text,
                        "family": fam, "text": frag,
                        "source_path": t.get("source_path", ""),
                        "revision": t.get("revision", ""), "raw_sha256": sha})
    spec = (REPO / FILES[1]).read_text(encoding="utf-8")
    counts = {}
    for r in records:
        counts[r["family"]] = counts.get(r["family"], 0) + 1
    checks = {
        "all_units_verbatim": bool(records) and all(r["verbatim"] for r in records),
        "expected_count_1573": len(records) == 1573,
        "five_families_present": len(counts) == 5,
        "spec_does_not_import_implementation":
            "import JapanTaxLaw.DelegationRefsAndWaivers\n" not in spec,
    }
    rec = {
        "tool": "scripts/ci/source_audit_deleg2.py",
        "units_found": len(records), "family_counts": counts,
        "records": records, "checks": checks,
        "module_sha256": {p: hashlib.sha256((REPO / p).read_bytes()).hexdigest() for p in FILES},
    }
    OUT.write_text(json.dumps(rec, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"checks": checks, "hits": sum(r["verbatim"] for r in records)}, ensure_ascii=False))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
