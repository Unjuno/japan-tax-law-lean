import JapanTaxLaw.LocalTax75_2Age70OrMoreSpec

/- Kernel-decided boundary checks for 「年齢七十歳以上の者」. -/
namespace JapanTaxLaw.LocalTax75_2Age70OrMore

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input / threshold_below
example : inScopeBool 69 = false := by decide  -- threshold_below
example : inScopeBool 70 = true := by decide  -- threshold_at (INCLUSIVE)
example : inScopeBool 71 = true := by decide  -- threshold_above
example : inScope 70 := by unfold inScope; decide  -- threshold_at (Prop, INCLUSIVE)
example : ¬ inScope 69 := by unfold inScope; decide  -- threshold_below (Prop)
example : inScope 71 ↔ specInScope 71 := agree_scope 71
example (age : Nat) : inScope age ↔ specInScope age := agree_scope age

end JapanTaxLaw.LocalTax75_2Age70OrMore
