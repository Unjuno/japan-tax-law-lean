import JapanTaxLaw.OfficeFeeSpecialWardAmount

/-! # OfficeFeeSpecialWardAmount tests — 二つの額 (law 325AC0000000226 / art.734) -/

namespace JapanTaxLaw.OfficeFeeSpecialWardAmount

example : outsideWardsAmount = 1_750_000 := by decide
example : otherAmount = 2_290_000 := by decide
example : amount true = 1_750_000 := by decide
example : amount false = 2_290_000 := by decide

end JapanTaxLaw.OfficeFeeSpecialWardAmount
