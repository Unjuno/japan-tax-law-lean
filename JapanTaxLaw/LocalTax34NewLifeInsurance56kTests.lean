import JapanTaxLaw.LocalTax34NewLifeInsurance56kSpec

/- Kernel-decided boundary checks for 「前年中に支払つた新生命保険料の金額の合計額が五万六千円を超える場合」. -/
namespace JapanTaxLaw.LocalTax34NewLifeInsurance56k

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : ¬ inScope 55_999 := by unfold inScope threshold; decide
example : ¬ inScope 56_000 := by unfold inScope threshold; decide
example : inScope 56_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 55_999 = false := by decide
example : inScopeBool 56_000 = false := by decide
example : inScopeBool 56_001 = true := by decide
example : inScope 56_001 ↔ specInScope 56_001 := agree_scope 56_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax34NewLifeInsurance56k
