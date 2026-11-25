import JapanTaxLaw.TenthsFractionsSpec

/-! Regression tests — 十分のN 相当額, boundaries and universal agreement. -/

namespace JapanTaxLaw.TenthsFractions

example : tenths1 9 = 0 := by decide
example : tenths1 10 = 1 := by decide
example : tenths2 5 = 1 := by decide
example : tenths5 3 = 1 := by decide
example : tenths7 19 = 13 := by decide
example : tenths9 19 = 17 := by decide

example : tenths2 1_234 = specTenths2 1_234 := tenths2_agrees 1_234
example : tenths5 1_234 = specTenths5 1_234 := tenths5_agrees 1_234
example : tenths7 1_234 = specTenths7 1_234 := tenths7_agrees 1_234
example : tenths9 1_234 = specTenths9 1_234 := tenths9_agrees 1_234

end JapanTaxLaw.TenthsFractions
