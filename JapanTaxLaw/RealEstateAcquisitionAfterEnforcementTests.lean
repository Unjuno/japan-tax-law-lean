import JapanTaxLaw.RealEstateAcquisitionAfterEnforcement

/-! # tests — 施行日境界 (law 325AC0000000226 / art.15) -/

namespace JapanTaxLaw.RealEstateAcquisitionAfterEnforcement

example : applies 0 100 = false := by decide
example : applies 99 100 = false := by decide
example : applies 100 100 = true := by decide
example : applies 101 100 = true := by decide
example : applies 200 100 = true := by decide

end JapanTaxLaw.RealEstateAcquisitionAfterEnforcement
