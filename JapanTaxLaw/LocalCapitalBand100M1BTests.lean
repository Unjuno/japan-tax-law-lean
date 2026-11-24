import JapanTaxLaw.LocalCapitalBand100M1BSpec

/-! Kernel-decided boundary examples: (lo, hi]. -/

namespace JapanTaxLaw.LocalCapitalBand100M1BTests

open JapanTaxLaw.LocalCapitalBand100M1B
open JapanTaxLaw.LocalCapitalBand100M1BSpec

example : inBand 0 = false := by decide
example : inBand 100000000 = false := by decide
example : inBand 100000001 = true := by decide
example : inBand 1000000000 = true := by decide
example : inBand 1000000001 = false := by decide
example : specInBand 100000000 = false := by decide
example : specInBand 100000001 = true := by decide
example : specInBand 1000000000 = true := by decide
example : specInBand 1000000001 = false := by decide
example : agree 0 := agree_thm 0
example : agree 100000000 := agree_thm 100000000
example : agree 100000001 := agree_thm 100000001
example : agree 1000000000 := agree_thm 1000000000
example : agree 1000000001 := agree_thm 1000000001

end JapanTaxLaw.LocalCapitalBand100M1BTests
