import JapanTaxLaw.PermilleAmounts

/-! Independent spec: each permille rate in lowest terms with different numerals. -/

namespace JapanTaxLaw.PermilleAmounts

theorem agree85 (a : Nat) : a * 85 / 10_000 = a * 17 / 2_000 := by
  rw [show a * 85 = (a * 17) * 5 by omega, show 10_000 = 2_000 * 5 by decide]
  exact Nat.mul_div_mul_right (a * 17) 2_000 (by decide)

theorem agree136 (a : Nat) : a * 136 / 10_000 = a * 17 / 1_250 := by
  rw [show a * 136 = (a * 17) * 8 by omega, show 10_000 = 1_250 * 8 by decide]
  exact Nat.mul_div_mul_right (a * 17) 1_250 (by decide)

theorem agree122 (a : Nat) : a * 122 / 10_000 = a * 61 / 5_000 := by
  rw [show a * 122 = (a * 61) * 2 by omega, show 10_000 = 5_000 * 2 by decide]
  exact Nat.mul_div_mul_right (a * 61) 5_000 (by decide)

theorem agree42 (a : Nat) : a * 42 / 10_000 = a * 21 / 5_000 := by
  rw [show a * 42 = (a * 21) * 2 by omega, show 10_000 = 5_000 * 2 by decide]
  exact Nat.mul_div_mul_right (a * 21) 5_000 (by decide)

theorem agree252 (a : Nat) : a * 252 / 100_000 = a * 63 / 25_000 := by
  rw [show a * 252 = (a * 63) * 4 by omega, show 100_000 = 25_000 * 4 by decide]
  exact Nat.mul_div_mul_right (a * 63) 25_000 (by decide)

theorem agree104 (a : Nat) : a * 104 / 10_000 = a * 13 / 1_250 := by
  rw [show a * 104 = (a * 13) * 8 by omega, show 10_000 = 1_250 * 8 by decide]
  exact Nat.mul_div_mul_right (a * 13) 1_250 (by decide)

def spec85 (a : Nat) := a * 17 / 2_000
def spec136 (a : Nat) := a * 17 / 1_250
def spec122 (a : Nat) := a * 61 / 5_000
def spec42 (a : Nat) := a * 21 / 5_000
def spec252 (a : Nat) := a * 63 / 25_000
def spec104 (a : Nat) := a * 13 / 1_250

theorem agreePer85 (a : Nat) : per85 a = spec85 a := agree85 a
theorem agreePer136 (a : Nat) : per136 a = spec136 a := agree136 a
theorem agreePer122 (a : Nat) : per122 a = spec122 a := agree122 a
theorem agreePer42 (a : Nat) : per42 a = spec42 a := agree42 a
theorem agreePer252 (a : Nat) : per252 a = spec252 a := agree252 a
theorem agreePer104 (a : Nat) : per104 a = spec104 a := agree104 a

end JapanTaxLaw.PermilleAmounts
