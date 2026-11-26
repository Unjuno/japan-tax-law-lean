import JapanTaxLaw.LocalTax72_50CorrectionRequestWithin3MonthsSpec

/- Kernel-decided boundary checks for 「当該更正の請求を受けた日から三月以内に更正をしない」. -/
namespace JapanTaxLaw.LocalTax72_50CorrectionRequestWithin3Months

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- below_limit
example : inScope 3 := by unfold inScope threshold; decide  -- limit_at (以内 inclusive)
example : ¬ inScope 4 := by unfold inScope threshold; decide  -- above_limit
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = true := by decide  -- bool
example : inScopeBool 4 = false := by decide  -- bool
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_50CorrectionRequestWithin3Months
