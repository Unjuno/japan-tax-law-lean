import JapanTaxLaw.CalculationBasisNorms
import JapanTaxLaw.CalculationBasisNormsSpec

/-!
# CalculationBasisNormsTests — 計算の基礎
-/
namespace JapanTaxLaw.CalculationBasisNormsTests
open JapanTaxLaw.CalculationBasisNorms

theorem derived_spec (d : Derivation) (b : Value) : derivedFrom d b = JapanTaxLaw.CalculationBasisNormsSpec.derivedFromSpec d b := by rfl
theorem compose_spec (d1 d2 : Derivation) : composeDerivation d1 d2 = JapanTaxLaw.CalculationBasisNormsSpec.composeDerivationSpec d1 d2 := by rfl
theorem scaled_spec (b r : Nat) : scaledBase b r = JapanTaxLaw.CalculationBasisNormsSpec.scaledBaseSpec b r := by rfl
example (d : Derivation) (b : Value) : derivedFrom d b = d b := derivation_deterministic d b
example (d : Derivation) (b a c : Value) (ha : a = d b) (hc : c = d b) : a = c := same_base_same_result d b a c ha hc
example (d1 d2 : Derivation) (b : Value) : composeDerivation d1 d2 b = d2 (d1 b) := compose_applies_in_sequence d1 d2 b
example (r : Nat) : scaledBase 0 r = 0 := zero_base_zero_derived r
example : calculationBasisDeclared = true := calculation_basis_is_declaration

end JapanTaxLaw.CalculationBasisNormsTests
