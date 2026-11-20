#!/usr/bin/env python3
"""Tests for historical-version reference classification (Objective §2).

Historical references (新／旧＋law name) are references to an enforced version
of a known law, not unacquired statutes. They must be distinguished from
truly unresolved names and must never be counted as acquired or proved.
"""
from __future__ import annotations

import json
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]


class TestHistoricalBase(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        import importlib.util
        p = REPO / "scripts" / "law_audit" / "inventory" / "recursive_discovery_resolve.py"
        spec = importlib.util.spec_from_file_location("rdresolve", p)
        cls.mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(cls.mod)

    def test_prefixes_stripped(self):
        m = self.mod
        self.assertEqual(m.historical_base("新租税特別措置法"), "租税特別措置法")
        self.assertEqual(m.historical_base("旧法人税法"), "法人税法")
        self.assertEqual(m.historical_base("改正前地方税法"), "地方税法")
        self.assertEqual(m.historical_base("租税特別措置法"), "")

    def test_base_resolves_in_full_law_list(self):
        m = self.mod
        entries = m.load_lawlist(m.LAWLIST)
        exact, short, by_no = m.build_index(entries)
        base = m.historical_base("旧租税特別措置法")
        lid, method = m.resolve_name(base, exact, short, by_no)
        self.assertEqual(lid, "332AC0000000026")
        self.assertNotEqual(method, "unresolved")


class TestLedgerShape(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        p = REPO / "data" / "RECURSIVE_DISCOVERY_RESOLVED.json"
        cls.data = json.loads(p.read_text(encoding="utf-8")) if p.exists() else {}

    def test_historical_layer_present_and_explicit(self):
        d = self.data
        self.assertIn("historical_version_references", d)
        self.assertGreater(d.get("historical_version_refs", 0), 0)
        for row in d["historical_version_references"]:
            self.assertTrue(row["name"].startswith(("新", "旧", "舊", "改正前", "改正後")))
            self.assertTrue(row["base_law_id"])
            self.assertIs(row["historical_revision_pinned"], False)
            self.assertIs(row["requires_revision_pin"], True)
            self.assertEqual(row["method"], "historical_version_of_base")

    def test_no_double_count_as_unresolved(self):
        d = self.data
        hist = {r["name"] for r in d.get("historical_version_references", [])}
        unresolved = {r["name"] for r in d.get("unresolved", [])}
        self.assertFalse(hist & unresolved)
        self.assertEqual(d["unmatched_reference_names"],
                         d["resolved_new_names"] + d["resolved_ledger_aliases"]
                         + d["historical_version_refs"] + d["unresolved_names"])

    def test_claim_is_discovery_only(self):
        self.assertIn("discovery only", self.data.get("claim", ""))


if __name__ == "__main__":
    unittest.main()
