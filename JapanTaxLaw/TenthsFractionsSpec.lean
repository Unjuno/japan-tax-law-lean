import JapanTaxLaw.TenthsFractions

/-!
# TenthsFractionsSpec — 独立仕様（既約分数・商余分解）

Reduced fractions for 2/10=1/5 and 5/10=1/2 use different numerals.
For 7/10 and 9/10 (irreducible), the independent spec uses the division
algorithm decomposition `a = 10*q + r`, computing `7q + 7r/10` (resp. 9q +
9r/10) instead of multiplying before dividing. Universal theorems are proved
for ALL Nat inputs. The former 100/10 case was moved to `FractionRates110`
after adversarial review found the source reads 百十分の百 (100/110).
-/

namespace JapanTaxLaw.TenthsFractions

theorem agree1 (a : Nat) : tenths1 a = a / 10 := rfl

theorem agree2 (a : Nat) : a * 2 / 10 = a / 5 := by
  rw [show 10 = 5 * 2 by decide]
  exact Nat.mul_div_mul_right a 5 (by decide)

theorem agree5 (a : Nat) : a * 5 / 10 = a / 2 := by
  rw [show 10 = 2 * 5 by decide]
  exact Nat.mul_div_mul_right a 2 (by decide)

def specTenths2 (a : Nat) := a / 5
def specTenths5 (a : Nat) := a / 2
def specTenths7 (a : Nat) := a / 10 * 7 + a % 10 * 7 / 10
def specTenths9 (a : Nat) := a / 10 * 9 + a % 10 * 9 / 10
theorem tenths2_agrees (a : Nat) : tenths2 a = specTenths2 a := agree2 a
theorem tenths5_agrees (a : Nat) : tenths5 a = specTenths5 a := agree5 a
theorem tenths7_agrees (a : Nat) : tenths7 a = specTenths7 a := by
  unfold tenths7 specTenths7
  have hdec := Nat.div_add_mod a 10
  have hle : a % 10 ≤ a := Nat.mod_le a 10
  have hmod : a % 10 < 10 := Nat.mod_lt _ (by decide)
  omega

theorem tenths9_agrees (a : Nat) : tenths9 a = specTenths9 a := by
  unfold tenths9 specTenths9
  have hdec := Nat.div_add_mod a 10
  have hle : a % 10 ≤ a := Nat.mod_le a 10
  have hmod : a % 10 < 10 := Nat.mod_lt _ (by decide)
  omega

end JapanTaxLaw.TenthsFractions
