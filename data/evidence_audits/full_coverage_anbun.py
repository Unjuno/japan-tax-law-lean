#!/usr/bin/env python3
"""Full-coverage (NOT sampled) adversarial source-fidelity check for the 85
units in anbun.json assigned to JapanTaxLaw/ProportionalAllocation*.lean
(按分 pro-rata allocation).

READ-ONLY with respect to the repository. Script/report live only in
D:\\CodexData\\Temp\\opencode\\goal208\\.

For EVERY record (no sampling):
  1. pinned source SHA-256 (INVENTORY.json raw_snapshot) == the record's
     source_sha256, cross-checked against build/task_queue.json and the
     on-disk raw bytes;
  2. token 「按分」 occurs verbatim in the normalized pinned source
     (reconstructed by link_existing_proofs.py:make_full_text_reader) and in
     the normalized norm_fragment;
  3. norm_fragment is a CONTIGUOUS substring of the normalized full provision
     text; non-contiguous (or missing) fragments are reported explicitly.

Plus: forbidden proof-token scan of JapanTaxLaw/ProportionalAllocation*.lean
and structural confirmation that the allocate_decomposition theorem is intact.

Separately: an explicit assessment of whether modelling 按分 as
total*part/whole is a defensible reading of the Japanese term or an unstated
assumption. This is reported separately from the source-fidelity checks.

Scope: mechanical SHA / token / containment and structural checks only. No
legal advice, no completeness claim.
"""
from __future__ import annotations

import hashlib
import importlib.util
import json
import re
import sys
from pathlib import Path

sys.stdout.reconfigure(encoding="utf-8")

REPO = Path(r"C:\Users\user\.local\share\opencode\worktree\484e09\norm-queue-fix")
TMP = Path(r"D:\CodexData\Temp\opencode\goal208")
TARGET = TMP / "anbun.json"
REPORT = TMP / "fullcov_anbun_source_fidelity_report.json"
sys.path.insert(0, str(REPO / "scripts" / "ci"))
sys.path.insert(0, str(REPO / "scripts" / "law_audit"))


def load_json(path: Path):
    return json.loads(path.read_text(encoding="utf-8"))


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


lep = load_module("lep_anbun_audit", REPO / "scripts" / "ci" / "link_existing_proofs.py")
nosorry = load_module("nosorry_anbun_audit", REPO / "scripts" / "ci" / "check_no_sorry.py")

units = load_json(TARGET)
q = load_json(REPO / "build" / "task_queue.json")
tasks = {t["normative_id"]: t for t in q["tasks"]}
inventory = load_json(REPO / "data" / "INVENTORY.json")
full_text = lep.make_full_text_reader()

# ---- pinned raw snapshots from INVENTORY (authoritative pinned SHA/pin path) ----
pinned: dict[str, dict] = {}


def walk_pins(node):
    if isinstance(node, dict):
        if "law_id" in node and isinstance(node.get("raw_snapshot"), dict):
            snap = node["raw_snapshot"]
            if "source_sha256" in snap:
                pinned.setdefault(node["law_id"], {
                    "sha": str(snap["source_sha256"]).upper(),
                    "source_file": snap.get("source_file", ""),
                })
        for v in node.values():
            walk_pins(v)
    elif isinstance(node, list):
        for v in node:
            walk_pins(v)


walk_pins(inventory)

WS = re.compile(r"[\s\u3000]+")
TOKEN = "按分"


def norm(s: str) -> str:
    return WS.sub("", s)


def is_subsequence(frag: str, txt: str) -> tuple[bool, int]:
    """Greedy in-order subsequence match; returns (is_subsequence, matched)."""
    j = 0
    for ch in frag:
        idx = txt.find(ch, j)
        if idx < 0:
            return False, j
        j = idx + 1
    return True, j


