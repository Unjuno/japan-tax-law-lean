#!/usr/bin/env python3
"""The task selector's machine-readable output must be valid UTF-8 JSON."""
from __future__ import annotations

import json
import subprocess
import sys
import unittest
from pathlib import Path

CI = Path(__file__).resolve().parents[1] / "ci"


class SelectorOutputTests(unittest.TestCase):
    def test_output_is_parseable_utf8_json(self):
        r = subprocess.run(
            [sys.executable, str(CI / "task_selector.py"), "3"],
            capture_output=True,
        )
        self.assertEqual(r.returncode, 0, r.stderr[:400])
        data = json.loads(r.stdout.decode("utf-8"))
        self.assertIn("selected", data)
        self.assertIsInstance(data["selected"], list)


if __name__ == "__main__":
    unittest.main(verbosity=2)
