import JapanTaxLaw.Income1320kSpec

/-! Kernel-decided boundary examples: 0/1319999/1320000/1320001 円. -/

namespace JapanTaxLaw.Income1320kTests

open JapanTaxLaw.Income1320k
open JapanTaxLaw.Income1320kSpec

example : withinIncome1320k 0 = true := by decide
example : withinIncome1320k 1319999 = true := by decide
example : withinIncome1320k 1320000 = true := by decide
example : withinIncome1320k 1320001 = false := by decide
example : specWithin 1319999 = true := by decide
example : specWithin 1320000 = true := by decide
example : specWithin 1320001 = false := by decide
example : agree 0 := agree_thm 0
example : agree 1319999 := agree_thm 1319999
example : agree 1320000 := agree_thm 1320000
example : agree 1320001 := agree_thm 1320001

end JapanTaxLaw.Income1320kTests
