import JapanTaxLaw.GiftBasicDeductionUnit
import JapanTaxLaw.GiftBasicDeductionUnitSpec

/-!
# Regression tests for the art. 21-5 ¥600,000 basic-deduction norm unit

The universal agreement theorem lives in the Spec module; these are boundary
and regression examples that exercise the implementation directly.
-/

namespace JapanTaxLaw.GiftBasicDeductionUnit

example : basicDeduction = 600_000 := by decide

example : taxableBaseAfterDeduction 0 = 0 := by decide
example : taxableBaseAfterDeduction 599_999 = 0 := by decide
example : taxableBaseAfterDeduction 600_000 = 0 := by decide
example : taxableBaseAfterDeduction 600_001 = 1 := by decide
example : taxableBaseAfterDeduction 1_200_000 = 600_000 := by decide

/-- The implementation never produces a negative or increased base. -/
example (b : Money) : taxableBaseAfterDeduction b ≤ b := by
  unfold taxableBaseAfterDeduction
  split
  · simp
  · exact Nat.sub_le b basicDeduction

end JapanTaxLaw.GiftBasicDeductionUnit
