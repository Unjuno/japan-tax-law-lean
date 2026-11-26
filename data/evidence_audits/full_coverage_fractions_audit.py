#!/usr/bin/env python3
"""FULL-COVERAGE mechanical source-fidelity audit of all 301 FractionAmounts units.

READ-ONLY with respect to the repository: opens source files for reading only,
writes its own report artifacts only under D:\\CodexData\\Temp\\opencode\\goal208\\.

Checks per record:
  1. source_file bytes hash to source_sha256; token present after whitespace
     normalization.
  2. independent re-parse of the two kanji numerals around 分の, confirming
     den == kanji_to_int(before) and num == kanji_to_int(after).
  3. norm_fragment contains the token.
  4. aggregate counts + full failure list (max 20 shown).

Also scans the 3 Lean files for forbidden proof tokens and verifies the
universal theorem text is unchanged / git-clean.
"""
from __future__ import annotations

import hashlib
import importlib.util
import json
import re
import subprocess
import sys
from pathlib import Path

REPO = Path(r"C:\Users\user\.local\share\opencode\worktree\484e09\norm-queue-fix")
FRACTIONS = Path(r"D:\CodexData\Temp\opencode\goal208\fractions.json")
OUT_DIR = Path(r"D:\CodexData\Temp\opencode\goal208")
KANSUJI_PY = REPO / "scripts" / "law_audit" / "kansuji.py"
LEAN_DIR = REPO / "JapanTaxLaw"
LEAN_FILES = [
    LEAN_DIR / "FractionAmounts.lean",
    LEAN_DIR / "FractionAmountsSpec.lean",
    LEAN_DIR / "FractionAmountsTests.lean",
]

# ---------------------------------------------------------------------------
# Load the independent kansuji parser (do not reimplement ad hoc).
# ---------------------------------------------------------------------------
spec = importlib.util.spec_from_file_location("kansuji_independent", KANSUJI_PY)
kansuji = importlib.util.module_from_spec(spec)
spec.loader.exec_module(kansuji)
kanji_to_int = kansuji.kanji_to_int


def normalize_ws(s: str) -> str:
    """Remove all whitespace (incl. full-width U+3000) so the phrase can be
    located regardless of JSON pretty-printing / line breaks."""
    return "".join(ch for ch in s if not ch.isspace())


TOKEN_RE = re.compile(r"^(?P<before>[^分]*)分の(?P<after>[^に]*)に相当する")

# ---------------------------------------------------------------------------
# Load records.
# ---------------------------------------------------------------------------
raw_json = FRACTIONS.read_bytes()
records = json.loads(raw_json.decode("utf-8-sig"))
total = len(records)

cnt = {
    "hash_ok": 0,
    "token_present": 0,
    "fragment_ok": 0,
    "direction_ok": 0,
}
failures: list[dict] = []

source_cache: dict[str, tuple[bytes, str, str, bool]] = {}

