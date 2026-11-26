#!/usr/bin/env python3
"""FULL-COVERAGE mechanical source-fidelity audit of the 83 pinned floor units.

READ-ONLY with respect to the repository: every provision text is obtained via
scripts/ci/link_existing_proofs.py:make_full_text_reader().

Scope: the exact ``円未満の端数`` rounding phrase, source SHA, threshold and
floor-direction checks. Surrounding semantic context is out of scope.
"""
from __future__ import annotations

import hashlib
import importlib.util
import json
import pathlib
import re
import subprocess
import sys
import unicodedata

TEMP = pathlib.Path(r"D:\CodexData\Temp\opencode\goal208")
REPO = pathlib.Path(r"C:\Users\user\.local\share\opencode\worktree\484e09\norm-queue-fix")
TARGET = TEMP / "floor_all.json"
REPORT = TEMP / "audit_floor_fidelity_report.txt"

sys.path.insert(0, str(REPO / "scripts" / "ci"))

# --- helper required by the brief: full provision text from pinned bytes -----
spec = importlib.util.spec_from_file_location(
    "link_existing_proofs", REPO / "scripts" / "ci" / "link_existing_proofs.py")
lxp = importlib.util.module_from_spec(spec)
spec.loader.exec_module(lxp)
full_text_reader = lxp.make_full_text_reader()

# repo's own whitespace-normalisation convention (phase_e/rate_consistency.norm)
def norm_ws(s: str) -> str:
    return re.sub(r"[\s\u3000]+", "", s)

def norm_all(s: str) -> str:
    return norm_ws(unicodedata.normalize("NFKC", s))

# ordered longest-first so 五百円 / 一万円 win over 百円 / 一円
KANJI_TO_YEN = [("一万円", 10000), ("五百円", 500), ("千円", 1000),
                ("百円", 100), ("一円", 1)]
MODELED = {1, 100, 500, 1000, 10000}
CONSTANT = {1: "oneYen", 100: "hundredYen", 500: "fiveHundredYen",
            1000: "thousandYen", 10000: "tenThousandYen"}

THR_RE = re.compile(r"(一万円|五百円|千円|百円|一円)未満の端数")
PHRASE_RE = re.compile(r"円未満の端数")
FLOOR_CUE = ("切り捨て", "切捨て", "端数金額を控除した金額")
ROUNDUP_RE = re.compile(r"四捨五入|切り上げ|切上げ")

# A genuine range-based round-up-to-fixed-value pattern:
#   "...<amount>円以上 ... <amount>円未満の端数 ... とする"
RANGE_ROUNDUP_RE = re.compile(r"円以上[^。]{0,80}?円未満の端数[^。]{0,100}?とする")

units = json.loads(TARGET.read_text(encoding="utf-8"))
q = json.loads((REPO / "build" / "task_queue.json").read_text(encoding="utf-8"))
by_id = {t["normative_id"]: t for t in q["tasks"]}
evidence = json.loads((REPO / "data" / "verification_evidence.json").read_text(
    encoding="utf-8"))["records"]
impl_src = (REPO / "JapanTaxLaw" / "FloorRoundingMinimum.lean").read_text(encoding="utf-8")
spec_src = (REPO / "JapanTaxLaw" / "FloorRoundingMinimumSpec.lean").read_text(encoding="utf-8")

FAIL: dict[int, list[str]] = {1: [], 2: [], 3: [], 4: [], 5: []}
OUT_OF_SCOPE_FLAGS: list[str] = []
PASS = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0}
DETAIL: list[str] = []


def threshold_of(text: str) -> list[int]:
    return sorted({dict(KANJI_TO_YEN)[k] for k in THR_RE.findall(text)})


