import JapanTaxLaw.OldLongTermPremium20kSpec

/-! Kernel-decided boundary examples: 0/19999/20000/20001 円. -/

namespace JapanTaxLaw.OldLongTermPremium20kTests

open JapanTaxLaw.OldLongTermPremium20k
open JapanTaxLaw.OldLongTermPremium20kSpec

example : exceedsPremium20k 0 = false := by decide
example : exceedsPremium20k 19999 = false := by decide
example : exceedsPremium20k 20000 = false := by decide
example : exceedsPremium20k 20001 = true := by decide
example : specWithin 19999 = false := by decide
example : specWithin 20000 = false := by decide
example : specWithin 20001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 19999 := agree_thm 19999
example : agree 20000 := agree_thm 20000
example : agree 20001 := agree_thm 20001

end JapanTaxLaw.OldLongTermPremium20kTests
