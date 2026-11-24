# Evidence attestation binding — adversarial audit (2026-11-24)

Evidence record with measured values. No legal-correctness or completion claim.

## H — falsifiable hypothesis

H1: every `kernel_proof` reference that cites a GitHub Actions run resolves to
a **committed** `PROOF_ATTESTATION*.json` file; a local-only claim must be
explicitly labelled and must not also cite a CI run.

## T — reproduction

```
python scripts/ci/audit_evidence_references.py
python -m unittest scripts.tests.test_evidence_attestation_binding -v
```

Measured at an intermediate `main` state (`21eb79cb`, 669 evidence units):

```
evidence references: 2674/3276 resolved, 602 unresolved
601 x kernel_proof: run=45333988195 attested_run=45344189369
  1 x adversarial_review: "__ADVERSARIAL__" placeholder
```

601 `FULLY_VERIFIED` units cited run `45333988195`, for which **no attestation
file was committed** — the kernel-proof claim was not reproducible from the
repository. Regenerating against the committed attestations reduced unresolved
references to 1 (and added 10 attested units); `progress_ledger.py` reported
`COUNTED; NOT_STARTED delta -10; new modules 27`.

At the current `main` (`c491ceff`) the same audit reports
`3434/3438 resolved, 4 unresolved`: three SHA-256 mismatches on the GiftTax
module trio (evidence hashes stale after a later edit to `GiftTax.lean`) and one
`__ADVERSARIAL__` placeholder. These 4 are recorded, not hidden.

## D — decision

Add `test_evidence_attestation_binding.py` and wire it into the gate runner so
the H1 property is enforced on every CI run:

- every CI-run `kernel_proof` reference must resolve to a committed attestation;
- a `LOCAL VERIFICATION` claim must never also cite a CI run.

Both tests pass on current `main`; they prevent the stale-run pattern from
returning. No Lean proof and no existing evidence entry was modified here.

## C — competing interpretation

A local `lake build` is genuine kernel verification even without CI. Such
entries are allowed but explicitly labelled `LOCAL VERIFICATION (not
CI-attested)`; they are not represented as reproducible CI evidence.

## U — uncertainty

- Artifact hashing checks identity, not legal correctness. Human legal review
  stays `LEGAL_REVIEW_PENDING` (0/3438 candidates recorded).
- The audit does not re-run Lean; it only verifies that the claim is
  reproducible from committed artifacts.
- The 4 currently unresolved references (GiftTax hash drift and one placeholder)
  remain open and are not claimed as verified.
