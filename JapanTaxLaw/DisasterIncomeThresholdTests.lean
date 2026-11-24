import JapanTaxLaw.DisasterIncomeThresholdSpec

/-!
# Boundary tests — art. 2(1) ¥5,000,000 threshold

Each example is closed by the Lean kernel (`decide`), not by a finite external
sweep. The universal agreement theorem is instantiated at the boundaries.
-/
namespace JapanTaxLaw.DisasterIncomeThreshold

example : thresholdYen = 5_000_000 := by decide

example : eligible 0 = true := by decide
example : eligible 4_999_999 = true := by decide
example : eligible 5_000_000 = true := by decide
example : eligible 5_000_001 = false := by decide

example : specEligible 4_999_999 = true := by decide
example : specEligible 5_000_000 = true := by decide
example : specEligible 5_000_001 = false := by decide

example : specEligible 0 = eligible 0 := agree_spec_impl 0
example : specEligible 4_999_999 = eligible 4_999_999 := agree_spec_impl 4_999_999
example : specEligible 5_000_000 = eligible 5_000_000 := agree_spec_impl 5_000_000
example : specEligible 5_000_001 = eligible 5_000_001 := agree_spec_impl 5_000_001

end JapanTaxLaw.DisasterIncomeThreshold
