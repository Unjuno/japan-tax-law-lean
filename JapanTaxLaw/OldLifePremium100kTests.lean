import JapanTaxLaw.OldLifePremium100kSpec

/-! Kernel-decided boundary examples: 0/99999/100000/100001 円. -/

namespace JapanTaxLaw.OldLifePremium100kTests

open JapanTaxLaw.OldLifePremium100k
open JapanTaxLaw.OldLifePremium100kSpec

example : exceedsOldLife100k 0 = false := by decide
example : exceedsOldLife100k 99999 = false := by decide
example : exceedsOldLife100k 100000 = false := by decide
example : exceedsOldLife100k 100001 = true := by decide
example : specWithin 99999 = false := by decide
example : specWithin 100000 = false := by decide
example : specWithin 100001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 99999 := agree_thm 99999
example : agree 100000 := agree_thm 100000
example : agree 100001 := agree_thm 100001

end JapanTaxLaw.OldLifePremium100kTests
