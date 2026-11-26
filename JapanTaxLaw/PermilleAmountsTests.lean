import JapanTaxLaw.PermilleAmountsSpec

/-! Regression tests — 小数千分率, boundaries and universal agreement. -/

namespace JapanTaxLaw.PermilleAmounts

example : per85 1 = 0 := by decide
example : per85 235 = 1 := by decide
example : per136 1_000 = 13 := by decide
example : per252 1_000 = 2 := by decide

example : per85 123_456 = spec85 123_456 := agreePer85 123_456
example : per136 123_456 = spec136 123_456 := agreePer136 123_456
example : per122 123_456 = spec122 123_456 := agreePer122 123_456
example : per42 123_456 = spec42 123_456 := agreePer42 123_456
example : per252 123_456 = spec252 123_456 := agreePer252 123_456
example : per104 123_456 = spec104 123_456 := agreePer104 123_456

end JapanTaxLaw.PermilleAmounts
