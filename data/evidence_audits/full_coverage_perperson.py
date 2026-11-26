#!/usr/bin/env python3
"""FULL-COVERAGE mechanical source-fidelity check for the 8 PerPersonDeduction units.

READ-ONLY with respect to the repository. Written/run only under
D:\\CodexData\\Temp\\opencode\\goal208\\.

Checks per record:
  1) SHA-256 of the pinned source file bytes == record["source_sha256"]
  2) norm_fragment contains "一人につき" + yen amount (the token field)
  3) token occurs verbatim in the normalized pinned source text
  4) norm_fragment is a substring of the normalized pinned source text

Plus:
  - forbidden-proof-token scan of JapanTaxLaw/PerPersonDeduction*.lean
  - theorem-block comparison vs git HEAD
"""
from __future__ import annotations

import hashlib
import json
import pathlib
import re
import subprocess

REPO = pathlib.Path(r"C:\Users\user\.local\share\opencode\worktree\484e09\norm-queue-fix")
JSON_PATH = pathlib.Path(r"D:\CodexData\Temp\opencode\goal208\perperson.json")

# Same whitespace normalization as scripts/ci/normative_ids.py::norm_text
_WS = re.compile(r"[\s\u3000]+")


def norm_text(s: str) -> str:
    return _WS.sub("", s)


# Same label exclusions as scripts/ci/task_queue.py::_collect
LABEL_TAGS = {
    "ArticleTitle", "ArticleCaption", "ParagraphNum", "ParagraphCaption",
    "ItemTitle", "Subitem1Title", "Subitem2Title", "Subitem3Title",
    "AppdxTableTitle", "SupplProvisionLabel", "LawTitle", "LawNum",
}


def collect_strings(node, out: list[str]) -> None:
    """Flatten text leaves in document order, mirroring task_queue._collect."""
    if isinstance(node, str):
        t = norm_text(node)
        if t:
            out.append(t)
        return
    if isinstance(node, list):
        for child in node:
            collect_strings(child, out)
        return
    if isinstance(node, dict):
        if node.get("tag") in LABEL_TAGS:
            return
        for child in node.get("children", []):
            collect_strings(child, out)


def normalized_source_text(doc: dict) -> str:
    parts: list[str] = []
    collect_strings(doc.get("law_full_text", {}), parts)
    return "".join(parts)


# 一人につき + kanji yen amount + 円
AMOUNT_KANJI = r"[〇零一二三四五六七八九十百千万]+"
PHRASE_AMOUNT = re.compile(r"一人につき" + AMOUNT_KANJI + r"円")
TOKEN_EXACT = re.compile(r"^一人につき" + AMOUNT_KANJI + r"円$")

MAX_FAILURES_REPORTED = 20


