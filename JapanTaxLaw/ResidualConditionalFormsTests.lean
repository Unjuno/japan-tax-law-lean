import JapanTaxLaw.ResidualConditionalForms
import JapanTaxLaw.ResidualConditionalFormsSpec

/-!
# ResidualConditionalFormsTests — 残余の条件形式
-/
namespace JapanTaxLaw.ResidualConditionalFormsTests
open JapanTaxLaw.ResidualConditionalForms

theorem passive_spec (p : Bool) : passiveEvent p = JapanTaxLaw.ResidualConditionalFormsSpec.passiveEventSpec p := by rfl
theorem existence_spec (p : Bool) : existenceState p = JapanTaxLaw.ResidualConditionalFormsSpec.existenceStateSpec p := by rfl
theorem agentive_spec (p : Bool) : agentiveAct p = JapanTaxLaw.ResidualConditionalFormsSpec.agentiveActSpec p := by rfl
theorem quality_spec (p : Bool) : qualityTime p = JapanTaxLaw.ResidualConditionalFormsSpec.qualityTimeSpec p := by rfl
theorem item_spec (p : Bool) : itemCase p = JapanTaxLaw.ResidualConditionalFormsSpec.itemCaseSpec p := by rfl
theorem prescriptive_spec (p : Bool) : prescriptiveAct p = JapanTaxLaw.ResidualConditionalFormsSpec.prescriptiveActSpec p := by rfl
theorem condnot_spec (p : Bool) : condNot p = JapanTaxLaw.ResidualConditionalFormsSpec.condNotSpec p := by rfl
theorem anycond_spec (a b : Bool) : anyCond a b = JapanTaxLaw.ResidualConditionalFormsSpec.anyCondSpec a b := by rfl
example : passiveEvent true = true := passive_holds
example : existenceState true = true := existence_holds
example : agentiveAct true = true := agentive_holds
example : qualityTime true = true := quality_holds
example : itemCase true = true := item_holds
example : prescriptiveAct true = true := prescriptive_holds
example : passiveEvent false = false := passive_fails
example : existenceState false = false := existence_fails
example (p : Bool) : ¬ (passiveEvent p = true ∧ condNot p = true) := cond_exclusive p
example : anyCond true false = true := any_first
example : anyCond false true = true := any_second
example : anyCond false false = false := any_none
example : residualConditionDeclared = true := residual_condition_is_declaration

end JapanTaxLaw.ResidualConditionalFormsTests
