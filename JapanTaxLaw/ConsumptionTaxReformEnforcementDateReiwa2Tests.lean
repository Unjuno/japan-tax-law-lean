import JapanTaxLaw.ConsumptionTaxReformEnforcementDateReiwa2Spec

/-
# ConsumptionTaxReformEnforcementDateReiwa2Tests — kernel-decided checks for 消費税抜本改革法 附則第一条

Closed Nat/Bool expressions discharged by `by decide`, or theorem applications.
-/

namespace JapanTaxLaw.ConsumptionTaxReformEnforcementDateReiwa2

example : enforcementEraYear = 2 := rfl
example : enforcementMonth = 4 := rfl
example : enforcementDay = 1 := rfl
example : isEnforcementDate 2 4 1 = true := by decide
example : isEnforcementDate 1 4 1 = false := by decide
example : isEnforcementDate 2 4 2 = false := by decide
example : isEnforcementDate 2 5 1 = false := by decide
example : isEnforcementDate 2 4 1 = specIsEnforcementDate 2 4 1 := by decide
example (y m d : Nat) : isEnforcementDate y m d = specIsEnforcementDate y m d := agree_enforcement_date y m d

end JapanTaxLaw.ConsumptionTaxReformEnforcementDateReiwa2
