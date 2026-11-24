import JapanTaxLaw.LocalTax34DisasterExpense50kSpec

/- Kernel-decided boundary checks for 「損失の金額に含まれる災害関連支出の金額が五万円を超える場合」. -/
namespace JapanTaxLaw.LocalTax34DisasterExpense50k

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : ¬ inScope 49_999 := by unfold inScope threshold; decide
example : ¬ inScope 50_000 := by unfold inScope threshold; decide
example : inScope 50_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 49_999 = false := by decide
example : inScopeBool 50_000 = false := by decide
example : inScopeBool 50_001 = true := by decide
example : inScope 50_001 ↔ specInScope 50_001 := agree_scope 50_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax34DisasterExpense50k
