import JapanTaxLaw.CouncilMemberCap30
import JapanTaxLaw.CouncilMemberCap30Spec

/-
# CouncilMemberCap30Tests — kernel-decided boundary + agreement checks

Count cap 三十人以内 = n <= 30, INCLUSIVE at 30. Boundary categories
registered: zero (0), small_input (1), threshold_below (29),
threshold_at (30), threshold_above (31).
-/

namespace JapanTaxLaw.CouncilMemberCap30

example : withinMemberCap 0 = true := by decide
example : withinMemberCap 1 = true := by decide
example : withinMemberCap 29 = true := by decide
example : withinMemberCap 30 = true := by decide
example : withinMemberCap 31 = false := by decide
example : withinMemberCap 50 = false := by decide

example : specWithin 0 = true := by decide
example : specWithin 1 = true := by decide
example : specWithin 29 = true := by decide
example : specWithin 30 = true := by decide
example : specWithin 31 = false := by decide
example : specWithin 50 = false := by decide

example : memberCap = specCap := agreeCap
example : withinMemberCap 0 = specWithin 0 := agreeWithin 0
example : withinMemberCap 1 = specWithin 1 := agreeWithin 1
example : withinMemberCap 29 = specWithin 29 := agreeWithin 29
example : withinMemberCap 30 = specWithin 30 := agreeWithin 30
example : withinMemberCap 31 = specWithin 31 := agreeWithin 31
example : withinMemberCap 50 = specWithin 50 := agreeWithin 50

end JapanTaxLaw.CouncilMemberCap30
