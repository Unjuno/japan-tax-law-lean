#!/usr/bin/env python3
"""Regression tests for the task-queue rectification (Objective §1).

Pins the invariants that replaced the baseline's incorrect completion logic:
  * full-length, collision-free normative ids including source span;
  * decomposition with exact coverage and explicit UNRESOLVED recording;
  * dependencies beyond the 15-digit id (law name, article, version);
  * five-valued, evidence-driven status that cannot be reached by a numeric
    match, a file's existence or a theorem-name string match alone;
  * durable ledger state surviving regeneration.

Run: python scripts/ci/test_norm_core_regression.py  (exit 0 = pass)
"""
from __future__ import annotations

import re
import sys
import tempfile
from pathlib import Path

CI = Path(__file__).resolve().parent
sys.path.insert(0, str(CI))
import norm_core as nc  # noqa: E402

RESULTS = []


def check(name, cond):
    RESULTS.append((name, bool(cond)))
    print(("PASS " if cond else "FAIL ") + name)


def main() -> int:
    a = nc.make_norm_id("L", "REV", "Main/Article:66", "66", 0, [0, 5], "abc")
    b = nc.make_norm_id("L", "REV", "Main/Article:66", "66", 1, [5, 10], "abc")
    c = nc.make_norm_id("L", "REV", "Main/Article:66", "66", 1, [5, 10], "abc")
    check("id distinct across units", a != b)
    check("id deterministic", b == c)
    check("id is full sha256", re.fullmatch(r"norm-[0-9a-f]{64}", a) is not None)
    check("id includes source digest",
          nc.make_norm_id("L", "REV", "P", "66", 0, [0, 5], "xyz") != a)

    text = "税率は百分の二十三・二とする。ただし、一億円以下の場合は百分の十九とする。みなす。"
    units = nc.decompose(text)
    cov = nc.coverage_audit(text, units)
    check("decomposition covers source exactly",
          cov["contiguous"] and cov["uncovered_chars"] == 0)
    check("exception separated", any(u["kind"] == "exception" for u in units))
    check("deeming separated", any(u["kind"] == "deeming" for u in units))
    check("independent audit not auto-satisfied", cov["independent_audit"] == "PENDING")

    idx = nc.law_title_index({"laws": [{"official_title": "法人税法", "law_id": "340AC0000000034"}]})
    deps = nc.analyze_dependencies(
        "法人税法第一条の規定により340AC0000000034令和8年施行日から", idx)
    kinds = {d["kind"] for d in deps}
    check("15-digit id extractor present", "law_id_15" in kinds)
    check("law name extractor present", "law_name" in kinds)
    check("article extractor present", "article_reference" in kinds)
    check("enforcement version extractor present", "enforcement_version" in kinds)
    check("law name resolved to id",
          any(d["kind"] == "law_name" and d["resolved_law_id"] == "340AC0000000034"
              for d in deps))

    unit = {"blockers": [], "axes": nc.default_axes(),
            "obligations": nc.default_obligations(), "unresolved_count": 0}
    check("untouched unit is NOT_STARTED", nc.derive_status(unit) == nc.STATUS_NOT_STARTED)
    unit["axes"]["proved"] = True
    check("proved scope distinguished", nc.derive_status(unit) == nc.STATUS_PROVED_SCOPE)
    unit["blockers"] = ["needs source review"]
    check("blocker overrides", nc.derive_status(unit) == nc.STATUS_BLOCKED)
    unit["blockers"] = []
    for k in nc.AXIS_KEYS:
        unit["axes"][k] = True
    check("full evidence can verify", nc.derive_status(unit) == nc.STATUS_FULLY_VERIFIED)
    unit["unresolved_count"] = 1
    check("unresolved blocks FULLY_VERIFIED", nc.derive_status(unit) == nc.STATUS_PROVED_SCOPE)

    with tempfile.TemporaryDirectory() as td:
        path = Path(td) / "ledger.json"
        led = nc.Ledger(path)
        data = led.load()
        u = led.upsert(data, {"norm_id": "n1", "unhandled_conditions": [], "source_fixed": True})
        u["owner"] = "FORMALIZE-A"
        u["blockers"] = ["x"]
        led.save(data)
        led2 = nc.Ledger(path).load()
        check("ledger persists owner", led2["units"]["n1"]["owner"] == "FORMALIZE-A")
        check("ledger persists blockers", led2["units"]["n1"]["blockers"] == ["x"])
        led3 = nc.Ledger(path).load()
        led.upsert(led3, {"norm_id": "n1", "unhandled_conditions": [], "source_fixed": True})
        check("regeneration preserves owner",
              led3["units"]["n1"]["owner"] == "FORMALIZE-A")

    bad = [n for n, ok in RESULTS if not ok]
    print(f"\n{len(RESULTS) - len(bad)}/{len(RESULTS)} checks passed")
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
