# Evidence attestation rebind — adversarial audit (2026-11-24)

Status record with measured values. No legal-correctness claim.

## H — falsifiable hypothesis

H1: every `kernel_proof` reference of a `FULLY_VERIFIED` unit that cites a
GitHub Actions run resolves to a **committed** attestation whose Lean job
succeeded, and whose module SHA-256 hashes match the blobs in the tree.

## T — reproduction checks

```
python scripts/ci/audit_evidence_references.py
python -m unittest scripts.tests.test_evidence_attestation_binding -v
```

Before this change (measured on `origin/main` at `21eb79cb`, evidence ledger
669 units):

```
evidence references: 2674/3276 resolved, 602 unresolved
601 x kernel_proof: run=45333988195 attested_run=45344189369 conclusion=success
  1 x adversarial_review: "__ADVERSARIAL__" non-batch placeholder
```

601 of 669 units cited a CI run for which **no attestation file was committed**
(run `45333988195` did not appear in any `PROOF_ATTESTATION*.json`). Those
`kernel_proof` references were therefore not reproducible from the repository,
even though the units were reported as `FULLY_VERIFIED`.

## D — decision / fix

Regenerated the evidence ledger with the committed attestations via
`python scripts/ci/generate_verification_evidence.py`, which re-verifies all
three module hashes and re-binds each CI reference to the attested run:

```
attested units: 611 ledger total: 679
evidence references: 3325/3326 resolved, 1 unresolved
```

Measured effect: **602 → 1 unresolved evidence references**. Ten additional
units became genuinely attested; `progress_ledger.py` reports
`COUNTED; NOT_STARTED delta -10; new modules 27` — i.e. unverified obligations
decreased by 10, not by the number of new modules.

## C — competing interpretation

A local `lake build` on a developer machine is genuine kernel verification.
67 entries are explicitly labelled `LOCAL VERIFICATION (not CI-attested)`;
they are **not** counted as CI-backed. The regression test requires that such
entries never also cite a CI run (no ambiguous claim). They remain a separate,
honestly-labelled category and are not represented as reproducible CI evidence.

## U — uncertainty

- One entry still carries the placeholder `"__ADVERSARIAL__"` instead of a
  resolvable review reference. It is recorded as unresolved; no completion
  claim is made for it.
- Artifact-hash resolution checks identity, not legal correctness. Human legal
  review stays `LEGAL_REVIEW_PENDING` (0/3438 candidates recorded).
- The audit does not re-run Lean; it verifies that the claim is reproducible
  from committed artifacts.

No completion, legal-correctness or defect-existence claim is made.
