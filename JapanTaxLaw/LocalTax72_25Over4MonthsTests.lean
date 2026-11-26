import JapanTaxLaw.LocalTax72_25Over4MonthsSpec

/- Kernel-decided boundary checks for 「当該道府県知事が指定する四月を超える月数の期間内」. -/
namespace JapanTaxLaw.LocalTax72_25Over4Months

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 3 := by unfold inScope threshold; decide  -- threshold_below
example : ¬ inScope 4 := by unfold inScope threshold; decide  -- threshold_at
example : inScope 5 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 3 = false := by decide  -- threshold_below
example : inScopeBool 4 = false := by decide  -- threshold_at
example : inScopeBool 5 = true := by decide  -- threshold_above
example : inScope 4 ↔ specInScope 4 := agree_scope 4
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_25Over4Months
