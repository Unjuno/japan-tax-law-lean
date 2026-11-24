import JapanTaxLaw.LocalTax71_14Over3MSpec

/- Kernel-decided boundary checks for 「三百万円を超える部分に相当する金額」. -/
namespace JapanTaxLaw.LocalTax71_14Over3M

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : ¬ inScope 2_999_999 := by unfold inScope threshold; decide
example : ¬ inScope 3_000_000 := by unfold inScope threshold; decide
example : inScope 3_000_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 2_999_999 = false := by decide
example : inScopeBool 3_000_000 = false := by decide
example : inScopeBool 3_000_001 = true := by decide
example : inScope 3_000_001 ↔ specInScope 3_000_001 := agree_scope 3_000_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax71_14Over3M
