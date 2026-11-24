"""Tests for the in-scope source backlog (Sponsor Directive §1/§5)."""
import importlib.util
import json
import pathlib
import unittest

REPO = pathlib.Path(__file__).resolve().parents[2]


def load():
    spec = importlib.util.spec_from_file_location(
        "source_backlog_test", REPO / "scripts" / "ci" / "source_backlog.py")
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


class SourceBacklogTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.mod = load()
        cls.data = cls.mod.build()

    def test_no_item_is_a_permanent_exclusion(self):
        for i in self.data["items"]:
            self.assertTrue(i["not_a_permanent_exclusion"])
            self.assertFalse(i["blocks_other_units"])
            self.assertEqual(i["legal_review_axis"], "LEGAL_REVIEW_PENDING")

    def test_every_item_carries_full_verification_obligations(self):
        for i in self.data["items"]:
            self.assertEqual(list(i["verification_obligations"]),
                             list(self.mod.OBLIGATIONS))
            self.assertTrue(i["version_requirement"])

    def test_declared_families_are_present(self):
        ids = {i["item_id"] for i in self.data["items"]}
        self.assertTrue({"L2-ORDINANCE-ACQUISITION", "L3-TREATY-ACQUISITION",
                         "L4-CIRCULAR-STAGING", "L5-CASELAW-STAGING",
                         "L6-HISTORICAL-PINNING"} <= ids)

    def test_committed_ledger_matches(self):
        committed = json.loads((REPO / "data" / "SOURCE_BACKLOG.json").read_text(
            encoding="utf-8"))
        self.assertEqual(committed, self.data)


if __name__ == "__main__":
    unittest.main()
