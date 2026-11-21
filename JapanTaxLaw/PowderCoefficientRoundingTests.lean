import JapanTaxLaw.PowderCoefficientRounding

/-!
# PowderCoefficientRounding tests — 粉末酒換算係数 端数計算 smoke checks
Decidable smoke tests, pinned to law 337M50000040026 / revision 337M50000040026_20250401_507M60000040034.
第三位未満/第二位未満の切捨て境界。
-/

namespace JapanTaxLaw.PowderCoefficientRounding

example : truncate3 0 = 0 := by decide
example : truncate3 12_345 = 12_340 := by decide
example : truncate3 12_349 = 12_340 := by decide
example : truncate2 12_345 = 12_300 := by decide
example : truncate2 12_999 = 12_900 := by decide
example : truncate2 10_000 = 10_000 := by decide

end JapanTaxLaw.PowderCoefficientRounding
