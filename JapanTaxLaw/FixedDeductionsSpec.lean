import JapanTaxLaw.FixedDeductions

/-! Independent spec: subtract the smaller of base and the fixed amount. -/

namespace JapanTaxLaw.FixedDeductions

def specFixedDeduction (base fixed : Nat) : Nat := base - min base fixed

theorem fixedDeduction_agrees (base fixed : Nat) :
    fixedDeduction base fixed = specFixedDeduction base fixed := by
  unfold fixedDeduction specFixedDeduction
  by_cases h : fixed ≤ base
  · have hm : min base fixed = fixed := Nat.min_eq_right h
    simp [h, hm]
  · have hb : base ≤ fixed := by omega
    have hm : min base fixed = base := Nat.min_eq_left hb
    simp [h, hm]

end JapanTaxLaw.FixedDeductions
