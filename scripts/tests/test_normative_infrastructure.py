#!/usr/bin/env python3
"""Canonical tests for the normative queue / completion infrastructure.

These are data-independent where possible; the real-inventory checks only read
the committed snapshot. Run:
  python -m unittest scripts.tests.test_normative_infrastructure -v
"""
from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
CI = REPO / "scripts" / "ci"
sys.path.insert(0, str(CI))

import dependency_parser as dp  # noqa: E402
import norm_decomposer as nd  # noqa: E402
import normative_ids as ni  # noqa: E402
import task_queue as tq  # noqa: E402
import task_selector as selector  # noqa: E402
import task_state as st  # noqa: E402

INVENTORY_FIXTURE = [
    {"law_id": "340AC0000000033", "official_title": "所得税法",
     "current_revision": {"law_revision_id": "REV-A",
                          "amendment_enforcement_date": "2026-04-01"},
     "current_revision_status": "CurrentEnforced"},
    {"law_id": "337AC0000000066", "official_title": "国税通則法",
     "current_revision": {"law_revision_id": "REV-B",
                          "amendment_enforcement_date": "2026-01-01"},
     "current_revision_status": "CurrentEnforced"},
]


class TestIdentifiers(unittest.TestCase):
    def make(self, **kw):
        base = dict(law_id="340AC0000000033", history_id="REV-A",
                    provision_kind="MAIN", fragment="税率は百分の十とする",
                    unit_index=0, norm_type="LEGAL_EFFECT")
        base.update(kw)
        return ni.make_id(**base)

    def test_full_digest_and_all_components_change_it(self):
        variants = [
            self.make(), self.make(law_id="340AC0000000034"),
            self.make(history_id="REV-Z"), self.make(provision_kind="SUPPLEMENTARY"),
            self.make(provision_id="Chapter:2"), self.make(article_no="第八十九条"),
            self.make(paragraph_no="第1項"), self.make(item_no="第1号"),
            self.make(subitem_path="イ"), self.make(table_cell_ref="row-3/col-2"),
            self.make(unit_index=1), self.make(norm_type="EXCEPTION"),
            self.make(fragment="税率は百分の二十とする"),
        ]
        ids = [v.identifier() for v in variants]
        self.assertEqual(len(set(ids)), len(ids))
        for v in variants:
            self.assertRegex(v.identifier(), r"^[0-9a-f]{64}$")

    def test_duplicate_is_rejected_and_deterministic(self):
        a, b = self.make(), self.make()
        self.assertEqual(a.identifier(), b.identifier())
        with self.assertRaises(ValueError):
            ni.assert_unique([a, b])
        ni.assert_unique([a])

    def test_missing_history_placeholder_is_non_colliding(self):
        a = self.make(history_id="", fragment="甲")
        b = self.make(history_id="", fragment="乙")
        self.assertNotEqual(a.identifier(), b.identifier())
        self.assertTrue(a.history_id.startswith("HISTORY_UNKNOWN:"))

    def test_canon_delimiter_safe(self):
        self.assertNotEqual(ni.canon("a/b", "c"), ni.canon("a", "b/c"))

    def test_ten_thousand_units_no_collision(self):
        ids = {self.make(unit_index=i).identifier() for i in range(10000)}
        self.assertEqual(len(ids), 10000)

    def test_empty_fragment_digest_rejected(self):
        with self.assertRaises(ValueError):
            ni.NormativeId(law_id="L", history_id="R", provision_kind="MAIN",
                           fragment_sha256="")


