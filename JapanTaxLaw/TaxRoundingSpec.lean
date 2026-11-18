import JapanTaxLaw.TaxRounding

/-!
# TaxRounding specification — independent restatement of 国税通則法 art. 118/119 端数処理

Source (pinned):
  Law id: 337AC0000000066
  Revision: 337AC0000000066_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01

This module restates the two truncation rules independently of the
implementation in TaxRounding.lean. The implementation computes the floor as
`x / unit * unit`; the specification instead subtracts the sub-unit remainder
`x % unit`. These are extensionally equal on `Money` (= `Nat`), but the two
formulas are written differently so that agreement is a genuine cross-check
rather than a syntactic restatement.

Scope: art. 118(1) (課税標準・千円未満切り捨て) and art. 119(1)
(確定金額・百円未満切り捨て) only. Sub-articles, excluded taxes and the
per-product intra-sum choices are NOT modeled here, and agreement on the
finite grid below is NOT a claim of exhaustive coverage.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

namespace TaxRoundingSpec

/-- Independent spec for art. 118(1): discard the remainder below 1,000 yen.
    Written as subtraction of `x % 1000`, not as `x / 1000 * 1000`. -/
def thousandYenFloorSpec (x : Money) : Money := x - x % 1000

/-- Independent spec for art. 119(1): discard the remainder below 100 yen.
    Written as subtraction of `x % 100`, not as `x / 100 * 100`. -/
def hundredYenFloorSpec (x : Money) : Money := x - x % 100

/-- Pointwise correspondence between the implementation and the independent
    specification at one `Money` value (both truncation modes at once). -/
def agreePoint (x : Money) : Bool :=
  decide (thousandYenFloor x = thousandYenFloorSpec x) &&
  decide (hundredYenFloor x = hundredYenFloorSpec x)

/-- Finite grid correspondence check. Includes zero, the sub-unit
    remainders, both sides of the 1,000/100 boundaries and larger amounts.
    This is a sampled smoke grid, not a universal claim. -/
def agreeTaxRounding : Bool :=
  agreePoint 0 && agreePoint 1 && agreePoint 99 && agreePoint 100 &&
  agreePoint 101 && agreePoint 999 && agreePoint 1000 && agreePoint 1001 &&
  agreePoint 1999 && agreePoint 2000 && agreePoint 12345 &&
  agreePoint 99999 && agreePoint 100000 && agreePoint 1234567

/-- The sampled agreement evaluates to true under kernel reduction. -/
example : agreeTaxRounding = true := by decide

end TaxRoundingSpec

end JapanTaxLaw
