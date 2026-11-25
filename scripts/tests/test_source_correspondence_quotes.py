"""Tests for the Lean-independent source correspondence audit's quoted-text
handling. 読替え norms quote the text to be replaced; those quotes must be
audited verbatim by a dedicated phrase audit, not mistaken for operative
numeric constants of the unit.
"""
from __future__ import annotations

import json
import os
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
SCRIPT = REPO / "scripts" / "ci" / "source_correspondence.py"
VERBATIM = "この場合において、第七項中「一年以内に」とあるのは、「一年以内において速やかに」と読み替えるものとする。"


def make_doc(tmp: Path) -> Path:
    tree = {
        "law_full_text": {"tag": "Law", "children": [{
            "tag": "Article", "attr": {"Num": "7"}, "children": [VERBATIM]}]}}
    p = tmp / "reading.law.json"
    p.write_text(json.dumps(tree, ensure_ascii=False), encoding="utf-8")
    return p


class TestQuotedTextInSourceCorrespondence(unittest.TestCase):
    def setUp(self):
        self.tmp = Path(tempfile.mkdtemp(prefix="src-corr-quotes-"))
        self.doc = make_doc(self.tmp)
        self.impl = self.tmp / "impl.lean"
        self.spec = self.tmp / "spec.lean"
        self.impl.write_text("一年以内に / 一年以内において速やかに", encoding="utf-8")
        self.spec.write_text("if p == original then replacement else p", encoding="utf-8")

    def run_cli(self, verbatim: str, *extra: str):
        env = dict(os.environ, PYTHONIOENCODING="utf-8")
        return subprocess.run(
            [sys.executable, str(SCRIPT), "--source-file", str(self.doc),
             "--article", "7", "--verbatim", verbatim,
             "--spec", str(self.spec), "--impl", str(self.impl), *extra],
            cwd=REPO, capture_output=True, text=True, encoding="utf-8", env=env)

    def run_audit(self, *extra: str) -> dict:
        return json.loads(self.run_cli(VERBATIM, *extra).stdout)

    def test_without_flag_kanji_in_quote_is_false_negative(self):
        out = self.run_audit()
        self.assertEqual(out["D"], "FAIL")
        self.assertEqual(out["missing_in_spec_or_impl"], [1])

    def test_ignore_quoted_removes_quote_numerals(self):
        out = self.run_audit("--ignore-quoted")
        self.assertEqual(out["D"], "PASS")
        self.assertEqual(out["constants_checked"], [])
        self.assertTrue(out["quoted_text_ignored"])
        self.assertTrue(out["verbatim_located"])
        self.assertTrue(out["phrase_only_correspondence"])

    def test_numbers_outside_quotes_are_still_checked(self):
        verb = VERBATIM + "十日以内とする。"
        tree = {"law_full_text": {"tag": "Law", "children": [{
            "tag": "Article", "attr": {"Num": "7"}, "children": [verb]}]}}
        self.doc.write_text(json.dumps(tree, ensure_ascii=False), encoding="utf-8")
        out = json.loads(self.run_cli(verb, "--ignore-quoted").stdout)
        self.assertEqual(out["D"], "FAIL")
        self.assertEqual(out["missing_in_spec_or_impl"], [10])
        self.impl.write_text(
            self.impl.read_text(encoding="utf-8") + "\n-- limit 10\n", encoding="utf-8")
        self.assertEqual(json.loads(self.run_cli(verb, "--ignore-quoted").stdout)["D"], "PASS")


if __name__ == "__main__":
    unittest.main()
