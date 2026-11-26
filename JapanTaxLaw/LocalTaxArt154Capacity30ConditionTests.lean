import JapanTaxLaw.LocalTaxArt154Capacity30ConditionSpec

/-!
# LocalTaxArt154Capacity30ConditionTests — kernel-checked checks

Verifies CONDITION 「（１）　乗車定員が三十人以下のもの」: limit value, boundary, zero, rejection, spec agreement.
-/

namespace JapanTaxLaw.LocalTaxArt154Capacity30Condition

example : capacityLimit = 30 := limit_is_source_value
example : withinLimit 30 := capacity_at_limit
example : withinLimit 0 := zero_capacity_allowed
example (h : 30 < 31) : ¬ withinLimit 31 := capacity_over_limit_rejected 31 h
example : withinLimit 30 ↔ SpecWithinLimit 30 := within_limit_spec_agreement 30

end JapanTaxLaw.LocalTaxArt154Capacity30Condition
