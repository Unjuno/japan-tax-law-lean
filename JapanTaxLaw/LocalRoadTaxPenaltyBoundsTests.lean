import JapanTaxLaw.LocalRoadTaxPenaltyBounds

/-!
# LocalRoadTaxPenaltyBounds tests — kernel-decided boundary examples
Pinned to law 330AC0000000104, revision 330AC0000000104_20260401_508AC0000000012, art. 15(1).
Bounds: prison <= 10 years or fine <= 1000000 yen.
-/

namespace JapanTaxLaw.LocalRoadTaxPenaltyBounds

example : withinPenalty 0 0 = true := by decide
example : withinPenalty 1 0 = true := by decide
example : withinPenalty 9 9999999 = true := by decide
example : withinPenalty 10 9999999 = true := by decide
example : withinPenalty 11 1000000 = true := by decide
example : withinPenalty 11 1000001 = false := by decide

end JapanTaxLaw.LocalRoadTaxPenaltyBounds
