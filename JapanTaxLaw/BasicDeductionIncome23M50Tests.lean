import JapanTaxLaw.BasicDeductionIncome23M50Spec

/-! Kernel-decided boundary examples: 0/23499999/23500000/23500001 円. -/

namespace JapanTaxLaw.BasicDeductionIncome23M50Tests

open JapanTaxLaw.BasicDeductionIncome23M50
open JapanTaxLaw.BasicDeductionIncome23M50Spec

example : withinIncome23M50 0 = true := by decide
example : withinIncome23M50 23499999 = true := by decide
example : withinIncome23M50 23500000 = true := by decide
example : withinIncome23M50 23500001 = false := by decide
example : specWithin 23499999 = true := by decide
example : specWithin 23500000 = true := by decide
example : specWithin 23500001 = false := by decide
example : agree 0 := agree_thm 0
example : agree 23499999 := agree_thm 23499999
example : agree 23500000 := agree_thm 23500000
example : agree 23500001 := agree_thm 23500001

end JapanTaxLaw.BasicDeductionIncome23M50Tests