class TestDecomposition(unittest.TestCase):
    TEXT = ("事業者は、国内において課税資産の譲渡等をした場合には、消費税を納める義務がある。"
            "ただし、政令で定める場合は、この限りでない。"
            "当該事業者は、国税庁長官が定めるところによりみなす。"
            "推定する場合もある。"
            "不明確な記述断片")

    def test_reconstruction_and_unit_types(self):
        units = nd.decompose(self.TEXT)
        self.assertEqual("".join(u.text for u in units), self.TEXT)
        types = {u.norm_type for u in units}
        for expected in ("LEGAL_EFFECT", "EXCEPTION", "DEEMING",
                         "PRESUMPTION", "UNCLASSIFIED"):
            self.assertIn(expected, types)
        # "みなす" wins the primary kind, but the delegation cue is retained.
        self.assertTrue(any("DELEGATION" in u.kinds for u in units))

    def test_coverage_is_mechanical_only(self):
        units = nd.decompose(self.TEXT)
        cov = nd.audit_coverage(self.TEXT, units)
        self.assertTrue(cov["reconstruction_ok"])
        self.assertTrue(cov["contiguous"])
        self.assertTrue(cov["independent_reconstruction_ok"])
        self.assertEqual(cov["uncovered_chars"], 0)
        self.assertTrue(cov["unclassified_units"])
        self.assertTrue(cov["unresolved_units"])
        self.assertFalse(cov["audited"])
        self.assertEqual(cov["claim"], "MECHANICAL_COVERAGE_ONLY_NOT_SEMANTIC_AUDIT")

    def test_unresolvable_text_is_recorded(self):
        units = nd.decompose("意味不明な断片")
        self.assertTrue(all(u.needs_review for u in units))
        self.assertTrue(all(u.norm_type == "UNCLASSIFIED" for u in units))

    def test_exception_priority(self):
        self.assertEqual(nd.classify("ただし、年八百万円以下である場合は課しない。")["primary"],
                         "EXCEPTION")
        self.assertEqual(nd.classify("読み替えて適用する")["primary"],
                         "READING_SUBSTITUTION")
        operative = nd.classify("第1条の規定により所得税を課する")
        self.assertEqual(operative["primary"], "LEGAL_EFFECT")
        self.assertIn("REFERENCE", operative["kinds"])

    def test_audit_detects_gap(self):
        units = nd.decompose("abcdef")
        cov = nd.audit_coverage("abcdefgh", units)
        self.assertFalse(cov["ok"])
        self.assertGreater(cov["uncovered_chars"], 0)


class TestDependencies(unittest.TestCase):
    def test_bare_id_is_not_resolved(self):
        deps = dp.parse_dependencies("340AC0000000033 の規定による", INVENTORY_FIXTURE)
        self.assertEqual(len(deps), 1)
        self.assertFalse(deps[0].resolved)
        self.assertIn("bare_id_only", deps[0].note)
        ok, blockers = dp.dependencies_satisfied(deps, {"340AC0000000033"})
        self.assertFalse(ok)
        self.assertTrue(blockers)

    def test_name_article_revision_and_relation(self):
        deps = dp.parse_dependencies("所得税法第八条第一項の規定を準用する", INVENTORY_FIXTURE)
        d = [x for x in deps if x.law_name][0]
        self.assertEqual(d.law_id, "340AC0000000033")
        self.assertEqual(d.article_no, "第八条")
        self.assertEqual(d.paragraph_no, "第一項")
        self.assertEqual(d.enforcement_date, "2026-04-01")
        self.assertEqual(d.relation, "QUASI_APPLICATION")
        self.assertTrue(d.resolved)

    def test_historical_and_delegation_are_separate(self):
        deps = dp.parse_dependencies("改正前の所得税法第八条", INVENTORY_FIXTURE)
        self.assertTrue(any(d.resolution == "HISTORICAL" for d in deps))
        deps = dp.parse_dependencies("政令で定めるところによる", INVENTORY_FIXTURE)
        self.assertTrue(any(d.resolution == "EXTERNAL_UNVERIFIED" for d in deps))

    def test_completion_requires_exact_coordinates(self):
        deps = dp.parse_dependencies("所得税法第八条の規定を準用する", INVENTORY_FIXTURE)
        d = [x for x in deps if x.resolution == "RESOLVED_IN_LEDGER"][0]
        key = (d.law_id, d.article_no, d.enforcement_date)
        ok, blockers = dp.dependencies_satisfied([d], {key})
        self.assertTrue(ok)
        wrong = (d.law_id, "第九条", d.enforcement_date)
        ok, blockers = dp.dependencies_satisfied([d], {wrong})
        self.assertFalse(ok)
        self.assertTrue(blockers)


