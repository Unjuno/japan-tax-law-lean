import JapanTaxLaw.LocalTax34IncomeUpTo24MSpec
/- Kernel-decided boundary checks for 「当該納税義務者の前年の合計所得金額が二千四百万円以下である場合」. -/
namespace JapanTaxLaw.LocalTax34IncomeUpTo24M
open JapanTaxLaw.TaxFinance
example : inScope 0 := by unfold inScope threshold; decide
example : inScope 1 := by unfold inScope threshold; decide
example : inScope 24_000_000 := by unfold inScope threshold; decide
example : ¬ inScope 24_000_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = true := by decide
example : inScopeBool 1 = true := by decide
example : inScopeBool 24_000_000 = true := by decide
example : inScopeBool 24_000_001 = false := by decide
example : inScope 24_000_000 ↔ specInScope 24_000_000 := agree_scope 24_000_000
example (a : Money) : inScope a ↔ specInScope a := agree_scope a
end JapanTaxLaw.LocalTax34IncomeUpTo24M
