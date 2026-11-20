# Adversarial observation — uniformity of FULLY_VERIFIED evidence references

Date: 2026-11-20
Role: independent ADVERSARIAL review (separate from the implementers)

## Observation (measured)

`data/verification_evidence.json` at `origin/main` contains 9 unit records.
Across 8 of them, the following evidence strings are byte-identical:

- `boundary_proof`: "attested Tests module contains kernel-decided boundary
  examples (0/1/11/12/13)"
- `proof_scope`: "statutory boundary constant 十二 present in 原文 and in both
  spec and kernel-checked implementation"
- `decomposition_audit`: "normative_core.decompose_article: exact
  reconstruction, unique ids, coverage=COVERED"

The 9th record (GiftTax art. 21-5) is genuinely unit-specific.

## H / T / D / C / U

- **H (falsifiable)**: if evidence were separately established per unit, the
  boundary and scope references would name that unit's own constants and
  boundary values; 8 identical strings would be unlikely.
- **T (reproduction)**: compare the `boundary_proof` and `proof_scope` values
  across the 9 records in `data/verification_evidence.json`.
- **D (decision)**: NOT a confirmed defect. The strings are reproducible
  references to a common attestation process, not proof claims by themselves.
  Recorded as a review obligation, not a finding of legal error.
- **C (competing interpretation)**: a shared canonical attestation template is
  legitimate if each unit's source_location, module hashes and spec scope map
  entry independently bind the unit to its own clause. The spec-scope mapping
  introduced at `c48b421` supplies exactly that binding for 7 of the 9.
- **U (uncertainty)**: the identical strings do not show whether each unit's
  boundary constants were checked individually. Independent re-derivation of
  per-unit boundary values remains outstanding.

## Non-claims

No law is said to be defective. No verification count is changed by this
document. Human legal review remains pending and out of repo.
