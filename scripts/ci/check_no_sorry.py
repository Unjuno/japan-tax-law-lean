#!/usr/bin/env python3
"""Comment- and string-aware scan for forbidden placeholder proofs (`sorry` / `admit`).

The previous CI gate (`! grep -rnE '\\bsorry\\b|\\badmit\\b' JapanTaxLaw/`) false-triggered
on this repo's own documentation, which writes e.g. "No `sorry`, `admit`" in doc comments.
That made the gate useless. This checker removes comments and string literals first, then
looks for the tokens in actual proof code. Any remaining occurrence fails the gate.

Lean comment syntax handled:
  - nested block comments `/- ... -/` (including `/-! ... -/` and `/-- ... -/`)
  - line comments `-- ...`
  - string literals `"..."` with backslash escapes

Interpolated-string code fragments (`s!"..."`) are *not* scanned; they are inert here and
documented as a limitation. The axiom probe (`sorryAx` in `#print axioms` output) remains
the authoritative backstop for every adopted theorem.
"""
import re
import subprocess
import sys
from pathlib import Path

FORBIDDEN = re.compile(r"\b(sorry|admit)\b")


def tracked_lean_files() -> list[str]:
    out = subprocess.run(
        ["git", "ls-files", "-z", "*.lean"],
        capture_output=True,
        check=True,
    ).stdout
    files = out.decode("utf-8").split("\0")
    return [f for f in files if f]


def strip_comments_and_strings(src: str) -> str:
    out: list[str] = []
    i, n = 0, len(src)
    while i < n:
        # string literal
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
        # line comment
        if src.startswith("--", i):
            while i < n and src[i] != "\n":
                out.append(" ")
                i += 1
            continue
        # nested block comment
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


def main() -> int:
    findings: list[str] = []
    for f in tracked_lean_files():
        text = Path(f).read_text(encoding="utf-8")
        stripped = strip_comments_and_strings(text)
        for lineno, line in enumerate(stripped.splitlines(), start=1):
            for m in FORBIDDEN.finditer(line):
                findings.append(f"{f}:{lineno}: forbidden placeholder {m.group(0)!r} in proof code")
    if findings:
        print("\n".join(findings))
        return 1
    print("no forbidden placeholder proofs found in tracked Lean sources")
    return 0


if __name__ == "__main__":
    sys.exit(main())
