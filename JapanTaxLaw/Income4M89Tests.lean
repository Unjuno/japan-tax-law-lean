import JapanTaxLaw.Income4M89Spec

/-! Kernel-decided boundary examples: 0/4889999/4890000/4890001 円. -/

namespace JapanTaxLaw.Income4M89Tests

open JapanTaxLaw.Income4M89
open JapanTaxLaw.Income4M89Spec

example : exceedsIncome4M89 0 = false := by decide
example : exceedsIncome4M89 4889999 = false := by decide
example : exceedsIncome4M89 4890000 = false := by decide
example : exceedsIncome4M89 4890001 = true := by decide
example : specWithin 4889999 = false := by decide
example : specWithin 4890000 = false := by decide
example : specWithin 4890001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 4889999 := agree_thm 4889999
example : agree 4890000 := agree_thm 4890000
example : agree 4890001 := agree_thm 4890001

end JapanTaxLaw.Income4M89Tests
