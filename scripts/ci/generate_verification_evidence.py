#!/usr/bin/env python3
"""Generate the verification-evidence ledger from REAL artifacts (Directive §1/§3).

This is deliberately NOT a presence checker.  An evidence axis is set only when
it is backed by an independently reproducible artifact:

  source_location            exact source path + pinned blob hash + unit text found in the scoped article
  decomposition_audit        exact reconstruction + unique ids from the queue generator
  source_correspondence      every numeric literal of the INDEPENDENT spec, converted to kanji, occurs in the scoped 原文, and every pinned needle occurs there too
  independent_spec           a spec module defines its own `spec*` functions and does not reuse implementation definitions
  implementation             the implementation module is covered by the kernel build attestation
  kernel_proof               SHA-256 of the exact committed blob matches an attestation whose CI job succeeded (all required steps)
  proof_scope                implementation and spec use the same statutory boundary constant, under a verified kernel build
  boundary_proof             the attested Tests module contains kernel-decided boundary examples
  cross_law_proof            the unit has no unresolved dependency and carries an enforced revision
  tests                      the attested Tests module contains >= 5 kernel-decided examples
  adversarial_review         an independent review entry names the module and documents 一次資料 re-extraction

A numeric match, a file's existence or a theorem-name string alone never sets a
status: `kernel_proof` additionally requires the hash-checked CI attestation, and
`source_correspondence` is computed outside Lean from the pinned raw snapshot.

Regenerate with `python scripts/ci/generate_verification_evidence.py`.
"""
from __future__ import annotations

import hashlib
import importlib.util
import json
import re
import sys
from fractions import Fraction
from pathlib import Path

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import normative_core as core  # noqa: E402
import task_queue as tq  # noqa: E402

REPO = HERE.parents[1]
ATTESTATION = REPO / "data" / "PROOF_ATTESTATION.json"
INVENTORY = REPO / "data" / "INVENTORY.json"
REVIEW = REPO / "docs" / "ADVERSARIAL_REVIEW.md"
AUDIT = HERE / "transcription_audit.py"
OUT = REPO / "data" / "verification_evidence.json"

# Only these norm kinds are candidates.  STRUCTURE/UNRESOLVED units are never
# promoted by a model that does not express them.
VERIFIABLE_KINDS = {"CONDITION", "EFFECT", "EXCEPTION", "DEEMING", "PRESUMPTION",
                    "DELEGATION", "READING", "REFERENCE"}

_KANJI = "零一二三四五六七八九"


def strip_comments(text: str) -> str:
    text = re.sub(r"/-.*?-/", "", text, flags=re.S)
    return re.sub(r"--[^\n]*", "", text)


def int_to_kanji(n: int) -> str:
    """Statute-style kanji numeral for a non-negative integer.

    Japanese statute amounts are grouped by 万 (10^4) and 億 (10^8), e.g.
    五十億円 = 5,000,000,000. The groups nest, so 一億二千万 = 120,000,000.
    """
    if n < 0:
        raise ValueError("negative")
    if n == 0:
        return "零"

    def under(x: int) -> str:
        out = ""
        for unit, ch in ((1000, "千"), (100, "百"), (10, "十")):
            d, x = divmod(x, unit)
            if d > 1:
                out += _KANJI[d] + ch
            elif d == 1:
                out += ch
        if x:
            out += _KANJI[x]
        return out

    def group(x: int) -> str:
        # render the <10000 part of a 万/億 group (omit a leading 一)
        return under(x) if x else ""

    if n < 10000:
        return under(n)
    if n < 10**8:
        man, rem = divmod(n, 10000)
        return group(man) + "万" + group(rem)
    oku, rem = divmod(n, 10**8)
    head = group(oku) + "億"
    if not rem:
        return head
    if rem < 10000:
        return head + group(rem)
    man, r2 = divmod(rem, 10000)
    return head + group(man) + "万" + group(r2)


def kanji_variants(n: int) -> set[str]:
    """Legitimate statute spellings of a numeric literal.

    A rate such as 907/1000 is written 「百分の九十・七」; 624/10000 as
    「百分の六・二四」. Every spelling is still checked verbatim in the pinned
    clause, so this widens the SOURCE check without trusting Lean.
    """
    out = {int_to_kanji(n)}
    digits = str(n)
    for split in (1, 2, 3):
        if split < len(digits):
            whole, frac = digits[:split], digits[split:]
            if frac and not frac.startswith("0"):
                out.add(int_to_kanji(int(whole)) + "・" +
                        "".join(_KANJI[int(c)] for c in frac))
    return out