checks = ("sha", "token", "contiguity")
counts = {k: 0 for k in checks}
failure_counts = {k: 0 for k in checks}
failures: list[dict] = []
file_sha_cache: dict[str, str] = {}
seen_ids: set[str] = set()
dup_ids: list[str] = []
per_unit: list[dict] = []
noncontiguous: list[dict] = []


def fail(idx: int, uid: str, check: str, reason: str, detail: str = "") -> None:
    failures.append({
        "index": idx, "normative_id": uid, "check": check,
        "reason": reason, "detail": str(detail)[:600],
    })
    failure_counts[check] += 1


for idx, u in enumerate(units):
    uid = u["normative_id"]
    short = uid[:12]
    t = tasks.get(uid)
    if uid in seen_ids:
        dup_ids.append(short)
    seen_ids.add(uid)

    # ---- hydration: unit fields must agree with the queued task ----
    hydrated_ok = bool(t) and (
        t.get("source_file") == u.get("source_file")
        and str(t.get("source_sha256", "")).upper() == str(u.get("source_sha256", "")).upper()
        and t.get("norm_fragment") == u.get("norm_fragment")
        and t.get("article") == u.get("article")
        and t.get("law_id") == u.get("law_id")
    )

    # ---- check 1: pinned source SHA-256 == source_sha256 ----
    sf = u["source_file"]
    if sf not in file_sha_cache:
        p = REPO / sf
        file_sha_cache[sf] = (
            hashlib.sha256(p.read_bytes()).hexdigest().upper() if p.exists() else "MISSING_FILE"
        )
    pin = pinned.get(u["law_id"])
    pin_sha = pin["sha"] if pin else "NO_PIN"
    unit_sha = str(u["source_sha256"]).upper()
    task_sha = str(t.get("source_sha256", "")).upper() if t else "NO_TASK"
    file_sha = file_sha_cache[sf]
    sha_ok = False
    if not hydrated_ok:
        fail(idx, uid, "sha", "unit fields disagree with build/task_queue.json or id absent",
             f"task_present={bool(t)}")
    elif not (pin_sha == unit_sha == task_sha == file_sha):
        fail(idx, uid, "sha",
             f"SHA mismatch: pinned={pin_sha} unit={unit_sha} task={task_sha} file={file_sha}")
    elif pin and pin["source_file"] and pin["source_file"] != sf:
        fail(idx, uid, "sha", f"pinned source_file mismatch: {pin['source_file']} != {sf}")
    else:
        sha_ok = True
        counts["sha"] += 1

    txt = full_text(t) if t else ""
    frag = u["norm_fragment"]
    tok = u["token"]
    frag_n, txt_n = norm(frag), norm(txt)

    # ---- check 2: token verbatim in normalized pinned source and fragment ----
    tok_in_frag_n = tok in frag_n
    tok_in_src_n = tok in txt_n
    tok_in_frag_raw = tok in frag
    tok_in_src_raw = tok in txt
    tok_ok = tok_in_frag_n and tok_in_src_n
    if tok_ok:
        counts["token"] += 1
    else:
        fail(idx, uid, "token", "token not verbatim in normalized source/fragment",
             f"token={tok} in_frag_norm={tok_in_frag_n} in_src_norm={tok_in_src_n} "
             f"in_frag_raw={tok_in_frag_raw} in_src_raw={tok_in_src_raw} text={txt}")

    # ---- check 3: contiguous substring of normalized full provision text ----
    direct = frag in txt
    normalized = frag_n in txt_n
    if normalized:
        contiguity = "CONTIGUOUS"
    else:
        subseq, matched = is_subsequence(frag_n, txt_n)
        contiguity = "NON_CONTIGUOUS" if subseq else "MISSING_TEXT"
        if not subseq:
            matched = 0
        noncontiguous.append({
            "index": idx, "normative_id": uid, "law_id": u["law_id"],
            "article": u["article"], "contiguity": contiguity,
            "matched": matched, "fragment_len": len(frag_n),
            "fragment": frag, "text": txt,
        })
    containment_ok = normalized and hydrated_ok
    if containment_ok:
        counts["contiguity"] += 1
    else:
        extra = ""
        if not normalized:
            subseq, matched = is_subsequence(frag_n, txt_n)
            extra = (f"{contiguity}: matched {matched}/{len(frag_n)} chars in order; ")
        fail(idx, uid, "contiguity",
             f"norm_fragment not a contiguous substring of normalized full text "
             f"(direct={direct}, normalized={normalized}, hydration={hydrated_ok}); " + extra,
             f"fragment={frag} text={txt}")

    per_unit.append({
        "index": idx, "normative_id": uid, "law_id": u["law_id"], "article": u["article"],
        "token": tok, "sha_ok": sha_ok, "token_ok": tok_ok,
        "containment_ok": containment_ok, "contiguity": contiguity,
        "direct_containment": direct, "normalized_containment": normalized,
        "hydration_ok": hydrated_ok, "source_text": txt, "norm_fragment": frag,
        "pin_sha": pin_sha, "unit_sha": unit_sha, "task_sha": task_sha, "file_sha": file_sha,
    })

