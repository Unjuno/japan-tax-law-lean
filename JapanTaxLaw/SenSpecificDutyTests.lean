import JapanTaxLaw.SenSpecificDutySpec

/-! Regression tests — 銭単位従量税額, boundaries and universal agreement. -/

namespace JapanTaxLaw.SenSpecificDuty

example : senDuty 99 152 = 150 := by decide
example : senDuty 100 152 = 152 := by decide
example : senDuty 1_000 152 = 1_520 := by decide

example : senDuty 7_777 152 = specSenDuty 7_777 152 := agrees 7_777 152
example : senDuty 1 152 = specSenDuty 1 152 := agrees 1 152

end JapanTaxLaw.SenSpecificDuty
