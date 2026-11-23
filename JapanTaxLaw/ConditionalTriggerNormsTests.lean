import JapanTaxLaw.ConditionalTriggerNorms
import JapanTaxLaw.ConditionalTriggerNormsSpec

/-!
# ConditionalTriggerNormsTests — 条件発生
-/
namespace JapanTaxLaw.ConditionalTriggerNormsTests
open JapanTaxLaw.ConditionalTriggerNorms

theorem triggered_spec (o : Bool) : triggered o = JapanTaxLaw.ConditionalTriggerNormsSpec.triggeredSpec o := by rfl
theorem any_spec (a b : Bool) : anyTriggered a b = JapanTaxLaw.ConditionalTriggerNormsSpec.anyTriggeredSpec a b := by rfl
example : triggered true = true := occurrence_triggers
example : triggered false = false := no_occurrence_no_trigger
example (o : Bool) (h : triggered o = true) : o = true := trigger_implies_occurred o h
example : anyTriggered true false = true := first_triggers
example : anyTriggered false true = true := second_triggers
example : anyTriggered false false = false := neither_no_trigger
example : conditionalTriggerDeclared = true := conditional_trigger_is_declaration

end JapanTaxLaw.ConditionalTriggerNormsTests
