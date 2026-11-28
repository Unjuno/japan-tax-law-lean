import JapanTaxLaw.LocalTax349_4PopulationOver6000InclusiveSpec

/- Kernel-decided boundary checks for 「人口六千人未満の場合には五億四千四百万円、人口六千人以上の場合には五億四千四百万円に人口五千人から計算して人口千人を増すごとに四千四百万円を加算した額」. -/
namespace JapanTaxLaw.LocalTax349_4PopulationOver6000Inclusive

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 5_999 = false := by decide  -- threshold_below
example : inScopeBool 6_000 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 6_001 = true := by decide  -- threshold_above
example : ¬ inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 6_000 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 5_999 := by unfold inScope; decide  -- outside (Prop)
example : inScope 6_000 ↔ specInScope 6_000 := agree_scope 6_000
example (population : Nat) : inScope population ↔ specInScope population := agree_scope population

end JapanTaxLaw.LocalTax349_4PopulationOver6000Inclusive
