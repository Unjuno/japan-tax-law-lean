import JapanTaxLaw.LocalOrdinanceTwoThirdsMajoritySpec

/-! Kernel-decided boundary examples for the 2/3 supermajority. -/

namespace JapanTaxLaw.LocalOrdinanceTwoThirdsMajorityTests

open JapanTaxLaw.LocalOrdinanceTwoThirdsMajority
open JapanTaxLaw.LocalOrdinanceTwoThirdsMajoritySpec

example : hasTwoThirds 0 0 = false := by decide
example : hasTwoThirds 0 9 = false := by decide
example : hasTwoThirds 5 9 = false := by decide
example : hasTwoThirds 6 9 = true := by decide
example : hasTwoThirds 7 9 = true := by decide
example : hasTwoThirds 1 1 = true := by decide
example : hasTwoThirds 2 3 = true := by decide
example : hasTwoThirds 1 3 = false := by decide
example : hasTwoThirds 2 2 = true := by decide
example : agree 0 0 := agree_thm 0 0
example : agree 0 9 := agree_thm 0 9
example : agree 5 9 := agree_thm 5 9
example : agree 6 9 := agree_thm 6 9
example : agree 7 9 := agree_thm 7 9
example : agree 1 1 := agree_thm 1 1

end JapanTaxLaw.LocalOrdinanceTwoThirdsMajorityTests
