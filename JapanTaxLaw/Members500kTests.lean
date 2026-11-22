import JapanTaxLaw.Members500kSpec

/-! Kernel-decided boundary examples: 0/499999/500000/500001 人. -/

namespace JapanTaxLaw.Members500kTests

open JapanTaxLaw.Members500k
open JapanTaxLaw.Members500kSpec

example : hasMembers500k 0 = false := by decide
example : hasMembers500k 499999 = false := by decide
example : hasMembers500k 500000 = true := by decide
example : hasMembers500k 500001 = true := by decide
example : specWithin 499999 = false := by decide
example : specWithin 500000 = true := by decide
example : specWithin 500001 = true := by decide
example : agree 0 := agree_thm 0
example : agree 499999 := agree_thm 499999
example : agree 500000 := agree_thm 500000
example : agree 500001 := agree_thm 500001

end JapanTaxLaw.Members500kTests