def detect_roundups(ft: str) -> tuple[list[str], list[str]]:
    """Return (in-scope round-ups, out-of-scope flags).

    A round-up token is in scope only when the nearest preceding ``未満の端数``
    phrase is a MONEY phrase (``円未満の端数``); e.g. ``月数に一月未満の端数``
    governs month counts and is a different rounding phrase, out of scope.
    """
    in_scope: list[str] = []
    out: list[str] = []
    for m in ROUNDUP_RE.finditer(ft):
        preceding = ft[:m.start()]
        phrases = list(re.finditer(r"([^\s、。]{0,12})未満の端数", preceding))
        nearest = phrases[-1].group(0) if phrases else ""
        if "円未満の端数" in nearest:
            in_scope.append(f"{m.group(0)} after '{nearest}'")
        else:
            out.append(f"{m.group(0)} after '{nearest}'")
    for m in RANGE_ROUNDUP_RE.finditer(ft):
        in_scope.append(f"range-roundup '{m.group(0)}'")
    return in_scope, out


for i, u in enumerate(units):
    uid = u["normative_id"]
    t = by_id.get(uid)
    frag = u["norm_fragment"]
    short = f"[{i:02d} {uid[:12]} {u['law_id']}/{u['article']}]"
    if t is None:
        for c in FAIL:
            FAIL[c].append(f"{short} unit absent from build/task_queue.json")
        continue
    ft = full_text_reader(t)

    # ---- 1. pinned source SHA-256 -------------------------------------------
    p = REPO / u["source_file"]
    try:
        actual = hashlib.sha256(p.read_bytes()).hexdigest().upper()
    except OSError as exc:
        actual = f"READ_ERROR:{exc}"
    pinned = u["source_sha256"].strip().upper()
    sha_ok = actual == pinned
    queue_sha_ok = str(t.get("source_sha256", "")).strip().upper() == pinned
    frag_ok = t.get("norm_fragment") == frag
    if sha_ok and queue_sha_ok and frag_ok:
        PASS[1] += 1
    else:
        FAIL[1].append(f"{short} file_sha={actual} pinned={pinned} "
                       f"queue_sha_match={queue_sha_ok} queue_fragment_match={frag_ok}")

    # ---- 2. full text: 円未満の端数 phrase + floor cue -----------------------
    has_phrase = bool(PHRASE_RE.search(ft))
    floor_cues = [c for c in FLOOR_CUE if c in ft]
    # Informational only (not required by the brief): whether the phrase and a
    # floor cue also co-occur in one comma/period-delimited clause.
    clause_ok = any(PHRASE_RE.search(cl) and any(c in cl for c in FLOOR_CUE)
                    for cl in re.split(r"[。]", ft))
    if has_phrase and floor_cues:
        PASS[2] += 1
    else:
        FAIL[2].append(f"{short} phrase={has_phrase} cues={floor_cues} clause_link={clause_ok}")

    # ---- 3. threshold kanji -> modelled threshold, consistent with impl ref --
    thr = threshold_of(frag)
    impl_refs = [r.get("evidence_ref", "") for r in evidence.get(uid, [])
                 if r.get("axis") == "IMPLEMENTATION"]
    impl_ref = impl_refs[0] if impl_refs else ""
    impl_ok = ("floorAt" in impl_ref or "floorOrMinimum" in impl_ref)
    no_roundup_model = not re.search(r"roundUp|ceil|四捨五入|切り上げ", impl_ref, re.I)
    note_thr: list[int] = []
    for r in evidence.get(uid, []):
        if r.get("axis") == "IMPLEMENTATION":
            prefix = str(r.get("note", "")).split(";")[0]
            note_thr = threshold_of(prefix)
            break
    note_ok = bool(note_thr) and note_thr == thr
    constants_ok = all(f"def {CONSTANT[v]} : Nat" in impl_src for v in thr)
    if (len(thr) == 1 and thr[0] in MODELED and impl_refs and impl_ok
            and no_roundup_model and note_ok and constants_ok):
        PASS[3] += 1
    else:
        FAIL[3].append(f"{short} thresholds={thr} impl_ref={impl_ref!r} "
                       f"floor_model={impl_ok} no_roundup_model={no_roundup_model} "
                       f"note_thr={note_thr} constants_ok={constants_ok}")
    DETAIL.append(f"{short} threshold={thr} impl={impl_ref.split('#')[-1]} "
                  f"roundup_tokens_in_fulltext={ROUNDUP_RE.findall(ft)}")

    # ---- 4. suspicious round-up clauses -------------------------------------
    in_scope, out_scope = detect_roundups(ft)
    if not in_scope:
        PASS[4] += 1
    else:
        FAIL[4].append(f"{short} IN-SCOPE round-up: {in_scope}")
    for flag in out_scope:
        OUT_OF_SCOPE_FLAGS.append(f"{short} out-of-scope round-up flag: {flag} "
                                  "(different rounding phrase; surrounding context out of scope)")

    # ---- 5. norm_fragment substring of normalized full text ------------------
    raw_sub = frag in ft
    ws_sub = norm_ws(frag) in norm_ws(ft)
    nfkc_sub = norm_all(frag) in norm_all(ft)
    if raw_sub and ws_sub and nfkc_sub:
        PASS[5] += 1
    else:
        FAIL[5].append(f"{short} raw={raw_sub} whitespace_norm={ws_sub} nfkc_norm={nfkc_sub} "
                       f"len(frag)={len(frag)} len(full)={len(ft)}")

