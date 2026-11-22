import JapanTaxLaw.FineCap200kSpec

/-! Kernel-decided boundary examples: 0/199999/200000/200001 円. -/

namespace JapanTaxLaw.FineCap200kTests

open JapanTaxLaw.FineCap200k
open JapanTaxLaw.FineCap200kSpec

example : withinFine 0 = true := by decide
example : withinFine 199999 = true := by decide
example : withinFine 200000 = true := by decide
example : withinFine 200001 = false := by decide
example : specWithin 199999 = true := by decide
example : specWithin 200000 = true := by decide
example : specWithin 200001 = false := by decide
example : agree 0 := agree_thm 0
example : agree 199999 := agree_thm 199999
example : agree 200000 := agree_thm 200000
example : agree 200001 := agree_thm 200001

end JapanTaxLaw.FineCap200kTests
