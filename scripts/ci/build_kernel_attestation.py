#!/usr/bin/env python3
"""Build a machine-checkable kernel attestation from a CI run log.

The Lean CI job runs `lake build` and then `#print axioms <every tracked
theorem>`. Its log therefore contains a kernel-verified axiom report for each
theorem. This tool extracts that report into a small committed JSON file so the
evidence recorder can cite real kernel results instead of file existence.

Usage:
  python scripts/ci/build_kernel_attestation.py --log build/ci_main.log \
      --run-id 44685121369 --commit 2eb3e38 --out data/kernel_attestation.json
"""
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

LINE_RE = re.compile(
    r"'([A-Za-z0-9_.']+)'\s+does not depend on any axioms|"
    r"'([A-Za-z0-9_.']+)'\s+depends on axioms:\s*\[([^\]]*)\]"
)
FORBIDDEN = {"sorryAx"}
# propext / Quot.sound are permitted kernel axioms in this project; the CI job
# additionally rejects Classical.choice. Record every axiom verbatim.
DISALLOWED = {"sorryAx", "Classical.choice"}


def parse_log(text: str) -> dict[str, list[str]]:
    out: dict[str, list[str]] = {}
    for line in text.splitlines():
        m = LINE_RE.search(line)
        if not m:
            continue
        if m.group(1):
            name, axioms = m.group(1), []
        else:
            name = m.group(2)
            axioms = [a.strip() for a in m.group(3).split(",") if a.strip()]
        out[name] = sorted(set(axioms))
    return out


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--log", required=True)
    ap.add_argument("--run-id", required=True)
    ap.add_argument("--commit", required=True)
    ap.add_argument("--out", required=True)
    args = ap.parse_args()

    theorems = parse_log(Path(args.log).read_text(encoding="utf-8", errors="replace"))
    bad = {name: ax for name, ax in theorems.items() if set(ax) & DISALLOWED}
    payload = {
        "schema": "kernel-attestation/v1",
        "ci_run_id": args.run_id,
        "commit": args.commit,
        "method": "lake build + #print axioms for every tracked theorem",
        "forbidden_axioms_observed": bad,
        "theorem_count": len(theorems),
        "theorems": {k: theorems[k] for k in sorted(theorems)},
    }
    out = Path(args.out)
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
                   encoding="utf-8")
    print(f"attestation: {len(theorems)} theorems; forbidden-axiom hits={len(bad)}; wrote {out}")
    return 1 if bad else 0


if __name__ == "__main__":
    raise SystemExit(main())
