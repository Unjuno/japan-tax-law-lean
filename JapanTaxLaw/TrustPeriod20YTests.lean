import JapanTaxLaw.TrustPeriod20YSpec

/-! Kernel-decided boundary examples: 0/19/20/21 年. -/

namespace JapanTaxLaw.TrustPeriod20YTests

open JapanTaxLaw.TrustPeriod20Y
open JapanTaxLaw.TrustPeriod20YSpec

example : hasTrust20Y 0 = false := by decide
example : hasTrust20Y 19 = false := by decide
example : hasTrust20Y 20 = true := by decide
example : hasTrust20Y 21 = true := by decide
example : specWithin 19 = false := by decide
example : specWithin 20 = true := by decide
example : specWithin 21 = true := by decide
example : agree 0 := agree_thm 0
example : agree 19 := agree_thm 19
example : agree 20 := agree_thm 20
example : agree 21 := agree_thm 21

end JapanTaxLaw.TrustPeriod20YTests
