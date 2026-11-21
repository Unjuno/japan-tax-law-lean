import JapanTaxLaw.RawMaterialRatio

/-!
# RawMaterialRatio tests — 関税定率法施行規則 art.1の2 smoke checks
Decidable smoke tests, pinned to law 344M50000040016 / revision 344M50000040016_20260401_508M60000040016.
60% 閾値、0/100/1000/10000。
-/

namespace JapanTaxLaw.RawMaterialRatio

example : thresholdYen 0 = 0 := by decide
example : thresholdYen 100 = 60 := by decide
example : thresholdYen 1000 = 600 := by decide
example : thresholdYen 10000 = 6000 := by decide

end JapanTaxLaw.RawMaterialRatio
