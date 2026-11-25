import JapanTaxLaw.RegTax41_19_3IndividualIncomeOver10MSpec
/- Kernel-decided boundary checks for 「ただし、当該個人のその年分の所得税に係る合計所得金額が千万円を超える場合には、この限りでない。」. -/
namespace JapanTaxLaw.RegTax41_19_3IndividualIncomeOver10M
open JapanTaxLaw.TaxFinance
example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : ¬ inScope 9_999_999 := by unfold inScope threshold; decide
example : ¬ inScope 10_000_000 := by unfold inScope threshold; decide
example : inScope 10_000_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 9_999_999 = false := by decide
example : inScopeBool 10_000_000 = false := by decide
example : inScopeBool 10_000_001 = true := by decide
example : inScope 10_000_000 ↔ specInScope 10_000_000 := agree_scope 10_000_000
example (a : Money) : inScope a ↔ specInScope a := agree_scope a
end JapanTaxLaw.RegTax41_19_3IndividualIncomeOver10M
