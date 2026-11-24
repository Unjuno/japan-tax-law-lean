import JapanTaxLaw.NegativeFactConditions
import JapanTaxLaw.NegativeFactConditionsSpec

/-!
# NegativeFactConditionsTests — 否定事実条件
-/
namespace JapanTaxLaw.NegativeFactConditionsTests
open JapanTaxLaw.NegativeFactConditions

theorem negative_spec (p : Bool) : negativeFact p = JapanTaxLaw.NegativeFactConditionsSpec.negativeFactSpec p := by rfl
theorem positive_spec (p : Bool) : positiveFact p = JapanTaxLaw.NegativeFactConditionsSpec.positiveFactSpec p := by rfl
theorem any_spec (a b : Bool) : anyNegative a b = JapanTaxLaw.NegativeFactConditionsSpec.anyNegativeSpec a b := by rfl
theorem all_spec (a b : Bool) : allNegative a b = JapanTaxLaw.NegativeFactConditionsSpec.allNegativeSpec a b := by rfl
example : negativeFact false = true := negative_holds_when_absent
example : negativeFact true = false := negative_fails_when_present
example (p : Bool) : negativeFact (negativeFact p) = positiveFact p := double_negation p
example (p : Bool) : ¬ (positiveFact p = true ∧ negativeFact p = true) := positive_negative_exclusive p
example : anyNegative true false = true := any_first
example : anyNegative false false = false := any_none
example : allNegative true true = true := all_both
example : allNegative true false = false := all_one_absent
example : negativeFactDeclared = true := negative_fact_is_declaration

end JapanTaxLaw.NegativeFactConditionsTests
