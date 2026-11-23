import JapanTaxLaw.RetirementAggregate3MSpec

/-! Kernel-decided boundary examples: 0/2999999/3000000/3000001 円. -/

namespace JapanTaxLaw.RetirementAggregate3MTests

open JapanTaxLaw.RetirementAggregate3M
open JapanTaxLaw.RetirementAggregate3MSpec

example : withinAggregate3M 0 = true := by decide
example : withinAggregate3M 2999999 = true := by decide
example : withinAggregate3M 3000000 = true := by decide
example : withinAggregate3M 3000001 = false := by decide
example : specWithin 2999999 = true := by decide
example : specWithin 3000000 = true := by decide
example : specWithin 3000001 = false := by decide
example : agree 0 := agree_thm 0
example : agree 2999999 := agree_thm 2999999
example : agree 3000000 := agree_thm 3000000
example : agree 3000001 := agree_thm 3000001

end JapanTaxLaw.RetirementAggregate3MTests
