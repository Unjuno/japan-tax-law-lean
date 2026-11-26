#!/usr/bin/env python3
"""FULL-COVERAGE (all 71 units) adversarial source-fidelity check — READ-ONLY.

Target: every record in goal208/sen2.json assigned to
        JapanTaxLaw/SenSpecificDuty*.lean
        (customs tariff specific duty 一平方メートルにつき一円五二銭 = 152 sen/m^2).

For EVERY record this script checks:
  1. SHA-256 of the pinned source file bytes == record['source_sha256'].
  2. Token 「一平方メートルにつき一円五二銭」 occurs verbatim in the normalized
     pinned source AND in record['norm_fragment'].
  3. Independently parse 一円五二銭 -> 1 yen 52 sen -> 152 sen (1 yen = 100 sen)
     and confirm this matches the senRate constant used by the Lean files
     (doc comment + every numeric senRate argument) and every record's sen_rate.
  4. record['norm_fragment'] is contained in the normalized full provision text
     obtained from scripts/ci/link_existing_proofs.py::make_full_text_reader.
     Non-contiguous (stitched) fragments are detected and reported explicitly.
  5. The three SenSpecificDuty*.lean files are scanned for forbidden proof
     tokens, and the senDuty_agrees theorem is confirmed intact.

Full failure list is capped at 20 entries in the report.

This script writes ONLY to D:\\CodexData\\Temp\\opencode\\goal208\\.
No legal advice, no completeness claim. Scope: SHA / phrase / parse / containment.
"""
from __future__ import annotations

import hashlib
import importlib.util
import json
import re
import sys
from pathlib import Path

REPO = Path(r"C:\Users\user\.local\share\opencode\worktree\484e09\norm-queue-fix")
OUTDIR = Path(r"D:\CodexData\Temp\opencode\goal208")
UNITS_PATH = OUTDIR / "sen2.json"
REPORT = OUTDIR / "sen2_full_fidelity_report.txt"

TOKEN = "一平方メートルにつき一円五二銭"
EXPECTED_COUNT = 71
EXPECTED_SEN_RATE = 152
SEN_PER_YEN = 100  # 1 yen = 100 sen (independent definition)
FORBIDDEN = ("sorry", "admit", "axiom", "Classical.choice")
LEAN_FILES = (
    "SenSpecificDuty.lean",
    "SenSpecificDutySpec.lean",
    "SenSpecificDutyTests.lean",
)
MAX_FAILURES = 20

failures: list[str] = []
notes: list[str] = []


def fail(msg: str) -> None:
    failures.append(msg)


def normalize(s: str) -> str:
    """Same normalization convention as the repo's sen2 audit: drop all whitespace."""
    return re.sub(r"[\s\u3000]+", "", s)


# ---------------------------------------------------------------------------
# Independent kanji-numeral parsing (does NOT import the repo's kansuji module).
# ---------------------------------------------------------------------------
KANJI_DIGITS = {
    "〇": 0, "零": 0, "一": 1, "二": 2, "三": 3, "四": 4,
    "五": 5, "六": 6, "七": 7, "八": 8, "九": 9,
}
KANJI_UNITS = {"十": 10, "百": 100, "千": 1000, "万": 10000}


def parse_kanji_int(s: str) -> int:
    total = section = number = 0
    for ch in s:
        if ch in KANJI_DIGITS:
            number = number * 10 + KANJI_DIGITS[ch]
        elif ch in KANJI_UNITS:
            unit = KANJI_UNITS[ch]
            if unit == 10000:
                total += (section + number) * 10000
                section = number = 0
            else:
                section += (number if number else 1) * unit
                number = 0
        else:
            raise ValueError(f"unexpected kanji digit {ch!r} in {s!r}")
    return total + section + number


def parse_rate_phrase(token: str) -> tuple[int, int, int]:
    """Parse '...一円五二銭...' -> (yen, sen, yen*100+sen)."""
    m = re.search(r"([〇零一二三四五六七八九十百千万]+)円([〇零一二三四五六七八九十百千万]+)銭", token)
    if not m:
        raise ValueError(f"cannot parse 円/銭 amount out of {token!r}")
    yen = parse_kanji_int(m.group(1))
    sen = parse_kanji_int(m.group(2))
    if not 0 <= sen < SEN_PER_YEN:
        raise ValueError(f"sen component {sen} outside [0,100)")
    return yen, sen, yen * SEN_PER_YEN + sen


