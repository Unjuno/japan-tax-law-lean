import JapanTaxLaw.InheritanceTaxArt19SevenYearGiftConditionSpec

/-!
# InheritanceTaxArt19SevenYearGiftConditionTests — kernel-checked checks

Verifies CONDITION 「（相続開始前七年以内に贈与があつた場合の相続税額）」: gift within 7 years (inclusive) applies; beyond does not.
-/

namespace JapanTaxLaw.InheritanceTaxArt19SevenYearGiftCondition

example : applies true 7 = true := gift_at_seven_years
example : applies true 0 = true := gift_at_zero_years
example : applies true 8 = false := gift_beyond_seven
example : applies false 7 = false := no_gift
example : SpecApplies true 7 := spec_seven
example : (applies true 7 = true) ↔ SpecApplies true 7 := agree_seven
example (g : Bool) (n : Nat) : applies g n = true -> SpecApplies g n := impl_implies_spec g n

end JapanTaxLaw.InheritanceTaxArt19SevenYearGiftCondition
