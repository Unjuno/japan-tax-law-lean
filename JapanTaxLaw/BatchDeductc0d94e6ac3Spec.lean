import JapanTaxLaw.BatchDeductc0d94e6ac3

/-! Independent spec: explicit branch on the comparison instead of `min`. -/
namespace JapanTaxLaw.BatchDeductc0d94e6ac3

def specDeduction (eligible : Bool) (base : Nat) : Nat :=
  if eligible then (if base ≤ deduction then 0 else base - deduction) else base

theorem agree_spec_impl (eligible : Bool) (base : Nat) :
    specDeduction eligible base = afterDeduction eligible base := by
  cases eligible
  · rfl
  · unfold specDeduction afterDeduction
    by_cases h : base ≤ deduction
    · have hm : Nat.min base deduction = base := Nat.min_eq_left h
      rw [if_pos h, hm, Nat.sub_self]
    · have hlt : deduction < base := Nat.lt_of_not_ge h
      have hm : Nat.min base deduction = deduction := Nat.min_eq_right (Nat.le_of_lt hlt)
      rw [if_neg h, hm]

end JapanTaxLaw.BatchDeductc0d94e6ac3
