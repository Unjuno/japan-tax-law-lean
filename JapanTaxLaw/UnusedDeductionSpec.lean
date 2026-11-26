import JapanTaxLaw.UnusedDeduction

/-! Independent spec: the undeducted remainder via Nat.min, not a comparison. -/

namespace JapanTaxLaw.UnusedDeduction

def specUndeducted (deduction base : Nat) : Nat := deduction - min deduction base

theorem undeducted_agrees (deduction base : Nat) :
    undeducted deduction base = specUndeducted deduction base := by
  unfold undeducted specUndeducted
  by_cases h : base ≤ deduction
  · have hm : min deduction base = base := Nat.min_eq_right h
    simp [h, hm]
  · have hm : min deduction base = deduction := Nat.min_eq_left (by omega)
    simp [h, hm]

end JapanTaxLaw.UnusedDeduction
