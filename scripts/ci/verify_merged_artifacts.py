#!/usr/bin/env python3
"""Guard against silent deletion/alteration of MERGED verified artifacts.

Several stale-base ledger regenerations deleted Lean modules, scoped
attestations, transcription pins and review docs of units that had already
been merged (the merge commit was an ancestor of HEAD, but the files were
gone).  This gate makes every such deletion a REQUIRED-gate failure.

The manifest is append-only in intent: a PR that intentionally edits a
verified artifact must regenerate the manifest in the SAME PR with
`python scripts/ci/verify_merged_artifacts.py --write`, so the change is
explicit and reviewable.  `--write` is never invoked by CI.
"""
from __future__ import annotations

import hashlib
import json
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
MANIFEST = REPO / "data" / "MERGED_ARTIFACT_MANIFEST.json"


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes().replace(b"\r\n", b"\n")).hexdigest()


def seed() -> dict:
    """Derive the protected set from committed scoped attestations."""
    artifacts: dict[str, dict] = {}
    data = REPO / "data"
    for att in sorted(data.glob("PROOF_ATTESTATION_SCOPED*.json")):
        payload = json.loads(att.read_text(encoding="utf-8"))
        artifacts[str(att.relative_to(REPO)).replace("\\", "/")] = {"merged_at": payload.get("commit", "")}
        for name in payload.get("modules", {}):
            base = name[:-5] if name.endswith(".lean") else name
            for p in (REPO / "JapanTaxLaw" / f"{base}.lean",
                      REPO / "JapanTaxLaw" / f"{base}Spec.lean",
                      REPO / "JapanTaxLaw" / f"{base}Tests.lean",
                      data / "TRANSCRIPTION_PINS" / f"{base}.json"):
                if p.exists():
                    artifacts[str(p.relative_to(REPO)).replace("\\", "/")] = {}
    # module-specific adversarial reviews for those modules
    adv = REPO / "docs" / "adversarial"
    if adv.exists():
        for p in sorted(adv.glob("*.md")):
            text = p.read_text(encoding="utf-8", errors="replace")
            for att in sorted(data.glob("PROOF_ATTESTATION_SCOPED*.json")):
                payload = json.loads(att.read_text(encoding="utf-8"))
                bases = [n[:-5] for n in payload.get("modules", {})]
                if any(b in text for b in bases):
                    artifacts[str(p.relative_to(REPO)).replace("\\", "/")] = {}
    for rel in artifacts:
        artifacts[rel]["sha256"] = sha(REPO / rel)
    return {
        "schema": 1,
        "note": ("Explicit manifest of artifacts belonging to already-merged verified units. "
                 "Deletion or unrecorded modification is a REQUIRED-gate failure. "
                 "Regenerate with --write in the same PR that intentionally edits one."),
        "artifacts": dict(sorted(artifacts.items())),
    }


def main() -> int:
    if "--write" in sys.argv[1:]:
        blob = json.dumps(seed(), ensure_ascii=False, indent=2, sort_keys=True) + "\n"
        MANIFEST.write_text(blob, encoding="utf-8")
        print(f"wrote {MANIFEST} with {len(seed()['artifacts'])} artifacts")
        return 0
    if not MANIFEST.exists():
        print("FAIL merged artifact manifest missing; regenerate with --write")
        return 1
    manifest = json.loads(MANIFEST.read_text(encoding="utf-8"))
    problems = []
    for rel, rec in sorted(manifest.get("artifacts", {}).items()):
        p = REPO / rel
        if not p.exists():
            problems.append(f"DELETED {rel} (merged_at={rec.get('merged_at', 'n/a')})")
            continue
        actual = sha(p)
        if actual != rec.get("sha256"):
            problems.append(f"ALTERED {rel}: recorded {rec.get('sha256')} != current {actual}")
    if problems:
        print(f"FAIL merged artifact guard: {len(problems)} problem(s)")
        for p in problems[:40]:
            print("  " + p)
        return 1
    print(f"merged artifact guard: {len(manifest['artifacts'])} protected artifacts intact")
    return 0


if __name__ == "__main__":
    sys.exit(main())