class TestCompletionState(unittest.TestCase):
    def unit(self, **kw):
        u = {"normative_id": "norm-test", "dependency_ids": [],
             "unresolved_conditions": []}
        u.update(kw)
        return u

    def evidence_all(self, uid="norm-test"):
        ev = {"records": {}}
        for axis in st.MECHANICAL_AXES:
            st.record_evidence(ev, uid, axis, evidence_ref=f"ci/run/{axis}", tool="lake build")
        return ev

    def test_presence_facts_alone_do_not_complete(self):
        fake = self.unit(needle_found=True, impl_present=True, spec_present=True,
                         theorem_name_matched=True, file_exists=True)
        stt = st.derive_status(fake, {"units": {}}, {"records": {}})
        self.assertEqual(stt["status"], "NOT_STARTED")
        self.assertFalse(stt["completion_claim"])

    def test_every_axis_is_required(self):
        for axis in st.MECHANICAL_AXES:
            ev = self.evidence_all()
            ev["records"]["norm-test"] = [r for r in ev["records"]["norm-test"]
                                           if r["axis"] != axis]
            self.assertNotEqual(st.derive_status(self.unit(), {"units": {}}, ev)["status"],
                                st.STATUS_FULLY_VERIFIED)
        self.assertEqual(st.derive_status(self.unit(), {"units": {}},
                                          self.evidence_all())["status"],
                         st.STATUS_FULLY_VERIFIED)

    def test_empty_evidence_ref_rejected(self):
        with self.assertRaises(ValueError):
            st.record_evidence({"records": {}}, "norm-test", "PROOF_SOUNDNESS",
                               evidence_ref="")

    def test_unresolved_caps_at_proved_scope(self):
        u = self.unit(unresolved_conditions=["delegated_fact_unresolved"])
        self.assertEqual(st.derive_status(u, {"units": {}}, self.evidence_all())["status"],
                         st.STATUS_PROVED_SCOPE)

    def test_blocker_and_stale_are_independent(self):
        ev = self.evidence_all()
        blocked = {"units": {"norm-test": dict(st.default_unit_state(),
                                                status=st.STATUS_BLOCKED,
                                                blockers=["NEEDS_LEGAL_INTERPRETATION"])}}
        self.assertEqual(st.derive_status(self.unit(), blocked, ev)["status"], "BLOCKED")
        stale = {"units": {"norm-test": dict(st.default_unit_state(),
                                              status=st.STATUS_STALE)}}
        self.assertEqual(st.derive_status(self.unit(), stale, ev)["status"], "STALE")

    def test_cross_law_axis_only_with_dependencies(self):
        ev = self.evidence_all()
        with_dep = self.unit(dependency_ids=["340AC0000000033"])
        self.assertNotEqual(st.derive_status(with_dep, {"units": {}}, ev)["status"],
                            st.STATUS_FULLY_VERIFIED)
        st.record_evidence(ev, "norm-test", "PROOF_CROSS_LAW", evidence_ref="ci/cross-law")
        self.assertEqual(st.derive_status(with_dep, {"units": {}}, ev)["status"],
                         st.STATUS_FULLY_VERIFIED)

    def test_human_review_is_a_separate_axis(self):
        ev = self.evidence_all()
        state = {"units": {"norm-test": st.default_unit_state()}}
        claim = st.completion_claim([self.unit()], state, ev)
        self.assertEqual(claim["fully_verified"], 1)
        self.assertFalse(claim["all_complete_claimable"])
        state["units"]["norm-test"]["legal_review"] = st.LEGAL_REVIEWED
        self.assertTrue(st.completion_claim([self.unit()], state, ev)["all_complete_claimable"])


