"""Regression tests for the CI preflight artifact sync (integration blocker fix)."""
from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path

CI = Path(__file__).resolve().parents[1] / "ci"


def load():
    spec = importlib.util.spec_from_file_location("preflight_sync", CI / "preflight_sync.py")
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


pf = load()


class PreflightTests(unittest.TestCase):
    def test_sync_steps_cover_all_drift_prone_artifacts(self):
        names = [n for n, _ in pf.SYNC_STEPS]
        self.assertIn("umbrella imports", names)
        self.assertIn("task queue", names)
        self.assertIn("coverage ledger", names)
        self.assertIn("L7 ledger", names)
        self.assertIn("law status ledger", names)

    def test_write_return_code_one_is_success(self):
        # Regeneration scripts return 1 when they wrote changes; preflight must
        # not treat that as a failure. Verified by reading the source rule.
        src = (CI / "preflight_sync.py").read_text(encoding="utf-8")
        self.assertIn("rc > 1", src)

    def test_workflow_calls_preflight_before_gates(self):
        wf = (Path(__file__).resolve().parents[2] / ".github/workflows/lean.yml").read_text(encoding="utf-8")
        p = wf.find("preflight_sync.py")
        g = wf.find("run_python_gates.py")
        self.assertGreater(p, 0)
        self.assertGreater(g, p)


if __name__ == "__main__":
    unittest.main()
