import JapanTaxLaw.FractionAmounts

/-!
# FractionAmountsSpec — 独立仕様（商×分子 + 端数×分子/分母）

The implementation multiplies first and divides once. This independent spec
uses the division algorithm decomposition: split the amount into quotient and
remainder, multiply each by the numerator, then divide only the remainder
term. The universal agreement theorem is proved for ALL `amount`, `num` and
positive `den`, from `Nat.div_add_mod` and `Nat.mul_add_div`.
-/

namespace JapanTaxLaw.FractionAmounts

theorem aux (q r num den : Nat) (hd : 0 < den) :
    (den * q + r) * num / den = q * num + r * num / den := by
  rw [Nat.add_mul, Nat.mul_assoc, Nat.mul_add_div hd]

theorem fracAmount_eq_decomposition (amount num den : Nat) (hd : 0 < den) :
    fracAmount amount num den =
      amount / den * num + amount % den * num / den := by
  unfold fracAmount
  have hdec := Nat.div_add_mod amount den
  have haux := aux (amount / den) (amount % den) num den hd
  rw [hdec] at haux
  exact haux

def specFracAmount (amount num den : Nat) : Nat :=
  amount / den * num + amount % den * num / den

theorem fracAmount_agrees (amount num den : Nat) (hd : 0 < den) :
    fracAmount amount num den = specFracAmount amount num den :=
  fracAmount_eq_decomposition amount num den hd

end JapanTaxLaw.FractionAmounts
