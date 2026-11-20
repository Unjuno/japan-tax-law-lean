#!/usr/bin/env python3
"""Regression tests for Objective §5 gate-result provenance.

A gate_results.json produced in a concurrently edited working tree can become
stale within seconds. A stale result must never be reported as "registered
checks all green". Results are bound to the commit they were produced from.
"""
from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path

CI = Path(__file__).resolve().parents[1] / "ci"
spec = importlib.util.spec_from_file_location("cgate", CI / "completion_gate.py")
cg = importlib.util.module_from_spec(spec)
spec.loader.exec_module(cg)


def reg(**kw):
    base = {"available": True, "pass": 3, "fail": 0, "skip": 0,
            "required_skip": 0, "commit_matches_head": True}
    base.update(kw)
    return base


class TestGateProvenance(unittest.TestCase):
    def test_green_requires_commit_binding(self):
        self.assertTrue(cg.checks_are_green(reg()))

    def test_stale_commit_is_not_green(self):
        self.assertFalse(cg.checks_are_green(reg(commit_matches_head=False)))

    def test_unavailable_results_is_not_green(self):
        self.assertFalse(cg.checks_are_green(reg(available=False)))

    def test_fail_or_skip_is_not_green(self):
        self.assertFalse(cg.checks_are_green(reg(fail=1)))
        self.assertFalse(cg.checks_are_green(reg(skip=1)))
        self.assertFalse(cg.checks_are_green(reg(required_skip=1)))

    def test_sha_lines_are_masked_for_determinism(self):
        a = "- gate results commit: abc\n- current HEAD commit: def\n- PASS: 1"
        b = "- gate results commit: xyz\n- current HEAD commit: uvw\n- PASS: 1"
        self.assertEqual(cg._stable_text(a), cg._stable_text(b))

    def test_real_changes_are_not_masked(self):
        a = "- PASS: 1"
        b = "- PASS: 2"
        self.assertNotEqual(cg._stable_text(a), cg._stable_text(b))


if __name__ == "__main__":
    unittest.main()
