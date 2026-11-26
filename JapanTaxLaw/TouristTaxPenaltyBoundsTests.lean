import JapanTaxLaw.TouristTaxPenaltyBounds

/-!
# TouristTaxPenaltyBounds tests — kernel-decided boundary examples
Pinned to law 430AC0000000016, revision 430AC0000000016_20260701_508AC0000000012, art. 25(1).
Bounds: prison <= 1 year or fine <= 500000 yen.
-/

namespace JapanTaxLaw.TouristTaxPenaltyBounds

example : withinPenalty 0 0 = true := by decide
example : withinPenalty 1 999999 = true := by decide
example : withinPenalty 2 499999 = true := by decide
example : withinPenalty 2 500000 = true := by decide
example : withinPenalty 2 500001 = false := by decide
example : withinPenalty 3 999999 = false := by decide

end JapanTaxLaw.TouristTaxPenaltyBounds
