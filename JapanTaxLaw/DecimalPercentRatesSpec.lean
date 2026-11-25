import JapanTaxLaw.DecimalPercentRates

/-!
# DecimalPercentRatesSpec — 独立仕様（既約分数・別スケール）

The implementation writes every decimal rate over 10000 (or 1000 for 1.4%).
This spec writes each rate in lowest terms with **different numerals**:
  135/10000 = 27/2000,  4085/10000 = 817/2000,
  4465/10000 = 893/2000, 624/10000 = 39/625,  14/1000 = 7/500.
Universal theorems prove agreement for ALL Nat inputs using Nat division
cancellation; these are substantive arithmetic identities, not rfl.
-/

namespace JapanTaxLaw.DecimalPercentRates

theorem agree135 (x : Nat) : x * 135 / 10_000 = x * 27 / 2_000 := by
  rw [show x * 135 = (x * 27) * 5 by omega]
  rw [show 10_000 = 2_000 * 5 by decide]
  exact Nat.mul_div_mul_right (x * 27) 2_000 (by decide)

theorem agree4085 (x : Nat) : x * 4085 / 10_000 = x * 817 / 2_000 := by
  rw [show x * 4085 = (x * 817) * 5 by omega]
  rw [show 10_000 = 2_000 * 5 by decide]
  exact Nat.mul_div_mul_right (x * 817) 2_000 (by decide)

theorem agree4465 (x : Nat) : x * 4465 / 10_000 = x * 893 / 2_000 := by
  rw [show x * 4465 = (x * 893) * 5 by omega]
  rw [show 10_000 = 2_000 * 5 by decide]
  exact Nat.mul_div_mul_right (x * 893) 2_000 (by decide)

theorem agree624 (x : Nat) : x * 624 / 10_000 = x * 39 / 625 := by
  rw [show x * 624 = (x * 39) * 16 by omega]
  rw [show 10_000 = 625 * 16 by decide]
  exact Nat.mul_div_mul_right (x * 39) 625 (by decide)

theorem agree14 (x : Nat) : x * 14 / 1_000 = x * 7 / 500 := by
  rw [show x * 14 = (x * 7) * 2 by omega]
  rw [show 1_000 = 500 * 2 by decide]
  exact Nat.mul_div_mul_right (x * 7) 500 (by decide)

def spec135 (x : Nat) := x * 27 / 2_000
def spec4085 (x : Nat) := x * 817 / 2_000
def spec4465 (x : Nat) := x * 893 / 2_000
def spec624 (x : Nat) := x * 39 / 625
def spec14 (x : Nat) := x * 7 / 500

theorem deduction135_agrees (x : Nat) : deduct135 x = spec135 x := agree135 x
theorem rate4085_agrees (x : Nat) : rate4085 x = spec4085 x := agree4085 x
theorem rate4465_agrees (x : Nat) : rate4465 x = spec4465 x := agree4465 x
theorem rate624_agrees (x : Nat) : rate624 x = spec624 x := agree624 x
theorem rate14_agrees (x : Nat) : rate14 x = spec14 x := agree14 x

end JapanTaxLaw.DecimalPercentRates
