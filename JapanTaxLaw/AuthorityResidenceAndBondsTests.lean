import JapanTaxLaw.AuthorityResidenceAndBonds
import JapanTaxLaw.AuthorityResidenceAndBondsSpec

/-!
# AuthorityResidenceAndBondsTests — 権限・居住者・地方債
-/
namespace JapanTaxLaw.AuthorityResidenceAndBondsTests

open JapanTaxLaw.AuthorityResidenceAndBonds

theorem issuance_spec (c : Bool) :
    issuanceAllowed c = JapanTaxLaw.AuthorityResidenceAndBondsSpec.issuanceSpec c := by rfl

theorem reciprocity_spec (c : Bool) :
    reciprocityApplies c = JapanTaxLaw.AuthorityResidenceAndBondsSpec.reciprocitySpec c := by rfl

example : issuanceAllowed true = true := issuance_with_consent
example : issuanceAllowed false = false := issuance_without_consent
example : isTaxableResident .resident = true := resident_taxable
example : isTaxableResident .permanentEstablishmentNonResident = true := pe_nonresident_taxable
example : isTaxableResident .other = false := other_not_taxable
example : reciprocityApplies true = true := reciprocity_when_met
example : credentialDutyDeclared = true := credential_duty_is_declaration
example : residentAreaShare 0 0 = none := area_zero
example : residentAreaShare 5 5 = some 100 := area_full

end JapanTaxLaw.AuthorityResidenceAndBondsTests
