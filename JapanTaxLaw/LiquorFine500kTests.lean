import JapanTaxLaw.LiquorFine500kSpec

/-! Kernel-decided boundary examples: 0/499999/500000/500001 円. -/

namespace JapanTaxLaw.LiquorFine500kTests

open JapanTaxLaw.LiquorFine500k
open JapanTaxLaw.LiquorFine500kSpec

example : withinLiquorFine 0 = true := by decide
example : withinLiquorFine 499999 = true := by decide
example : withinLiquorFine 500000 = true := by decide
example : withinLiquorFine 500001 = false := by decide
example : specWithin 499999 = true := by decide
example : specWithin 500000 = true := by decide
example : specWithin 500001 = false := by decide
example : agree 0 := agree_thm 0
example : agree 499999 := agree_thm 499999
example : agree 500000 := agree_thm 500000
example : agree 500001 := agree_thm 500001

end JapanTaxLaw.LiquorFine500kTests
