"""Tests for the independent adversarial completion-gate auditor.

These tests exercise the auditor itself (not the queue modules), so a circular
proof in the queue modules cannot make a false COMPLETE pass here.
"""
from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO / "scripts" / "ci"))

import completion_gate_adversary as adv  # noqa: E402


class TestStripComments(unittest.TestCase):
    def test_docstring_completion_claim_is_not_live_code(self):
        src = '"""earlier versions wrote COMPLETE on a needle match"""\nx = 1\n'
        self.assertEqual(adv.strip_comments(src).strip(), "x = 1")

    def test_line_comment_removed(self):
        self.assertEqual(adv.strip_comments("status = 'X'  # fidelity says COMPLETE").strip(),
                         "status = 'X'")


class TestRules(unittest.TestCase):
    def test_presence_assignment_is_detected(self):
        f = adv.rule_no_needle_completion({"a.py": "done = all([fidelity, exists, agree])"})
        self.assertEqual(f["D"], "FAIL")

    def test_evidence_derivation_is_accepted(self):
        f = adv.rule_no_needle_completion({"a.py": "status = derive_status(unit, state, evidence)"})
        self.assertEqual(f["D"], "PASS")

    def test_single_boolean_status_is_rejected(self):
        f = adv.rule_distinct_states({"a.py": "status = bool(needle)"})
        self.assertEqual(f["D"], "FAIL")
        good = adv.rule_distinct_states({"a.py": " ".join(adv.STATES)})
        self.assertEqual(good["D"], "PASS")

    def test_dependency_rule_needs_name_article_and_revision(self):
        only15 = adv.rule_dependency_signals({"a.py": "re.findall(r'\\d{15}', text)"})
        self.assertEqual(only15["D"], "FAIL")
        full = adv.rule_dependency_signals({"a.py": "law_name article revision 15"})
        self.assertEqual(full["D"], "PASS")

    def test_skip_rule_requires_required_gate_set(self):
        self.assertEqual(adv.rule_skip_not_pass("print('SKIP')")["D"], "FAIL")
        self.assertEqual(adv.rule_skip_not_pass("REQUIRED_GATES = {...}\nstrict = True")["D"],
                         "PASS")

    def test_evidence_ledger_rejects_unsupported_full_verification(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            (root / "data").mkdir()
            (root / "data" / "task_state.json").write_text(json.dumps({
                "units": {"u": {"status": "FULLY_VERIFIED", "blockers": []}}
            }), encoding="utf-8")
            (root / "data" / "verification_evidence.json").write_text(json.dumps({
                "records": {"u": [{"axis": "TESTS", "evidence_ref": "ref", "date": "now"}]}
            }), encoding="utf-8")
            self.assertEqual(adv.rule_evidence_ledger(root)["D"], "FAIL")
            (root / "data" / "task_state.json").write_text(json.dumps({
                "units": {"u": {"status": "NOT_STARTED", "blockers": []}}
            }), encoding="utf-8")
            self.assertEqual(adv.rule_evidence_ledger(root)["D"], "PASS")

    def test_findings_always_carry_evidence_tuple(self):
        f = adv.finding("r", True, "h", "t", "d", "c", "u")
        for key in ("rule", "must", "H", "T", "D", "C", "U"):
            self.assertIn(key, f)


if __name__ == "__main__":
    unittest.main()
