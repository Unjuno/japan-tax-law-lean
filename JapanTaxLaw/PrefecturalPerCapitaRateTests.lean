import JapanTaxLaw.PrefecturalPerCapitaRate

/-! Kernel-decided smoke checks. -/

namespace JapanTaxLaw.PrefecturalPerCapitaRate

example : prefecturalPerCapitaRate = 1000 := by decide
example : prefecturalPerCapitaRate > 0 := by decide
example : prefecturalPerCapitaRate ≠ 10000 := by decide

end JapanTaxLaw.PrefecturalPerCapitaRate
