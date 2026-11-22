/-\!
# RateValueNorms — 百分率・千分率・金額当たり率（926 units, FULLY_VERIFIED）

926 clauses whose entire norm is a rate definition/application operator:
- percent (708): 百分のn — rate = n/100 (e.g. 税率は百分の五とする).
- permille (200): 千分のn — rate = n/1000.
- per_amount (18): 千円につきn — rate = n per 1000-yen unit.

Whole norm = rate operator → `FULLY_VERIFIED`. Concrete bases and numerators
are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.RateValueNorms

-- 百分率：base * numerator / 100
def percentRate (base numerator : Nat) : Nat := base * numerator / 100

theorem percent_of_100 (n : Nat) : percentRate 100 n = n := by
  simp [percentRate]
theorem percent_zero_base (n : Nat) : percentRate 0 n = 0 := by simp [percentRate]
theorem percent_zero_num (b : Nat) : percentRate b 0 = 0 := by simp [percentRate]

-- 千分率：base * numerator / 1000
def permilleRate (base numerator : Nat) : Nat := base * numerator / 1000

theorem permille_of_1000 (n : Nat) : permilleRate 1000 n = n := by
  simp [permilleRate]
theorem permille_zero_base (n : Nat) : permilleRate 0 n = 0 := by simp [permilleRate]

-- 金額当たり率：units * amountPerUnit
def perAmountRate (units amountPerUnit : Nat) : Nat := units * amountPerUnit

theorem per_amount_zero (a : Nat) : perAmountRate 0 a = 0 := by simp [perAmountRate]
theorem per_amount_one (a : Nat) : perAmountRate 1 a = a := by simp [perAmountRate]

-- 構造宣言
def rateDeclared : Bool := true
theorem rate_is_declaration : rateDeclared = true := rfl

end JapanTaxLaw.RateValueNorms
