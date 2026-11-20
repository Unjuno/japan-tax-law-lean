import JapanTaxLaw.DeductionCapsAndMonthFloors
import JapanTaxLaw.DeductionCapsAndMonthFloorsSpec

/-!
# DeductionCapsAndMonthFloorsTests — 境界・仕様一致・相互作用
-/
namespace JapanTaxLaw.DeductionCapsAndMonthFloorsTests

open JapanTaxLaw.DeductionCapsAndMonthFloors

theorem month_spec (m : Nat) :
    effectiveMonths m = JapanTaxLaw.DeductionCapsAndMonthFloorsSpec.monthFloorSpec m := by
  by_cases h : m = 0 <;>
  simp [h, effectiveMonths, JapanTaxLaw.DeductionCapsAndMonthFloorsSpec.monthFloorSpec]

theorem cap_spec (deduction liability : Nat) :
    cappedDeduction deduction liability =
      JapanTaxLaw.DeductionCapsAndMonthFloorsSpec.deductionCapSpec deduction liability := by
  by_cases h : liability <= deduction <;>
  simp [h, cappedDeduction, JapanTaxLaw.DeductionCapsAndMonthFloorsSpec.deductionCapSpec]

example : effectiveMonths 0 = 1 := by decide
example : effectiveMonths 1 = 1 := by decide
example : effectiveMonths 12 = 12 := by decide
example : cappedDeduction 500 300 = 300 := by decide
example : cappedDeduction 200 300 = 200 := by decide
example : cappedDeduction 0 0 = 0 := by decide

example (m : Nat) : 1 <= effectiveMonths m := months_at_least_one m
example (a b : Nat) (h : a <= b) : effectiveMonths a <= effectiveMonths b := months_mono a b h
example (m : Nat) : effectiveMonths (effectiveMonths m) = effectiveMonths m := months_idempotent m
example (d l : Nat) : cappedDeduction d l <= l := capped_le_liability d l
example (d l : Nat) : cappedDeduction d l <= d := capped_le_deduction d l
example (a b l : Nat) (h : a <= b) : cappedDeduction a l <= cappedDeduction b l := capped_mono_deduction a b l h
example (d l : Nat) (hl : 1 <= l) :
    effectiveMonths (cappedDeduction d l) = cappedDeduction (effectiveMonths d) l :=
  cap_and_floor_commute d l hl

end JapanTaxLaw.DeductionCapsAndMonthFloorsTests
