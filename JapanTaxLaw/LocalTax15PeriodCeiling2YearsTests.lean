import JapanTaxLaw.LocalTax15PeriodCeiling2YearsSpec
/- Kernel-decided boundary checks for 「ただし、その期間は、既にその者につき徴収の猶予をした期間と合わせて二年を超えることができない。」. -/
namespace JapanTaxLaw.LocalTax15PeriodCeiling2Years
open JapanTaxLaw.TaxFinance
example : inScope 0 := by unfold inScope ceiling; decide
example : inScope 1 := by unfold inScope ceiling; decide
example : inScope 2 := by unfold inScope ceiling; decide
example : ¬ inScope 3 := by unfold inScope ceiling; decide
example : inScopeBool 0 = true := by decide
example : inScopeBool 1 = true := by decide
example : inScopeBool 2 = true := by decide
example : inScopeBool 3 = false := by decide
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Money) : inScope a ↔ specInScope a := agree_scope a
end JapanTaxLaw.LocalTax15PeriodCeiling2Years
