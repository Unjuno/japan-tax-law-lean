import JapanTaxLaw.OldLifePremium9kSpec

/-! Kernel-decided boundary examples: 0/8999/9000/9001 円. -/

namespace JapanTaxLaw.OldLifePremium9kTests

open JapanTaxLaw.OldLifePremium9k
open JapanTaxLaw.OldLifePremium9kSpec

example : exceedsOldLife9k 0 = false := by decide
example : exceedsOldLife9k 8999 = false := by decide
example : exceedsOldLife9k 9000 = false := by decide
example : exceedsOldLife9k 9001 = true := by decide
example : specWithin 8999 = false := by decide
example : specWithin 9000 = false := by decide
example : specWithin 9001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 8999 := agree_thm 8999
example : agree 9000 := agree_thm 9000
example : agree 9001 := agree_thm 9001

end JapanTaxLaw.OldLifePremium9kTests
