import JapanTaxLaw.PerMilleSevenPointFive

/-! # PerMilleSevenPointFive tests — 75/10000 算定 (law 332CO0000000043 / art.11) -/

namespace JapanTaxLaw.PerMilleSevenPointFive

example : substituted 0 = 0 := by decide
example : substituted 1 = 0 := by decide
example : substituted 100 = 0 := by decide
example : substituted 10_000 = 75 := by decide
example : substituted 100_000 = 750 := by decide
example : numerator = 75 := by decide
example : denominator = 10_000 := by decide

end JapanTaxLaw.PerMilleSevenPointFive
