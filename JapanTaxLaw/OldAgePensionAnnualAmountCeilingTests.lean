import JapanTaxLaw.OldAgePensionAnnualAmountCeilingSpec

/-!
# OldAgePensionAnnualAmountCeilingTests — kernel-checked checks for 地方税法施行令 附則第三条(1)5
-/

namespace JapanTaxLaw.OldAgePensionAnnualAmountCeiling

open JapanTaxLaw.TaxFinance

example : annualCeilingYen = 180_000 := rfl
example : belowAnnualCeiling 179_999 := below_limit
example : ¬ belowAnnualCeiling 180_000 := at_limit
example (a : Money) : belowAnnualCeiling a ↔ specBelowAnnualCeiling a := agree_below_ceiling a

end JapanTaxLaw.OldAgePensionAnnualAmountCeiling
