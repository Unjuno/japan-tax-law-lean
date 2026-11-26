import JapanTaxLaw.LocalTaxEnforcementArt4AnnualAmount350To700Spec

/-!
# LocalTaxEnforcementArt4AnnualAmount350To700Tests — kernel-checked checks

Verifies CONDITION 「年３５０万円を超え年７００万円以下の金額　（（２２））」: bounds, interval boundaries, spec agreement.
-/

namespace JapanTaxLaw.LocalTaxEnforcementArt4AnnualAmount350To700

example : lowerBound = 350 := lower_bound_is_source
example : upperBound = 700 := upper_bound_is_source
example : withinInterval 351 := lower_plus_one_qualifies
example : withinInterval 700 := upper_qualifies
example : ¬ withinInterval 350 := lower_rejected
example : ¬ withinInterval 701 := above_upper_rejected
example : withinInterval 700 ↔ SpecWithinInterval 700 := interval_spec_agreement 700

end JapanTaxLaw.LocalTaxEnforcementArt4AnnualAmount350To700
