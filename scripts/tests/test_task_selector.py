#!/usr/bin/env python3
"""Regression tests for the Coordinator's computable-unit ranking (Directive §3).

The v3 queue stores a normative unit's text in ``text``. A selector that only
reads ``norm_fragment``/``verbatim`` ranks every unit as equally uncomputable,
so the Coordinator never prefers arithmetic provisions. These tests pin the
field contract and the resulting ordering.
"""
from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path

CI = Path(__file__).resolve().parents[1] / "ci"
spec = importlib.util.spec_from_file_location("tsel", CI / "task_selector.py")
sel = importlib.util.module_from_spec(spec)
spec.loader.exec_module(sel)


def unit(uid, text, status="NOT_STARTED"):
    return {
        "id": uid,
        "normative_id": uid,
        "law_id": "340AC0000000033",
        "status": status,
        "text": text,
        "owner": "",
        "blockers": [],
        "dependencies": [],
        "unhandled_conditions": [],
    }


class TestComputableRanking(unittest.TestCase):
    def test_v3_text_field_is_scored(self):
        self.assertGreater(sel.computable(unit("a", "課税標準に百分の十を乗じて税額を算出する")), 0)

    def test_legacy_fragment_still_scored(self):
        u = unit("a", "")
        u["norm_fragment"] = "税率百分の十"
        self.assertGreater(sel.computable(u), 0)

    def test_selector_prefers_computable_unit(self):
        tasks = [
            unit("NORM|" + "0" * 64, "これは手続に関する規定である。"),
            unit("NORM|" + "1" * 64, "課税標準に百分の十を乗じて税額を算出する。"),
        ]
        report = sel.select_tasks(tasks, 1)
        self.assertEqual(report["selected_count"], 1)
        self.assertEqual(report["selected"][0]["normative_id"], "NORM|" + "1" * 64)


if __name__ == "__main__":
    unittest.main()
