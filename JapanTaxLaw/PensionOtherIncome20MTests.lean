import JapanTaxLaw.PensionOtherIncome20MSpec

/-! Kernel-decided boundary examples: 0/19999999/20000000/20000001 円. -/

namespace JapanTaxLaw.PensionOtherIncome20MTests

open JapanTaxLaw.PensionOtherIncome20M
open JapanTaxLaw.PensionOtherIncome20MSpec

example : exceedsOtherIncome20M 0 = false := by decide
example : exceedsOtherIncome20M 19999999 = false := by decide
example : exceedsOtherIncome20M 20000000 = false := by decide
example : exceedsOtherIncome20M 20000001 = true := by decide
example : specWithin 19999999 = false := by decide
example : specWithin 20000000 = false := by decide
example : specWithin 20000001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 19999999 := agree_thm 19999999
example : agree 20000000 := agree_thm 20000000
example : agree 20000001 := agree_thm 20000001

end JapanTaxLaw.PensionOtherIncome20MTests
