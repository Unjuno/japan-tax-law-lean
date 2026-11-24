import JapanTaxLaw.ShareExchange50PlusSpec

/-! Kernel-decided boundary examples: 0/49/50/51 人. -/

namespace JapanTaxLaw.ShareExchange50PlusTests

open JapanTaxLaw.ShareExchange50Plus
open JapanTaxLaw.ShareExchange50PlusSpec

example : atLeast50 0 = false := by decide
example : atLeast50 49 = false := by decide
example : atLeast50 50 = true := by decide
example : atLeast50 51 = true := by decide
example : specWithin 49 = false := by decide
example : specWithin 50 = true := by decide
example : specWithin 51 = true := by decide
example : agree 0 := agree_thm 0
example : agree 49 := agree_thm 49
example : agree 50 := agree_thm 50
example : agree 51 := agree_thm 51

end JapanTaxLaw.ShareExchange50PlusTests