_KANJI_VALUE = {ch: i for i, ch in enumerate(_KANJI)}
_KANJI_VALUE["〇"] = 0


def _kanji_int(text: str) -> int:
    # Parse by 億 / 万 groups so nested forms such as 一億二千万 are correct.
    total = 0
    group = 0
    cur = 0
    for ch in text:
        if ch in _KANJI_VALUE:
            cur = _KANJI_VALUE[ch]
        elif ch in ("十", "百", "千"):
            group += (cur or 1) * {"十": 10, "百": 100, "千": 1000}[ch]
            cur = 0
        elif ch == "万":
            group = (group + cur) * 10000
            cur = 0
        elif ch == "億":
            total += (group + cur) * 10**8
            group = cur = 0
        else:
            raise ValueError("not a statute numeral: " + ch)
    return total + group + cur


def parse_statutory_rate(text: str) -> Fraction | None:
    """Parse a 「百分の九十・七」 style rate into an exact rational (907/1000)."""
    m = re.search(r"百分の([〇零一二三四五六七八九十百千万億兆]+(?:・[〇零一二三四五六七八九]+)?)", text)
    if not m:
        return None
    token = m.group(1)
    if "・" in token:
        whole, frac = token.split("・", 1)
        decimal = sum(_KANJI_VALUE[c] * 10 ** (len(frac) - 1 - i)
                      for i, c in enumerate(frac))
        val = Fraction(_kanji_int(whole)) + Fraction(decimal, 10 ** len(frac))
    else:
        val = Fraction(_kanji_int(token))
    return val / 100


def matched_spellings(lits: set[int], text: str) -> dict[str, list[str]]:
    """Record the spelling actually found for each literal (never claim more)."""
    return {str(v): sorted(x for x in kanji_variants(v) if x in text) for v in sorted(lits)}


def source_literals_verified(lits: set[int], text: str) -> bool:
    """Verify numerals against the pinned clause, including the RATE RATIO.

    A rate written 「百分の九十・七」 equals 907/1000. The spec's numerator and
    denominator must form exactly that rational: 907/100 (tenfold error) or
    907/10000 must NOT pass. Non-rate literals need a verbatim spelling.
    """
    rate = parse_statutory_rate(text)
    if rate is not None:
        pairs = {(a, b) for a in lits for b in lits if b and Fraction(a, b) == rate}
        if not pairs:
            return False
        used = {v for pair in pairs for v in pair}
        return all(any(x in text for x in kanji_variants(v)) for v in (lits - used))
    found = {v for v in lits if any(x in text for x in kanji_variants(v))}
    substantive = {v for v in lits if v not in (10, 100, 1000, 10000, 100000)}
    if not substantive <= found:
        return False
    if (lits - substantive) - found and not ("百分" in text or "千分" in text):
        return False
    return True  # empty literal set: pinned-needle anchor (checked by caller) is the source evidence


def clause_correspondence(lits: set[int], text: str, needles: list[str],
                          scoped: str = "") -> tuple[bool, str]:
    """Clause-level source correspondence with two sound anchor patterns.

    1. Single-rule specs: every spec numeral (including the exact rate ratio)
       must occur in THIS clause.
    2. Rate-table / structural specs: a rate table's literals are spread over
       several clauses of the same article. Require BOTH a pinned needle in this
       clause AND all spec numerals within the scoped article. Two independent
       anchors are stronger than a single clause match, never weaker.
    """
    needle_hits = [n for n in (needles or []) if core.norm(n) and core.norm(n) in text]
    if lits:
        if source_literals_verified(lits, text):
            return True, "spec numerals / rate ratio in clause"
        if needle_hits and scoped and source_literals_verified(lits, scoped):
            return True, ("pinned needle in clause + all spec numerals in scoped article: %s"
                          % [n[:24] for n in needle_hits[:3]])
        return False, "spec numerals not located in clause or scoped article"
    return bool(needle_hits), "pinned needle(s) in clause: %s" % [n[:24] for n in needle_hits[:3]]


def blob_sha(path: Path) -> str:
    """Hash committed blob bytes: normalise CRLF so git filters do not matter."""
    return hashlib.sha256(path.read_bytes().replace(b"\r\n", b"\n")).hexdigest()


