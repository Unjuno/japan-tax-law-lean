import JapanTaxLaw.LocalCapitalBand1B5BSpec

/-! Kernel-decided boundary examples: (lo, hi]. -/

namespace JapanTaxLaw.LocalCapitalBand1B5BTests

open JapanTaxLaw.LocalCapitalBand1B5B
open JapanTaxLaw.LocalCapitalBand1B5BSpec

example : inBand 0 = false := by decide
example : inBand 1000000000 = false := by decide
example : inBand 1000000001 = true := by decide
example : inBand 5000000000 = true := by decide
example : inBand 5000000001 = false := by decide
example : specInBand 1000000000 = false := by decide
example : specInBand 1000000001 = true := by decide
example : specInBand 5000000000 = true := by decide
example : specInBand 5000000001 = false := by decide
example : agree 0 := agree_thm 0
example : agree 1000000000 := agree_thm 1000000000
example : agree 1000000001 := agree_thm 1000000001
example : agree 5000000000 := agree_thm 5000000000
example : agree 5000000001 := agree_thm 5000000001

end JapanTaxLaw.LocalCapitalBand1B5BTests
