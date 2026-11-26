"""Full-coverage (NOT sampled) adversarial source-fidelity check for the 6
PermilleAmounts units. READ-ONLY with respect to the repository: all writes
go to D:\\CodexData\\Temp\\opencode\\goal208\\.

Checks (every record, no sampling):
  1. pinned source SHA-256 == source_sha256
  2. norm_fragment contains the record's token
  3. token occurs verbatim in the normalized pinned source
  4. independent Kanji permille parse matches the assigned Lean function
     as identified by the IMPLEMENTATION evidence_ref
  5. norm_fragment is a substring of the normalized pinned source
  + Lean static scan: forbidden proof tokens and theorem-block integrity.
"""
import json
import re
import hashlib
from fractions import Fraction
from pathlib import Path

ROOT = Path(r"C:\Users\user\.local\share\opencode\worktree\484e09\norm-queue-fix")
TMP = Path(r"D:\CodexData\Temp\opencode\goal208")
UNITS_PATH = TMP / "permille_amount.json"
REPORT_PATH = TMP / "fullcov_permille_amount_source_fidelity_report.json"
OUT_PATH = TMP / "fullcov_permille_amount_source_fidelity.out.txt"

IMPL_PATH = "JapanTaxLaw/PermilleAmounts.lean"
SPEC_PATH = "JapanTaxLaw/PermilleAmountsSpec.lean"
TEST_PATH = "JapanTaxLaw/PermilleAmountsTests.lean"
LEAN_FILES = [IMPL_PATH, SPEC_PATH, TEST_PATH]
ALLOWED_FNS = {"per85", "per136", "per122", "per42", "per252", "per104"}
EXPECTED_THEOREMS = {
    "agree85", "agree136", "agree122", "agree42", "agree252", "agree104",
    "agreePer85", "agreePer136", "agreePer122", "agreePer42",
    "agreePer252", "agreePer104",
}
FORBIDDEN = ("sorry", "admit", "axiom", "Classical.choice")

KAN_DIGIT = {"〇": 0, "零": 0, "一": 1, "二": 2, "三": 3, "四": 4,
             "五": 5, "六": 6, "七": 7, "八": 8, "九": 9}
KAN_UNIT = {"十": 10, "百": 100, "千": 1000}


def parse_kanji_int(s):
    """Independent parser for Kanji integers using 〇零一..九 and 十百千."""
    if not s:
        raise ValueError("empty kanji integer")
    total, section = 0, 0
    for ch in s:
        if ch in KAN_DIGIT:
            section = KAN_DIGIT[ch]
        elif ch in KAN_UNIT:
            mul = KAN_UNIT[ch]
            section = (section if section != 0 else 1) * mul
            total += section
            section = 0
        else:
            raise ValueError("unexpected kanji digit %r" % ch)
    return total + section


def parse_permille(rate):
    """Return (numer, denom) for e.g. 八・五 -> 85/10000, 二・五二 -> 252/100000."""
    parts = rate.split("・")
    whole = parse_kanji_int(parts[0])
    frac = ""
    for p in parts[1:]:
        for ch in p:
            if ch not in KAN_DIGIT:
                raise ValueError("unexpected fractional kanji %r" % ch)
            frac += str(KAN_DIGIT[ch])
    numer = int(str(whole) + frac)
    denom = 1000 * (10 ** len(frac))
    # independent value cross-check: (whole + 0.frac)/1000 == numer/denom
    value = Fraction(whole) + (Fraction(int(frac), 10 ** len(frac)) if frac else 0)
    value /= 1000
    if value != Fraction(numer, denom):
        raise ValueError("permille value self-check failed for %r" % rate)
    return numer, denom


def strip_comments(s):
    s = re.sub(r"/-.*?-/", "", s, flags=re.S)
    s = re.sub(r"--[^\n]*", "", s)
    return s


def balanced(s):
    pairs = {")": "(", "]": "[", "}": "{"}
    stack = []
    for ch in s:
        if ch in "([{":
            stack.append(ch)
        elif ch in ")]}":
            if not stack or stack.pop() != pairs[ch]:
                return False
    return not stack


