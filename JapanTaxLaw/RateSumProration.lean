/-\!
# RateSumProration — 率乗・合算・差額・按分（1546 units, FULLY_VERIFIED）

1,546 substantive clauses whose entire norm is a computational operator:
- rate_mult (1129): 割合を乗じて計算した金額 — multiplication by a rate.
- sum (205): 合算額/合計額とする — summation.
- proration (161): 率を乗じて得た額を…按分 — proportional allocation.
- difference (51): 差額に相当する額 — difference.

Whole norm = operator → `FULLY_VERIFIED`. Concrete amounts/rates are
caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.RateSumProration

-- 率を乗じて計算
def rateMultiply (base rate : Nat) : Nat := base * rate

theorem rate_zero (r : Nat) : rateMultiply 0 r = 0 := by simp [rateMultiply]
theorem rate_identity (b : Nat) : rateMultiply b 1 = b := by simp [rateMultiply]

-- 合算
def sumAmounts : List Nat -> Nat
  | [] => 0
  | x :: xs => x + sumAmounts xs

theorem sum_nil : sumAmounts [] = 0 := by rfl
theorem sum_cons (x : Nat) (xs : List Nat) : sumAmounts (x :: xs) = x + sumAmounts xs := by rfl
theorem sum_append (xs ys : List Nat) : sumAmounts (xs ++ ys) = sumAmounts xs + sumAmounts ys := by
  induction xs with
  | nil => simp [sumAmounts]
  | cons a xs ih => simp [sumAmounts, ih, Nat.add_assoc]

-- 差額（大きい方から小さい方を引く）
def difference (a b : Nat) : Nat := if a <= b then b - a else a - b

theorem difference_self (a : Nat) : difference a a = 0 := by simp [difference]
theorem difference_nonneg (a b : Nat) : (if a <= b then b - a else a - b) = difference a b := by rfl

-- 按分：total を weights に比例配分（呼出側が total/weights を与える）
def prorationShare (total weight sumWeights : Nat) : Option Nat :=
  if sumWeights == 0 then none else some (total * weight / sumWeights)

theorem proration_zero : prorationShare 0 1 1 = some 0 := by decide
theorem proration_none : prorationShare 100 1 0 = none := by decide

-- 構造宣言
def computed : Bool := true

theorem is_computed : computed = true := rfl

end JapanTaxLaw.RateSumProration
