import JapanTaxLaw.HalfSenRoundingSpec

/-! Regression tests — 五十銭 half boundary and universal agreement. -/

namespace JapanTaxLaw.HalfSenRounding

example : roundSen 0 = 0 := by decide
example : roundSen 50 = 100 := by decide
example : roundSen 9_950 = 10_000 := by decide
example : roundSen 149 = specRoundSen 149 := agreeRoundSen 149
example : roundSen 150 = specRoundSen 150 := agreeRoundSen 150

end JapanTaxLaw.HalfSenRounding
