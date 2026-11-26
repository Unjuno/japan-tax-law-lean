import JapanTaxLaw.LocalTax73_27_4DeferralWithin2YearsSpec

/- Kernel-decided boundary checks for 「当該取得の日から二年以内の期間を限つて不動産取得税額を徴収猶予する」. -/
namespace JapanTaxLaw.LocalTax73_27_4DeferralWithin2Years

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- below_limit
example : inScope 2 := by unfold inScope threshold; decide  -- limit_at (以内 inclusive)
example : ¬ inScope 3 := by unfold inScope threshold; decide  -- above_limit
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = false := by decide  -- bool
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax73_27_4DeferralWithin2Years