n_units = len(units)

# ---- forbidden proof tokens + theorem integrity ----
FORBIDDEN = ("sorry", "admit", "axiom", "Classical.choice")
LEAN_FILES = [
    REPO / "JapanTaxLaw" / "ProportionalAllocation.lean",
    REPO / "JapanTaxLaw" / "ProportionalAllocationSpec.lean",
    REPO / "JapanTaxLaw" / "ProportionalAllocationTests.lean",
]
token_findings: list[dict] = []
lean_scan = []
lean_texts = {}
for p in LEAN_FILES:
    src = p.read_text(encoding="utf-8") if p.exists() else ""
    lean_texts[p.name] = src
    code = nosorry.strip_comments_and_strings(src)
    lean_scan.append({"file": p.name, "exists": p.exists(),
                      "code_sha256": hashlib.sha256(code.encode("utf-8")).hexdigest()})
    for token in FORBIDDEN:
        for m in re.finditer(r"\b" + re.escape(token) + r"\b", code):
            lineno = code.count("\n", 0, m.start()) + 1
            token_findings.append({"file": p.name, "line": lineno, "token": token})

spec_text = lean_texts.get("ProportionalAllocationSpec.lean", "")
code_spec = nosorry.strip_comments_and_strings(spec_text)
theorem_blocks = [m.group(0).strip() for m in re.finditer(
    r"theorem\s+allocate_decomposition[\s\S]*?(?=\n(?:theorem|def|end|namespace)\b|\Z)", code_spec)]
REQUIRED_THEOREM_PARTS = [
    "theorem allocate_decomposition (total part whole : Nat) (hw : 0 < whole) :",
    "allocate total part whole = total / whole * part + total % whole * part / whole := by",
    "unfold allocate",
    "Nat.div_add_mod total whole",
    "Nat.mul_add_div hw",
    "rw [hdec] at haux",
    "exact haux",
]
theorem_ok = (
    len(theorem_blocks) == 1
    and all(part in theorem_blocks[0] for part in REQUIRED_THEOREM_PARTS)
    and not token_findings
)
theorem_report = {
    "intact": theorem_ok,
    "block_count": len(theorem_blocks),
    "missing_parts": [p for p in REQUIRED_THEOREM_PARTS
                      if not theorem_blocks or p not in theorem_blocks[0]],
    "block_sha256": hashlib.sha256(theorem_blocks[0].encode("utf-8")).hexdigest()
                    if theorem_blocks else None,
    "block": theorem_blocks[0] if theorem_blocks else None,
}

