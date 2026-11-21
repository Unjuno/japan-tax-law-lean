import JapanTaxLaw.ProceduralDeonticNorms
import JapanTaxLaw.ProceduralDeonticNormsSpec

/-!
# ProceduralDeonticNormsTests — 手続的義務
-/
namespace JapanTaxLaw.ProceduralDeonticNormsTests

open JapanTaxLaw.ProceduralDeonticNorms

theorem approval_spec (a : Bool) :
    approvalGated a = JapanTaxLaw.ProceduralDeonticNormsSpec.approvalSpec a := by rfl

theorem mandatory_spec (d : Bool) :
    mandatoryFulfilled d = JapanTaxLaw.ProceduralDeonticNormsSpec.mandatorySpec d := by rfl

example : approvalGated true = true := act_with_approval
example : approvalGated false = false := act_without_approval
example : mandatoryFulfilled true = true := mandatory_satisfied
example : mandatoryFulfilled false = false := mandatory_violated
example : orderIssued true = true := order_when_issued
example : isMandatory .mandatory = true := mandatory_is_mandatory
example : isMandatory .permissive = false := permissive_not_mandatory
example : proceduralDeclared = true := procedural_is_declaration

end JapanTaxLaw.ProceduralDeonticNormsTests
