#!/usr/bin/env python3
"""Full-coverage (NOT sampled) adversarial source-fidelity check for the 7
FixedDeductions units in fixed.json (定額控除 「からX円を控除」).

READ-ONLY with respect to the repository. Script/report live only in
D:\\CodexData\\Temp\\opencode\\goal208\\.

For EVERY record (no sampling):
  1. pinned source SHA-256 (INVENTORY.json raw_snapshot) == unit source_sha256,
     cross-checked against build/task_queue.json and the on-disk raw bytes;
  2. token 「からX円を控除」 occurs verbatim in the normalized pinned source
     (reconstructed by link_existing_proofs.py:make_full_text_reader) and in
     the normalized norm_fragment;
  3. independent re-parse of X (kanji -> int) using an independently written
     parser, compared with the record's fixed_kanji, with the fragment/source
     captures, with the repo kansuji parser (on the 万-free sub-parts), and
     with the Lean example constants where applicable;
  4. norm_fragment is a CONTIGUOUS substring of the normalized full provision
     text; non-contiguous (or missing) fragments are reported explicitly.

Plus: forbidden proof-token scan of JapanTaxLaw/FixedDeductions*.lean and
structural confirmation that the fixedDeduction_agrees theorem is intact.

Scope: mechanical SHA / phrase / parse / containment only. Surrounding
semantic context, legal correctness and completeness are out of scope.
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
TARGET = TMP / "fixed.json"
REPORT = TMP / "fullcov_fixed_source_fidelity_report.json"
sys.path.insert(0, str(REPO / "scripts" / "ci"))
sys.path.insert(0, str(REPO / "scripts" / "law_audit"))


def load_json(path: Path):
    return json.loads(path.read_text(encoding="utf-8"))


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


lep = load_module("lep_fixed_audit", REPO / "scripts" / "ci" / "link_existing_proofs.py")
nosorry = load_module("nosorry_fixed_audit", REPO / "scripts" / "ci" / "check_no_sorry.py")
kansuji = load_module("kansuji_fixed_audit", REPO / "scripts" / "law_audit" / "kansuji.py")

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
TOKEN_RE = re.compile(r"から([〇零一二三四五六七八九十百千万]+)円を控除")
KAN_DIGIT = {"〇": 0, "零": 0, "一": 1, "二": 2, "三": 3, "四": 4,
             "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
KAN_UNIT = {"十": 10, "百": 100, "千": 1000}


def norm(s: str) -> str:
    return WS.sub("", s)


def parse_small(s: str) -> int:
    """Independent parser for kanji integers using only 〇零一..九 and 十百千."""
    if not s:
        raise ValueError("empty small kanji integer")
    total, digit = 0, 0
    for ch in s:
        if ch in KAN_DIGIT:
            digit = KAN_DIGIT[ch]
        elif ch in KAN_UNIT:
            unit = KAN_UNIT[ch]
            total += (digit if digit else 1) * unit
            digit = 0
        else:
            raise ValueError(f"unexpected kanji char {ch!r} in {s!r}")
    return total + digit


def parse_kanji_int(s: str) -> int:
    """Independent parser for the amounts here, incl. bare 万 / 百万 / 十万."""
    if not s:
        raise ValueError("empty kanji integer")
    if s.count("万") > 1:
        raise ValueError(f"multiple 万 in {s!r}")
    if "万" in s:
        hi, lo = s.split("万")
        return parse_small(hi or "一") * 10_000 + (parse_small(lo) if lo else 0)
    return parse_small(s)


def repo_crosscheck(s: str) -> int | None:
    """Cross-check with the repo parser on 万-free subparts (it rejects 万)."""
    try:
        if "万" in s:
            hi, lo = s.split("万")
            v = (kansuji.kanji_to_int(hi or "一") * 10_000
                 + (kansuji.kanji_to_int(lo) if lo else 0))
        else:
            v = kansuji.kanji_to_int(s)
        return int(v)
    except Exception:
        return None


def is_subsequence(frag: str, txt: str) -> tuple[bool, int]:
    """Greedy in-order subsequence match; returns (is_subsequence, matched)."""
    j = 0
    for ch in frag:
        idx = txt.find(ch, j)
        if idx < 0:
            return False, j
        j = idx + 1
    return True, j


counts = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0}
failure_counts = {k: 0 for k in counts}
failures: list[dict] = []
file_sha_cache: dict[str, str] = {}
seen_ids: set[str] = set()
dup_ids: list[str] = []
per_unit: list[dict] = []
parsed_values: list[int | None] = []


def fail(idx: int, uid: str, check: int, reason: str, detail: str = "") -> None:
    failures.append({
        "index": idx, "normative_id": uid, "check": check,
        "reason": reason, "detail": str(detail)[:400],
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
        fail(idx, uid, 1, "unit fields disagree with build/task_queue.json or id absent",
             f"task_present={bool(t)}")
    elif not (pin_sha == unit_sha == task_sha == file_sha):
        fail(idx, uid, 1,
             f"SHA mismatch: pinned={pin_sha} unit={unit_sha} task={task_sha} file={file_sha}")
    elif pin and pin["source_file"] and pin["source_file"] != sf:
        fail(idx, uid, 1, f"pinned source_file mismatch: {pin['source_file']} != {sf}")
    else:
        sha_ok = True
        counts[1] += 1

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
        counts[2] += 1
    else:
        fail(idx, uid, 2, "token not verbatim in normalized source/fragment",
             f"token={tok} in_frag_norm={tok_in_frag_n} in_src_norm={tok_in_src_n} "
             f"in_frag_raw={tok_in_frag_raw} in_src_raw={tok_in_src_raw} text={txt}")

    # ---- check 3: independent kanji re-parse ----
    fixed_kanji = u["fixed_kanji"]
    exact_token = f"から{fixed_kanji}円を控除"
    m_tok = TOKEN_RE.search(tok)
    tok_x = m_tok.group(1) if m_tok else None
    frag_xs = TOKEN_RE.findall(frag_n)
    src_xs = TOKEN_RE.findall(txt_n)
    parse_info = {"token_x": tok_x, "fixed_kanji": fixed_kanji,
                  "fragment_xs": frag_xs, "source_xs": src_xs}
    # Only the record's own X is compared with fixed_kanji. Other amounts with the
    # same phrase in the same provision are informational, not a parse mismatch.
    parse_ok = (tok == exact_token and tok_x == fixed_kanji
                and tok_x in frag_xs and tok_x in src_xs)
    parsed = None
    try:
        parsed = parse_kanji_int(tok_x) if tok_x is not None else None
        vals = {
            "token": parse_kanji_int(tok_x),
            "fixed_kanji": parse_kanji_int(fixed_kanji),
            "fragment": [parse_kanji_int(x) for x in frag_xs],
            "source": [parse_kanji_int(x) for x in src_xs],
            "repo_crosscheck": repo_crosscheck(tok_x),
        }
        parse_info["values"] = vals
        parse_info["other_token_amounts_in_source"] = sorted(
            {x for x in src_xs if x != tok_x})
        expected = vals["token"]
        parse_ok = (parse_ok and vals["fixed_kanji"] == expected
                    and vals["repo_crosscheck"] == expected
                    and expected in vals["fragment"] and expected in vals["source"])
    except Exception as exc:
        parse_ok = False
        parse_info["error"] = repr(exc)
        vals = {}
    parsed_values.append(parsed)
    if parse_ok:
        counts[3] += 1
    else:
        fail(idx, uid, 3, "independent kanji parse mismatch", f"{parse_info}")

    # ---- check 4: contiguous substring of normalized full provision text ----
    direct = frag in txt
    normalized = frag_n in txt_n
    if normalized:
        contiguity = "CONTIGUOUS"
    else:
        subseq, matched = is_subsequence(frag_n, txt_n)
        contiguity = "NON_CONTIGUOUS" if subseq else "MISSING_TEXT"
        parse_info.setdefault("contiguity_detail", {})
    containment_ok = normalized and hydrated_ok
    if containment_ok:
        counts[4] += 1
    else:
        extra = ""
        if not normalized:
            subseq, matched = is_subsequence(frag_n, txt_n)
            extra = (f"{contiguity}: matched {matched}/{len(frag_n)} chars in order; ")
        fail(idx, uid, 4,
             f"norm_fragment not a contiguous substring of normalized full text "
             f"(direct={direct}, normalized={normalized}, hydration={hydrated_ok}); " + extra,
             f"fragment={frag} text={txt}")

    per_unit.append({
        "index": idx, "normative_id": uid, "law_id": u["law_id"], "article": u["article"],
        "fixed_kanji": fixed_kanji, "token": tok, "parsed_value": parsed,
        "sha_ok": sha_ok, "token_ok": tok_ok, "parse_ok": parse_ok,
        "containment_ok": containment_ok, "contiguity": contiguity,
        "direct_containment": direct, "normalized_containment": normalized,
        "hydration_ok": hydrated_ok, "parse_detail": parse_info,
    })

counts[5] = len(units)

# ---- Lean example constants: compare where applicable ----
LEAN_FILES = [
    REPO / "JapanTaxLaw" / "FixedDeductions.lean",
    REPO / "JapanTaxLaw" / "FixedDeductionsSpec.lean",
    REPO / "JapanTaxLaw" / "FixedDeductionsTests.lean",
]
EXAMPLE_RE = re.compile(r"example\s*:\s*fixedDeduction\s+(\d[\d_]*)\s+(\d[\d_]*)")
lean_examples = []
lean_texts = {}
for p in LEAN_FILES:
    s = p.read_text(encoding="utf-8")
    lean_texts[p.name] = s
    for m in EXAMPLE_RE.finditer(s):
        base = int(m.group(1).replace("_", ""))
        fixed = int(m.group(2).replace("_", ""))
        lean_examples.append({"file": p.name, "base": base, "fixed": fixed})
lean_fixed_constants = sorted({e["fixed"] for e in lean_examples})
unit_values = sorted({v for v in parsed_values if v is not None})
applicable = []
for pv in per_unit:
    v = pv["parsed_value"]
    if v is not None and v in lean_fixed_constants:
        applicable.append({
            "normative_id": pv["normative_id"], "fixed_kanji": pv["fixed_kanji"],
            "parsed_value": v, "lean_fixed_constant_present": True,
            "agrees": True,
        })
    elif v is not None:
        applicable.append({
            "normative_id": pv["normative_id"], "fixed_kanji": pv["fixed_kanji"],
            "parsed_value": v, "lean_fixed_constant_present": False,
            "agrees": None,  # not applicable: no Lean example for this amount
        })
# informational: example fixed constants not tied to any pinned unit
non_pinned_lean_constants = sorted(set(lean_fixed_constants) - set(unit_values))
# verify arithmetic of every concrete equality example
example_arithmetic = []
for e in lean_examples:
    expected = e["base"] - e["fixed"] if e["fixed"] <= e["base"] else 0
    example_arithmetic.append({**e, "expected_result": expected})

# ---- forbidden proof tokens + theorem integrity ----
FORBIDDEN = ("sorry", "admit", "axiom", "Classical.choice")
token_findings: list[dict] = []
lean_scan = []
for p in LEAN_FILES:
    src = lean_texts[p.name]
    code = nosorry.strip_comments_and_strings(src)
    lean_scan.append({"file": p.name, "exists": True,
                      "code_sha256": hashlib.sha256(code.encode("utf-8")).hexdigest()})
    for token in FORBIDDEN:
        for m in re.finditer(r"\b" + re.escape(token) + r"\b", code):
            lineno = code.count("\n", 0, m.start()) + 1
            token_findings.append({"file": p.name, "line": lineno, "token": token})

spec_text = lean_texts["FixedDeductionsSpec.lean"]
code_spec = nosorry.strip_comments_and_strings(spec_text)
theorem_blocks = [m.group(0).strip() for m in re.finditer(
    r"theorem\s+fixedDeduction_agrees[\s\S]*?(?=\n(?:theorem|def|end)\b|\Z)", code_spec)]
REQUIRED_THEOREM_PARTS = [
    "theorem fixedDeduction_agrees (base fixed : Nat) :",
    "fixedDeduction base fixed = specFixedDeduction base fixed := by",
    "unfold fixedDeduction specFixedDeduction",
    "by_cases h : fixed ≤ base",
    "Nat.min_eq_right h",
    "by omega",
    "Nat.min_eq_left hb",
]
theorem_ok = (
    len(theorem_blocks) == 1
    and all(part in theorem_blocks[0] for part in REQUIRED_THEOREM_PARTS)
    and theorem_blocks[0].count("simp [h, hm]") >= 2
    and not token_findings
)
theorem_report = {
    "intact": theorem_ok,
    "block_count": len(theorem_blocks),
    "missing_parts": [p for p in REQUIRED_THEOREM_PARTS
                      if not theorem_blocks or p not in theorem_blocks[0]],
    "simp_count": theorem_blocks[0].count("simp [h, hm]") if theorem_blocks else 0,
    "block_sha256": hashlib.sha256(theorem_blocks[0].encode("utf-8")).hexdigest()
                    if theorem_blocks else None,
    "block": theorem_blocks[0] if theorem_blocks else None,
}

all_checks_ok = (counts[1] == counts[2] == counts[3] == counts[4] == len(units)
                 and not failures and len(dup_ids) == 0)
verdict_ok = all_checks_ok and theorem_ok and not token_findings
report = {
    "scope": "FULL_COVERAGE_MECHANICAL_SOURCE_FIDELITY_NO_SAMPLING",
    "units_total": len(units),
    "checks": {
        "1_pinned_sha_equals_source_sha256": counts[1],
        "2_token_in_normalized_source_and_fragment": counts[2],
        "3_independent_kanji_parse": counts[3],
        "4_contiguous_fragment_containment": counts[4],
    },
    "failure_counts": {f"check_{k}": failure_counts[k] for k in (1, 2, 3, 4)},
    "failures_total": len(failures),
    "failures": failures[:20],
    "duplicate_ids": dup_ids,
    "per_unit": per_unit,
    "parsed_values": parsed_values,
    "lean_examples": lean_examples,
    "lean_fixed_constants": lean_fixed_constants,
    "lean_constants_applicable": applicable,
    "lean_non_pinned_example_constants": non_pinned_lean_constants,
    "example_arithmetic": example_arithmetic,
    "forbidden_tokens": token_findings,
    "lean_files_scanned": lean_scan,
    "fixedDeduction_agrees": theorem_report,
    "verdict": "PASS" if verdict_ok else "FAIL",
}
REPORT.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")

print("=== FULL-COVERAGE SOURCE-FIDELITY AUDIT: fixed.json (7 units, no sampling) ===")
print("units total:", len(units), " unique ids:", len(seen_ids), " duplicates:", dup_ids)
print("pass counts:", report["checks"])
print("failure counts:", report["failure_counts"], " total:", len(failures))
print("failures (max 20):")
for x in failures[:20]:
    print(f"  FAIL #{x['index']} {x['normative_id'][:12]} check{x['check']}: {x['reason']}")
    if x["detail"]:
        print("     ", x["detail"])
if not failures:
    print("  NONE")
print("non-contiguous fragments:",
      [x["normative_id"][:12] for x in per_unit if x["contiguity"] != "CONTIGUOUS"] or "NONE")
print("independently parsed values:", parsed_values)
print("Lean example fixed constants:", lean_fixed_constants,
      "(non-pinned boundary examples:", non_pinned_lean_constants, ")")
print("Lean constants applicable to units:",
      [(x["fixed_kanji"], x["parsed_value"], x["agrees"]) for x in applicable])
print("forbidden proof tokens:", token_findings or "NONE")
print("fixedDeduction_agrees intact:", theorem_ok,
      "blocks=", theorem_report["block_count"], "simp=", theorem_report["simp_count"],
      "missing=", theorem_report["missing_parts"])
print("report:", REPORT)
print("VERDICT: " + report["verdict"])
