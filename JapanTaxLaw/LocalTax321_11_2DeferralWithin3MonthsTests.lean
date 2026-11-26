import JapanTaxLaw.LocalTax321_11_2DeferralWithin3MonthsSpec

/- Kernel-decided boundary checks for 「その猶予の期間が三月以内である場合」. -/
namespace JapanTaxLaw.LocalTax321_11_2DeferralWithin3Months

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero (within ceiling)
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- below_ceiling
example : inScope 3 := by unfold inScope threshold; decide  -- ceiling_at (以内 inclusive)
example : ¬ inScope 4 := by unfold inScope threshold; decide  -- above_ceiling
example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 2 = true := by decide  -- below_ceiling
example : inScopeBool 3 = true := by decide  -- ceiling_at
example : inScopeBool 4 = false := by decide  -- above_ceiling
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax321_11_2DeferralWithin3Months
