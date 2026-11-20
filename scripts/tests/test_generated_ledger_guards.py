"""Guard tests: generated ledgers must refuse to emit zero-filled baselines.

Objective §5: an absent results file must not be reported as a pass, and a
measurement computed without its inputs is not a measurement.
"""
import importlib.util
import pathlib
import unittest

REPO = pathlib.Path(__file__).resolve().parents[2]


def load_module(name: str, rel: str):
    spec = importlib.util.spec_from_file_location(name, REPO / rel)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


class GeneratedLedgerGuardTests(unittest.TestCase):
    def test_l7_guard_refuses_missing_sweep(self):
        mod = load_module("l7_guard_test", "scripts/ci/l7_ledger.py")
        original = mod.SWEEP
        try:
            mod.SWEEP = REPO / "build" / "__definitely_absent_audit_sweep.json"
            self.assertFalse(mod.require_inputs())
        finally:
            mod.SWEEP = original

    def test_coverage_guard_refuses_missing_cross_law(self):
        mod = load_module("coverage_guard_test", "scripts/ci/coverage_ledger.py")
        original = mod.CROSS
        try:
            mod.CROSS = REPO / "build" / "__definitely_absent_cross_law.json"
            self.assertFalse(mod.require_inputs())
        finally:
            mod.CROSS = original

    def test_l7_guard_accepts_present_inputs(self):
        mod = load_module("l7_guard_test2", "scripts/ci/l7_ledger.py")
        # Gate order in run_python_gates.py creates this before the L7 ledger.
        if mod.SWEEP.exists():
            self.assertTrue(mod.require_inputs())


if __name__ == "__main__":
    unittest.main()