class TestStatePersistence(unittest.TestCase):
    def test_manual_fields_survive_regeneration(self):
        state = st.load_state(Path(tempfile.gettempdir()) / "no-such-state-file.json")
        state["units"]["u1"] = {
            **st.default_unit_state(), "owner": "FORMALIZE", "status": "PROVED_SCOPE",
            "blockers": ["NEEDS_REVIEW"], "artifacts": ["JapanTaxLaw/X.lean"],
            "review_evidence": ["batch-AG"], "notes": "keep me",
            "last_generated_digest": "d1",
        }
        st.merge_state(state, [{"normative_id": "u1", "projection_digest": "d1"},
                               {"normative_id": "u2", "projection_digest": "d2"}])
        stamp = state["units"]["u1"]["updated_at"]
        st.merge_state(state, [{"normative_id": "u1", "projection_digest": "d1"},
                               {"normative_id": "u2", "projection_digest": "d2"}])
        self.assertEqual(state["units"]["u1"]["updated_at"], stamp,
                         "unchanged regeneration must not rewrite updated_at")
        self.assertEqual(state["units"]["u1"]["owner"], "FORMALIZE")
        self.assertEqual(state["units"]["u1"]["status"], "PROVED_SCOPE")
        self.assertEqual(state["units"]["u1"]["notes"], "keep me")
        self.assertEqual(state["units"]["u2"]["status"], "NOT_STARTED")

    def test_changed_source_downgrades_and_disappeared_is_stale(self):
        state = {"units": {"u1": {**st.default_unit_state(), "status": "FULLY_VERIFIED",
                                   "last_generated_digest": "old"}}}
        st.merge_state(state, [{"normative_id": "u1", "projection_digest": "new"}])
        self.assertEqual(state["units"]["u1"]["status"], "PARTIAL")
        self.assertIn("SOURCE_PROJECTION_CHANGED_REVALIDATE", state["units"]["u1"]["blockers"])
        st.merge_state(state, [])
        self.assertEqual(state["units"]["u1"]["status"], "STALE")

    def test_atomic_round_trip_and_prune(self):
        with tempfile.TemporaryDirectory() as d:
            p = Path(d) / "nested" / "task_state.json"
            state = {"schema": st.SCHEMA_STATE, "units": {"u": st.default_unit_state()}}
            st.save_state(state, p)
            self.assertEqual(st.load_state(p)["units"]["u"]["legal_review"],
                             st.LEGAL_REVIEW_PENDING)
            st.prune_defaults(state)
            self.assertNotIn("u", state["units"])


class TestSelector(unittest.TestCase):
    def task(self, tid, law, status="NOT_STARTED", deps=None, owner="", article="1",
             enforcement="2026-04-01", frag="税率 円", unresolved=None):
        return {"normative_id": tid, "law_id": law, "article": article,
                "enforcement_date": enforcement, "status": status, "owner": owner,
                "dependencies": deps or [], "unresolved_conditions": unresolved or [],
                "norm_fragment": frag, "dependency_ids": [],
                "verification": {"missing_axes": ["TESTS"]},
                "legal_review": "LEGAL_REVIEW_PENDING"}

    def test_only_unfinished_and_unowned_are_selected(self):
        tasks = [self.task("A", "L1"), self.task("B", "L2", "FULLY_VERIFIED"),
                 self.task("C", "L3", "BLOCKED"), self.task("D", "L4", owner="PROVE-1")]
        report = selector.select_tasks(tasks, 10)
        self.assertEqual({t["task_id"] for t in report["selected"]}, {"A"})
        self.assertGreaterEqual(report["skipped_status"], 2)
        self.assertEqual(report["skipped_owner"], 1)

    def test_exact_article_and_revision_dependency(self):
        dep = {"law_id": "L2", "article_no": "第二条", "enforcement_date": "2026-04-01",
               "resolution": "RESOLVED_IN_LEDGER", "raw": "所得税法第二条"}
        proved = self.task("P", "L2", "PROVED_SCOPE", article="第一条")
        candidate = self.task("A", "L1", deps=[dep])
        self.assertNotIn("A", {t["task_id"] for t in
                               selector.select_tasks([candidate, proved], 10)["selected"]})
        proved["article"] = "第二条"
        selected_ids = {t["task_id"] for t in selector.select_tasks([candidate, proved], 10)["selected"]}
        self.assertIn("A", selected_ids)

    def test_bare_id_dependency_blocks(self):
        dep = {"law_id": "", "raw": "123456789012345",
               "resolution": "UNRESOLVED", "note": "bare_id_only"}
        self.assertEqual(selector.select_tasks([self.task("A", "L1", deps=[dep])], 10)["selected"], [])

    def test_legal_review_is_not_a_filter(self):
        report = selector.select_tasks([self.task("A", "L1")], 10)
        self.assertTrue(report["legal_review_is_not_a_filter"])
        self.assertEqual(report["selected"][0]["remaining_axes"], ["TESTS"])


