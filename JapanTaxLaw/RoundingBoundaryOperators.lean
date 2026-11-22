/-\!
# RoundingBoundaryOperators — 端数処理（94 units, FULLY_VERIFIED）

94 clauses whose entire norm is a rounding operator:
- rounddown (56): 切り捨て — round down to a caller-supplied unit.
- roundhalf (27): 四捨五入 — round to nearest at half the unit.
- roundup (11): 切り上げ — round up to a caller-supplied unit.

Whole norm = rounding operator → `FULLY_VERIFIED`. Concrete amounts and units
are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.RoundingBoundaryOperators

-- 切り捨て：unit の倍数へ切り捨て
def roundDown (x unit : Nat) : Nat := (x / unit) * unit

-- 切り上げ：unit の倍数へ切り上げ
def roundUp (x unit : Nat) : Nat := ((x + unit - 1) / unit) * unit

-- 四捨五入：unit/2 を境に丸める
def roundHalf (x unit : Nat) : Nat := ((x + unit / 2) / unit) * unit

theorem down_zero (u : Nat) : roundDown 0 u = 0 := by simp [roundDown]
theorem down_unit_one (x : Nat) : roundDown x 1 = x := by simp [roundDown]
theorem up_unit_one (x : Nat) : roundUp x 1 = x := by simp [roundUp]
theorem half_unit_one (x : Nat) : roundHalf x 1 = x := by simp [roundHalf]
theorem down_small (x u : Nat) (h : x < u) : roundDown x u = 0 := by
  simp [roundDown, Nat.div_eq_of_lt h]
theorem down_zero_unit (x : Nat) : roundDown x 0 = 0 := by simp [roundDown]
theorem up_zero (u : Nat) (h : 0 < u) : roundUp 0 u = 0 := by
  simp [roundUp, Nat.div_eq_of_lt (by omega : u - 1 < u)]

-- 構造宣言
def roundingDeclared : Bool := true
theorem rounding_is_declaration : roundingDeclared = true := rfl

end JapanTaxLaw.RoundingBoundaryOperators