# ---------------------------------------------------------------------------
# Containment / contiguity classification.
# ---------------------------------------------------------------------------
def classify_containment(frag: str, text: str) -> tuple[str, object]:
    """Return (kind, detail): contiguous / non-contiguous / missing."""
    if frag in text:
        return "contiguous", text.index(frag)
    # Try to detect a stitched (non-contiguous) fragment: two ordered pieces
    # both present but not adjacent.
    for cut in range(1, len(frag)):
        left, right = frag[:cut], frag[cut:]
        i = text.find(left)
        if i < 0:
            continue
        j = text.find(right, i + len(left))
        if j >= 0 and j > i + len(left):
            return "non-contiguous", (i, i + len(left), j, j + len(right))
    return "missing", None


# ---------------------------------------------------------------------------
# Lean comment/string stripping (mirrors scripts/ci/check_no_sorry.py).
# ---------------------------------------------------------------------------
def strip_comments_and_strings(src: str) -> str:
    out: list[str] = []
    i, n = 0, len(src)
    while i < n:
        if src[i] == '"':
            out.append(" ")
            i += 1
            while i < n:
                c = src[i]
                if c == "\\":
                    out.append("  ")
                    i += 2
                elif c == '"':
                    out.append(" ")
                    i += 1
                    break
                else:
                    out.append("\n" if c == "\n" else " ")
                    i += 1
            continue
        if src.startswith("--", i):
            while i < n and src[i] != "\n":
                out.append(" ")
                i += 1
            continue
        if src.startswith("/-", i):
            depth = 0
            while i < n:
                if src.startswith("/-", i):
                    depth += 1
                    out.append("  ")
                    i += 2
                elif src.startswith("-/", i):
                    depth -= 1
                    out.append("  ")
                    i += 2
                    if depth == 0:
                        break
                else:
                    out.append("\n" if src[i] == "\n" else " ")
                    i += 1
            continue
        out.append(src[i])
        i += 1
    return "".join(out)


# ---------------------------------------------------------------------------
# Load units.
# ---------------------------------------------------------------------------
units = json.loads(UNITS_PATH.read_text(encoding="utf-8"))
detail: list[str] = []
detail.append("FULL-COVERAGE ADVERSARIAL SOURCE-FIDELITY CHECK — SenSpecificDuty (71 units)")
detail.append("READ-ONLY. Scope: SHA / phrase / parse / containment. No legal advice. No completeness claim.")
detail.append(f"records in sen2.json: {len(units)} (expected {EXPECTED_COUNT})")
if len(units) != EXPECTED_COUNT:
    fail(f"record count {len(units)} != expected {EXPECTED_COUNT}")

uids = [u.get("normative_id") for u in units]
dupes = sorted({u for u in uids if uids.count(u) > 1})
detail.append(f"duplicate normative_id in sen2.json: {len(dupes)}")
if dupes:
    fail(f"duplicate normative_id(s) in sen2.json: {[d[:12] for d in dupes]}")

# Load task_queue and the full-text reader.
q = json.loads((REPO / "build" / "task_queue.json").read_text(encoding="utf-8"))
tasks = q["tasks"]
by_id_multi: dict[str, list[dict]] = {}
for t in tasks:
    by_id_multi.setdefault(t.get("normative_id", ""), []).append(t)

spec = importlib.util.spec_from_file_location(
    "link_existing_proofs", REPO / "scripts" / "ci" / "link_existing_proofs.py"
)
mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)
full_text = mod.make_full_text_reader()

# ---------------------------------------------------------------------------
# Step 3 (global): parse the phrase, compare to Lean senRate constant.
# ---------------------------------------------------------------------------
yen, sen, derived_rate = parse_rate_phrase(TOKEN)
detail.append("\n=== RATE PARSE (independent) ===")
detail.append(f"token: {TOKEN}")
detail.append(f"parsed: {yen} yen  {sen} sen; 1 yen = {SEN_PER_YEN} sen -> {derived_rate} sen")
if (yen, sen, derived_rate) != (1, 52, EXPECTED_SEN_RATE):
    fail(f"independent rate parse {(yen, sen, derived_rate)} != (1,52,152)")

lean_texts = {f: (REPO / "JapanTaxLaw" / f).read_text(encoding="utf-8") for f in LEAN_FILES}
joined_lean = "\n".join(lean_texts.values())
strip_lean = {f: strip_comments_and_strings(s) for f, s in lean_texts.items()}
code_lean = "\n".join(strip_lean.values())

