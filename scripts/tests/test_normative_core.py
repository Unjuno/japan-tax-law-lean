"""Regression tests for Directive §1 queue and completion determination."""
from __future__ import annotations

import tempfile
import unittest
from pathlib import Path

from scripts.ci import normative_core as nc


LAW = "340AC0000000033"
REV = "340AC0000000033_20250601_504AC0000000068"


class IdentityTests(unittest.TestCase):
    def make(self, **kw):
        base = dict(
            law_id=LAW, history_id=REV, provision="MAIN", article="第一条",
            paragraph="1", item="一", subitem="", table="", row="", cell="",
            ordinal=0, kind="EFFECT", text="百分の十の税率を課する。",
        )
        base.update(kw)
        return nc.make_normative_id(**base)

    def test_full_sha256_and_all_components(self):
        ident = self.make()
        self.assertTrue(ident.startswith("NORM|"))
        self.assertEqual(len(ident), 5 + 64)
        self.assertEqual(len(ident[5:]), 64)

    def test_no_collision_across_dimensions(self):
        ids = {
            self.make(),
            self.make(article="第二条"),
            self.make(paragraph="2"),
            self.make(item="二"),
            self.make(cell="1"),
            self.make(ordinal=1),
            self.make(kind="EXCEPTION"),
            self.make(history_id=REV + "X"),
            self.make(provision="SUPPLEMENTARY"),
            self.make(text="百分の二十の税率を課する。"),
        }
        self.assertEqual(len(ids), 10)

    def test_delimiter_components_cannot_collide(self):
        self.assertNotEqual(nc.canon("a/b", "c"), nc.canon("a", "b/c"))


class DecompositionTests(unittest.TestCase):
    ARTICLE = {
        "tag": "Article", "attr": {"Num": "第一条"},
        "children": [
            {"tag": "ArticleTitle", "children": ["第一条（税率）"]},
            {"tag": "Paragraph", "attr": {"Num": "1"}, "children": [
                "所有者は、政令で定める場合には百分の十の税率を課する。",
                {"tag": "Item", "attr": {"Num": "一"}, "children": [
                    "ただし、みなす規定は適用しない。"]},
            ]},
        ],
    }

    def test_exact_coverage_and_kinds(self):
        d = nc.decompose_article(self.ARTICLE, LAW, REV, "第一条", "2025-06-01", {})
        self.assertEqual(d["coverage"]["status"], "COVERED")
        self.assertTrue(d["coverage"]["exact"])
        self.assertTrue(d["coverage"]["unique_ids"])
        kinds = {k for u in d["units"] for k in u["kinds"]}
        self.assertIn("DELEGATION", kinds)
        self.assertIn("EXCEPTION", kinds)
        self.assertIn("DEEMING", kinds)

    def test_unresolved_is_recorded(self):
        node = {"tag": "Article", "attr": {"Num": "第一条"},
                "children": ["意味不明な断片的文字列"]}
        d = nc.decompose_article(node, LAW, REV, "第一条", "", {})
        self.assertEqual(d["coverage"]["unresolved"], 1)
        self.assertTrue(any(u["kind"] == nc.UNRESOLVED for u in d["units"]))

    def test_gap_is_detected(self):
        d = nc.decompose_article(self.ARTICLE, LAW, REV, "第一条", "", {})
        units = d["units"][:-1]
        self.assertNotEqual(nc.audit_coverage(nc.flat(self.ARTICLE), units)["status"], "COVERED")


class DependencyTests(unittest.TestCase):
    INDEX = {LAW: LAW, "所得税法": LAW, "法人税法": "340AC0000000034"}

    def test_bare_id_is_underdetermined(self):
        deps = nc.parse_dependencies("340AC0000000033", {})
        self.assertTrue(deps)
        self.assertTrue(all(d["resolution"] == "unresolved_underdetermined" for d in deps))
        self.assertTrue(all(not d["sufficient"] for d in deps))

    def test_name_article_revision_resolves(self):
        text = "所得税法第九条（令和7年6月1日施行）の規定によるもの"
        deps = nc.parse_dependencies(text, self.INDEX)
        kinds = {d["resolution"] for d in deps}
        self.assertIn("resolved_by_name", kinds)
        self.assertTrue(any(d["type"] == "enforcement_version" for d in deps))

    def test_enforcement_index_supplies_third_coordinate(self):
        # §1.6: a law_article dep must carry the referenced law's enforced
        # version, not an empty string (audit finding 3).
        laws = [{"law_id": "340AC0000000034",
                 "current_revision": {"law_revision_id": "340AC0000000034_20250601_X"}}]
        idx = nc.build_enforcement_index(laws)
        self.assertEqual(idx["340AC0000000034"], "340AC0000000034_20250601_X")
        deps = nc.parse_dependencies("法人税法第九条の規定", self.INDEX, idx)
        dep = next(d for d in deps if d["type"] == "law_article" and d["law_id"] == "340AC0000000034")
        self.assertEqual(dep["enforcement_version"], "340AC0000000034_20250601_X")
        self.assertTrue(dep["sufficient"])


