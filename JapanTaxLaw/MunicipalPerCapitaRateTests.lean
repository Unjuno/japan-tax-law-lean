import JapanTaxLaw.MunicipalPerCapitaRate

/-! Kernel-decided smoke checks. -/

namespace JapanTaxLaw.MunicipalPerCapitaRate

example : municipalPerCapitaRate = 3000 := by decide
example : municipalPerCapitaRate > 0 := by decide
example : municipalPerCapitaRate ≠ 30000 := by decide

end JapanTaxLaw.MunicipalPerCapitaRate
