import JapanTaxLaw.ComputationalNormOperators
import JapanTaxLaw.ComputationalNormOperatorsSpec

/-!
# ComputationalNormOperatorsTests — 算定・選択・端数
-/
namespace JapanTaxLaw.ComputationalNormOperatorsTests

open JapanTaxLaw.ComputationalNormOperators

theorem calc_spec (b u v : Nat) :
    tableCalc b u v = JapanTaxLaw.ComputationalNormOperatorsSpec.calcSpec b u v := by rfl

theorem min_spec (a b : Nat) :
    selectMin a b = JapanTaxLaw.ComputationalNormOperatorsSpec.minSpec a b := by rfl

theorem max_spec (a b : Nat) :
    selectMax a b = JapanTaxLaw.ComputationalNormOperatorsSpec.maxSpec a b := by rfl

theorem round_down_spec (x u : Nat) :
    roundDown x u = JapanTaxLaw.ComputationalNormOperatorsSpec.roundDownSpec x u := by rfl

example (b u : Nat) : tableCalc b u 0 = 0 := calc_zero_value b u
example (b u : Nat) (h : 0 < u) : tableCalc b u (u * 3) = b * 3 := calc_scales_with_unit b u h
example (a b : Nat) (h : a <= b) : selectMin a b = a := min_left a b h
example (a b : Nat) (h : b < a) : selectMin a b = b := min_right a b h
example (a b : Nat) (h : a <= b) : selectMax a b = b := max_left a b h
example (a b : Nat) (h : b < a) : selectMax a b = a := max_right a b h
example (a b : Nat) : selectMin a b <= a ∧ selectMin a b <= b := min_le_both a b
example (x u : Nat) (h : 0 < u) : roundDown x u % u = 0 := roundDown_divisible x u h
example (x u : Nat) : roundDown x u <= x := roundDown_le x u

end JapanTaxLaw.ComputationalNormOperatorsTests
