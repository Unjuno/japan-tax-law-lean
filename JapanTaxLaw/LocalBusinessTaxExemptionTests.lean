import JapanTaxLaw.LocalBusinessTaxExemption
import JapanTaxLaw.LocalBusinessTaxExemptionSpec

/-!
# LocalBusinessTaxExemptionTests — 地方税法 第七十二条の四（実質的証明）
-/
namespace JapanTaxLaw.LocalBusinessTaxExemptionTests
open JapanTaxLaw.LocalBusinessTaxExemption

theorem exempt_spec (a b c d : Bool) : businessTaxExempt a b c d = JapanTaxLaw.LocalBusinessTaxExemptionSpec.businessTaxExemptSpec a b c d := by rfl
theorem may_spec (e : Bool) : mayTaxBusiness e = JapanTaxLaw.LocalBusinessTaxExemptionSpec.mayTaxBusinessSpec e := by rfl
example : businessTaxExempt true false false false = true := state_exempt
example : businessTaxExempt false true false false = true := public_corp_exempt
example : businessTaxExempt false false true false = true := inc_agency_exempt
example : businessTaxExempt false false false false = false := none_not_exempt
example : mayTaxBusiness true = false := exempt_not_taxed
example : mayTaxBusiness false = true := nonexempt_may_tax
example : localBusinessTaxExemptionDeclared = true := local_business_tax_exemption_is_declaration

end JapanTaxLaw.LocalBusinessTaxExemptionTests
