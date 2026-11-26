import JapanTaxLaw.LocalTax314_6IncomeOver2MSpec

/- Kernel-decided boundary checks for 「当該納税義務者の合計課税所得金額が二百万円を超える場合」. -/
namespace JapanTaxLaw.LocalTax314_6IncomeOver2M

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope lower threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope lower threshold; decide  -- small_input
example : ¬ inScope 1_999_999 := by unfold inScope lower threshold; decide  -- threshold_below
example : ¬ inScope 2_000_000 := by unfold inScope lower threshold; decide  -- threshold_at
example : inScope 2_000_001 := by unfold inScope lower threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 1_999_999 = false := by decide  -- threshold_below
example : inScopeBool 2_000_000 = false := by decide  -- threshold_at
example : inScopeBool 2_000_001 = true := by decide  -- threshold_above
example : inScope 2_000_001 ↔ specInScope 2_000_001 := agree_scope 2_000_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax314_6IncomeOver2M
