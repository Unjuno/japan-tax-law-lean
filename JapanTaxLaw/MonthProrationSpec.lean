import JapanTaxLaw.MonthProration

/-!
# MonthProrationSpec — 独立仕様（12 で割ってから約分母で割る）

Every pinned denominator is a multiple of 12. The independent spec always
divides by 12 first, then by the cofactor (1, 2, 3, 4, 5, 15), using Nat's
successive-division identity instead of a single division. Universal
agreement theorems are proved for ALL `annual` and `months`.
-/

namespace JapanTaxLaw.MonthProration

theorem prorate_by_cofactor (annual months k : Nat) :
    prorate annual months (12 * k) = annual * months / 12 / k := by
  unfold prorate
  rw [Nat.div_div_eq_div_mul]

def spec12 (annual months : Nat) := annual * months / 12
def spec24 (annual months : Nat) := annual * months / 12 / 2
def spec36 (annual months : Nat) := annual * months / 12 / 3
def spec48 (annual months : Nat) := annual * months / 12 / 4
def spec60 (annual months : Nat) := annual * months / 12 / 5
def spec180 (annual months : Nat) := annual * months / 12 / 15

theorem agree12 (a m : Nat) : prorate12 a m = spec12 a m := by
  unfold prorate12 spec12 prorate
  rfl
theorem agree24 (a m : Nat) : prorate24 a m = spec24 a m := by
  unfold prorate24 spec24 prorate
  rw [show 24 = 12 * 2 by decide, Nat.div_div_eq_div_mul]
theorem agree36 (a m : Nat) : prorate36 a m = spec36 a m := by
  unfold prorate36 spec36 prorate
  rw [show 36 = 12 * 3 by decide, Nat.div_div_eq_div_mul]
theorem agree48 (a m : Nat) : prorate48 a m = spec48 a m := by
  unfold prorate48 spec48 prorate
  rw [show 48 = 12 * 4 by decide, Nat.div_div_eq_div_mul]
theorem agree60 (a m : Nat) : prorate60 a m = spec60 a m := by
  unfold prorate60 spec60 prorate
  rw [show 60 = 12 * 5 by decide, Nat.div_div_eq_div_mul]
theorem agree180 (a m : Nat) : prorate180 a m = spec180 a m := by
  unfold prorate180 spec180 prorate
  rw [show 180 = 12 * 15 by decide, Nat.div_div_eq_div_mul]

theorem prorate_monotone (den : Nat) :
    ∀ a b m, a ≤ b → prorate a m den ≤ prorate b m den := by
  intro a b m h
  unfold prorate
  exact Nat.div_le_div_right (Nat.mul_le_mul_right m h)

end JapanTaxLaw.MonthProration
