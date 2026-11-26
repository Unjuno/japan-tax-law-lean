import JapanTaxLaw.DecimalMultipliers

/-! Independent spec: quotient/remainder decomposition of the multiplication. -/

namespace JapanTaxLaw.DecimalMultipliers

theorem aux (q r num den : Nat) (hd : 0 < den) :
    (den * q + r) * num / den = q * num + r * num / den := by
  rw [Nat.add_mul, Nat.mul_assoc, Nat.mul_add_div hd]

theorem scaledAmount_agrees (base num den : Nat) (hd : 0 < den) :
    scaledAmount base num den = base / den * num + base % den * num / den := by
  unfold scaledAmount
  have hdec := Nat.div_add_mod base den
  have haux := aux (base / den) (base % den) num den hd
  rw [hdec] at haux
  exact haux

def specScaled (base num den : Nat) := base / den * num + base % den * num / den

theorem agrees (base num den : Nat) (hd : 0 < den) :
    scaledAmount base num den = specScaled base num den :=
  scaledAmount_agrees base num den hd

end JapanTaxLaw.DecimalMultipliers