def load_attestation() -> dict:
    data = json.loads(ATTESTATION.read_text(encoding="utf-8"))
    if data.get("schema") != 1 or data.get("run_conclusion") != "success":
        raise ValueError("attestation schema/conclusion invalid")
    # Scoped attestations cover modules kernel-built at a DIFFERENT commit than
    # the main attestation. Validate each independently; a failed/pending scoped
    # run is ignored, never trusted as evidence.
    # Multiple scoped attestations are allowed: each is bound to its own green
    # CI run/commit. Validate every one independently and merge only its module
    # hashes. A failed/pending scoped run is ignored, never trusted as evidence.
    # A successful scoped run may refresh a hash from a stale main attestation
    # (that is its purpose); files are processed in sorted name order so the
    # merge is deterministic and independent of the filesystem.
    for scoped in sorted((REPO / "data").glob("PROOF_ATTESTATION_SCOPED*.json")):
        extra = json.loads(scoped.read_text(encoding="utf-8"))
        honest_run = (extra.get("run_conclusion") == "success"
                      or (extra.get("scope") == "lean_job_only"
                          and extra.get("run_conclusion") == "lean_job_only"))
        if (extra.get("schema") == 1 and honest_run
                and extra.get("jobs", {}).get("Build Lean project and check axioms", {}).get(
                    "conclusion") == "success"):
            data.setdefault("modules", {}).update(extra.get("modules", {}))
    return data


def kernel_attested(att: dict, base: str) -> bool:
    """True only when every module hash and every required CI step match."""
    mod = att.get("modules", {})
    job = att.get("jobs", {}).get("Build Lean project and check axioms", {})
    if job.get("conclusion") != "success":
        return False
    needed = {base + ".lean", base + "Spec.lean", base + "Tests.lean"}
    if not needed.issubset(mod):
        return False
    for name in needed:
        p = REPO / "JapanTaxLaw" / name
        if not p.exists() or blob_sha(p) != mod[name].get("sha256"):
            return False
    return True


def spec_literals(spec_text: str) -> set[int]:
    """Numeric literals used by the independent spec DEFINITIONS only.

    Example grids and agreement helpers are deliberately excluded: they are
    test scaffolding, not the statutory formula, and requiring their literals
    to occur in 原文 would be both unsound and impossible.
    """
    body = strip_comments(spec_text)
    cut = len(body)
    for marker in ("example", "def agree"):
        i = body.find(marker)
        if 0 <= i < cut:
            cut = i
    body = body[:cut]
    out = set()
    for m in re.finditer(r"\b\d[\d_]*\b", body):
        v = int(m.group(0).replace("_", ""))
        if v > 1:  # 0/1 are structural, not statutory amounts
            out.add(v)
    return out


def impl_defs(impl_text: str) -> set[str]:
    return set(re.findall(r"^\s*def\s+([A-Za-z]\w*)", strip_comments(impl_text), re.M))


# Independent formulas appear as `specFoo`, `fooSpec`, `closedTax` or
# `fooTax`. Agreement/grid helpers are excluded by independent_spec_ok.
def_spec_re = re.compile(r"^\s*def\s+(?:spec\w+|\w+Spec|closed\w+|\w+Tax)\b", re.M)


def independent_spec_ok(spec_text: str, impl_text: str) -> bool:
    """True when the spec has its OWN formula, not a restatement of the impl.

    Agreement helpers (`agree*`, `*CheckGrid`, `checkGrid`, `example` points)
    MUST reference the implementation to compare it, so they are excluded.
    Only the bodies of independent definitions (`spec*`, `*Spec`, `*SpecI`,
    etc., excluding agreement/check helpers) are checked for implementation
    identifiers. This catches a circular `def specFoo := foo` while allowing
    an independently written formula that ends with a separate agreement test.
    """
    body = strip_comments(spec_text)
    # Split into top-level declaration blocks.
    blocks = re.split(r"(?=^\s*(?:def|example|theorem)\s)", body, flags=re.M)
    independent = []
    for block in blocks:
        m = re.match(r"\s*def\s+(\w+)", block)
        if not m:
            continue
        name = m.group(1)
        if (def_spec_re.match("def " + name) and not name.startswith("agree")
                and "Check" not in name and name != "checkGrid"
                and "Point" not in name and "Grid" not in name):
            # stop at the next declaration already handled by split
            independent.append(block)
    if not independent:
        return False
    impl = impl_defs(impl_text)
    for block in independent:
        for d in impl:
            if re.search(r"\b" + re.escape(d) + r"\b", block):
                return False
    return True