# ---------------------------- Lean-side checks --------------------------------
# Import the repo's own comment/string-aware stripper; forbidden tokens are the
# CI gate's FORBIDDEN set (sorry / admit), plus informational axiom/unsafe scan.
spec2 = importlib.util.spec_from_file_location(
    "check_no_sorry", REPO / "scripts" / "ci" / "check_no_sorry.py")
cns = importlib.util.module_from_spec(spec2)
spec2.loader.exec_module(cns)

LEAN_FILES = sorted(str(p.relative_to(REPO)).replace("\\", "/")
                    for p in (REPO / "JapanTaxLaw").glob("FloorRoundingMinimum*.lean"))
LEAN_FAIL: list[str] = []
LEAN_INFO: list[str] = []
for rel in LEAN_FILES:
    src = (REPO / rel).read_text(encoding="utf-8")
    stripped = cns.strip_comments_and_strings(src)
    for lineno, line in enumerate(stripped.splitlines(), 1):
        for m in cns.FORBIDDEN.finditer(line):
            LEAN_FAIL.append(f"{rel}:{lineno}: forbidden placeholder {m.group(0)!r}")
    for token in ("axiom", "unsafe"):
        for m in re.compile(rf"\b{token}\b").finditer(stripped):
            LEAN_INFO.append(f"{rel}: informational token {token!r} at offset {m.start()}")

# Universal theorems unchanged vs git HEAD (exact block comparison + whole file).
def theorem_blocks(src: str) -> dict[str, str]:
    out: dict[str, str] = {}
    for m in re.finditer(r"^theorem\s+(\w+)\b", src, re.M):
        name = m.group(1)
        nxt = re.search(r"^theorem\s+\w+\b|^end\s", src[m.end():], re.M)
        end = m.end() + nxt.start() if nxt else len(src)
        out[name] = src[m.start():end].rstrip()
    return out

THEOREMS_FAIL: list[str] = []
for rel in LEAN_FILES:
    head = subprocess.run(["git", "show", f"HEAD:{rel}"], cwd=str(REPO),
                          capture_output=True, check=True).stdout.decode("utf-8")
    work = (REPO / rel).read_text(encoding="utf-8")
    if work.replace("\r\n", "\n") != head.replace("\r\n", "\n"):
        THEOREMS_FAIL.append(f"{rel}: file differs from git HEAD")
    hb, wb = theorem_blocks(head), theorem_blocks(work)
    if set(hb) != set(wb):
        THEOREMS_FAIL.append(f"{rel}: theorem set changed HEAD={sorted(hb)} work={sorted(wb)}")
    for name in sorted(set(hb) & set(wb)):
        if hb[name] != wb[name]:
            THEOREMS_FAIL.append(f"{rel}: universal theorem {name} body changed vs HEAD")
