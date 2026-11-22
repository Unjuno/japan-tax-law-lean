import JapanTaxLaw.ClampOperators
import JapanTaxLaw.ClampOperatorsSpec

/-!
# ClampOperatorsTests — クランプ境界演算子
-/
namespace JapanTaxLaw.ClampOperatorsTests

open JapanTaxLaw.ClampOperators

theorem nonneg_spec (x : Int) :
    clampNonNeg x = JapanTaxLaw.ClampOperatorsSpec.clampNonNegSpec x := by rfl
theorem floor_spec (x f : Int) :
    clampFloor x f = JapanTaxLaw.ClampOperatorsSpec.clampFloorSpec x f := by
  unfold clampFloor JapanTaxLaw.ClampOperatorsSpec.clampFloorSpec
  split <;> omega
theorem cap_spec (x c : Int) :
    clampCap x c = JapanTaxLaw.ClampOperatorsSpec.clampCapSpec x c := by
  unfold clampCap JapanTaxLaw.ClampOperatorsSpec.clampCapSpec
  split <;> omega

example (x : Int) (h : x < 0) : clampNonNeg x = 0 := clamp_neg x h
example (x : Int) (h : 0 <= x) : clampNonNeg x = x.toNat := clamp_nonneg x h
example : clampNonNeg 0 = 0 := clamp_zero
example (x f : Int) (h : x < f) : clampFloor x f = f := floor_below x f h
example (x f : Int) (h : f <= x) : clampFloor x f = x := floor_above x f h
example (x f : Int) : f <= clampFloor x f := floor_ge x f
example (x c : Int) (h : c < x) : clampCap x c = c := cap_above x c h
example (x c : Int) (h : x <= c) : clampCap x c = x := cap_below x c h
example (x c : Int) : clampCap x c <= c := cap_le x c
example : clampDeclared = true := clamp_is_declaration

end JapanTaxLaw.ClampOperatorsTests
