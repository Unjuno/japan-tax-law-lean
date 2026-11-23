import JapanTaxLaw.TemporalConditionNorms
import JapanTaxLaw.TemporalConditionNormsSpec

/-!
# TemporalConditionNormsTests — 時的条件（完了・該当・存在）
-/
namespace JapanTaxLaw.TemporalConditionNormsTests
open JapanTaxLaw.TemporalConditionNorms

theorem completion_spec (p : Bool) : completionCondition p = JapanTaxLaw.TemporalConditionNormsSpec.completionConditionSpec p := by rfl
theorem noncompletion_spec (p : Bool) : nonCompletionCondition p = JapanTaxLaw.TemporalConditionNormsSpec.nonCompletionConditionSpec p := by rfl
theorem applicability_spec (p : Bool) : applicabilityCondition p = JapanTaxLaw.TemporalConditionNormsSpec.applicabilityConditionSpec p := by rfl
theorem existence_spec (p : Bool) : existenceCondition p = JapanTaxLaw.TemporalConditionNormsSpec.existenceConditionSpec p := by rfl
example : completionCondition true = true := completion_holds
example : completionCondition false = false := completion_fails
example : nonCompletionCondition false = true := non_completion_when_absent
example : nonCompletionCondition true = false := non_completion_fails_when_present
example (p : Bool) : ¬ (completionCondition p = true ∧ nonCompletionCondition p = true) := completion_noncompletion_exclusive p
example : applicabilityCondition true = true := applicability_holds
example : applicabilityCondition false = false := applicability_fails
example : existenceCondition true = true := existence_holds
example : existenceCondition false = false := existence_fails
example : temporalConditionDeclared = true := temporal_condition_is_declaration

end JapanTaxLaw.TemporalConditionNormsTests