# ---- modelling assessment (kept distinct from source-fidelity defects) ----
# The Japanese term 按分 (anbun) means proportional allocation/apportionment:
# distributing a total in proportion to a base. The canonical mathematical
# representation of a pro-rata share is total * part / whole, so the core
# reading is defensible. However, the term alone does NOT fix the particular
# operands (which base is `part`/`whole`), the floor-truncation (Nat division),
# or the handling of statutes that split a total into sub-totals. The Lean
# artifacts explicitly disclose these as caller-established modelling choices,
# so they are stated assumptions in the artifacts, not hidden ones. Verdict on
# this axis is therefore "defensible core reading; specific arithmetic is a
# disclosed modelling assumption, not entailed by the token alone".
modelling = {
    "token": "按分",
    "term_meaning": "proportional allocation / apportionment according to a base",
    "model": "allocate(total,part,whole) = total * part / whole  (Nat floor)",
    "core_reading_defensible": True,
    "unstated_elements": [
        "identity of `part` and `whole` (statute-specific base) is caller-established",
        "Nat floor-truncation of the quotient is an implementation choice not entailed by 按分",
        "where a statute splits a total into several sub-totals, only ONE pro-rata "
        "component is modelled and the split is caller-established",
    ],
    "disclosed_in_artifacts": True,
    "assessment": (
        "Defensible reading of the core pro-rata meaning of 按分; the specific "
        "floor arithmetic, operand selection and sub-total handling are disclosed "
        "modelling assumptions, not derived from the token alone. This is kept "
        "separate from source-fidelity defects."
    ),
}

all_checks_ok = (
    counts["sha"] == counts["token"] == counts["contiguity"] == n_units
    and not failures and len(dup_ids) == 0
)
verdict_ok = all_checks_ok and theorem_ok and not token_findings
report = {
    "scope": "FULL_COVERAGE_MECHANICAL_SOURCE_FIDELITY_NO_SAMPLING",
    "units_total": n_units,
    "unique_ids": len(seen_ids),
    "duplicate_ids": dup_ids,
    "checks": {
        "1_pinned_sha_equals_source_sha256": counts["sha"],
        "2_token_in_normalized_source_and_fragment": counts["token"],
        "3_contiguous_fragment_containment": counts["contiguity"],
    },
    "failure_counts": {f"check_{k}": failure_counts[k] for k in checks},
    "failures_total": len(failures),
    "failures": failures[:20],
    "noncontiguous_fragments": [
        {k: v for k, v in x.items() if k not in ("text",)} for x in noncontiguous
    ],
    "noncontiguous_count": len(noncontiguous),
    "per_unit": per_unit,
    "forbidden_tokens": token_findings,
    "lean_files_scanned": lean_scan,
    "allocate_decomposition": theorem_report,
    "modelling_assessment": modelling,
    "verdict": "PASS" if verdict_ok else "FAIL",
    "verdict_basis": "source_fidelity_and_lean_structure_only",
}
REPORT.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")

print("=== FULL-COVERAGE SOURCE-FIDELITY AUDIT: anbun.json (85 units, no sampling) ===")
print("units total:", n_units, " unique ids:", len(seen_ids), " duplicates:", dup_ids)
print("pass counts:", report["checks"])
print("failure counts:", report["failure_counts"], " total:", len(failures))
print("failures (max 20):")
for x in failures[:20]:
    print(f"  FAIL #{x['index']} {x['normative_id'][:12]} check={x['check']}: {x['reason']}")
    if x["detail"]:
        print("     ", x["detail"])
if not failures:
    print("  NONE")
print("non-contiguous fragments (explicit):",
      [(x["normative_id"][:12], x["contiguity"], f"{x['matched']}/{x['fragment_len']}")
       for x in noncontiguous] or "NONE")
print("forbidden proof tokens:", token_findings or "NONE")
print("allocate_decomposition intact:", theorem_ok,
      "blocks=", theorem_report["block_count"],
      "missing=", theorem_report["missing_parts"])
print("modelling assessment:", modelling["assessment"])
print("report:", REPORT)
print("VERDICT: " + report["verdict"])
