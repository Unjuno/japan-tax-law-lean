import JapanTaxLaw.LandRatioRoundDownSpec

/-! Regression tests — 地価税法施行令 23条2項 (百分の十未満の端数切り捨て). -/

namespace JapanTaxLaw.LandRatioRoundDown

example : step = 10 := by decide
example : roundDownTenths 0 = 0 := by decide
example : roundDownTenths 1 = 0 := by decide
example : roundDownTenths 9 = 0 := by decide
example : roundDownTenths 10 = 10 := by decide
example : roundDownTenths 11 = 10 := by decide
example : roundDownTenths 47 = 40 := by decide
example : roundDownTenths 100 = 100 := by decide

example : specRounded 47 (roundDownTenths 47) := agreeRoundDown 47
example : roundDownTenths 9 = roundDownTenths 0 := by decide

end JapanTaxLaw.LandRatioRoundDown
