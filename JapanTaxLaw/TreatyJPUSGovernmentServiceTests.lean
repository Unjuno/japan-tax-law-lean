import JapanTaxLaw.TreatyJPUSGovernmentService
import JapanTaxLaw.TreatyJPUSGovernmentServiceSpec

/-!
# TreatyJPUSGovernmentServiceTests — 第十八条（政府の職務）
-/
namespace JapanTaxLaw.TreatyJPUSGovernmentServiceTests
open JapanTaxLaw.TreatyJPUSGovernmentService

theorem other_spec (s t : Bool) : otherStateOnlyTax s t = JapanTaxLaw.TreatyJPUSGovernmentServiceSpec.otherStateOnlyTaxSpec s t := by rfl
theorem payer_spec (e : Bool) : payerStateOnlyTax e = JapanTaxLaw.TreatyJPUSGovernmentServiceSpec.payerStateOnlyTaxSpec e := by rfl
example : otherStateOnlyTax true true = true := both_conditions_other_only
example : otherStateOnlyTax false true = false := home_service_no_other_tax
example : otherStateOnlyTax true false = false := untied_no_other_tax
example : payerStateOnlyTax false = true := government_remuneration_payer_only
example (s t : Bool) (h : otherStateOnlyTax s t = true) : payerStateOnlyTax (otherStateOnlyTax s t) = false := exception_excludes_payer_only s t h
example : governmentServiceDeclared = true := government_service_is_declaration

end JapanTaxLaw.TreatyJPUSGovernmentServiceTests