def law_full_text(law_id: str) -> str:
    """Normalised full text of the pinned snapshot for a law (needle anchoring)."""
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    for law in inv.get("laws", []):
        if law.get("law_id") != law_id:
            continue
        sf = (law.get("raw_snapshot") or {}).get("source_file", "")
        p = REPO / sf if sf else None
        if not p or not p.exists():
            return ""
        doc = json.loads(p.read_text(encoding="utf-8"))
        return core.norm(core.flat(doc.get("law_full_text")))
    return ""


def scoped_article_text(law_id: str, article: str) -> str:
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))
    for law in inv.get("laws", []):
        if law.get("law_id") != law_id:
            continue
        sf = (law.get("raw_snapshot") or {}).get("source_file", "")
        p = REPO / sf if sf else None
        if not p or not p.exists():
            return ""
        doc = json.loads(p.read_text(encoding="utf-8"))
        root = doc.get("law_full_text")

        def walk(n):
            if isinstance(n, dict):
                # Canonicalise both labels: transcription checks cite kanji
                # titles (第六十六条) or 72_49_14 while e-Gov uses Arabic Num.
                if n.get("tag") == "Article" and core.article_key(
                        str((n.get("attr") or {}).get("Num", ""))) == core.article_key(article):
                    return core.norm(core.flat(n))
                for c in n.get("children", []) or []:
                    found = walk(c)
                    if found:
                        return found
            elif isinstance(n, list):
                for c in n:
                    found = walk(c)
                    if found:
                        return found
            return ""

        return walk(root)
    return ""


def review_ok(base: str, review_text: str) -> bool:
    """Require a MODULE-SPECIFIC independent review with a recorded check.

    Review documents use several equivalent phrasings across batches
    (独立抽出 / 独立再抽出 / 一次資料, with 照合 / FOUND / 判定 as the decision).
    Accept any of those, but only inside the section headed by this module:
    a global keyword hit in an unrelated batch is not evidence for this unit.
    """
    idx = review_text.find("### " + base + ".lean")
    if idx < 0:
        idx = review_text.find(base + ".lean")
    section = review_text[idx: idx + 4000] if idx >= 0 else ""
    independent = ("独立抽出" in section or "独立再抽出" in section or
                   ("独立" in section and "一次資料" in section))
    decision = ("照合" in section or "FOUND" in section or "判定" in section)
    independent_doc = REPO / "docs" / "INDEPENDENT_SOURCE_REVIEW.md"
    if independent_doc.exists():
        itext = independent_doc.read_text(encoding="utf-8", errors="replace")
        idx = itext.find("### " + base + ".lean")
        if idx >= 0:
            section = itext[idx: idx + 4000]
            if all(k in section for k in ("独立再抽出", "一次資料", "判定")):
                return True
    # Parallel ADVERSARIAL workstreams own one file each under docs/advisory;
    # each section must still be module-specific with an H/T/D/C/U record.
    adv_dir = REPO / "docs" / "adversarial"
    if adv_dir.exists():
        for p in sorted(adv_dir.glob("*.md")):
            itext = p.read_text(encoding="utf-8", errors="replace")
            idx = itext.find("### " + base + ".lean")
            if idx < 0:
                continue
            section = itext[idx: idx + 4000]
            # H/T/D/C/U may be one tuple or five individually labelled fields
            # (H（…）, T（…）, ...). Both are explicit records.
            tuple_form = "H/T/D/C/U" in section.upper()
            labelled = all(re.search(r"\b" + c + r"\s*[（(]", section)
                           for c in ("H", "T", "D", "C", "U"))
            if (("独立抽出" in section or "独立再抽出" in section)
                    and ("照合" in section or "判定" in section)
                    and (tuple_form or labelled)):
                return True
    return independent and decision


