import JapanTaxLaw.ConditionStateNorms
import JapanTaxLaw.ConditionStateNormsSpec

/-!
# ConditionStateNormsTests — 条件状態
-/
namespace JapanTaxLaw.ConditionStateNormsTests
open JapanTaxLaw.ConditionStateNorms

theorem pos_spec (x : Bool) : posCondition x = JapanTaxLaw.ConditionStateNormsSpec.posConditionSpec x := by rfl
theorem neg_spec (x : Bool) : negCondition x = JapanTaxLaw.ConditionStateNormsSpec.negConditionSpec x := by rfl
example : posCondition true = true := pos_holds
example : posCondition false = false := pos_not_holds
example : negCondition false = true := neg_holds_when_absent
example : negCondition true = false := neg_fails_when_present
example (x : Bool) : ¬ (posCondition x = true ∧ negCondition x = true) := pos_neg_exclusive x
example : conditionStateDeclared = true := condition_state_is_declaration

end JapanTaxLaw.ConditionStateNormsTests
