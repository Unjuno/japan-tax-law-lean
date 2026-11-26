import JapanTaxLaw.LocalTaxArt154Capacity30To40ConditionSpec

/-!
# LocalTaxArt154Capacity30To40ConditionTests — kernel-checked checks

Verifies CONDITION 「（２）　乗車定員が三十人を超え、四十人以下のもの」: bounds, interval boundaries, spec agreement.
-/

namespace JapanTaxLaw.LocalTaxArt154Capacity30To40Condition

example : lowerBound = 30 := lower_bound_is_source
example : upperBound = 40 := upper_bound_is_source
example : withinInterval 31 := capacity_31_qualifies
example : withinInterval 40 := capacity_upper_qualifies
example : ¬ withinInterval 30 := capacity_lower_rejected
example : ¬ withinInterval 41 := capacity_above_upper_rejected
example : withinInterval 40 ↔ SpecWithinInterval 40 := interval_spec_agreement 40

end JapanTaxLaw.LocalTaxArt154Capacity30To40Condition
