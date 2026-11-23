import JapanTaxLaw.CaseWhenConditions
import JapanTaxLaw.CaseWhenConditionsSpec

/-!
# CaseWhenConditionsTests — 場合条件
-/
namespace JapanTaxLaw.CaseWhenConditionsTests
open JapanTaxLaw.CaseWhenConditions

theorem case_spec (p : Bool) : caseCondition p = JapanTaxLaw.CaseWhenConditionsSpec.caseConditionSpec p := by rfl
theorem nocase_spec (p : Bool) : noCaseCondition p = JapanTaxLaw.CaseWhenConditionsSpec.noCaseConditionSpec p := by rfl
theorem any_spec (a b : Bool) : anyCase a b = JapanTaxLaw.CaseWhenConditionsSpec.anyCaseSpec a b := by rfl
theorem all_spec (a b : Bool) : allCases a b = JapanTaxLaw.CaseWhenConditionsSpec.allCasesSpec a b := by rfl
example : caseCondition true = true := case_holds
example : caseCondition false = false := case_fails
example : noCaseCondition false = true := no_case_when_absent
example : noCaseCondition true = false := no_case_fails_when_present
example (p : Bool) : ¬ (caseCondition p = true ∧ noCaseCondition p = true) := case_exclusive p
example : anyCase true false = true := any_first
example : anyCase false true = true := any_second
example : anyCase false false = false := any_none
example : allCases true true = true := all_both
example : allCases true false = false := all_one_absent
example : caseWhenDeclared = true := case_when_is_declaration

end JapanTaxLaw.CaseWhenConditionsTests
