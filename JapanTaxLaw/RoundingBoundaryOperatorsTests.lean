import JapanTaxLaw.RoundingBoundaryOperators
import JapanTaxLaw.RoundingBoundaryOperatorsSpec

/-!
# RoundingBoundaryOperatorsTests — 端数処理演算子
-/
namespace JapanTaxLaw.RoundingBoundaryOperatorsTests

open JapanTaxLaw.RoundingBoundaryOperators

theorem down_spec (x u : Nat) :
    roundDown x u = JapanTaxLaw.RoundingBoundaryOperatorsSpec.downSpec x u := by rfl
theorem half_spec (x u : Nat) :
    roundHalf x u = JapanTaxLaw.RoundingBoundaryOperatorsSpec.halfSpec x u := by rfl
theorem up_spec (x u : Nat) :
    roundUp x u = JapanTaxLaw.RoundingBoundaryOperatorsSpec.upSpec x u := by rfl

example (u : Nat) : roundDown 0 u = 0 := down_zero u
example (x : Nat) : roundDown x 1 = x := down_unit_one x
example (x : Nat) : roundUp x 1 = x := up_unit_one x
example (x : Nat) : roundHalf x 1 = x := half_unit_one x
example (x u : Nat) (h : x < u) : roundDown x u = 0 := down_small x u h
example (x : Nat) : roundDown x 0 = 0 := down_zero_unit x
example (u : Nat) (h : 0 < u) : roundUp 0 u = 0 := up_zero u h
example : roundingDeclared = true := rounding_is_declaration

end JapanTaxLaw.RoundingBoundaryOperatorsTests
