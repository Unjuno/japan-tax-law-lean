import JapanTaxLaw.UsForcesTreatyEnforcementDateReiwa8Spec

/-
# UsForcesTreatyEnforcementDateReiwa8Tests — kernel-decided checks for 米軍地位協定国税臨時特例法 附則第一条

Closed Nat/Bool expressions discharged by `by decide`, or theorem applications.
-/

namespace JapanTaxLaw.UsForcesTreatyEnforcementDateReiwa8

example : enforcementEraYear = 8 := rfl
example : enforcementMonth = 4 := rfl
example : enforcementDay = 1 := rfl
example : isEnforcementDate 8 4 1 = true := by decide
example : isEnforcementDate 7 4 1 = false := by decide
example : isEnforcementDate 8 4 2 = false := by decide
example : isEnforcementDate 8 5 1 = false := by decide
example : isEnforcementDate 8 4 1 = specIsEnforcementDate 8 4 1 := by decide
example (y m d : Nat) : isEnforcementDate y m d = specIsEnforcementDate y m d := agree_enforcement_date y m d

end JapanTaxLaw.UsForcesTreatyEnforcementDateReiwa8