# Every senDuty-family application is `f area senRate`; the SECOND integer
# argument is the senRate constant. Parse those, not the area argument.
rate_literals: list[int] = []
for m in re.finditer(r"\b(?:senDuty|specSenDuty|agrees|senDuty_agrees)[ \t]+(\d[\d_]*)[ \t]+(\d[\d_]*)", code_lean):
    rate_literals.append(int(m.group(2).replace("_", "")))
# Defensive: if the Lean code ever defines a named senRate constant, check it too.
for m in re.finditer(r"\bdef\s+senRate\s*:=\s*(\d[\d_]*)", code_lean):
    rate_literals.append(int(m.group(1).replace("_", "")))
rate_literals = sorted(set(rate_literals))
detail.append(f"Lean numeric literals adjacent to senDuty family: {rate_literals}")
detail.append(f"doc comment states 152 sen: {'152 sen per square metre' in joined_lean}")
if not rate_literals or any(v != EXPECTED_SEN_RATE for v in rate_literals):
    fail(f"Lean senRate literals disagree with parsed 152: {rate_literals}")
if "1 yen 52 sen = 152 sen per square metre" not in joined_lean:
    fail("Lean doc comment does not state 1 yen 52 sen = 152 sen per square metre")
# sen->yen conversion must be division by 100, consistent with 1 yen = 100 sen.
if not re.search(r"def\s+senDuty\s*\(area senRate : Nat\)\s*:\s*Nat\s*:=\s*area\s*\*\s*senRate\s*/\s*100", code_lean):
    fail("senDuty definition does not divide by 100 (100 sen = 1 yen conversion)")

# ---------------------------------------------------------------------------
# Per-record checks (steps 1, 2, 4) — FULL COVERAGE, no sampling.
# ---------------------------------------------------------------------------
counts = {
    "sha_ok": 0,
    "token_in_source": 0,
    "token_in_fragment": 0,
    "sen_rate_ok": 0,
    "unique_task": 0,
    "contiguous": 0,
    "non_contiguous": 0,
    "missing": 0,
}
per_record: list[str] = []

for idx, u in enumerate(units, 1):
    uid = u.get("normative_id", "<no-id>")
    short = uid[:12]
    tag = f"[{idx:02d} {short}]"
    rec_lines: list[str] = [f"\n=== RECORD {tag} ==="]
    rec_lines.append(f"law_id={u.get('law_id')} article={u.get('article')!r} source_file={u.get('source_file')}")

    # 1. pinned source SHA-256.
    sf = REPO / u["source_file"]
    if not sf.is_file():
        fail(f"{tag} pinned source file missing: {u['source_file']}")
        computed = "<MISSING>"
    else:
        computed = hashlib.sha256(sf.read_bytes()).hexdigest().upper()
    sha_ok = computed == u["source_sha256"].upper()
    if sha_ok:
        counts["sha_ok"] += 1
    else:
        fail(f"{tag} SHA-256 mismatch: computed {computed} != pinned {u['source_sha256']}")
    rec_lines.append(f"sha256_ok={sha_ok} computed={computed} pinned={u['source_sha256']}")

    raw = sf.read_text(encoding="utf-8", errors="replace") if sf.is_file() else ""
    norm_source = normalize(raw)
    frag = u.get("norm_fragment", "")
    norm_frag = normalize(frag)

    # 2. token verbatim in normalized pinned source and in norm_fragment.
    in_src = TOKEN in norm_source
    in_frag = TOKEN in norm_frag
    if in_src:
        counts["token_in_source"] += 1
    else:
        fail(f"{tag} token not verbatim in normalized pinned source")
    if in_frag:
        counts["token_in_fragment"] += 1
    else:
        fail(f"{tag} token not verbatim in norm_fragment")
    rec_lines.append(f"token_in_source={in_src} token_in_norm_fragment={in_frag}")

    # 3 (per record). sen_rate field must be 152.
    if u.get("sen_rate") == EXPECTED_SEN_RATE and derived_rate == EXPECTED_SEN_RATE:
        counts["sen_rate_ok"] += 1
    else:
        fail(f"{tag} record sen_rate={u.get('sen_rate')} != parsed/Lean 152")

    # 4. norm_fragment containment in normalized full provision text.
    hits = by_id_multi.get(uid, [])
    if len(hits) != 1:
        fail(f"{tag} task_queue normative_id count {len(hits)} != 1")
    else:
        counts["unique_task"] += 1
        task = hits[0]
        # Cross-check the task points at the same pinned source.
        if task.get("source_file") != u.get("source_file"):
            fail(f"{tag} task source_file {task.get('source_file')} != unit source_file {u.get('source_file')}")
        full = normalize(full_text(task))
        rec_lines.append(f"full_text_len(normalized)={len(full)}")
        kind, info = classify_containment(norm_frag, full)
        counts[kind] += 1
        rec_lines.append(f"fragment_containment={kind} detail={info}")
        if kind == "non-contiguous":
            fail(f"{tag} NON-CONTIGUOUS fragment (stitched): pieces at {info}")
        elif kind == "missing":
            fail(f"{tag} norm_fragment NOT contained in full provision text (neither contiguous nor stitched)")
        # Also report raw (un-normalized) containment as a note.
        raw_full = full_text(task)
        if frag not in raw_full and norm_frag in full:
            notes.append(f"{tag} fragment matches only after whitespace normalization")
    per_record.extend(rec_lines)

