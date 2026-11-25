import JapanTaxLaw.LocalTax72_24_7UpTo4MSpec

/- Kernel-decided boundary checks for 「各事業年度の所得のうち年四百万円以下の金額」. -/
namespace JapanTaxLaw.LocalTax72_24_7UpTo4M

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide
example : inScope 1 := by unfold inScope threshold; decide
example : inScope 3_999_999 := by unfold inScope threshold; decide
example : inScope 4_000_000 := by unfold inScope threshold; decide
example : ¬ inScope 4_000_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = true := by decide
example : inScopeBool 1 = true := by decide
example : inScopeBool 3_999_999 = true := by decide
example : inScopeBool 4_000_000 = true := by decide
example : inScopeBool 4_000_001 = false := by decide
example : inScope 4_000_000 ↔ specInScope 4_000_000 := agree_scope 4_000_000
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_24_7UpTo4M
