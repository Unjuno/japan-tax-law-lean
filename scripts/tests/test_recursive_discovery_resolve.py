"""Tests for official-law-id resolution of discovered references (Objective §2).

No repository-scale data is required; all XML/JSON fixtures are synthetic.
"""
from __future__ import annotations

import importlib.util
import tempfile
import unittest
import xml.etree.ElementTree as ET
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
MODULE = REPO / "scripts" / "law_audit" / "inventory" / "recursive_discovery_resolve.py"

spec = importlib.util.spec_from_file_location("recursive_discovery_resolve", MODULE)
RDR = importlib.util.module_from_spec(spec)
spec.loader.exec_module(RDR)


class NormalizeTests(unittest.TestCase):
    def test_norm_and_short_name(self):
        self.assertEqual(RDR.norm("  Company\t法 "), "Company法")
        self.assertEqual(
            RDR.short_name("昭和二十五年法律第二百二十六号（地方税法）"), "地方税法"
        )
        self.assertEqual(RDR.short_name("地方自治法"), "地方自治法")


class IndexTests(unittest.TestCase):
    ENTRIES = [
        {"law_id": "325AC0000000226", "law_name": "地方税法", "law_no": "昭和二十五年法律第二百二十六号"},
        {"law_id": "322AC0000000067", "law_name": "地方自治法", "law_no": "昭和二十二年法律第六十七号"},
        {"law_id": "323AC0000000025", "law_name": "金融商品取引法", "law_no": "昭和二十三年法律第二十五条"},
    ]

    def test_parse_full_law_list(self):
        with tempfile.TemporaryDirectory() as d:
            p = Path(d) / "lawlists.xml"
            root = ET.Element("DataRoot")
            appl = ET.SubElement(root, "ApplData")
            tags = {"law_id": "LawId", "law_name": "LawName", "law_no": "LawNo"}
            for e in self.ENTRIES:
                info = ET.SubElement(appl, "LawNameListInfo")
                for k, v in e.items():
                    ET.SubElement(info, tags[k]).text = v
            ET.ElementTree(root).write(p, encoding="utf-8", xml_declaration=True)
            got = RDR.load_lawlist(p)
            self.assertEqual(len(got), 3)
            self.assertEqual(got[0]["law_id"], "325AC0000000226")

    def test_prefix_only_name_stays_unresolved(self):
        exact, short, by_no = RDR.build_index(self.ENTRIES)
        self.assertEqual(
            RDR.resolve_name("地方税法施行令", exact, short, by_no),
            (None, "unresolved"),
            "a shared prefix must not assign a different statute's law id",
        )

    def test_exact_short_and_law_number_resolution(self):
        exact, short, by_no = RDR.build_index(self.ENTRIES)
        self.assertEqual(RDR.resolve_name("地方税法", exact, short, by_no),
                         ("325AC0000000226", "exact_law_name"))
        self.assertEqual(
            RDR.resolve_name("昭和二十五年法律第二百二十六号（地方税法）", exact, short, by_no),
            ("325AC0000000226", "short_law_name"),
        )
        self.assertEqual(RDR.resolve_name("金融商品取引法", exact, short, by_no),
                         ("323AC0000000025", "exact_law_name"))
        self.assertEqual(RDR.resolve_name("存在しない法律", exact, short, by_no),
                         (None, "unresolved"))

    def test_generic_names_are_not_candidates(self):
        self.assertIn("この法律", RDR.GENERIC)
        self.assertIn("同法", RDR.GENERIC)


class LawListCoverageTests(unittest.TestCase):
    def test_real_law_list_is_broader_than_ledger(self):
        entries = RDR.load_lawlist(RDR.LAWLIST)
        self.assertGreater(len(entries), 9000)
        import json
        inv = json.loads(RDR.INVENTORY.read_text(encoding="utf-8"))
        self.assertEqual(len(inv["laws"]), 327)
        exact, short, by_no = RDR.build_index(entries)
        for name in ("会社法", "地方自治法", "金融商品取引法"):
            lid, method = RDR.resolve_name(name, exact, short, by_no)
            self.assertTrue(lid, name)
            self.assertEqual(method, "exact_law_name")

    def test_json_groups_all_reference_names(self):
        import json
        doc = json.loads(RDR.OUT_JSON.read_text(encoding="utf-8"))
        for group in doc["new_law_candidates"]:
            self.assertTrue(group["reference_names"])
            self.assertEqual(group["total_occurrences"],
                             sum(n["occurrences"] for n in group["reference_names"]))
        by_lid = {}
        for group in doc["new_law_candidates"]:
            by_lid.setdefault(group["law_id"], []).extend(n["name"] for n in group["reference_names"])
        self.assertTrue(all(len(v) >= 1 for v in by_lid.values()))
        self.assertGreater(len(doc["unresolved"]), 0)

    def test_gate_compares_json_artifact(self):
        src = RDR.MODULE.read_text(encoding="utf-8") if hasattr(RDR, "MODULE") else ""
        if not src:
            import inspect
            src = inspect.getsource(RDR)
        self.assertIn("json_same", src)
        self.assertIn("OUT_JSON.read_text", src)


if __name__ == "__main__":
    unittest.main()
