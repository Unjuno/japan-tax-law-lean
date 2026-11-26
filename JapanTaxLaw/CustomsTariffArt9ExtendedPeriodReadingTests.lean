import JapanTaxLaw.CustomsTariffArt9ExtendedPeriodReadingSpec

/-!
# CustomsTariffArt9ExtendedPeriodReadingTests — kernel-checked checks

Verifies READING 「第六項及び第七項の規定は、第一項の規定により指定された期間を前項の規定により延長する場合について準用する。」: extended period read in, non-extended not.
-/

namespace JapanTaxLaw.CustomsTariffArt9ExtendedPeriodReading

example : applies true := extended_applies
example : ¬ applies false := not_extended_rejected
example : applies true ↔ SpecApplies true := applies_spec_agreement true
example : applies false ↔ SpecApplies false := applies_spec_agreement false

end JapanTaxLaw.CustomsTariffArt9ExtendedPeriodReading
