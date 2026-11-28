import JapanTaxLaw.LocalTax349_4PopulationOver5000InclusiveSpec

/- Kernel-decided boundary checks for 「人口五千人以上一万人未満の市町村」. -/
namespace JapanTaxLaw.LocalTax349_4PopulationOver5000Inclusive

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 4_999 = false := by decide  -- threshold_below
example : inScopeBool 5_000 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 5_001 = true := by decide  -- threshold_above
example : ¬ inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 5_000 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 4_999 := by unfold inScope; decide  -- outside (Prop)
example : inScope 5_000 ↔ specInScope 5_000 := agree_scope 5_000
example (population : Nat) : inScope population ↔ specInScope population := agree_scope population

end JapanTaxLaw.LocalTax349_4PopulationOver5000Inclusive
