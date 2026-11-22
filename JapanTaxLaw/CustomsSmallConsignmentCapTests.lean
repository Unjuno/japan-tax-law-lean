import JapanTaxLaw.CustomsSmallConsignmentCapSpec

/-! Kernel-decided boundary examples: 0/9999/10000/10001 円. -/

namespace JapanTaxLaw.CustomsSmallConsignmentCapTests

open JapanTaxLaw.CustomsSmallConsignmentCap
open JapanTaxLaw.CustomsSmallConsignmentCapSpec

example : customsSmallCap 0 = true := by decide
example : customsSmallCap 9999 = true := by decide
example : customsSmallCap 10000 = true := by decide
example : customsSmallCap 10001 = false := by decide
example : specWithin 9999 = true := by decide
example : specWithin 10000 = true := by decide
example : specWithin 10001 = false := by decide
example : agree 0 := agree_thm 0
example : agree 9999 := agree_thm 9999
example : agree 10000 := agree_thm 10000
example : agree 10001 := agree_thm 10001

end JapanTaxLaw.CustomsSmallConsignmentCapTests
