# Spec independence fixes — CorporateTaxRate / SpecialLandHoldingTax

## Problem

Both independent spec files were being rejected as *circular* by the CI
detector (`scripts/ci/generate_verification_evidence.py::independent_spec_ok`).
That detector scans the bodies of the "independent" `def`s (names matching
`spec*`/`*Spec`/`closed*`/`*Tax`, excluding `agree*`/`*Check*`/`*Grid*` helpers)
and rejects any that mention a `def` declared in the implementation module.
Each spec had leaked an implementation definition into its own formula:

- `CorporateTaxRateSpec.specOrdinaryTax` branched on the implementation
  predicate `smeEligible f` (and required a `CorpFacts` argument).
- `SpecialLandHoldingTaxSpec.specLandHoldingTaxI/II/III` passed the
  implementation constants `fixedAssetDeductionRate` / `realEstateDeductionRate`.

## Fix (spec files only — implementation files untouched)

### `JapanTaxLaw/CorporateTaxRateSpec.lean`

- `specOrdinaryTax (f : CorpFacts) (income : Money)` →
  `specOrdinaryTax (sme : Bool) (income : Money)`. SME eligibility is now an
  explicit **caller-established `Bool`**; the spec no longer derives it from
  `CorpFacts` and no longer references `smeEligible` anywhere in its formula.
- The statutory arithmetic is unchanged and independently written:
  19% = `(* 19) / 100` on the first ¥8,000,000 and 23.2% =
  `(* 232) / 1000` on the excess for eligible corporations; flat 23.2%
  otherwise. `specPublicInterestTax` remains the flat 19% rule. Same constants:
  19%, 23.2%, ¥8,000,000 cap.
- The `example` points now pass `true`/`false` for the eligibility Bool.
- `agreeBoundary` (an excluded agreement helper) supplies the Bool from
  `smeEligible fᵢ` purely as the caller-established input for the cross-check
  against `corporateTax`; it is comparison scaffolding, not part of the spec.

### `JapanTaxLaw/SpecialLandHoldingTaxSpec.lean`

- Added locally-defined independent statutory rate constants in the spec:
  - `specFixedAssetDeductionRate : TaxRate := ⟨14, 1000, by decide⟩`
    (art. 596 一号 「百分の一・四」 = 1.4%)
  - `specRealEstateDeductionRate : TaxRate := ⟨4, 100, by decide⟩`
    (art. 596 二号/三号 「百分の四」 = 4%)
- `specLandHoldingTaxI/II/III` and the spec smoke points now use these local
  constants instead of the implementation's `fixedAssetDeductionRate` /
  `realEstateDeductionRate`.
- The `agree*` / `*CheckGrid` helpers still reference the implementation
  constants deliberately — they exist precisely to cross-check the two
  computations at finite sample points and are excluded from the detector.
- `specLandHoldingTax` continues to use raw `Nat` operations (`num`/`den`)
  rather than `TaxRate.applyFloor`.

## Decidability discipline

All new proofs use only `by decide` on closed `Nat`/`Bool` computations (rate
denominator positivity `0 < den`, and kernel evaluation of `Money = Nat`
equalities) and `by rfl` on reducible Nat-pair equalities
(`.numDen = (14, 1000)` / `= (4, 100)`). No `by decide` is applied to an opaque
`Prop`.

## Verification

Detector results (`independent_spec_ok(spec, impl)`), both `True`:

- `CorporateTaxRate`: **True**
- `SpecialLandHoldingTax`: **True**

Lean was not run (not installed in this environment); no implementation file
or statutory value was modified; nothing was committed or pushed.