for i, rec in enumerate(records):
    src_rel = rec.get("source_file", "")
    expected = str(rec.get("source_sha256", "")).upper()
    token = rec.get("token", "")
    frag = rec.get("norm_fragment", "")
    rid = rec.get("normative_id", f"#{i}")

    # -- load / cache source file bytes -------------------------------------
    if src_rel not in source_cache:
        p = REPO / src_rel
        if not p.exists():
            source_cache[src_rel] = (b"", "", "", False)
        else:
            data = p.read_bytes()
            digest = hashlib.sha256(data).hexdigest().upper()
            norm = normalize_ws(data.decode("utf-8", errors="replace"))
            source_cache[src_rel] = (data, digest, norm, True)

    data, digest, norm_src, exists = source_cache[src_rel]
    hash_ok = exists and (digest == expected)
    if hash_ok:
        cnt["hash_ok"] += 1
    else:
        failures.append({
            "index": i, "id": rid, "check": "hash",
            "detail": f"source={src_rel!r} exists={exists} expected={expected} got={digest}",
        })

    # -- token in normalized source -----------------------------------------
    token_present = bool(token) and (token in norm_src)
    if token_present:
        cnt["token_present"] += 1
    else:
        failures.append({
            "index": i, "id": rid, "check": "token_in_source",
            "detail": f"token={token!r} not found in normalized {src_rel!r}",
        })

    # -- norm_fragment contains token ---------------------------------------
    fragment_ok = bool(token) and (token in frag)
    if fragment_ok:
        cnt["fragment_ok"] += 1
    else:
        failures.append({
            "index": i, "id": rid, "check": "fragment_contains_token",
            "detail": f"token={token!r} not in norm_fragment={frag[:120]!r}",
        })

    # -- independent direction re-parse -------------------------------------
    m = TOKEN_RE.match(token)
    direction_ok = False
    if not m:
        failures.append({
            "index": i, "id": rid, "check": "direction",
            "detail": f"token={token!r} does not match X分のYに相当する pattern",
        })
    else:
        before, after = m.group("before"), m.group("after")
        try:
            den_val = kanji_to_int(before)
            num_val = kanji_to_int(after)
            direction_ok = (den_val == rec.get("den")) and (num_val == rec.get("num"))
            if direction_ok:
                cnt["direction_ok"] += 1
            else:
                failures.append({
                    "index": i, "id": rid, "check": "direction",
                    "detail": (f"token={token!r} before={before!r}->{den_val} "
                               f"(stored den={rec.get('den')}), after={after!r}->{num_val} "
                               f"(stored num={rec.get('num')})"),
                })
        except ValueError as exc:
            failures.append({
                "index": i, "id": rid, "check": "direction",
                "detail": f"token={token!r} parse error: {exc}",
            })

# ---------------------------------------------------------------------------
# Lean checks: forbidden proof tokens (comment/string aware) + universal
# theorem text integrity + git cleanliness of the three files.
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


FORBIDDEN_TOKENS = ("sorry", "admit", "axiom", "Classical.choice", "sorryAx")
lean_forbidden: list[str] = []
lean_texts: dict[str, str] = {}
for p in LEAN_FILES:
    text = p.read_text(encoding="utf-8")
    lean_texts[p.name] = text
    code = strip_comments_and_strings(text)
    for tok in FORBIDDEN_TOKENS:
        for m in re.finditer(rf"(?<![A-Za-z]){re.escape(tok)}(?![A-Za-z])", code):
            line = code.count("\n", 0, m.start()) + 1
            lean_forbidden.append(f"{p.name}:{line}:{tok}")

# Informational: Quot.sound is expected as a kernel artifact (not forbidden).
quot_sound_mentions = []
for name, text in lean_texts.items():
    if "Quot.sound" in text:
        quot_sound_mentions.append(name)

# Universal theorem text (exact expected lines).
spec_text = lean_texts.get("FractionAmountsSpec.lean", "")
impl_text = lean_texts.get("FractionAmounts.lean", "")
EXPECTED_SPEC_LINES = [
    "theorem fracAmount_eq_decomposition (amount num den : Nat) (hd : 0 < den) :",
    "fracAmount amount num den =",
    "amount / den * num + amount % den * num / den := by",
    "unfold fracAmount",
    "have hdec := Nat.div_add_mod amount den",
    "have haux := aux (amount / den) (amount % den) num den hd",
    "rw [hdec] at haux",
    "exact haux",
    "theorem fracAmount_agrees (amount num den : Nat) (hd : 0 < den) :",
    "fracAmount amount num den = specFracAmount amount num den :=",
    "fracAmount_eq_decomposition amount num den hd",
]
spec_lines_present = all(line in spec_text for line in EXPECTED_SPEC_LINES)
impl_line_present = "def fracAmount (amount num den : Nat) : Nat := amount * num / den" in impl_text
sole_assumption = spec_text.count("0 < den") >= 2 and "hd : 0 < den" in spec_text

