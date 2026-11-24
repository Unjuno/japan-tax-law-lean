import JapanTaxLaw.LiquorFine100kSpec

/-! Kernel-decided boundary examples: 0/99999/100000/100001 円. -/

namespace JapanTaxLaw.LiquorFine100kTests

open JapanTaxLaw.LiquorFine100k
open JapanTaxLaw.LiquorFine100kSpec

example : withinLiquorFine100k 0 = true := by decide
example : withinLiquorFine100k 99999 = true := by decide
example : withinLiquorFine100k 100000 = true := by decide
example : withinLiquorFine100k 100001 = false := by decide
example : specWithin 99999 = true := by decide
example : specWithin 100000 = true := by decide
example : specWithin 100001 = false := by decide
example : agree 0 := agree_thm 0
example : agree 99999 := agree_thm 99999
example : agree 100000 := agree_thm 100000
example : agree 100001 := agree_thm 100001

end JapanTaxLaw.LiquorFine100kTests
