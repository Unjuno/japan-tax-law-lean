import JapanTaxLaw.TreatyJPUSPermanentEstablishment
import JapanTaxLaw.TreatyJPUSPermanentEstablishmentSpec

/-!
# TreatyJPUSPermanentEstablishmentTests — 第五条（恒久的施設）
-/
namespace JapanTaxLaw.TreatyJPUSPermanentEstablishmentTests
open JapanTaxLaw.TreatyJPUSPermanentEstablishment

theorem construction_spec (m : Nat) : constructionPE m = JapanTaxLaw.TreatyJPUSPermanentEstablishmentSpec.constructionPESpec m := by
  unfold constructionPE JapanTaxLaw.TreatyJPUSPermanentEstablishmentSpec.constructionPESpec
  by_cases h : 12 < m <;> simp [h]
theorem agency_spec (a r n : Bool) : agencyPE a r n = JapanTaxLaw.TreatyJPUSPermanentEstablishmentSpec.agencyPESpec a r n := by rfl
example : constructionPE 12 = false := at_12_months_no_pe
example : constructionPE 13 = true := above_12_months_pe
example : preparatoryActivityIsPE true = false := preparatory_not_pe
example : agencyPE true true true = true := agency_pe_all
example : agencyPE false true true = false := agency_no_authority
example : agencyPE true true false = false := agency_preparatory_only
example : independentAgentPE = false := independent_agent_not_pe
example : controlCreatesPE = false := control_not_pe
example : permanentEstablishmentDeclared = true := permanent_establishment_is_declaration

end JapanTaxLaw.TreatyJPUSPermanentEstablishmentTests
