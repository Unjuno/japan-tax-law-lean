import JapanTaxLaw.LocalTax34OldLifeInsurance70kSpec

/- Kernel-decided boundary checks for 「前年中に支払つた旧生命保険料の金額の合計額が七万円を超える場合」. -/
namespace JapanTaxLaw.LocalTax34OldLifeInsurance70k

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : ¬ inScope 69_999 := by unfold inScope threshold; decide
example : ¬ inScope 70_000 := by unfold inScope threshold; decide
example : inScope 70_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 69_999 = false := by decide
example : inScopeBool 70_000 = false := by decide
example : inScopeBool 70_001 = true := by decide
example : inScope 70_001 ↔ specInScope 70_001 := agree_scope 70_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax34OldLifeInsurance70k
