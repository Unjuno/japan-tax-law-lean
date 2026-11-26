import JapanTaxLaw.LocalTax144_9OpinionWithin2MonthsSpec

/- Kernel-decided boundary checks for 「書類を受け取つた日から二月以内に自己の意見を付して総務大臣に送付」. -/
namespace JapanTaxLaw.LocalTax144_9OpinionWithin2Months

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- limit_at (以内 inclusive)
example : ¬ inScope 3 := by unfold inScope threshold; decide  -- above_limit
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = false := by decide  -- bool
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax144_9OpinionWithin2Months
