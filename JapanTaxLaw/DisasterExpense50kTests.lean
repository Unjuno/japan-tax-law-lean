import JapanTaxLaw.DisasterExpense50kSpec

/-! Kernel-decided boundary examples: 0/49999/50000/50001 円. -/

namespace JapanTaxLaw.DisasterExpense50kTests

open JapanTaxLaw.DisasterExpense50k
open JapanTaxLaw.DisasterExpense50kSpec

example : exceedsDisasterExpense50k 0 = false := by decide
example : exceedsDisasterExpense50k 49999 = false := by decide
example : exceedsDisasterExpense50k 50000 = false := by decide
example : exceedsDisasterExpense50k 50001 = true := by decide
example : specWithin 49999 = false := by decide
example : specWithin 50000 = false := by decide
example : specWithin 50001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 49999 := agree_thm 49999
example : agree 50000 := agree_thm 50000
example : agree 50001 := agree_thm 50001

end JapanTaxLaw.DisasterExpense50kTests
