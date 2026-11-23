import JapanTaxLaw.TreatyJPUSDependentServices
import JapanTaxLaw.TreatyJPUSDependentServicesSpec

/-!
# TreatyJPUSDependentServicesTests — 第十四条（従属的個人サービス）
-/
namespace JapanTaxLaw.TreatyJPUSDependentServicesTests
open JapanTaxLaw.TreatyJPUSDependentServices

theorem work_spec (w : Bool) : sourceTaxIfWorkThere w = JapanTaxLaw.TreatyJPUSDependentServicesSpec.sourceTaxIfWorkThereSpec w := by rfl
theorem days_spec (d : Nat) : within183 d = JapanTaxLaw.TreatyJPUSDependentServicesSpec.within183Spec d := by
  unfold within183 JapanTaxLaw.TreatyJPUSDependentServicesSpec.within183Spec
  by_cases h : d <= 183 <;> simp [h]
theorem exempt_spec (d : Nat) (e p : Bool) : exemptionConditions d e p = JapanTaxLaw.TreatyJPUSDependentServicesSpec.exemptionConditionsSpec d e p := by
  unfold exemptionConditions JapanTaxLaw.TreatyJPUSDependentServicesSpec.exemptionConditionsSpec within183
  by_cases h : d <= 183 <;> simp [h]
example : sourceTaxIfWorkThere false = false := work_at_home_no_source_tax
example : sourceTaxIfWorkThere true = true := work_there_source_tax
example : within183 183 = true := at_183_within
example : within183 184 = false := at_184_exceeded
example : exemptionConditions 183 true true = true := all_conditions_exempt
example : exemptionConditions 184 true true = false := day_limit_fail_no_exempt
example : exemptionConditions 183 false true = false := employer_fail_no_exempt
example : exemptionConditions 183 true false = false := pe_borne_no_exempt
example (d : Nat) (e p : Bool) (h : exemptionConditions d e p = true) : d <= 183 := exemption_requires_day_limit d e p h
example : internationalTransportExempt = true := intl_transport_no_source_tax
example : dependentServicesDeclared = true := dependent_services_is_declaration

end JapanTaxLaw.TreatyJPUSDependentServicesTests
