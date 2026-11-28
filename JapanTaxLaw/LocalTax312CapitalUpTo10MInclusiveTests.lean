import JapanTaxLaw.LocalTax312CapitalUpTo10MInclusiveSpec

/- Kernel-decided boundary checks for 「二　資本金等の額を有する法人で資本金等の額が千万円以下であるもののうち、従業者数の合計数が五十人を超えるもの」. -/
namespace JapanTaxLaw.LocalTax312CapitalUpTo10MInclusive

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 9_999_999 = true := by decide  -- threshold_below
example : inScopeBool 10_000_000 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 10_000_001 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 10_000_000 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 10_000_001 := by unfold inScope; decide  -- outside (Prop)
example : inScope 10_000_000 ↔ specInScope 10_000_000 := agree_scope 10_000_000
example (capital : Nat) : inScope capital ↔ specInScope capital := agree_scope capital

end JapanTaxLaw.LocalTax312CapitalUpTo10MInclusive
