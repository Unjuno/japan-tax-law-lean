import JapanTaxLaw.EnforcementDatesSpec

/-! Regression tests — 元号変換とカレンダー境界. -/

namespace JapanTaxLaw.EnforcementDates

example : eraBaseYear Era.showa = 1925 := by decide
example : eraBaseYear Era.heisei = 1988 := by decide
example : eraBaseYear Era.reiwa = 2018 := by decide
example : toWesternYear Era.showa 42 = 1967 := by decide
example : toWesternYear Era.heisei 8 = 1996 := by decide
example : toWesternYear Era.reiwa 8 = 2026 := by decide
example : toWesternYear Era.reiwa 8 > 8 := agreeEraConversion Era.reiwa 8
example : specValidDate Era.reiwa 8 11 15 :=
  specDateBounds 8 11 15 (by decide) (by decide) (by decide)

end JapanTaxLaw.EnforcementDates
