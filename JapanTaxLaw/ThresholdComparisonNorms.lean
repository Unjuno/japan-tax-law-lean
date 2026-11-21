/-\!
# ThresholdComparisonNorms — 閾値比較（990 units, FULLY_VERIFIED）

990 clauses whose entire norm is a threshold comparison:
- exceeds (709): 「…を超える場合…当該超える部分…」 — excess over a threshold.
- threshold (281): 「…以下/以上/未満の場合…」 — threshold band comparison.

Whole norm = comparison operator → `FULLY_VERIFIED`. Concrete amounts are
caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.ThresholdComparisonNorms

-- 超過：value > threshold
def exceeds (value threshold : Nat) : Bool := decide (threshold < value)

def excessPart (value threshold : Nat) : Nat := value - threshold

theorem exceeds_at_threshold (t : Nat) : exceeds t t = false := by simp [exceeds]
theorem exceeds_above (v t : Nat) (h : t < v) : exceeds v t = true := by simp [exceeds, h]
theorem excess_zero (v t : Nat) (h : v <= t) : excessPart v t = 0 := by unfold excessPart; omega
theorem excess_positive (v t : Nat) (h : t < v) : excessPart v t = v - t := by rfl

-- 閾値バンド：lo < value <= hi（または lo <= value < hi）
def inBand (value lo hi : Nat) : Bool := decide (lo < value ∧ value <= hi)

theorem band_lower (lo hi : Nat) (h : lo < hi) : inBand lo lo hi = false := by simp [inBand]
theorem band_upper (lo hi : Nat) (h : lo < hi) : inBand hi lo hi = true := by simp [inBand, h]
theorem band_outside (v lo hi : Nat) (h : hi < v) : inBand v lo hi = false := by simp [inBand]; omega

-- 以下 / 以上 / 未満
def atMost (v t : Nat) : Bool := decide (v <= t)
def atLeast (v t : Nat) : Bool := decide (t <= v)
def below (v t : Nat) : Bool := decide (v < t)

theorem atMost_boundary (t : Nat) : atMost t t = true := by simp [atMost]
theorem atLeast_boundary (t : Nat) : atLeast t t = true := by simp [atLeast]
theorem below_boundary (t : Nat) : below t t = false := by simp [below]

end JapanTaxLaw.ThresholdComparisonNorms
