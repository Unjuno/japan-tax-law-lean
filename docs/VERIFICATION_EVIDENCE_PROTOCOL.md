# Verification-evidence protocol (Directive §1.4/§1.5, §3, §5)

This record makes the evidence-backed `FULLY_VERIFIED` statuses reproducible
from a clean checkout of `main`.

## Committed artifacts

- `data/PROOF_ATTESTATION.json` — machine-produced CI attestation: workflow
  run id, commit sha, and the SHA-256 of each attested Lean module. It is
  accepted only when the required "Build Lean project and check axioms" job
  succeeded.
- `data/verification_evidence.json` — append-only ledger, one entry per
  normative unit. Every entry contains a **reference string per evidence axis**
  (artifact path + hash, CI run id, or independent-audit document location),
  never a bare boolean and never a theorem-name match.
- `data/EVIDENCE_GENERATION_AUDIT.json` — full machine-readable detail of how
  each entry was derived (module, kanji literals, scoped original text,
  kernel-decided examples, cross-check results).
- `scripts/ci/generate_verification_evidence.py` — deterministic generator.
  It refuses to attest a unit unless ALL of the following are reproducible:
  kernel build + axiom job success with hash-matched modules, needles located
  in the *scoped article*, an independent `Spec` not reusing implementation
  constants, every spec literal present in 原文, ≥5 kernel-decided tests,
  ≥3 boundary examples, and a recorded adversarial review.

## Measured result (2026-11-20)

```
python scripts/ci/generate_verification_evidence.py
  -> attested units: 46; ledger total: 47
python scripts/ci/task_queue.py
  -> 396854 units; NOT_STARTED=396805, FULLY_VERIFIED=47, BLOCKED=2
python scripts/ci/verify_queue_invariants.py
  -> 12/12 invariants passed
     PASS every FULLY_VERIFIED is evidence-backed - FULLY_VERIFIED=47 backed=True
```

Before this evidence existed, the same queue reported `FULLY_VERIFIED=0` and
`NOT_STARTED=396852`. The reduction of unverified obligations is therefore
**47 units**, each traceable to a recorded reference; it is not a count of new
models or theorem names.

## What this does NOT establish

- 396,805 units remain NOT_STARTED; 2 are BLOCKED (no pinned snapshot).
- Human legal review remains `LEGAL_REVIEW_PENDING` for 3,438 candidates with
  0 recorded reviewers; it is a separate axis.
- The 47 verified units are scoped claims: `proof_scope` and
  `source_correspondence_audit` records explicitly describe the finite grid
  and the literals checked. They are not universal article completions.
- `Quot.sound` in 3 Lean declarations and the broader unbound-reference set
  remain open (see `docs/LEAN_KERNEL_AUDIT_20261120.md`).

No completion claim is made.
