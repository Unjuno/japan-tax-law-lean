import JapanTaxLaw.LocalTax34IncomeUpTo9MSpec

/- Kernel-decided boundary checks for 「当該納税義務者の前年の合計所得金額が九百万円以下である場合」. -/
namespace JapanTaxLaw.LocalTax34IncomeUpTo9M

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide
example : inScope 1 := by unfold inScope threshold; decide
example : inScope 8_999_999 := by unfold inScope threshold; decide
example : inScope 9_000_000 := by unfold inScope threshold; decide
example : ¬ inScope 9_000_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = true := by decide
example : inScopeBool 1 = true := by decide
example : inScopeBool 8_999_999 = true := by decide
example : inScopeBool 9_000_000 = true := by decide
example : inScopeBool 9_000_001 = false := by decide
example : inScope 9_000_000 ↔ specInScope 9_000_000 := agree_scope 9_000_000
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax34IncomeUpTo9M
