import JapanTaxLaw.LocalTax55_2DeferralReliefWithin3MonthsSpec

/- Kernel-decided boundary checks for 「ただし、その猶予に係る税額が百万円以下である場合、その猶予の期間が三月以内である場合又は担保を徴することができない特別の事情がある場合は、この限りでない。」. -/
namespace JapanTaxLaw.LocalTax55_2DeferralReliefWithin3Months

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 2 = true := by decide  -- threshold_below
example : inScopeBool 3 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 4 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 3 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 4 := by unfold inScope; decide  -- outside (Prop)
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (months : Nat) : inScope months ↔ specInScope months := agree_scope months

end JapanTaxLaw.LocalTax55_2DeferralReliefWithin3Months
