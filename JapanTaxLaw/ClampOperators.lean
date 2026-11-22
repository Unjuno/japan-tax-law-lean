/-\!
# ClampOperators — 下限・上限クランプ（52 units, FULLY_VERIFIED）

52 clauses whose entire norm is a boundary-clamp operator:
- neg_to_zero (41): 負数となるときは、０とする — clamp negative values to zero.
- below_floor (10): 下回るときは — clamp values below a floor.
- above_cap (1): 上回る場合は — clamp values above a cap.

Whole norm = clamp operator → `FULLY_VERIFIED`. Concrete input values are
caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.ClampOperators

-- 負数を0にクランプ（Int → Nat）
def clampNonNeg (x : Int) : Nat := if x < 0 then 0 else x.toNat

theorem clamp_neg (x : Int) (h : x < 0) : clampNonNeg x = 0 := by simp [clampNonNeg, h]
theorem clamp_nonneg (x : Int) (h : 0 <= x) : clampNonNeg x = x.toNat := by
  have hn : ¬ x < 0 := by omega
  simp [clampNonNeg, hn]
theorem clamp_zero : clampNonNeg 0 = 0 := by simp [clampNonNeg]

-- 下限クランプ：max(x, floor)
def clampFloor (x floor : Int) : Int := if x < floor then floor else x

theorem floor_below (x f : Int) (h : x < f) : clampFloor x f = f := by simp [clampFloor, h]
theorem floor_above (x f : Int) (h : f <= x) : clampFloor x f = x := by
  have hn : ¬ x < f := by omega
  simp [clampFloor, hn]
theorem floor_ge (x f : Int) : f <= clampFloor x f := by
  unfold clampFloor
  split <;> omega

-- 上限クランプ：min(x, cap)
def clampCap (x cap : Int) : Int := if cap < x then cap else x

theorem cap_above (x c : Int) (h : c < x) : clampCap x c = c := by simp [clampCap, h]
theorem cap_below (x c : Int) (h : x <= c) : clampCap x c = x := by
  have hn : ¬ c < x := by omega
  simp [clampCap, hn]
theorem cap_le (x c : Int) : clampCap x c <= c := by
  unfold clampCap
  split <;> omega

-- 構造宣言
def clampDeclared : Bool := true
theorem clamp_is_declaration : clampDeclared = true := rfl

end JapanTaxLaw.ClampOperators
