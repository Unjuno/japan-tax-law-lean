import JapanTaxLaw.LocalTax52CapitalUpTo10MSpec

/- Kernel-decided boundary checks for 「ホ　資本金等の額を有する法人（法人税法別表第二に規定する独立行政法人で収益事業を行わないもの及びニに掲げる法人を除く。以下この表において同じ。）で資本金等の額が千万円以下であるもの」. -/
namespace JapanTaxLaw.LocalTax52CapitalUpTo10M

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 9_999_999 = true := by decide  -- threshold_below
example : inScopeBool 10_000_000 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 10_000_001 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope threshold; decide  -- zero (Prop)
example : inScope 10_000_000 := by unfold inScope threshold; decide  -- threshold_at (inclusive, Prop)
example : inScope 10_000_000 ↔ specInScope 10_000_000 := agree_scope 10_000_000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax52CapitalUpTo10M