def main():
    units = json.loads(UNITS_PATH.read_text(encoding="utf-8"))
    q = json.loads((ROOT / "build/task_queue.json").read_text(encoding="utf-8"))
    tasks = q["tasks"]
    by_id = {}
    for t in tasks:
        by_id.setdefault(t["normative_id"], []).append(t)
    ev = json.loads((ROOT / "data/verification_evidence.json").read_text(encoding="utf-8"))

    counts = {
        "records": len(units),
        "unique_task_match": 0,
        "sha_pin_matches_record": 0,
        "sha_file_matches_pinned": 0,
        "token_in_norm_fragment": 0,
        "token_in_normalized_source": 0,
        "rate_parse_matches_function": 0,
        "norm_fragment_in_normalized_source": 0,
        "fragment_matches_queue": 0,
    }
    failures = []
    per_unit = []
    norms = {}

    def fail(uid, check, detail):
        failures.append({"unit": uid[:12], "check": check, "detail": detail})

    for o in units:
        uid = o["normative_id"]
        checks = {}

        # 0. exactly one task with this id, and record matches queue pin fields
        tlist = by_id.get(uid, [])
        checks["unique_task_match"] = len(tlist) == 1
        t = tlist[0] if len(tlist) == 1 else None
        if t is None:
            fail(uid, "unique_task_match", "task occurrences=%d" % len(tlist))
        else:
            counts["unique_task_match"] += 1

        # 1. pinned source SHA-256 == source_sha256
        if t is not None:
            pin_ok = t.get("source_sha256", "").upper() == o["source_sha256"].upper()
            checks["sha_pin_matches_record"] = pin_ok
            if pin_ok:
                counts["sha_pin_matches_record"] += 1
            else:
                fail(uid, "sha_pin_matches_record",
                     "queue=%s record=%s" % (t.get("source_sha256"), o["source_sha256"]))
        src_path = ROOT / o["source_file"]
        raw = None
        try:
            raw = src_path.read_bytes()
        except OSError as ex:
            fail(uid, "sha_file_matches_pinned", "unreadable source: %s" % ex)
        if raw is not None:
            digest = hashlib.sha256(raw).hexdigest().upper()
            sha_ok = digest == o["source_sha256"].upper()
            checks["sha_file_matches_pinned"] = sha_ok
            if sha_ok:
                counts["sha_file_matches_pinned"] += 1
            else:
                fail(uid, "sha_file_matches_pinned",
                     "file=%s record=%s" % (digest, o["source_sha256"]))
            norm = re.sub(r"[\s\u3000]+", "", raw.decode("utf-8", errors="replace"))
            norms[uid] = norm
        else:
            norm = ""

        # 2. norm_fragment contains the token
        tok_ok = o["token"] in o["norm_fragment"]
        checks["token_in_norm_fragment"] = tok_ok
        if tok_ok:
            counts["token_in_norm_fragment"] += 1
        else:
            fail(uid, "token_in_norm_fragment", "token=%r" % o["token"])

        # 3. token occurs verbatim in normalized pinned source
        tok_src_ok = bool(norm) and o["token"] in norm
        checks["token_in_normalized_source"] = tok_src_ok
        if tok_src_ok:
            counts["token_in_normalized_source"] += 1
        else:
            fail(uid, "token_in_normalized_source", "token=%r" % o["token"])

        # 4. independent Kanji parse vs assigned function via IMPLEMENTATION ref
        assigned = None
        rate_ok = True
        recs = ev["records"].get(uid, [])
        impl_refs = [r["evidence_ref"] for r in recs if r.get("axis") == "IMPLEMENTATION"]
        if len(impl_refs) != 1:
            rate_ok = False
            fail(uid, "rate_parse_matches_function",
                 "IMPLEMENTATION evidence_ref count=%d" % len(impl_refs))
        else:
            ref = impl_refs[0]
            m = re.fullmatch(r"(.+?)\#([A-Za-z0-9_]+)\@kernel", ref)
            if not m:
                rate_ok = False
                fail(uid, "rate_parse_matches_function", "malformed evidence_ref=%r" % ref)
            else:
                ref_path, fn = m.group(1), m.group(2)
                assigned = fn
                try:
                    numer, denom = parse_permille(o["rate_kanji"])
                    tok_rate_ok = ("千分の" + o["rate_kanji"]) in o["token"]
                    if not tok_rate_ok:
                        rate_ok = False
                        fail(uid, "rate_parse_matches_function",
                             "token rate mismatch: rate=%r token=%r" % (o["rate_kanji"], o["token"]))
                    impl_text = (ROOT / ref_path).read_text(encoding="utf-8")
                    dm = re.search(
                        r"def\s+" + re.escape(fn) + r"\s*\(a\s*:\s*Nat\)\s*:\s*Nat\s*:=\s*"
                        r"a\s*\*\s*(\d[\d_]*)\s*/\s*(\d[\d_]*)", impl_text)
                    if not dm:
                        rate_ok = False
                        fail(uid, "rate_parse_matches_function",
                             "def %s not found in %s" % (fn, ref_path))
                    else:
                        fn_numer = int(dm.group(1).replace("_", ""))
                        fn_denom = int(dm.group(2).replace("_", ""))
                        suffix = re.fullmatch(r"per(\d+)", fn)
                        suffix_ok = bool(suffix) and int(suffix.group(1)) == numer
                        ok = (ref_path == IMPL_PATH and fn in ALLOWED_FNS
                              and tok_rate_ok and suffix_ok
                              and (numer, denom) == (fn_numer, fn_denom))
                        if ok:
                            counts["rate_parse_matches_function"] += 1
                        else:
                            rate_ok = False
                            fail(uid, "rate_parse_matches_function",
                                 "rate=%s parsed=%d/%d ref_path=%s fn=%s fn_body=%d/%d suffix_ok=%s"
                                 % (o["rate_kanji"], numer, denom, ref_path, fn,
                                    fn_numer, fn_denom, suffix_ok))
                except (ValueError, OSError) as ex:
                    rate_ok = False
                    fail(uid, "rate_parse_matches_function", "parse error: %s" % ex)
        checks["rate_parse_matches_function"] = rate_ok

        # 5. norm_fragment is a substring of normalized pinned source
        frag_ok = bool(norm) and o["norm_fragment"] in norm
        checks["norm_fragment_in_normalized_source"] = frag_ok
        if frag_ok:
            counts["norm_fragment_in_normalized_source"] += 1
        else:
            fail(uid, "norm_fragment_in_normalized_source",
                 "fragment=%r" % o["norm_fragment"][:60])

        # supplementary: fragment is exactly queue fragment truncated to 120
        if t is not None:
            fq_ok = o["norm_fragment"] == t["norm_fragment"][:120]
            checks["fragment_matches_queue"] = fq_ok
            if fq_ok:
                counts["fragment_matches_queue"] += 1
            else:
                fail(uid, "fragment_matches_queue", "record fragment differs from queue[:120]")

        checks["assigned_function"] = assigned
        per_unit.append({"unit": uid[:12], "rate": o["rate_kanji"],
                         "assigned_function": assigned, "checks": checks})

    # ---- Lean static scan (all three files, full text) ----
    lean_results = []
    lean_ok = True
    for rel in LEAN_FILES:
        text = (ROOT / rel).read_text(encoding="utf-8")
        code = strip_comments(text)
        bad = []
        for token in FORBIDDEN:
            pat = r"\b" + re.escape(token) + r"\b"
            hits = [m.start() for m in re.finditer(pat, code)]
            if hits:
                bad.append({"token": token, "count": len(hits)})
        theorem_re = re.compile(
            r"\btheorem\s+([A-Za-z0-9_]+)\s*\(([^)]*)\)\s*:\s*(.*?)\s*:=\s*"
            r"(.*?)(?=\n\s*(?:theorem|def|end)\b|\Z)", re.S)
        theorems = theorem_re.findall(code)
        names = [x[0] for x in theorems]
        theorem_problems = []
        if rel == SPEC_PATH:
            if set(names) != EXPECTED_THEOREMS or len(names) != len(EXPECTED_THEOREMS):
                theorem_problems.append("expected theorem set mismatch: got %d names %s"
                                        % (len(names), sorted(names)))
        for nm, args, body_type, proof in theorems:
            proof = proof.strip()
            if not proof:
                theorem_problems.append("empty proof in theorem %s" % nm)
            if not balanced(proof):
                theorem_problems.append("unbalanced delimiters in theorem %s" % nm)
        ns_count = len(re.findall(r"\bnamespace\s+JapanTaxLaw\.PermilleAmounts\b", code))
        end_count = len(re.findall(r"\bend\s+JapanTaxLaw\.PermilleAmounts\b", code))
        if ns_count != 1 or end_count != 1:
            theorem_problems.append("namespace/end counts = %d/%d" % (ns_count, end_count))
        last_line = [ln for ln in text.splitlines() if ln.strip()][-1].strip()
        if last_line != "end JapanTaxLaw.PermilleAmounts":
            theorem_problems.append("file does not end with namespace end: %r" % last_line)
        file_ok = not bad and not theorem_problems
        lean_ok = lean_ok and file_ok
        lean_results.append({"file": rel, "forbidden": bad,
                             "theorem_count": len(names), "theorem_names": names,
                             "integrity_problems": theorem_problems, "ok": file_ok})

    n = len(units)
    gates = {
        "unique_task_match": counts["unique_task_match"] == n,
        "sha_pin_matches_record": counts["sha_pin_matches_record"] == n,
        "sha_file_matches_pinned": counts["sha_file_matches_pinned"] == n,
        "token_in_norm_fragment": counts["token_in_norm_fragment"] == n,
        "token_in_normalized_source": counts["token_in_normalized_source"] == n,
        "rate_parse_matches_function": counts["rate_parse_matches_function"] == n,
        "norm_fragment_in_normalized_source": counts["norm_fragment_in_normalized_source"] == n,
        "fragment_matches_queue": counts["fragment_matches_queue"] == n,
        "lean_scan": lean_ok,
    }
    passed = all(gates.values()) and n == 6
    report = {
        "scope": "FULL-COVERAGE mechanical source-fidelity: SHA / phrase / parse / containment "
                 "+ Lean static scan; surrounding context out of scope; "
                 "no legal advice; no completeness claim",
        "counts": counts,
        "gates": gates,
        "failure_count": len(failures),
        "failures": failures[:20],
        "per_unit": per_unit,
        "lean_scan": lean_results,
        "result": "PASS" if passed else "FAIL",
    }
    REPORT_PATH.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")

    lines = []
    lines.append("FULL-COVERAGE mechanical source-fidelity (SHA/phrase/parse/containment; "
                 "surrounding context out of scope; no legal advice; no completeness claim)")
    for k, v in counts.items():
        lines.append("%s: %d/%d" % (k, v, n))
    for lr in lean_results:
        lines.append("lean %s: forbidden=%s theorem_count=%d problems=%s ok=%s"
                     % (lr["file"], lr["forbidden"], lr["theorem_count"],
                        lr["integrity_problems"], lr["ok"]))
    lines.append("failure_count: %d (showing %d)" % (len(failures), min(20, len(failures))))
    for f in failures[:20]:
        lines.append("FAIL " + json.dumps(f, ensure_ascii=False))
    for u in per_unit:
        lines.append("UNIT " + json.dumps(u, ensure_ascii=False))
    verdict = ("VERDICT: PASS" if passed
               else "VERDICT: FAIL (%s)" % ", ".join(k for k, v in gates.items() if not v))
    lines.append(verdict)
    OUT_PATH.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print("\n".join(lines))


if __name__ == "__main__":
    main()
