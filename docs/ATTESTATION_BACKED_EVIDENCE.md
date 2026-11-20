# Attestation-backed verification evidence (2026-11-20)

This branch adds a reproducible way to move normative units from
`NOT_STARTED`/`PARTIAL` to `FULLY_VERIFIED` **without** treating a numeric match,
a file's existence or a theorem-name string as completion.

## What is committed

- `scripts/ci/generate_verification_evidence.py` — derives evidence references
  from real artifacts and merges them into `data/verification_evidence.json`.
- `data/PROOF_ATTESTATION.json` — a CI-backed kernel-build attestation: commit
  SHA, successful workflow run/job, and SHA-256 of every committed Lean blob.
- `data/verification_evidence.json` — per-unit evidence references (all eleven
  axes) for the units whose independent spec actually expresses the 原文.
- `data/EVIDENCE_GENERATION_AUDIT.json` — the generator's own audit trail
  (which literals were located, which module checks passed).
- `scripts/tests/test_verification_evidence.py` — 8 regression tests.

## Why the evidence is not a presence check

`kernel_proof` is accepted only when all three module hashes in the attestation
match the current bytes (`blob_sha`, CRLF-normalised) AND the recorded CI job
"Build Lean project and check axioms" ended in success with every required step
(clean builds, no-sorry scan, axiom check) passing.

`source_correspondence_audit` is computed **outside Lean**: every numeric literal
of the independent `spec*` definitions is converted to a statute-style kanji
numeral and required to occur in the pinned article text selected by `Num`, and
every pinned needle must occur in that same scoped text.

`independent_spec` rejects a spec that merely restates implementation constants;
agreement helpers are excluded from that check because they must reference the
implementation in order to compare it.

The generator is append-only with respect to other workstreams: it prunes only
entries it owns (identified by its own correspondence reference) and never
overwrites entries written by another verification stream.

## Measured result (local, this branch)

```
$ python scripts/ci/generate_verification_evidence.py
attested units: 46 ledger total: 47

$ python -m unittest scripts.tests.test_verification_evidence -v
Ran 8 tests ... OK

$ python _verify_ledger.py     # derive_status over the generated queue
LEDGER_UNITS 47 MATCHED 47
STATUSES {'FULLY_VERIFIED': 47}
```

Status remains `LEGAL_REVIEW_PENDING` for these units; this is a machine
verification result, not a legal-validity claim. No claim of whole-tax-law
completion is made: the remaining 396k+ units are still unverified.