def main() -> int:
    records = json.loads(JSON_PATH.read_text(encoding="utf-8"))
    print(f"records loaded: {len(records)}")
    print("=" * 78)

    passed = 0
    failed = 0
    failures: list[str] = []

    # cache normalized text per source file
    cache: dict[str, tuple[str, str]] = {}

    for idx, rec in enumerate(records, start=1):
        nid = rec["normative_id"]
        sf = rec["source_file"]
        token = rec["token"]
        frag = rec["norm_fragment"]
        expect_sha = rec["source_sha256"].upper()

        if sf not in cache:
            p = REPO / sf
            if p.exists():
                raw = p.read_bytes()
                sha = hashlib.sha256(raw).hexdigest().upper()
                doc = json.loads(raw.decode("utf-8"))
                full = normalized_source_text(doc)
            else:
                sha, full = "", ""
            cache[sf] = (sha, full)
        sha, full = cache[sf]

        # 1) pinned source SHA-256
        c1 = sha == expect_sha

        # 2) norm_fragment has 一人につき + yen amount == token field
        c2a = bool(TOKEN_EXACT.match(token))
        c2b = token in frag
        c2c = bool(PHRASE_AMOUNT.search(frag))
        c2 = c2a and c2b and c2c

        # 3) token verbatim in normalized pinned source text
        c3 = token in full

        # 4) norm_fragment substring of normalized pinned source text
        c4 = frag in full

        ok = c1 and c2 and c3 and c4
        if ok:
            passed += 1
        else:
            failed += 1
            detail = (
                f"record#{idx} id={nid} article={rec.get('article')} "
                f"file={sf}\n"
                f"    C1 sha_match={c1} (computed={sha or 'MISSING'} expected={expect_sha})\n"
                f"    C2 phrase+amount ok={c2} (token_exact={c2a} token_in_frag={c2b} "
                f"phrase_amount_in_frag={c2c}) token={token!r}\n"
                f"    C3 token_in_normalized_source={c3}\n"
                f"    C4 fragment_in_normalized_source={c4} "
                f"fraglen={len(frag)} srclen={len(full)}\n"
                f"    frag={frag!r}"
            )
            failures.append(detail)

        print(f"[{idx}] {'PASS' if ok else 'FAIL'}  C1={c1} C2={c2} C3={c3} C4={c4}  "
              f"id={nid[:12]}  token={token}")

    print("=" * 78)
    print(f"COUNTS: total={len(records)} pass={passed} fail={failed}")
    print(f"FAILURE LIST (max {MAX_FAILURES_REPORTED}):")
    if not failures:
        print("  (none)")
    else:
        for f in failures[:MAX_FAILURES_REPORTED]:
            print(f)
        if len(failures) > MAX_FAILURES_REPORTED:
            print(f"  ... {len(failures) - MAX_FAILURES_REPORTED} more suppressed")

    # ---------------- forbidden proof token scan ----------------
    print("=" * 78)
    print("FORBIDDEN PROOF TOKEN SCAN (JapanTaxLaw/PerPersonDeduction*.lean)")
    FORBIDDEN = ("sorry", "admit", "axiom", "Classical.choice")  # lean_kernel_audit.py

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

    lean_files = sorted((REPO / "JapanTaxLaw").glob("PerPersonDeduction*.lean"))
    forbidden_findings: list[str] = []
    theorem_inventory: dict[str, list[str]] = {}
    for pf in lean_files:
        text = pf.read_text(encoding="utf-8")
        stripped = strip_comments_and_strings(text)
        for tok in FORBIDDEN:
            for m in re.finditer(r"\b" + re.escape(tok) + r"\b", stripped):
                line = stripped.count("\n", 0, m.start()) + 1
                forbidden_findings.append(f"{pf.name}:{line}:{tok}")
        ths = re.findall(r"^\s*(?:theorem|lemma)\s+(\w+)",
                         text, flags=re.MULTILINE)
        theorem_inventory[pf.name] = ths

    print(f"  files scanned: {[p.name for p in lean_files]}")
    print(f"  forbidden tokens (set): {FORBIDDEN}")
    if forbidden_findings:
        print(f"  FORBIDDEN FOUND ({len(forbidden_findings)}): {forbidden_findings}")
    else:
        print("  forbidden findings: NONE")
    print(f"  theorem blocks present: {theorem_inventory}")

    # ---------------- theorem blocks vs git HEAD ----------------
    print("=" * 78)
    print("THEOREM BLOCKS vs git HEAD")
    for pf in lean_files:
        rel = pf.relative_to(REPO).as_posix()
        tracked = subprocess.run(
            ["git", "ls-files", "--error-unmatch", rel],
            cwd=REPO, capture_output=True, text=True,
        ).returncode == 0
        head_show = subprocess.run(
            ["git", "show", f"HEAD:{rel}"],
            cwd=REPO, capture_output=True, text=True,
        )
        in_head = head_show.returncode == 0
        if in_head:
            head_text = head_show.stdout
            head_ths = re.findall(r"^\s*(?:theorem|lemma)\s+(\w+)",
                                  head_text, flags=re.MULTILINE)
            work_ths = theorem_inventory[pf.name]
            # compare full theorem blocks (declaration line + proof body up to
            # the next declaration / end) by exact text
            head_blocks = re.findall(
                r"(?:^|\n)(theorem|lemma)\s+\w+[\s\S]*?(?=\n(?:theorem|lemma|end|\Z))",
                head_text, flags=re.MULTILINE)
            work_text = pf.read_text(encoding="utf-8")
            work_blocks = re.findall(
                r"(?:^|\n)(theorem|lemma)\s+\w+[\s\S]*?(?=\n(?:theorem|lemma|end|\Z))",
                work_text, flags=re.MULTILINE)
            same = (head_blocks == work_blocks)
            print(f"  {pf.name}: tracked_in_index={tracked} in_HEAD={in_head} "
                  f"head_theorems={head_ths} work_theorems={work_ths} "
                  f"theorem_blocks_identical={same}")
        else:
            print(f"  {pf.name}: tracked_in_index={tracked} in_HEAD=False -> "
                  f"NO HEAD BASELINE (untracked file); "
                  f"working-tree theorems={theorem_inventory[pf.name]}")

    print("=" * 78)
    overall = (failed == 0 and not forbidden_findings and len(records) == 8)
    if overall:
        print("ALL-RECORD RESULT: PASS")
        print("SCOPE: FULL-COVERAGE mechanical source-fidelity scoped to "
              "SHA / phrase / containment; surrounding context out of scope.")
    else:
        print("ALL-RECORD RESULT: FAIL")
    return 0 if overall else 1


if __name__ == "__main__":
    raise SystemExit(main())
