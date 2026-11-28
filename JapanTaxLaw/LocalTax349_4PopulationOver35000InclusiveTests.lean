import JapanTaxLaw.LocalTax349_4PopulationOver35000InclusiveSpec

/- Kernel-decided boundary checks for 「人口三万五千人未満の場合には十二億八千万円、人口三万五千人以上の場合には十二億八千万円に人口三万人から計算して人口五千人を増すごとに八千万円を加算した額」. -/
namespace JapanTaxLaw.LocalTax349_4PopulationOver35000Inclusive

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 34_999 = false := by decide  -- threshold_below
example : inScopeBool 35_000 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 35_001 = true := by decide  -- threshold_above
example : ¬ inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 35_000 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 34_999 := by unfold inScope; decide  -- outside (Prop)
example : inScope 35_000 ↔ specInScope 35_000 := agree_scope 35_000
example (population : Nat) : inScope population ↔ specInScope population := agree_scope population

end JapanTaxLaw.LocalTax349_4PopulationOver35000Inclusive
