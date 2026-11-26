import JapanTaxLaw.LocalTax4PrefecturalIncomeOver30MSpec

/- Kernel-decided boundary checks for 「合計所得金額が三千万円を超える」. -/
namespace JapanTaxLaw.LocalTax4PrefecturalIncomeOver30M

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 29_999_999 := by unfold inScope threshold; decide  -- threshold_below
example : ¬ inScope 30_000_000 := by unfold inScope threshold; decide  -- threshold_at (を超え strict)
example : inScope 30_000_001 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 29_999_999 = false := by decide  -- threshold_below
example : inScopeBool 30_000_000 = false := by decide  -- threshold_at
example : inScopeBool 30_000_001 = true := by decide  -- threshold_above
example : inScope 30_000_000 ↔ specInScope 30_000_000 := agree_scope 30_000_000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax4PrefecturalIncomeOver30M