class StateTests(unittest.TestCase):
    def make_unit(self):
        return {"id": self.uid(), "law_id": LAW, "article": "第一条",
                "enforcement_date": "", "status": "PARTIAL", "dependencies": [],
                "source_digest": "abc123"}

    @staticmethod
    def uid():
        return nc.make_normative_id(
            LAW, REV, "MAIN", "第一条", "", "", "", "", "", "", 0, "EFFECT", "課する。")

    def test_merge_preserves_manual_fields(self):
        state = {"schema": "task_state/v1", "units": {}}
        uid = self.uid()
        state["units"][uid] = dict(nc.default_state(uid), owner="FORMALIZE",
                                    blockers=[{"code": "X", "resolved": False}],
                                    evidence={"kernel_proof": "build/foo.proof"})
        merged, _ = nc.merge_state(state, [self.make_unit()])
        self.assertEqual(merged["units"][uid]["owner"], "FORMALIZE")
        self.assertEqual(merged["units"][uid]["blockers"][0]["code"], "X")
        self.assertEqual(merged["units"][uid]["evidence"]["kernel_proof"], "build/foo.proof")

    def test_source_change_resets_evidence(self):
        state = {"schema": "task_state/v1", "units": {}}
        uid = self.uid()
        state["units"][uid] = dict(nc.default_state(uid), evidence={"kernel_proof": "old"},
                                    source_digest="olddigest")
        unit = self.make_unit()
        unit["source_digest"] = "newdigest"
        merged, notes = nc.merge_state(state, [unit])
        self.assertEqual(merged["units"][uid]["evidence"]["kernel_proof"], "")
        self.assertTrue(any(n.startswith("source-changed") for n in notes))

    def test_state_persistence_is_compact_and_lossless(self):
        """Owned units survive a round-trip; default units need not be stored."""
        owned = self.uid()
        other = nc.make_normative_id(
            LAW, REV, "MAIN", "第二条", "", "", "", "", "", "", 0, "EFFECT", "納める。")
        state = {"schema": "task_state/v1", "units": {
            owned: dict(nc.default_state(owned), owner="PROVE",
                        evidence={"kernel_proof": "build/proof"}),
            other: nc.default_state(other),
        }}
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "task_state.json"
            nc.save_state(state, p)
            saved = p.read_text(encoding="utf-8")
            self.assertNotIn(other, saved)  # default record is not persisted
            reloaded = nc.load_state(p)
        self.assertEqual(reloaded["units"][owned]["owner"], "PROVE")
        self.assertEqual(reloaded["units"][owned]["evidence"]["kernel_proof"], "build/proof")
        self.assertNotIn(other, reloaded["units"])


