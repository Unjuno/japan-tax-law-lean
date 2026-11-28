import JapanTaxLaw.ForeignVessel24HourDeparture
import JapanTaxLaw.ForeignVessel24HourDepartureSpec

/-
# ForeignVessel24HourDepartureTests — 関税法施行規則 2の2(3)(4) の kernel-decided 検証

Pinned: law 341M50000040055 / revision 341M50000040055_20260601_508M60000040016.
Coverage: 二十四=24, inclusive upper boundary (24 true / 25 false), zero and
small inputs, impl/spec agreement.
-/

namespace JapanTaxLaw.ForeignVessel24HourDeparture

example : hourLimit = 24 := by decide

-- 「以内」境界
example : within24h 0 = true := by decide
example : within24h 1 = true := by decide
example : within24h 23 = true := by decide
example : within24h 24 = true := by decide
example : within24h 25 = false := by decide
example : within24h 100 = false := by decide

-- impl / 独立仕様の一致
example : hourLimit = spec24 := by decide
example : within24h 0 = specWithin24 0 := by decide
example : within24h 1 = specWithin24 1 := by decide
example : within24h 23 = specWithin24 23 := by decide
example : within24h 24 = specWithin24 24 := by decide
example : within24h 25 = specWithin24 25 := by decide
example : within24h 100 = specWithin24 100 := by decide

end JapanTaxLaw.ForeignVessel24HourDeparture
