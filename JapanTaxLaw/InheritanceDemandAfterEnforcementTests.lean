import JapanTaxLaw.InheritanceDemandAfterEnforcement

/-! # tests — 施行日境界 (law 325AC0000000073 / art.18) -/

namespace JapanTaxLaw.InheritanceDemandAfterEnforcement

example : applies 0 100 = false := by decide
example : applies 99 100 = false := by decide
example : applies 100 100 = true := by decide
example : applies 101 100 = true := by decide
example : applies 500 100 = true := by decide

end JapanTaxLaw.InheritanceDemandAfterEnforcement
