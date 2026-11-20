import JapanTaxLaw.LocalGasolineRate

/-! Kernel-decided smoke checks for 地方揮発油税法 art.4. -/

namespace JapanTaxLaw.LocalGasolineRate

example : localGasolineRate = 4_400 := by decide
example : localGasolineRate > 0 := by decide
example : localGasolineRate ≠ 440 := by decide
example : localGasolineRate ≠ 44_000 := by decide

end JapanTaxLaw.LocalGasolineRate
