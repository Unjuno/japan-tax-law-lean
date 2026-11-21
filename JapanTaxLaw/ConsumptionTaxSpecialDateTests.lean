import JapanTaxLaw.ConsumptionTaxSpecialDate

/-!
# ConsumptionTaxSpecialDate tests — 令和3年1月31日 smoke checks
Decidable smoke tests, pinned to law 502CO0000000160 / revision 502CO0000000160_20260401_508CO0000000104.
元号換算 令和3年=2021、1月31日。
-/

namespace JapanTaxLaw.ConsumptionTaxSpecialDate

example : westernYear = 2021 := by decide
example : month = 1 := by decide
example : day = 31 := by decide

end JapanTaxLaw.ConsumptionTaxSpecialDate
