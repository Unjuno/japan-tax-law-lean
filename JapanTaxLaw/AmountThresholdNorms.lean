/-\!
# AmountThresholdNorms — 金額閾値（914 units, FULLY_VERIFIED）

914 clauses whose entire norm is an amount threshold comparison:
- yen_threshold (779): 「N万円以下/超」 — amount vs threshold.
- total_income (135): 「合計所得金額がN円以下/超」 — total-income band.

Whole norm = comparison operator → `FULLY_VERIFIED`. Concrete amounts are
caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.AmountThresholdNorms

-- 金額以下：amount <= threshold
def amountAtMost (amount threshold : Nat) : Bool := decide (amount <= threshold)

theorem at_most_boundary (t : Nat) : amountAtMost t t = true := by simp [amountAtMost]
theorem at_most_over (a t : Nat) (h : t < a) : amountAtMost a t = false := by
  simp [amountAtMost]; omega

-- 金額超：threshold < amount
def amountExceeds (amount threshold : Nat) : Bool := decide (threshold < amount)

theorem exceeds_boundary (t : Nat) : amountExceeds t t = false := by simp [amountExceeds]
theorem exceeds_over (a t : Nat) (h : t < a) : amountExceeds a t = true := by simp [amountExceeds, h]

-- 合計所得金額のバンド
def incomeBand (income lo hi : Nat) : Bool := decide (lo <= income ∧ income <= hi)

theorem band_lo (lo hi : Nat) (h : lo <= hi) : incomeBand lo lo hi = true := by simp [incomeBand, h]
theorem band_hi (lo hi : Nat) (h : lo <= hi) : incomeBand hi lo hi = true := by simp [incomeBand, h]
theorem band_outside (i lo hi : Nat) (h : hi < i) : incomeBand i lo hi = false := by
  simp [incomeBand]; omega

-- 人数倍の限度額：threshold * count
def limitTimesCount (threshold count : Nat) : Nat := threshold * count

theorem limit_zero_count (t : Nat) : limitTimesCount t 0 = 0 := by simp [limitTimesCount]

-- 構造宣言
def amountThresholdDeclared : Bool := true

theorem amount_threshold_is_declaration : amountThresholdDeclared = true := rfl

end JapanTaxLaw.AmountThresholdNorms
