from __future__ import annotations

import importlib.util
import json
import tempfile
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
CI = REPO / "scripts" / "ci"


def load():
    spec = importlib.util.spec_from_file_location("merged_guard", CI / "verify_merged_artifacts.py")
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


g = load()


class TestMergedArtifactGuard(unittest.TestCase):
    def test_real_manifest_is_intact(self):
        self.assertEqual(g.main(), 0)

    def test_deleted_artifact_is_detected(self):
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            p = tmp / "a.lean"
            p.write_text("example : True := by trivial\n", encoding="utf-8")
            old_repo, old_manifest = g.REPO, g.MANIFEST
            try:
                g.REPO = tmp
                g.MANIFEST = tmp / "manifest.json"
                g.MANIFEST.write_text(json.dumps({
                    "schema": 1,
                    "artifacts": {"a.lean": {"sha256": g.sha(p)}},
                }), encoding="utf-8")
                self.assertEqual(g.main(), 0)
                p.unlink()
                self.assertEqual(g.main(), 1)
            finally:
                g.REPO, g.MANIFEST = old_repo, old_manifest

    def test_altered_artifact_is_detected(self):
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            p = tmp / "b.lean"
            p.write_text("def x := 1\n", encoding="utf-8")
            old_repo, old_manifest = g.REPO, g.MANIFEST
            try:
                g.REPO = tmp
                g.MANIFEST = tmp / "manifest.json"
                g.MANIFEST.write_text(json.dumps({
                    "schema": 1,
                    "artifacts": {"b.lean": {"sha256": g.sha(p)}},
                }), encoding="utf-8")
                self.assertEqual(g.main(), 0)
                p.write_text("def x := 2\n", encoding="utf-8")
                self.assertEqual(g.main(), 1)
            finally:
                g.REPO, g.MANIFEST = old_repo, old_manifest


if __name__ == "__main__":
    unittest.main()