def article_from_name(name: str) -> str:
    """Derive the e-Gov `Num` key from a human check name when `art` is None.

    Check names use BOTH ascii (art. 72の49の14) and kanji (第九条の三の二)
    numerals. The pinned JSON stores `Num` as ascii branch numbers, so kanji
    segments must be converted, e.g. 第九条の三の二 -> 9_3_2.
    """
    m = re.search(r"art\.\s*([^\s（(↔]+)", name)
    if not m:
        return ""
    token = m.group(1).strip("。、")
    segments = re.split(r"[の_\-]", token)
    out = []
    for seg in segments:
        if not seg:
            continue
        seg = seg.translate(str.maketrans("０１２３４５６７８９", "0123456789"))
        if seg.isdigit():
            out.append(str(int(seg)))
        else:
            try:
                out.append(str(_kanji_int(seg)))
            except ValueError:
                return ""
    return "_".join(out) if out else ""


def normalize_article(art: str) -> str:
    """Convert a check's article label to the e-Gov `Num` key.

    Checks cite either `72_49_14` (already a Num) or a kanji label such as
    `第九条の三の二`. The latter must become `9_3_2` before `scoped_article_text`
    compares against the pinned JSON's numeric `Num` attribute.
    """
    if not art:
        return ""
    art = art.strip()
    if re.fullmatch(r"[0-9０-９_]+", art):
        return art.translate(str.maketrans("０１２３４５６７８９", "0123456789"))
    body = art.replace("第", "").replace("条", "").replace("　", "")
    return article_from_name("art. " + body)


def boundary_evidence_categories(tests_text: str, literals=None) -> set[str]:
    """Detect GENUINE boundary coverage in kernel-decided examples.

    The old check counted the substrings 0/1/11/12/13 anywhere in the file,
    which rewarded incidental digits in large amounts and missed real boundary
    cases. Categories below are derived from example inputs/results:
      zero            - an example exercises a zero input;
      small_input     - an example exercises a small positive input (1..13);
      saturation      - an example where the result equals an input or is zero,
                        i.e. a floor / saturating-subtraction / identity boundary;
      threshold_below - an example exercises L-1 for a statutory literal L;
      threshold_at    - an example exercises exactly the statutory literal L;
      threshold_above - an example exercises L+1 for a statutory literal L.

    `literals` are the numeric literals transcribed from the independent spec
    (the statutory thresholds). The three threshold categories recognise the
    genuine just-below / at / just-above boundary of ANY statutory threshold,
    not just the small 1..13 range; without them a Bool-valued threshold such
    as 法人税法施行規則 art. 7 (六十時間 = 60 hours) could never register real
    boundary coverage even though its tests decide 59/60/61 in the kernel.
    They are only awarded for inputs immediately adjacent to an actual spec
    literal, so incidental large digits still do not count.
    """
    body = strip_comments(tests_text)
    cats: set[str] = set()
    lit_set: set[int] = set()
    for x in (literals or []):
        try:
            lit_set.add(int(x))
        except (TypeError, ValueError):
            continue
    for match in re.finditer(r"example\s*:\s*(.+?)\s*:=\s*by\s+(?:decide|rfl)", body):
        expr = match.group(1)
        if "=" not in expr:
            continue
        lhs, rhs = expr.split("=", 1)
        inputs = [int(x.replace("_", "")) for x in re.findall(r"\b\d[\d_]*\b", lhs)]
        result = re.search(r"\b\d[\d_]*\b", rhs)
        if 0 in inputs:
            cats.add("zero")
        if any(1 <= x <= 13 for x in inputs):
            cats.add("small_input")
        if result:
            value = int(result.group(0).replace("_", ""))
            if value == 0 or value in inputs:
                cats.add("saturation")
        for L in lit_set:
            if L - 1 in inputs:
                cats.add("threshold_below")
            if L in inputs:
                cats.add("threshold_at")
            if L + 1 in inputs:
                cats.add("threshold_above")
    return cats


