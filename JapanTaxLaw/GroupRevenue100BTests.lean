import JapanTaxLaw.GroupRevenue100BSpec

/-! Kernel-decided boundary examples: 0/99999999999/100000000000/100000000001 円. -/

namespace JapanTaxLaw.GroupRevenue100BTests

open JapanTaxLaw.GroupRevenue100B
open JapanTaxLaw.GroupRevenue100BSpec

example : hasRevenue100B 0 = false := by decide
example : hasRevenue100B 99999999999 = false := by decide
example : hasRevenue100B 100000000000 = true := by decide
example : hasRevenue100B 100000000001 = true := by decide
example : specWithin 99999999999 = false := by decide
example : specWithin 100000000000 = true := by decide
example : specWithin 100000000001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 99999999999 := agree_thm 99999999999
example : agree 100000000000 := agree_thm 100000000000
example : agree 100000000001 := agree_thm 100000000001

end JapanTaxLaw.GroupRevenue100BTests