THEOREMS = sorted(theorem_blocks(spec_src))

# ---------------------------- report ------------------------------------------
lines: list[str] = []
lines.append("FULL-COVERAGE MECHANICAL SOURCE-FIDELITY AUDIT (83 pinned floor units)")
lines.append(f"units_total={len(units)}  lean_files_scanned={len(LEAN_FILES)}")
lines.append("")
lines.append("PASS COUNTS PER CHECK (out of 83):")
labels = {
    1: "pinned source SHA-256 == source_sha256 (+queue cross-check)",
    2: "full text has 円未満の端数 phrase AND floor cue (切り捨て/切捨て/端数金額を控除した金額)",
    3: "threshold kanji -> modelled threshold, consistent with IMPLEMENTATION evidence_ref",
    4: "no in-scope suspicious round-up clause (四捨五入/切り上げ/range-roundup)",
    5: "norm_fragment is substring of normalized full text (raw/whitespace/NFKC)",
}
for c in range(1, 6):
    lines.append(f"  check {c}: {PASS[c]}/83 pass, {len(FAIL[c])} fail  -- {labels[c]}")
lines.append("")
for c in range(1, 6):
    if FAIL[c]:
        lines.append(f"FAILURES check {c} (max 20 listed):")
        lines.extend("  - " + x for x in FAIL[c][:20])
        lines.append("")
lines.append(f"OUT-OF-SCOPE ROUND-UP FLAGS (not failures): {len(OUT_OF_SCOPE_FLAGS)}")
lines.extend("  - " + x for x in OUT_OF_SCOPE_FLAGS[:20])
lines.append("")
lines.append("LEAN SIDE:")
lines.append(f"  files: {LEAN_FILES}")
lines.append(f"  forbidden proof tokens (sorry/admit): {len(LEAN_FAIL)}"
             + (" -- " + "; ".join(LEAN_FAIL) if LEAN_FAIL else " -- none"))
lines.append(f"  informational axiom/unsafe tokens: {len(LEAN_INFO)}"
             + (" -- " + "; ".join(LEAN_INFO[:10]) if LEAN_INFO else " -- none"))
lines.append(f"  universal theorems in Spec: {THEOREMS}")
lines.append(f"  universal-theorem / file diff vs git HEAD: {len(THEOREMS_FAIL)} issue(s)")
lines.extend("  - " + x for x in THEOREMS_FAIL[:20])
lines.append("")
all_unit_pass = all(not FAIL[c] for c in FAIL)
lean_ok = not LEAN_FAIL and not THEOREMS_FAIL
if all_unit_pass and lean_ok:
    lines.append("SCOPE STATEMENT: This is a FULL-COVERAGE mechanical source-fidelity review "
                 "scoped to the exact rounding phrase and SHA/threshold/direction checks; "
                 "surrounding semantic context is out of scope. No legal advice, no "
                 "completeness claim.")
    lines.append("VERDICT: PASS")
else:
    reasons = []
    for c in range(1, 6):
        if FAIL[c]:
            reasons.append(f"check {c}: {len(FAIL[c])} failure(s)")
    if LEAN_FAIL:
        reasons.append(f"Lean forbidden tokens: {len(LEAN_FAIL)}")
    if THEOREMS_FAIL:
        reasons.append(f"Lean theorem diff vs HEAD: {len(THEOREMS_FAIL)}")
    lines.append("VERDICT: FAIL (" + "; ".join(reasons) + ")")

report = "\n".join(lines) + "\n"
REPORT.write_text(report, encoding="utf-8")
print(report)
