"""Unit tests for the Phase E cross-law pin consistency checker.

Two layers:
  * integration: the repository's committed Lean pins must be consistent
    with the committed ledger (these are the audit's own artifacts —
    a regression here means pinned provenance drifted from the ledger);
  * synthetic: hand-built ledger/lean trees exercising each failure mode,
    including the two unenforced laws (508CO0000000106 / 508M60000040027)
    which must never be pinnable.
"""
from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO))

from scripts.law_audit.phase_e import cross_law  # noqa: E402


REAL_LEAN_DIR = REPO / "JapanTaxLaw"
REAL_INVENTORY = REPO / "data" / "INVENTORY.json"
UNENFORCED = {"508CO0000000106", "508M60000040027"}
ENF = "337AC0000000066_20261101_507AC0000000013"


def _ledger(law_ids=("337AC0000000066",)):
    laws = []
    for lid in law_ids:
        laws.append(
            {
                "law_id": lid,
                "law_num": "test-law",
                "official_title": "test",
                "promulgation_date": "19650416",
                "law_page": f"https://laws.e-gov.go.jp/law/{lid}",
                "category": "tax_national",
                "phase": "A",
                "revisions_fetch": "ok",
                "current_revision": {
                    "law_revision_id": f"{lid}_20261101_507AC0000000013",
                    "current_revision_status": "CurrentEnforced",
                    "amendment_enforcement_date": "2026-11-01",
                },
                "current_revision_status": "CurrentEnforced",
                "selection_status": "current_enforced",
                "raw_snapshot": {
                    "source_file": f"data/raw/{lid}_20261101_507AC0000000013.law.json",
                    "source_sha256": "A" * 64,
                    "size_bytes": 1,
                },
                "audit_ready": True,
            }
        )
    return {
        "laws": laws,
        "snapshot_date": "2026-11-15",
        "summary": {"unresolved": [{"law_id": lid, "status": "fully_unenforced"} for lid in UNENFORCED]},
    }


def _full_pin(lid):
    return (
        "/-!\n"
        f"Law id: {lid}\n"
        f"Revision: {lid}_20261101_507AC0000000013\n"
        "Amendment enforcement date: 2026-11-01 (CurrentEnforced)\n"
        f"Raw snapshot sha256: {'A' * 64}\n"
        "-/\n"
    )


class TestRepoPinsConsistent(unittest.TestCase):

    def test_real_repo_pins_all_consistent(self):
        report = cross_law.run(REAL_LEAN_DIR, REAL_INVENTORY)
        failed = [m for m in report["modules"] if not m["ok"]]
        self.assertEqual([], failed, f"pinned Lean modules inconsistent with ledger: {failed}")
        self.assertTrue(report["ok"])
        self.assertGreater(report["summary"]["pinned_modules_ok"], 0)

    def test_unenforced_laws_never_pinned_in_lean(self):
        for path in REAL_LEAN_DIR.glob("*.lean"):
            text = path.read_text(encoding="utf-8")
            for lid in UNENFORCED:
                self.assertNotIn(lid, text, f"{path.name} pins unenforced law {lid}")

    def test_real_spec_style_pin_present_in_local_privilege(self):
        text = (REAL_LEAN_DIR / "LocalPrivilege.lean").read_text(encoding="utf-8")
        self.assertIn("Law id: 325AC0000000226", text)
        self.assertIn("Revision: 325AC0000000226_20261101_508AC0000000002", text)


class TestSynthetic(unittest.TestCase):

    def setUp(self):
        self._tmp_ctx = tempfile.TemporaryDirectory(prefix="cross_law_")
        self.tmp = Path(self._tmp_ctx.name)
        self.lean = self.tmp / "lean"
        self.lean.mkdir()
        self.inv = self.tmp / "INVENTORY.json"
        self.inv.write_text(json.dumps(_ledger()), encoding="utf-8")

    def tearDown(self):
        self._tmp_ctx.cleanup()

    def _write(self, name, text):
        (self.lean / name).write_text(text, encoding="utf-8")

    def test_good_pin_passes(self):
        self._write("Good.lean", _full_pin("337AC0000000066"))
        report = cross_law.run(self.lean, self.inv)
        self.assertTrue(report["ok"])

    def test_wrong_sha_fails(self):
        self._write("Bad.lean", _full_pin("337AC0000000066").replace("A" * 64, "B" * 64))
        report = cross_law.run(self.lean, self.inv)
        self.assertFalse(report["ok"])
        self.assertIn("sha256", report["modules"][0]["problems"][0])

    def test_wrong_revision_fails(self):
        bad = _full_pin("337AC0000000066").replace(ENF, "337AC0000000066_19000101_DEADBEEF00000000")
        self._write("Bad.lean", bad)
        report = cross_law.run(self.lean, self.inv)
        self.assertFalse(report["ok"])

    def test_unknown_law_id_fails(self):
        self._write("Bad.lean", _full_pin("999ZZ0000000001"))
        report = cross_law.run(self.lean, self.inv)
        self.assertFalse(report["ok"])

    def test_revision_only_pin_resolves(self):
        self._write("Spec.lean", "/-!\nRevision: 337AC0000000066_20261101_507AC0000000013\n-/\n")
        report = cross_law.run(self.lean, self.inv)
        self.assertTrue(report["ok"])

    def test_revision_only_unknown_fails(self):
        self._write("Spec.lean", "/-!\nRevision: 337AC0000000066_19000101_DEADBEEF00000000\n-/\n")
        report = cross_law.run(self.lean, self.inv)
        self.assertFalse(report["ok"])

    def test_unenforced_law_cannot_be_pinned(self):
        bad_ledger = _ledger(law_ids=("337AC0000000066", "508CO0000000106"))
        for rec in bad_ledger["laws"]:
            if rec["law_id"] == "508CO0000000106":
                rec["current_revision"] = None
                rec["current_revision_status"] = "fully_unenforced"
                rec["selection_status"] = "fully_unenforced"
                rec["audit_ready"] = False
                rec["raw_snapshot"] = None
        self.inv.write_text(json.dumps(bad_ledger), encoding="utf-8")
        self._write("Bad.lean", _full_pin("508CO0000000106"))
        report = cross_law.run(self.lean, self.inv)
        self.assertFalse(report["ok"])
        joined = " ".join(report["modules"][0]["problems"])
        self.assertIn("508CO0000000106", joined)

    def test_unpinned_module_is_listed_not_verified(self):
        self._write("Plain.lean", "namespace X\ndef f := 1\nend X\n")
        report = cross_law.run(self.lean, self.inv)
        self.assertTrue(report["ok"])
        self.assertIn("Plain.lean", report["summary"]["unpinned_modules"])

    def test_enforcement_date_mismatch_fails(self):
        bad = _full_pin("337AC0000000066").replace("2026-11-01 (CurrentEnforced)", "2026-10-01 (CurrentEnforced)")
        self._write("Bad.lean", bad)
        report = cross_law.run(self.lean, self.inv)
        self.assertFalse(report["ok"])


if __name__ == "__main__":
    unittest.main()