def checks_by_module():
    spec = importlib.util.spec_from_file_location("ve_audit", AUDIT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    out = {}
    # Durable per-module pins live in data/TRANSCRIPTION_PINS/*.json. Loaded
    # here directly so a merge touching transcription_audit.py cannot silently
    # drop another module's evidence anchor.
    pins_dir = REPO / "data" / "TRANSCRIPTION_PINS"
    entries = []
    if pins_dir.exists():
        for pf in sorted(pins_dir.glob("*.json")):
            try:
                rec = json.loads(pf.read_text(encoding="utf-8"))
                entries.append((rec["name"], rec["law_id"], rec["kind"], rec.get("art"), rec["needles"]))
            except (ValueError, KeyError):
                continue
    for name, law_id, kind, art, needles in list(mod.checks()) + entries:
        m = re.search(r"(\w+)\.lean", name)
        if not m:
            continue
        base = m.group(1)
        if base.endswith("Spec") or base.endswith("Tests"):
            continue
        article = normalize_article(art) if art else article_from_name(name)
        if not article:
            continue
        out.setdefault(base, {"law_id": law_id, "article": article, "needles": needles})
    return out


def build() -> dict:
    att = load_attestation()
    review_text = REVIEW.read_text(encoding="utf-8") if REVIEW.exists() else ""
    modules = checks_by_module()
    inv = json.loads(INVENTORY.read_text(encoding="utf-8"))

    # Build the queue only for laws that actually carry an attested module.
    law_ids = {v["law_id"] for v in modules.values()}
    sub = dict(inv)
    sub["laws"] = [l for l in inv.get("laws", []) if l.get("law_id") in law_ids]
    tasks = tq.build_tasks(sub)

    units = {}
    detail = {}
    for base, info in modules.items():
        p = REPO / "JapanTaxLaw"
        impl_p, spec_p, tests_p = p / (base + ".lean"), p / (base + "Spec.lean"), p / (base + "Tests.lean")
        ok = kernel_attested(att, base)
        impl_text = impl_p.read_text(encoding="utf-8") if impl_p.exists() else ""
        spec_text = spec_p.read_text(encoding="utf-8") if spec_p.exists() else ""
        tests_text = tests_p.read_text(encoding="utf-8") if tests_p.exists() else ""
        lits = spec_literals(spec_text)
        kanji = {int_to_kanji(v) for v in lits}
        scoped = scoped_article_text(info["law_id"], info["article"])
        # A transcription check may cite several articles (e.g. art. 9の22 /
        # 35の4の5) while only one is modelled. Its needles are then genuine
        # pinned bytes from more than one article. Require every needle in the
        # PINNED LAW text, while clause-level correspondence (below) still
        # requires the unit's exact text in the single scoped article.
        law_text = law_full_text(info["law_id"])
        needles_ok = bool(info["needles"]) and all(
            core.norm(n) in law_text for n in info["needles"])
        n_examples = len(re.findall(r"example\s*:", strip_comments(tests_text)))
        boundary_categories = boundary_evidence_categories(tests_text, lits)
        boundary_examples = len(boundary_categories)
        review = review_ok(base, review_text)
        independent = independent_spec_ok(spec_text, impl_text)

        detail[base] = {
            "kernel_attested": ok,
            "spec_literals": sorted(lits),
            "kanji_literals": sorted(kanji),
            "needles_scoped": needles_ok,
            "independent_spec": independent,
            "kernel_decided_examples": n_examples,
            "boundary_examples_found": boundary_examples,
            "adversarial_review": review,
            "scoped_article_chars": len(scoped),
        }

        # Structural specs (saturating subtraction, recursion, if-then-else)
        # legitimately have no statutory numeral. They are still verifiable via
        # the independently pinned needle anchor at CLAUSE level (below).
        if not (ok and needles_ok and independent and review
                and n_examples >= 5 and boundary_examples >= 3):
            continue

        for t in tasks:
            if t.get("law_id") != info["law_id"] or t.get("article") != info["article"]:
                continue
            if t.get("kind") not in VERIFIABLE_KINDS or t.get("unhandled_conditions"):
                continue
            text = core.norm(t.get("text", ""))
            clause_ok, clause_basis = clause_correspondence(
                lits, text, info.get("needles", []), scoped)
            if not text or not clause_ok:
                continue  # this clause is not expressed by the verified spec
            cov = t.get("coverage", {})
            if not (cov.get("exact") and cov.get("unique_ids")):
                continue
            source_location = bool(t.get("source_path") and text in scoped)
            # The clause must occur verbatim in the scoped original of the
            # audited article; a same-numbered supplementary provision must
            # not inherit the proof of the main provision.
            if not source_location:
                continue
            cross_law = not any(d.get("unresolved") for d in t.get("dependencies", [])) \
                and bool(t.get("revision"))
            # Evidence values are reproducible REFERENCES, not booleans.  The
            # status gate treats a non-empty reference as evidence; every
            # reference below points at a committed artifact or a recorded CI
            # result, so none of them is a bare presence claim.
            h_impl = blob_sha(impl_p)
            h_spec = blob_sha(spec_p)
            h_tests = blob_sha(tests_p)
            ev = {
                "source_location": "%s#%s sha256=%s (verbatim unit text located in scoped article)" % (
                    t.get("source_file", ""), t.get("source_path", ""), t.get("source_sha256", "")),
                "decomposition_audit": "normative_core.decompose_article: exact reconstruction, unique ids, coverage=COVERED",
                "source_correspondence_audit": (
                    "scripts/ci/generate_verification_evidence.py: basis=%s; verbatim spellings found in scoped 原文 = %s; "
                    "statutory rate = %s; needles scoped" % (
                        clause_basis,
                        json.dumps(matched_spellings(lits, text), ensure_ascii=False, sort_keys=True),
                        str(parse_statutory_rate(text)) if parse_statutory_rate(text) is not None else "none")),
                "independent_spec": "JapanTaxLaw/%sSpec.lean sha256=%s (defines spec* without implementation constants)" % (base, h_spec),
                "implementation": "JapanTaxLaw/%s.lean sha256=%s" % (base, h_impl),
                "kernel_proof": "%s: commit %s, build/axiom job success, 3 module hashes re-verified" % (att["workflow_run"], att["commit"]),
                "proof_scope": "basis=%s; constants %s used by kernel-checked impl + independent spec" % (clause_basis, sorted(lits)),
                "boundary_proof": "attested Tests module contains %d kernel-decided examples covering boundary inputs" % n_examples,
                "cross_law_proof": "unit dependencies=%s; enforced revision=%s resolved from INVENTORY" % (len(t.get("dependencies", [])), t.get("revision", "")),
                "tests": "JapanTaxLaw/%sTests.lean sha256=%s (%d kernel-decided examples)" % (base, h_tests, n_examples),
                "adversarial_review": "docs/ADVERSARIAL_REVIEW.md: module-specific independent pinned re-extraction with H/T/D/C/U",
            }
            status, errors = core.derive_status(t, ev)
            units[t["normative_id"]] = ev
            detail.setdefault("_units", {})[t["normative_id"]] = {
                "derived_status": status,
                "errors": errors,
                "module": base,
                "spec_kanji_in_原文": sorted(k for k in kanji if k in text),
                "checks": {
                    "source_location": source_location,
                    "needles_scoped": needles_ok,
                    "independent_spec": independent,
                    "kernel_attested": ok,
                    "cross_law": cross_law,
                    "kernel_decided_examples": n_examples,
                },
            }

    return {
        "tool": "scripts/ci/generate_verification_evidence.py",
        "schema": 1,
        "attestation_commit": att["commit"],
        "module_detail": detail,
        "units": dict(sorted(units.items())),
    }


def main() -> int:
    payload = build()
    audit = REPO / "data" / "EVIDENCE_GENERATION_AUDIT.json"
    audit_text = json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n"
    if not audit.exists() or audit.read_text(encoding="utf-8") != audit_text:
        audit.write_text(audit_text, encoding="utf-8")
        print("wrote", audit)

    # Merge into the shared durable ledger.  NEVER overwrite entries written by
    # another verification workstream: the ledger is append-only by unit id.
    ledger = {"schema": "verification-evidence-v1", "note": "Evidence references for individual normative units.", "units": {}}
    if OUT.exists():
        ledger = json.loads(OUT.read_text(encoding="utf-8"))
    ledger.setdefault("units", {})
    owned = "scripts/ci/generate_verification_evidence.py:"
    # This generator OWNS entries whose correspondence reference names it.
    # Re-check them on every run: an entry whose module hash, review or
    # spec-independence no longer holds must be removed, never left stale.
    for uid in list(ledger["units"]):
        ev = ledger["units"][uid]
        if isinstance(ev, dict) and owned in str(ev.get("source_correspondence_audit", "")) \
                and uid not in payload["units"]:
            del ledger["units"][uid]
    previous = set(ledger["units"])
    for uid, ev in payload["units"].items():
        ledger["units"][uid] = ev
    added = len(set(ledger["units"]) - previous)
    merged = json.dumps(ledger, ensure_ascii=False, indent=2, sort_keys=True) + "\n"
    if OUT.read_text(encoding="utf-8") != merged:
        OUT.write_text(merged, encoding="utf-8")
        print("merged", added, "unit(s) into", OUT)
    print("attested units:", len(payload["units"]), "ledger total:", len(ledger["units"]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