class TestStructuralCoordinates(unittest.TestCase):
    def test_coordinates_include_paragraph_item_cell(self):
        path = ("MainProvision:MainProvision", "Article:26", "Paragraph:1",
                "Item:一", "Subitem1:イ", "TableRow:0003", "TableColumn:0002")
        kind, pid, article, para, cell = tq._provision_info(path)
        self.assertEqual(kind, "MAIN")
        self.assertEqual(article, "第26条")
        self.assertEqual(para, "第1項")
        self.assertIn("TableRow:0003", cell)
        self.assertIn("Item:一", pid)

    def test_supplementary_and_appendix_are_distinct(self):
        p1 = ("SupplProvision:昭和四〇年法律", "Article:2")
        p2 = ("AppdxTable:第一", "TableRow:0001")
        self.assertEqual(tq._provision_info(p1)[0], "SUPPLEMENTARY")
        self.assertEqual(tq._provision_info(p2)[0], "APPENDIX_TABLE")


class TestGateSemantics(unittest.TestCase):
    def test_skip_is_not_pass(self):
        source = (REPO / "scripts" / "ci" / "run_python_gates.py").read_text(encoding="utf-8")
        self.assertIn("SKIP is never counted as PASS", source)
        self.assertIn("REQUIRED_GATES", source)
        self.assertIn("required gate is absent (SKIP is not PASS)", source)

    def test_status_vocabulary_is_distinct(self):
        self.assertEqual(len(set(st.STATUSES)), 6)
        self.assertNotIn("COMPLETE", st.STATUSES)


class TestFullSpanReader(unittest.TestCase):
    def test_units_in_same_provision_get_their_own_span(self):
        import link_existing_proofs as lp
        q_path = REPO / "build" / "task_queue.json"
        if not q_path.exists():
            self.skipTest("queue projection not generated")
        q = json.loads(q_path.read_text(encoding="utf-8"))
        groups: dict[tuple[str, str], list[dict]] = {}
        for t in q["tasks"]:
            groups.setdefault((t["source_file"], t["path"]), []).append(t)
        candidates = [g for g in groups.values() if len(g) >= 2]
        if not candidates:
            self.skipTest("no multi-unit provisions in projection")
        reader = lp.make_full_text_reader()
        for group in candidates[:10]:
            for t in group:
                text = reader(t)
                self.assertTrue(text, "exact span must be non-empty")
                self.assertTrue(text.startswith(t["norm_fragment"]),
                                "display prefix must be the start of the exact span")
                self.assertEqual(t["source_span"]["norm_end"] - t["source_span"]["norm_start"],
                                 len(text), "span length must match reconstructed text")


class TestRealInventory(unittest.TestCase):
    def test_non_tax_related_statutes_are_discovered_not_silently_inventoried(self):
        p = REPO / "build" / "discovered_laws.json"
        if not p.exists():
            self.skipTest("discovery ledger not generated yet")
        d = json.loads(p.read_text(encoding="utf-8"))
        self.assertGreater(d["resolved_non_tax"], 100)
        self.assertGreater(d["unresolved"], 0)
        self.assertGreaterEqual(d["local_ordinance_mentions"], 0)
        entries = d["entries"]
        self.assertTrue(any(e["category"] == "NON_TAX_NAME"
                            and e["resolution"] == "RESOLVED_IN_LAWLIST"
                            and e["law_id"] for e in entries))
        inv = json.loads((REPO / "data" / "INVENTORY.json").read_text(encoding="utf-8"))
        self.assertEqual(len(inv["laws"]), 327)  # discovery never auto-expands inventory

    def test_snapshot_is_pinned_and_raw_files_exist(self):
        inv = json.loads((REPO / "data" / "INVENTORY.json").read_text(encoding="utf-8"))
        self.assertEqual(inv.get("snapshot_date"), "2026-11-15")
        self.assertGreaterEqual(len(inv.get("laws", [])), 327)
        with_raw = [l for l in inv["laws"]
                    if (l.get("raw_snapshot") or {}).get("source_file")]
        self.assertGreater(len(with_raw), 300)
        for law in with_raw[:10]:
            self.assertTrue((REPO / law["raw_snapshot"]["source_file"]).exists())


if __name__ == "__main__":
    unittest.main(verbosity=2)
