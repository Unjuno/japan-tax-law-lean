import JapanTaxLaw.LocalTax72_21UpTo100BSpec

/- Kernel-decided boundary checks for 「千億円以下の金額」. -/
namespace JapanTaxLaw.LocalTax72_21UpTo100B

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide
example : inScope 1 := by unfold inScope threshold; decide
example : inScope 99_999_999_999 := by unfold inScope threshold; decide
example : inScope 100_000_000_000 := by unfold inScope threshold; decide
example : ¬ inScope 100_000_000_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = true := by decide
example : inScopeBool 1 = true := by decide
example : inScopeBool 99_999_999_999 = true := by decide
example : inScopeBool 100_000_000_000 = true := by decide
example : inScopeBool 100_000_000_001 = false := by decide
example : inScope 100_000_000_000 ↔ specInScope 100_000_000_000 := agree_scope 100_000_000_000
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_21UpTo100B
