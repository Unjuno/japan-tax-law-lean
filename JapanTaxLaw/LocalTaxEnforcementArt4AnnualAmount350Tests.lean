import JapanTaxLaw.LocalTaxEnforcementArt4AnnualAmount350Spec

/-!
# LocalTaxEnforcementArt4AnnualAmount350Tests — kernel-checked checks

Verifies CONDITION 「年３５０万円以下の金額　（（２１））」: source amount, boundary, zero, rejection, spec.
-/

namespace JapanTaxLaw.LocalTaxEnforcementArt4AnnualAmount350

example : amountLimit = 350 := limit_is_source_value
example : withinLimit 350 := amount_at_limit
example : withinLimit 0 := zero_amount_allowed
example (h : 350 < 351) : ¬ withinLimit 351 := amount_over_limit_rejected 351 h
example : withinLimit 350 ↔ SpecWithinLimit 350 := within_limit_spec_agreement 350

end JapanTaxLaw.LocalTaxEnforcementArt4AnnualAmount350
