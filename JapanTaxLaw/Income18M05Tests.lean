import JapanTaxLaw.Income18M05Spec

/-! Kernel-decided boundary examples: 0/18049999/18050000/18050001 円. -/

namespace JapanTaxLaw.Income18M05Tests

open JapanTaxLaw.Income18M05
open JapanTaxLaw.Income18M05Spec

example : exceedsIncome18M05 0 = false := by decide
example : exceedsIncome18M05 18049999 = false := by decide
example : exceedsIncome18M05 18050000 = false := by decide
example : exceedsIncome18M05 18050001 = true := by decide
example : specWithin 18049999 = false := by decide
example : specWithin 18050000 = false := by decide
example : specWithin 18050001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 18049999 := agree_thm 18049999
example : agree 18050000 := agree_thm 18050000
example : agree 18050001 := agree_thm 18050001

end JapanTaxLaw.Income18M05Tests
