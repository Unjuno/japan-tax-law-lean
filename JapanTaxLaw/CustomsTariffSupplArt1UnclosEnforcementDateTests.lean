import JapanTaxLaw.CustomsTariffSupplArt1UnclosEnforcementDateSpec

/-!
# CustomsTariffSupplArt1UnclosEnforcementDateTests — kernel-checked checks

Verifies REFERENCE 「この法律は、国連海洋法条約が日本国について効力を生ずる日から施行する。」: in force only after the treaty trigger and on/after its date.
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1UnclosEnforcementDate

example : inForce true true = true := in_force_after_trigger
example : inForce false true = false := not_in_force_before_trigger
example : inForce true false = false := not_in_force_before_date
example : SpecInForce true true := spec_after_trigger
example : SpecInForce true true := impl_matches_spec
example (a b : Bool) : inForce a b = true -> SpecInForce a b := impl_implies_spec a b

end JapanTaxLaw.CustomsTariffSupplArt1UnclosEnforcementDate
