import JapanTaxLaw.LocalTaxAgencyStatus
import JapanTaxLaw.LocalTaxAgencyStatusSpec

/-!
# LocalTaxAgencyStatusTests — 地方税法 第七百六十三条
-/
namespace JapanTaxLaw.LocalTaxAgencyStatusTests
open JapanTaxLaw.LocalTaxAgencyStatus

theorem juridical_spec : isJuridicalPerson = JapanTaxLaw.LocalTaxAgencyStatusSpec.isJuridicalPersonSpec := by rfl
theorem domicile_spec (h : Bool) : deemedDomicile h = JapanTaxLaw.LocalTaxAgencyStatusSpec.deemedDomicileSpec h := by rfl
example : isJuridicalPerson = true := agency_is_juridical
example : deemedDomicile true = true := office_gives_domicile
example : deemedDomicile false = false := no_office_no_domicile
example : localTaxAgencyStatusDeclared = true := local_tax_agency_status_is_declaration

end JapanTaxLaw.LocalTaxAgencyStatusTests