# git cleanliness for the three files.
try:
    gr = subprocess.run(
        ["git", "-C", str(REPO), "status", "--porcelain", "--",
         "JapanTaxLaw/FractionAmounts.lean",
         "JapanTaxLaw/FractionAmountsSpec.lean",
         "JapanTaxLaw/FractionAmountsTests.lean"],
        capture_output=True, text=True, encoding="utf-8", errors="replace",
    )
    git_status = gr.stdout.strip()
    git_rc = gr.returncode
except Exception as exc:  # pragma: no cover
    git_status = f"<git unavailable: {exc}>"
    git_rc = -1

# ---------------------------------------------------------------------------
# Report
# ---------------------------------------------------------------------------
lines: list[str] = []
lines.append("=== FULL-COVERAGE mechanical source-fidelity review (NOT sampled) ===")
lines.append(f"records_total              : {total}")
lines.append(f"hash_ok                    : {cnt['hash_ok']}/{total}")
lines.append(f"token_present_in_source    : {cnt['token_present']}/{total}")
lines.append(f"fragment_ok (token in frag): {cnt['fragment_ok']}/{total}")
lines.append(f"direction_ok (den=before,  : {cnt['direction_ok']}/{total}")
lines.append("                             num=after via independent kanji parse)")
lines.append(f"distinct source files      : {len(source_cache)}")
lines.append(f"total failure entries      : {len(failures)}")
lines.append("")
lines.append("--- Lean checks ---")
for f in LEAN_FILES:
    h = hashlib.sha256(f.read_bytes()).hexdigest().upper()
    lines.append(f"{f.name}: sha256={h}")
lines.append(f"forbidden proof tokens     : {lean_forbidden if lean_forbidden else 'NONE'}")
lines.append(f"Quot.sound mentions (info) : {quot_sound_mentions if quot_sound_mentions else 'NONE'}")
lines.append(f"universal theorem lines    : {'ALL PRESENT' if spec_lines_present else 'MISSING/ALTERED'}")
lines.append(f"fracAmount def unchanged   : {impl_line_present}")
lines.append(f"sole assumption 0<den      : {sole_assumption}")
lines.append(f"git status (3 lean files)  : rc={git_rc} out={git_status!r} (empty => clean/unchanged)")
lines.append("")
if failures:
    lines.append(f"--- FAILURES (showing first {min(20, len(failures))} of {len(failures)}) ---")
    for f in failures[:20]:
        lines.append(f"  [{f['index']}] {f['id']} {f['check']}: {f['detail']}")
else:
    lines.append("--- FAILURES: none ---")

all_pass = (
    total == 301
    and cnt["hash_ok"] == total
    and cnt["token_present"] == total
    and cnt["fragment_ok"] == total
    and cnt["direction_ok"] == total
    and not failures
    and not lean_forbidden
    and spec_lines_present
    and impl_line_present
    and sole_assumption
    and (git_status == "" and git_rc == 0)
)

report = "\n".join(lines)
print(report)

# write artifacts only under goal208
(OUT_DIR / "full_coverage_fractions_audit_report.txt").write_text(
    report + "\n", encoding="utf-8")
(OUT_DIR / "full_coverage_fractions_audit_results.json").write_text(
    json.dumps({
        "total": total,
        "counts": cnt,
        "failures": failures,
        "lean_forbidden": lean_forbidden,
        "quot_sound_mentions": quot_sound_mentions,
        "spec_lines_present": spec_lines_present,
        "impl_line_present": impl_line_present,
        "sole_assumption": sole_assumption,
        "git_status": git_status,
        "git_rc": git_rc,
        "all_pass": all_pass,
    }, ensure_ascii=False, indent=2),
    encoding="utf-8")

print()
print("VERDICT: " + ("PASS" if all_pass else "FAIL (see failures above)"))
