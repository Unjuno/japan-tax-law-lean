import JapanTaxLaw.ForestEnvironmentTaxRate
import JapanTaxLaw.ForestEnvironmentTaxRateSpec

/-!
# ForestEnvironmentTaxRateTests — kernel-decided boundary examples
-/
namespace JapanTaxLaw.ForestEnvironmentTaxRateTests

open JapanTaxLaw.ForestEnvironmentTaxRate
open JapanTaxLaw.ForestEnvironmentTaxRateSpec

theorem agrees_with_implementation (a : Nat) :
    rateEqualsStatutory a = true ↔ rateIsStatutory a := by
  simp [rateEqualsStatutory, rateIsStatutory, rateYen]

example : rateYen = statutoryRateYen := by decide
example : rateEqualsStatutory 0 = false := by decide
example : rateEqualsStatutory 999 = false := by decide
example : rateEqualsStatutory 1_000 = true := by decide
example : rateEqualsStatutory 1_001 = false := by decide
example : rateIsStatutory 1_000 := by unfold rateIsStatutory; decide
example : ¬ rateIsStatutory 999 := by unfold rateIsStatutory; decide

end JapanTaxLaw.ForestEnvironmentTaxRateTests