# ---------------------------------------------------------------------------
# Step 5: forbidden proof-token scan + senDuty_agrees theorem intact.
# ---------------------------------------------------------------------------
detail.append("\n=== FORBIDDEN PROOF TOKEN SCAN (3 Lean files) ===")
detail.append(f"tokens: {FORBIDDEN}")
token_hits: list[str] = []
for f in LEAN_FILES:
    code = strip_lean[f]
    for token in FORBIDDEN:
        if re.search(rf"\b{re.escape(token)}\b", code):
            token_hits.append(f"{f}:{token}")
    detail.append(f"{f}: lines={len(lean_texts[f].splitlines())} stripped_len={len(code)}")
detail.append(f"token_hits={token_hits}")
if token_hits:
    fail(f"forbidden proof tokens found: {token_hits}")

detail.append("\n=== senDuty_agrees THEOREM INTEGRITY ===")
spec_code = normalize(strip_lean["SenSpecificDutySpec.lean"])
expected_agree = normalize(
    "theorem senDuty_agrees (area senRate : Nat) : "
    "senDuty area senRate = area / 100 * senRate + area % 100 * senRate / 100 := by "
    "unfold senDuty "
    "have hdec := Nat.div_add_mod area 100 "
    "have haux := aux (area / 100) (area % 100) senRate "
    "rw [hdec] at haux "
    "exact haux"
)
agree_intact = expected_agree in spec_code
detail.append(f"senDuty_agrees full declaration+proof intact: {agree_intact}")
agrees_refs_agree = bool(re.search(r"theorem\s+agrees\b[\s\S]*?senDuty_agrees", strip_lean["SenSpecificDutySpec.lean"]))
detail.append(f"agrees theorem references senDuty_agrees: {agrees_refs_agree}")
if not agree_intact:
    fail("senDuty_agrees theorem declaration/proof is not intact")
if not re.search(r"theorem\s+aux\b", strip_lean["SenSpecificDutySpec.lean"]):
    fail("aux theorem (dependency of senDuty_agrees) missing")

# ---------------------------------------------------------------------------
# Report.
# ---------------------------------------------------------------------------
n = len(units)
lines: list[str] = [f"COUNTS (of {n} records each):"]
for k, v in counts.items():
    lines.append(f"  {k}: {v}")
lines.append(f"  failures_total: {len(failures)}")
lines.append("\nNOTES:")
lines.extend(f"  - {x}" for x in notes)
lines.append("\nPER-RECORD DETAIL:")
lines.extend(per_record)
detail.extend(lines)
detail.append("\n=== FAILURE LIST (max 20) ===")
if failures:
    for f in failures[:MAX_FAILURES]:
        detail.append(f"  - {f}")
    if len(failures) > MAX_FAILURES:
        detail.append(f"  ... and {len(failures) - MAX_FAILURES} more (truncated at {MAX_FAILURES})")
else:
    detail.append("  (none)")

if failures:
    verdict = f"VERDICT: FAIL ({'; '.join(failures[:2])}{' ...' if len(failures) > 2 else ''})"
else:
    verdict = "VERDICT: PASS"

detail.append("")
detail.append("SCOPE: FULL-COVERAGE mechanical source-fidelity scoped to SHA/phrase/parse/containment;")
detail.append("surrounding context (ad-valorem comparison) out of scope. No legal advice, no completeness claim.")
detail.append(verdict)

REPORT.write_text("\n".join(detail) + "\n", encoding="utf-8")

print(f"records_checked={n}")
for k, v in counts.items():
    print(f"  {k}={v}")
print(f"failures_total={len(failures)}")
print(f"forbidden_token_hits={len(token_hits)}")
print(f"senDuty_agrees_intact={agree_intact}")
print(f"report={REPORT}")
print(verdict)
