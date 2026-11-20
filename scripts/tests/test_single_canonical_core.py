#!/usr/bin/env python3
"""Enforce one canonical normative core (Directive §1: no chaotic parallel edits).

Several near-duplicate "single source of truth" modules were written in
parallel for the same §1 task, with incompatible APIs. This test pins the
consolidation decision: `normative_core.py` is the only core, and the four
target artifacts all import it. Adding a second core is a test failure, not a
silent drift.
"""
from __future__ import annotations

import ast
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
CI = REPO / "scripts" / "ci"

# Historic names of parallel core attempts. None of these may exist except the
# canonical one; a re-export shim is also forbidden here (one core, one API).
CORE_NAMES = {
    "normative_core.py",
    "norm_core.py",
    "norm_ids.py",
    "normative_ids.py",
    "normative_id.py",
    "norm_identity.py",
    "normative_identity.py",
}
CANONICAL = "normative_core.py"
# article_scope.py is intentionally a pure, I/O-free helper (source location,
# decomposition, H/T/D/C/U). It must not reimplement the core API, but it does
# not import the core.
ADAPTERS = ("task_queue.py", "task_selector.py", "article_obligations.py")


class SingleCoreTests(unittest.TestCase):
    def test_only_one_core_module_exists(self):
        present = sorted(p.name for p in CI.glob("*.py") if p.name in CORE_NAMES)
        self.assertEqual(present, [CANONICAL],
                         f"duplicate normative cores present: {present}")

    def test_core_defines_identity_and_status_once(self):
        source = (CI / CANONICAL).read_text(encoding="utf-8")
        tree = ast.parse(source)
        defs = {n.name for n in tree.body if isinstance(n, (ast.FunctionDef, ast.AsyncFunctionDef))}
        for required in ("make_normative_id", "derive_status", "merge_state",
                         "select_tasks", "decompose_article", "parse_dependencies"):
            self.assertIn(required, defs, f"canonical core missing {required}")

    def test_no_other_module_defines_the_core_api(self):
        for path in CI.glob("*.py"):
            if path.name == CANONICAL:
                continue
            tree = ast.parse(path.read_text(encoding="utf-8"))
            defs = {n.name for n in ast.walk(tree)
                    if isinstance(n, (ast.FunctionDef, ast.AsyncFunctionDef))}
            clash = defs & {"make_normative_id", "derive_status",
                            "merge_state", "decompose_article",
                            "parse_dependencies"}
            self.assertFalse(clash, f"{path.name} redefines core API: {sorted(clash)}")

    def test_all_four_adapters_import_the_canonical_core(self):
        for name in ADAPTERS:
            text = (CI / name).read_text(encoding="utf-8")
            self.assertIn("normative_core", text,
                          f"{name} does not use the canonical core")


if __name__ == "__main__":
    unittest.main(verbosity=2)
