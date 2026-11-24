import JapanTaxLaw.OkinawaEquip5MSpec

/-! Kernel-decided boundary examples: 0/4999999/5000000/5000001 円. -/

namespace JapanTaxLaw.OkinawaEquip5MTests

open JapanTaxLaw.OkinawaEquip5M
open JapanTaxLaw.OkinawaEquip5MSpec

example : exceedsEquip5M 0 = false := by decide
example : exceedsEquip5M 4999999 = false := by decide
example : exceedsEquip5M 5000000 = false := by decide
example : exceedsEquip5M 5000001 = true := by decide
example : specWithin 4999999 = false := by decide
example : specWithin 5000000 = false := by decide
example : specWithin 5000001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 4999999 := agree_thm 4999999
example : agree 5000000 := agree_thm 5000000
example : agree 5000001 := agree_thm 5000001

end JapanTaxLaw.OkinawaEquip5MTests
