import JapanTaxLaw.CapComparisonNorms
import JapanTaxLaw.CapComparisonNormsSpec

/-!
# CapComparisonNormsTests — 上限比較演算子
-/
namespace JapanTaxLaw.CapComparisonNormsTests

open JapanTaxLaw.CapComparisonNorms

theorem spec_agreement (v c : Nat) :
    notExceed v c = JapanTaxLaw.CapComparisonNormsSpec.capSpec v c := by
  unfold notExceed JapanTaxLaw.CapComparisonNormsSpec.capSpec
  by_cases h : v <= c <;> simp [h]
example (c : Nat) : notExceed c c = true := at_cap c
example (v c : Nat) (h : v <= c) : notExceed v c = true := below_cap v c h
example (v c : Nat) (h : c < v) : notExceed v c = false := above_cap v c h
example (v : Nat) : notExceed v 0 = (v == 0) := zero_cap v
example : capComparisonDeclared = true := cap_comparison_is_declaration

end JapanTaxLaw.CapComparisonNormsTests
