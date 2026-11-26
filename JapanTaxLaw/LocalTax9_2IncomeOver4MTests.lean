import JapanTaxLaw.LocalTax9_2IncomeOver4MSpec

/- Kernel-decided boundary checks for 「各事業年度の所得のうち年四百万円を超える金額」. -/
namespace JapanTaxLaw.LocalTax9_2IncomeOver4M

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 3999999 := by unfold inScope threshold; decide  -- threshold_below
example : ¬ inScope 4000000 := by unfold inScope threshold; decide  -- threshold_at (を超え strict)
example : inScope 4000001 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 3999999 = false := by decide  -- bool
example : inScopeBool 4000000 = false := by decide  -- bool
example : inScopeBool 4000001 = true := by decide  -- bool
example : inScope 4000000 ↔ specInScope 4000000 := agree_scope 4000000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax9_2IncomeOver4M
