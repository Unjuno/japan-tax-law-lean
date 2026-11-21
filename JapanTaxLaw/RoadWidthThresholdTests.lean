import JapanTaxLaw.RoadWidthThreshold

/-!
# RoadWidthThreshold tests — 石油ガス譲与税法施行規則 art.1 smoke checks
Decidable smoke tests, pinned to law 341M50000008002 / revision 341M50000008002_20191128_501M60000008059.
境界: 24→true / 25→false / 26→false（1/10m 単位）。
-/

namespace JapanTaxLaw.RoadWidthThreshold

example : widthThresholdDm = 25 := by decide
example : isNarrowRoad 0 = true := by decide
example : isNarrowRoad 24 = true := by decide
example : isNarrowRoad 25 = false := by decide
example : isNarrowRoad 26 = false := by decide
example : isNarrowRoad 100 = false := by decide

end JapanTaxLaw.RoadWidthThreshold
