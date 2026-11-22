import JapanTaxLaw.GolfRateCeiling1200Spec

/-! Kernel-decided boundary examples: 0/1199/1200/1201 円. -/

namespace JapanTaxLaw.GolfRateCeiling1200Tests

open JapanTaxLaw.GolfRateCeiling1200
open JapanTaxLaw.GolfRateCeiling1200Spec

example : withinGolfRate 0 = true := by decide
example : withinGolfRate 1199 = true := by decide
example : withinGolfRate 1200 = true := by decide
example : withinGolfRate 1201 = false := by decide
example : specWithin 1199 = true := by decide
example : specWithin 1200 = true := by decide
example : specWithin 1201 = false := by decide
example : agree 0 := agree_thm 0
example : agree 1199 := agree_thm 1199
example : agree 1200 := agree_thm 1200
example : agree 1201 := agree_thm 1201

end JapanTaxLaw.GolfRateCeiling1200Tests
