import JapanTaxLaw.FractionRates110

/-! Independent spec: 100/110 reduced to 10/11, a different denominator. -/

namespace JapanTaxLaw.FractionRates110

theorem agree100Over110 (a : Nat) : a * 100 / 110 = a * 10 / 11 := by
  rw [show a * 100 = (a * 10) * 10 by omega]
  rw [show 110 = 11 * 10 by decide]
  exact Nat.mul_div_mul_right (a * 10) 11 (by decide)

def spec100Over110 (a : Nat) := a * 10 / 11

theorem rate100Over110_agrees (a : Nat) :
    rate100Over110 a = spec100Over110 a := agree100Over110 a

end JapanTaxLaw.FractionRates110
