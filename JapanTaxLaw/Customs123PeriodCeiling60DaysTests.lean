import JapanTaxLaw.Customs123PeriodCeiling60DaysSpec
/- Kernel-decided boundary checks for 「ただし、消去しないよう求める期間は、通じて六十日を超えることができない。」. -/
namespace JapanTaxLaw.Customs123PeriodCeiling60Days
open JapanTaxLaw.TaxFinance
example : inScope 0 := by unfold inScope ceiling; decide
example : inScope 1 := by unfold inScope ceiling; decide
example : inScope 60 := by unfold inScope ceiling; decide
example : ¬ inScope 61 := by unfold inScope ceiling; decide
example : inScopeBool 0 = true := by decide
example : inScopeBool 1 = true := by decide
example : inScopeBool 60 = true := by decide
example : inScopeBool 61 = false := by decide
example : inScope 60 ↔ specInScope 60 := agree_scope 60
example (a : Money) : inScope a ↔ specInScope a := agree_scope a
end JapanTaxLaw.Customs123PeriodCeiling60Days