class CompletionTests(unittest.TestCase):
    def unit(self, **kw):
        base = {"blockers": [], "status": "PARTIAL", "unhandled_conditions": []}
        base.update(kw)
        return base

    def evidence(self, **over):
        ev = {k: "ref" for k in nc.EVIDENCE_AXES}
        ev.update(over)
        return ev

    def test_presence_alone_is_partial(self):
        ev = {k: ("ref" if k in nc.PRESENCE_AXES or k == "decomposition_audit" else "")
              for k in nc.EVIDENCE_AXES}
        st, _ = nc.derive_status(self.unit(), ev)
        self.assertEqual(st, nc.STATUS_PARTIAL)

    def test_no_source_location_is_not_started(self):
        ev = self.evidence()
        ev["source_location"] = ""
        st, _ = nc.derive_status(self.unit(), ev)
        self.assertEqual(st, nc.STATUS_NOT_STARTED)

    def test_kernel_without_audit_is_proved_scope(self):
        ev = self.evidence()
        ev["source_correspondence_audit"] = ""
        st, _ = nc.derive_status(self.unit(), ev)
        self.assertEqual(st, nc.STATUS_PROVED_SCOPE)

    def test_full_evidence_is_fully_verified(self):
        st, errs = nc.derive_status(self.unit(), self.evidence())
        self.assertEqual(st, nc.STATUS_FULLY_VERIFIED)
        self.assertEqual(errs, [])

    def test_unhandled_condition_caps_at_proved_scope(self):
        st, _ = nc.derive_status(self.unit(unhandled_conditions=["未対応条件"]), self.evidence())
        self.assertEqual(st, nc.STATUS_PROVED_SCOPE)

    def test_blocker_overrides(self):
        st, _ = nc.derive_status(self.unit(blockers=[{"code": "X", "resolved": False}]),
                                 self.evidence())
        self.assertEqual(st, nc.STATUS_BLOCKED)

    def test_skip_is_never_pass(self):
        ev = self.evidence()
        ev["kernel_proof"] = "SKIP"
        # "SKIP" is not evidence of a kernel proof; the caller must not map it to
        # a truthy reference. derive_status only accepts non-empty refs, so the
        # gate caller is required to pass "" for SKIP.
        ev["kernel_proof"] = ""
        st, _ = nc.derive_status(self.unit(), ev)
        self.assertNotEqual(st, nc.STATUS_FULLY_VERIFIED)

    def test_template_placeholder_is_not_evidence(self):
        # A __NAME__ template token is non-empty but is NOT review evidence.
        # A unit whose adversarial_review is still a placeholder must not be
        # FULLY_VERIFIED (§1 req 4: generic/template string != COMPLETE).
        self.assertFalse(nc._has_evidence("__ADVERSARIAL__"))
        self.assertTrue(nc._has_evidence("docs/ADVERSARIAL_X.md - verdict"))
        ev = self.evidence()
        ev["adversarial_review"] = "__ADVERSARIAL__"
        st, errs = nc.derive_status(self.unit(), ev)
        self.assertEqual(st, nc.STATUS_PROVED_SCOPE)
        self.assertTrue(errs)

    def test_all_placeholder_forms_are_not_evidence(self):
        for token in ("__TODO__", "__FILL_ME__", "__REVIEW__", "  __ADVERSARIAL__  "):
            self.assertFalse(nc._has_evidence(token), token)
        for good in ("ref", "docs/a.md", "LOCAL VERIFICATION (not CI-attested)"):
            self.assertTrue(nc._has_evidence(good), good)


class SelectorTests(unittest.TestCase):
    def unit(self, uid, **kw):
        base = {"id": uid, "law_id": LAW, "article": "第一条",
                "enforcement_date": "", "status": "NOT_STARTED", "dependencies": [],
                "evidence": {}}
        base.update(kw)
        return base

    def test_only_unfinished_and_unowned_selected(self):
        u1 = self.unit("a")
        u2 = self.unit("b", status="FULLY_VERIFIED")
        u3 = self.unit("c", owner="SOURCE")
        r = nc.select_tasks([u1, u2, u3], 10)
        self.assertEqual([x["id"] for x in r["selected"]], ["a"])

    def test_bare_id_dependency_blocks(self):
        candidate = self.unit("a", dependencies=[
            {"type": "law_id", "law_id": "340AC0000000034", "sufficient": False}])
        proved = self.unit("b", law_id="340AC0000000034", status="FULLY_VERIFIED")
        r = nc.select_tasks([candidate, proved], 10)
        self.assertEqual(r["selected"], [])
        self.assertEqual(r["blocked"][0]["reason"], "BLOCKED_BY_DEPENDENCY")

    def test_structured_dependency_satisfied(self):
        dep = {"type": "law_article", "law_id": "340AC0000000034",
               "article": "第二条", "sufficient": True}
        candidate = self.unit("a", dependencies=[dep])
        proved = self.unit("b", law_id="340AC0000000034", article="第二条",
                           status="PROVED_SCOPE")
        r = nc.select_tasks([candidate, proved], 10)
        ids = [x["id"] for x in r["selected"]]
        self.assertIn("a", ids)
        # PROVED_SCOPE is still an unfinished obligation: remaining axes are
        # returned so it can be selected for audit/integration work.
        self.assertIn("b", ids)
        self.assertTrue(next(x for x in r["selected"] if x["id"] == "b")["remaining_axes"])


if __name__ == "__main__":
    unittest.main()
