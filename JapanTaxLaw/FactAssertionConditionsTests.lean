import JapanTaxLaw.FactAssertionConditions
import JapanTaxLaw.FactAssertionConditionsSpec

/-!
# FactAssertionConditionsTests — 事実提示条件
-/
namespace JapanTaxLaw.FactAssertionConditionsTests
open JapanTaxLaw.FactAssertionConditions

theorem assertion_spec (p : Bool) : factAssertion p = JapanTaxLaw.FactAssertionConditionsSpec.factAssertionSpec p := by rfl
theorem denial_spec (p : Bool) : factDenial p = JapanTaxLaw.FactAssertionConditionsSpec.factDenialSpec p := by rfl
theorem any_spec (a b : Bool) : anyAssertion a b = JapanTaxLaw.FactAssertionConditionsSpec.anyAssertionSpec a b := by rfl
theorem all_spec (a b : Bool) : allAssertions a b = JapanTaxLaw.FactAssertionConditionsSpec.allAssertionsSpec a b := by rfl
theorem implies_spec (p q : Bool) : assertionImplies p q = JapanTaxLaw.FactAssertionConditionsSpec.assertionImpliesSpec p q := by rfl
example : factAssertion true = true := assertion_holds
example : factAssertion false = false := assertion_fails
example : factDenial false = true := denial_when_absent
example : factDenial true = false := denial_fails_when_present
example (p : Bool) : ¬ (factAssertion p = true ∧ factDenial p = true) := assertion_exclusive p
example : anyAssertion true false = true := any_first
example : anyAssertion false true = true := any_second
example : anyAssertion false false = false := any_none
example : allAssertions true true = true := all_both
example : allAssertions true false = false := all_one_absent
example (p q : Bool) (h : p = true) (hi : assertionImplies p q = true) : q = true := assertion_implies_consequence p q h hi
example : factAssertionDeclared = true := fact_assertion_is_declaration

end JapanTaxLaw.FactAssertionConditionsTests
