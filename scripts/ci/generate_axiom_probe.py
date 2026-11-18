"""Deterministically emit the #print axioms probe file used by CI.

Design (v2): scan every tracked .lean file, track namespace nesting, and emit
`#print axioms <fully-qualified-name>` for each theorem/lemma it declares.
No hand-maintained theorem list: the probe is derived from the sources, so it
is always in sync with the tree, on every branch.

Output is deterministic (sorted by fully-qualified name).
"""
import re
import subprocess
import sys

OUR_NAMESPACE_PATTERN = re.compile(r"^\s*namespace\s+([A-Za-z0-9_.']+)")
END_PATTERN = re.compile(r"^\s*end(\s+([A-Za-z0-9_.']+))?\s*$")
THM_PATTERN = re.compile(r"^\s*theorem\s+([A-Za-z0-9_.']+)(?=[\s\({:]|$)")
LEMMA_PATTERN = re.compile(r"^\s*lemma\s+([A-Za-z0-9_.']+)(?=[\s\({:]|$)")


def tracked_lean_files():
    out = subprocess.run(
        ["git", "ls-files", "-z", "*.lean"],
        capture_output=True,
        check=True,
    ).stdout
    return [f for f in out.decode("utf-8").split("\0") if f]


def strip_comments(text: str) -> str:
    """Blank out Lean block/doc/line comments so prose such as
    "theorem is claimed." inside a -/ doc comment is not mistaken for a
    declaration. Line structure is preserved so namespace tracking still works.
    """
    import re as _re
    text = _re.sub(r"/-.*?-/", lambda m: _re.sub(r"[^\n]", " ", m.group(0)), text, flags=_re.S)
    text = _re.sub(r"--[^\n]*", "", text)
    return text


def theorems_of(path):
    """Yield (qualified_name, path) for every theorem/lemma declared in file."""
    stack: list[str] = []
    with open(path, encoding="utf-8") as fh:
        source = strip_comments(fh.read())
        for line in source.splitlines():
            m = OUR_NAMESPACE_PATTERN.match(line)
            if m:
                stack.extend(m.group(1).split("."))
                continue
            m = END_PATTERN.match(line)
            if m:
                # `end X` closes X (or its ancestors); `end` alone pops one level.
                if m.group(2):
                    parts = m.group(2).split(".")
                    # pop until the stack ends with the named namespace
                    while stack:
                        popped_count = len(parts)
                        if stack[-popped_count:] == parts:
                            del stack[-popped_count:]
                            break
                        stack.pop()
                elif stack:
                    stack.pop()
                continue
            for pat in (THM_PATTERN, LEMMA_PATTERN):
                m = pat.match(line)
                if m:
                    yield ".".join(stack + [m.group(1)])


def main() -> int:
    names = set()
    for f in tracked_lean_files():
        for q in theorems_of(f):
            names.add(q)
    print("import JapanTaxLaw")
    for name in sorted(names):
        print(f"#print axioms {name}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
