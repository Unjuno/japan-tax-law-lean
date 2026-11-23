import JapanTaxLaw.SubtractionOperatorNorms
import JapanTaxLaw.SubtractionOperatorNormsSpec

/-!
# SubtractionOperatorNormsTests — 減算演算子
-/
namespace JapanTaxLaw.SubtractionOperatorNormsTests
open JapanTaxLaw.SubtractionOperatorNorms

theorem sub_spec (b d : Nat) : deductedAmount b d = JapanTaxLaw.SubtractionOperatorNormsSpec.deductedAmountSpec b d := by rfl
example (b : Nat) : deductedAmount b 0 = b := subtract_zero b
example (b : Nat) : deductedAmount b b = 0 := subtract_self b
example (b d : Nat) (h : b <= d) : deductedAmount b d = 0 := saturating b d h
example (b d : Nat) (h : d <= b) : deductedAmount b d + d = b := add_back b d h
example : subtractionOperatorDeclared = true := subtraction_operator_is_declaration

end JapanTaxLaw.SubtractionOperatorNormsTests
