import JapanTaxLaw.LocalTax314_2DisasterExpenseOver50kDeductionSpec

/- Kernel-decided boundary checks for 「災害関連支出の金額のうち五万円を超える部分の金額」. -/
namespace JapanTaxLaw.LocalTax314_2DisasterExpenseOver50kDeduction

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 49999 := by unfold inScope threshold; decide  -- threshold_below
example : ¬ inScope 50000 := by unfold inScope threshold; decide  -- threshold_at (を超え strict)
example : inScope 50001 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 49999 = false := by decide  -- bool
example : inScopeBool 50000 = false := by decide  -- bool
example : inScopeBool 50001 = true := by decide  -- bool
example : inScope 50000 ↔ specInScope 50000 := agree_scope 50000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax314_2DisasterExpenseOver50kDeduction
