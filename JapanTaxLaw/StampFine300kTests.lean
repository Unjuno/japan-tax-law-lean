import JapanTaxLaw.StampFine300kSpec

/-! Kernel-decided boundary examples: 0/299999/300000/300001 円. -/

namespace JapanTaxLaw.StampFine300kTests

open JapanTaxLaw.StampFine300k
open JapanTaxLaw.StampFine300kSpec

example : withinStampFine 0 = true := by decide
example : withinStampFine 299999 = true := by decide
example : withinStampFine 300000 = true := by decide
example : withinStampFine 300001 = false := by decide
example : specWithin 299999 = true := by decide
example : specWithin 300000 = true := by decide
example : specWithin 300001 = false := by decide
example : agree 0 := agree_thm 0
example : agree 299999 := agree_thm 299999
example : agree 300000 := agree_thm 300000
example : agree 300001 := agree_thm 300001

end JapanTaxLaw.StampFine300kTests
