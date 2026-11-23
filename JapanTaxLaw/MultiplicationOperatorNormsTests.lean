import JapanTaxLaw.MultiplicationOperatorNorms
import JapanTaxLaw.MultiplicationOperatorNormsSpec

/-!
# MultiplicationOperatorNormsTests — 乗算演算子
-/
namespace JapanTaxLaw.MultiplicationOperatorNormsTests
open JapanTaxLaw.MultiplicationOperatorNorms

theorem mul_spec (b r : Nat) : multipliedAmount b r = JapanTaxLaw.MultiplicationOperatorNormsSpec.multipliedAmountSpec b r := by rfl
example (b : Nat) : multipliedAmount b 0 = 0 := zero_rate_zero
example (r : Nat) : multipliedAmount 0 r = 0 := zero_base_zero
example (b : Nat) : multipliedAmount b 1 = b := one_rate_identity
example (b b' r : Nat) (h : b <= b') : multipliedAmount b r <= multipliedAmount b' r := monotone_in_base b b' r h
example (b1 b2 r : Nat) : multipliedAmount (b1 + b2) r = multipliedAmount b1 r + multipliedAmount b2 r := distributive b1 b2 r
example (b r : Nat) : multipliedAmount b r = multipliedAmount r b := commutative b r
example : multiplicationOperatorDeclared = true := multiplication_operator_is_declaration

end JapanTaxLaw.MultiplicationOperatorNormsTests
