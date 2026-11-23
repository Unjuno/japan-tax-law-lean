import JapanTaxLaw.DivisionOperatorNorms
import JapanTaxLaw.DivisionOperatorNormsSpec

/-!
# DivisionOperatorNormsTests — 除算演算子
-/
namespace JapanTaxLaw.DivisionOperatorNormsTests
open JapanTaxLaw.DivisionOperatorNorms

theorem div_spec (n d : Nat) : dividedValue n d = JapanTaxLaw.DivisionOperatorNormsSpec.dividedValueSpec n d := by rfl
example (n : Nat) (h : n > 0) : dividedValue n n = 1 := div_self n h
example (n : Nat) : dividedValue n 0 = 0 := div_zero_divisor n
example (d : Nat) : dividedValue 0 d = 0 := div_zero_numerator d
example (n : Nat) : dividedValue n 1 = n := div_by_one n
example (n d : Nat) : (n / d) * d <= n := mul_div_le n d
example : divisionOperatorDeclared = true := division_operator_is_declaration

end JapanTaxLaw.DivisionOperatorNormsTests
