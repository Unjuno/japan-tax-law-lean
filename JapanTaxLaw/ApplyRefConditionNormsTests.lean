import JapanTaxLaw.ApplyRefConditionNorms
import JapanTaxLaw.ApplyRefConditionNormsSpec

/-!
# ApplyRefConditionNormsTests — 適用条件
-/
namespace JapanTaxLaw.ApplyRefConditionNormsTests
open JapanTaxLaw.ApplyRefConditionNorms

theorem applies_spec (p : Bool) : applies p = JapanTaxLaw.ApplyRefConditionNormsSpec.appliesSpec p := by rfl
example : applies true = true := applied_satisfies
example : applies false = false := not_applied_no_trigger
example (p : Bool) (h : applies p = true) : p = true := trigger_implies_applied p h
example : applyRefConditionDeclared = true := apply_ref_condition_is_declaration

end JapanTaxLaw.ApplyRefConditionNormsTests
