import JapanTaxLaw.LocalCorp24_5_100MSpec

/-! Kernel-decided boundary examples: 0/99999999/100000000/100000001 円. -/

namespace JapanTaxLaw.LocalCorp24_5_100MTests

open JapanTaxLaw.LocalCorp24_5_100M
open JapanTaxLaw.LocalCorp24_5_100MSpec

example : exceedsLocalCapital24_5 0 = false := by decide
example : exceedsLocalCapital24_5 99999999 = false := by decide
example : exceedsLocalCapital24_5 100000000 = false := by decide
example : exceedsLocalCapital24_5 100000001 = true := by decide
example : specWithin 99999999 = false := by decide
example : specWithin 100000000 = false := by decide
example : specWithin 100000001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 99999999 := agree_thm 99999999
example : agree 100000000 := agree_thm 100000000
example : agree 100000001 := agree_thm 100000001

end JapanTaxLaw.LocalCorp24_5_100MTests
