#!/usr/bin/env python3
"""Independent audit of build/task_queue.json against Objective §1.

Read-only verifier: checks the measured invariants of the generated queue and
exits non-zero on failure. Handles both the flat (one task = one normative unit)
and nested (task with normative_units[]) schemas.

Usage: python scripts/ci/verify_queue_invariants.py
"""
from __future__ import annotations

import hashlib
import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
# main() imports normative_core lazily; make that module importable both when
# run as a script and when this file is loaded via importlib from unit tests.
sys.path.insert(0, str(Path(__file__).resolve().parent))
QUEUE = REPO / "build" / "task_queue.json"
EXPECTED = {"NOT_STARTED", "PARTIAL", "PROVED_SCOPE", "FULLY_VERIFIED", "BLOCKED"}

results = []


def check(name, cond, detail=""):
    results.append((name, bool(cond), detail))
    print(f"{'PASS' if cond else 'FAIL'} {name}" + (f" - {detail}" if detail else ""))


def main() -> int:
    results.clear()  # allow repeated in-process runs (tests / CI retries)
    q = json.loads(QUEUE.read_text(encoding="utf-8"))
    tasks = q.get("tasks", [])
    units = []
    for t in tasks:
        nested = t.get("normative_units")
        if nested:
            units.extend(nested)
        else:
            units.append(t)

    check("normative units generated", len(units) > 0, f"{len(units)} units")
    ids = [u.get("normative_id") for u in units]
    check("all normative ids present", all(ids))
    ids_str = [str(i) for i in ids]
    check("normative ids unique", len(set(ids_str)) == len(ids_str),
          f"{len(ids_str) - len(set(ids_str))} duplicates")
    # The canonical id carries a stable "NORM|" namespace prefix followed by
    # the full 64-hex SHA-256 (see normative_core.make_normative_id).
    check("normative ids are 64-hex after namespace prefix",
          all(re.fullmatch(r"(?:NORM\|)?[0-9a-f]{64}", i) for i in ids_str))

    vocab = set(q.get("status_values", q.get("status_vocabulary", [])))
    if not vocab:
        vocab = set(q.get("completion_rule", {}).get("statuses", [])) if isinstance(
            q.get("completion_rule"), dict) else set()
    check("status vocabulary is five-valued", vocab == EXPECTED, str(sorted(vocab)))

    statuses = {u.get("status") for u in units}
    check("only declared statuses used", statuses <= EXPECTED, str(sorted(statuses)))
    counts = q.get("status_counts", {})
    # Accept FULLY_VERIFIED only when every evidence axis is backed in the
    # committed ledger. The old rule (FULLY_VERIFIED must be zero) punished
    # successful verification; accepting FV without evidence rewards a false
    # completion claim. Check backing, not absence.
    evidence_path = REPO / "data" / "verification_evidence.json"
    evidence = {}
    if evidence_path.exists():
        try:
            evidence = json.loads(evidence_path.read_text(encoding="utf-8")).get("units", {})
        except (ValueError, OSError):
            evidence = {}
    # Required axes come from the canonical core, never from the ledger under
    # test: a partial ledger must not redefine what counts as complete.
    # The script is also imported in-process by tests, so its own directory is
    # not necessarily on sys.path.
    sys.path.insert(0, str(Path(__file__).resolve().parent))
    import normative_core  # noqa: E402
    axes = set(normative_core.EVIDENCE_AXES)
    fv_units = [u for u in units if u.get("status") == "FULLY_VERIFIED"]
    unbacked = [str(u.get("normative_id", ""))[:24] for u in fv_units
                if not evidence.get(str(u.get("normative_id", "")), {})
                or any(not str(evidence[str(u.get("normative_id", ""))].get(a, "")).strip()
                       for a in axes)]
    check("every FULLY_VERIFIED is evidence-backed",
          (not fv_units) or (bool(axes) and not unbacked),
          f"FULLY_VERIFIED={len(fv_units)} axes={len(axes)} unbacked={len(unbacked)}")

    # Non-empty strings are necessary but not sufficient. Re-derive the status
    # from the evidence ledger using the canonical rule so a stale/hand-edited
    # queue cannot claim FULLY_VERIFIED (audit finding: self-declaration only).
    rederive_mismatch = []
    for u in fv_units:
        derived, _ = normative_core.derive_status(u, evidence.get(str(u.get("normative_id", "")), {}))
        if derived != "FULLY_VERIFIED":
            rederive_mismatch.append(str(u.get("normative_id", ""))[:24])
    check("FULLY_VERIFIED re-derives from evidence",
          not rederive_mismatch,
          f"mismatches={len(rederive_mismatch)}")

    # §1 req 4/5: completion must not rest on stale evidence references. A
    # later commit may edit a Lean file without updating the ledger sha256;
    # without this gate the unit stays FULLY_VERIFIED on a broken proof link.
    # Re-resolve each implementation/spec/tests sha256 against current files.
    broken_refs = []
    hash_ref = re.compile(r"(JapanTaxLaw/[\w.]+\.lean)\s+sha256=([0-9a-f]{64})")
    for u in fv_units:
        uid = str(u.get("normative_id", ""))
        axes_u = evidence.get(uid, {})
        for axis in ("implementation", "independent_spec", "tests"):
            for m in hash_ref.finditer(str(axes_u.get(axis, ""))):
                rel, claimed = m.group(1), m.group(2)
                fp = REPO / rel
                if not fp.exists():
                    broken_refs.append(f"{uid[:12]}:{axis}:missing:{rel}")
                    continue
                actual = hashlib.sha256(
                    fp.read_bytes().replace(b"\r\n", b"\n")
                ).hexdigest()
                if actual != claimed:
                    broken_refs.append(f"{uid[:12]}:{axis}:mismatch:{rel}")
    check("FULLY_VERIFIED evidence refs resolve to current files",
          not broken_refs,
          f"broken={len(broken_refs)}")

    sample = units[0]
    required = ("normative_id", "law_id", "article", "source_path", "kind",
                "text", "dependencies", "obligations", "owner", "blockers",
                "artifacts", "status")
    missing = [f for f in required if f not in sample]
    check("unit carries provenance/evidence fields", not missing, str(missing))

    kinds = {u.get("kind") for u in units}
    check("normative decomposition has multiple kinds", len(kinds) >= 4, str(sorted(str(k) for k in kinds)))
    check("UNRESOLVED norms recorded",
          any(str(k).upper() == "UNRESOLVED" for k in kinds)
          or any("unresolved" in str(u.get("kinds", "")).lower() for u in units[:2000]))

    dep_types = set()
    for u in units[:20000]:
        for d in u.get("dependencies", []):
            dep_types.add(d.get("type", d.get("kind")))
    check("dependencies beyond 15-digit id", len(dep_types) >= 2,
          str(sorted(str(x) for x in dep_types)))

    check("legal review is a separate axis",
          any(u.get("legal_review") for u in units[:100]) or "legal_review_axis" in q,
          str(q.get("legal_review_axis"))[:80])

    # §5 integrity: source-correspondence evidence is driven by the transcription
    # audit registry. A reconciliation that rewrites transcription_audit.py from a
    # stale base can silently drop checks, erasing evidence for previously verified
    # units (observed: 18 checks dropped -> 8 FULLY_VERIFIED units lost). The
    # persisted registry makes every such drop a REQUIRED-gate failure, never a
    # silent regression. Registered modules must all still carry a check.
    registry_path = REPO / "data" / "TRANSCRIPTION_CHECK_REGISTRY.json"
    if registry_path.exists():
        import importlib.util
        registry = json.loads(registry_path.read_text(encoding="utf-8")).get("modules", [])
        audit_path = REPO / "scripts" / "ci" / "transcription_audit.py"
        spec = importlib.util.spec_from_file_location("ve_audit_inv", audit_path)
        amod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(amod)
        checked = set()
        for name, *_rest in amod.checks():
            mm = re.search(r"(\w+)\.lean", name)
            if mm:
                checked.add(mm.group(1))
        lost = [m for m in registry if m not in checked]
        check("registered transcription checks retained",
              not lost, f"registered={len(registry)} lost={len(lost)} {sorted(lost)[:8]}")

    # Axiom-probe integrity: generate_axiom_probe.py emits #print axioms for
    # every tracked .lean module but _ax.lean imports only the umbrella. A
    # reconciliation that rewrites JapanTaxLaw.lean from a stale base drops
    # imports and turns CI red with "Unknown constant". Require every on-disk
    # module to be imported by the umbrella (REQUIRED gate).
    umbrella_path = REPO / "JapanTaxLaw.lean"
    if umbrella_path.exists():
        umbrella_text = umbrella_path.read_text(encoding="utf-8")
        imported = set()
        for line in umbrella_text.splitlines():
            line = line.strip()
            if line.startswith("import JapanTaxLaw."):
                imported.add(line[len("import "):].strip())
        disk_mods = {"JapanTaxLaw." + p.stem for p in (REPO / "JapanTaxLaw").glob("*.lean")}
        missing_imports = sorted(disk_mods - imported)
        check("umbrella imports retained",
              not missing_imports,
              f"modules={len(disk_mods)} missing={len(missing_imports)} {missing_imports[:6]}")

    bad = [n for n, ok, _ in results if not ok]
    print(f"\n{len(results) - len(bad)}/{len(results)} invariants passed")
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
