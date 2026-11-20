import JapanTaxLaw.RemainingPeriodBand
import JapanTaxLaw.RemainingPeriodBandSpec

/-!
# RemainingPeriodBandTests — kernel-decided boundary examples
-/
namespace JapanTaxLaw.RemainingPeriodBandTests

open JapanTaxLaw.RemainingPeriodBand
open JapanTaxLaw.RemainingPeriodBandSpec

theorem agrees_with_implementation (y : Nat) :
    inBand y = true ↔ inRemainingPeriod y := by
  by_cases h1 : 10 < y <;> by_cases h2 : y <= 15 <;>
    simp [inBand, inRemainingPeriod, lowerExclusiveYears, upperInclusiveYears, h1, h2]

example : inBand 9 = false := by decide
example : inBand 10 = false := by decide
example : inBand 11 = true := by decide
example : inBand 14 = true := by decide
example : inBand 15 = true := by decide
example : inBand 16 = false := by decide
example : inRemainingPeriod 15 := by unfold inRemainingPeriod; decide
example : ¬ inRemainingPeriod 10 := by unfold inRemainingPeriod; decide

end JapanTaxLaw.RemainingPeriodBandTests
