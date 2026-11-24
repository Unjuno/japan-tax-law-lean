import JapanTaxLaw.LocalTax71_14UpTo500kSpec

/- Kernel-decided boundary checks for 「五十万円以下の部分に相当する金額」. -/
namespace JapanTaxLaw.LocalTax71_14UpTo500k

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide
example : inScope 1 := by unfold inScope threshold; decide
example : inScope 499_999 := by unfold inScope threshold; decide
example : inScope 500_000 := by unfold inScope threshold; decide
example : ¬ inScope 500_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = true := by decide
example : inScopeBool 1 = true := by decide
example : inScopeBool 499_999 = true := by decide
example : inScopeBool 500_000 = true := by decide
example : inScopeBool 500_001 = false := by decide
example : inScope 500_000 ↔ specInScope 500_000 := agree_scope 500_000
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax71_14UpTo500k
